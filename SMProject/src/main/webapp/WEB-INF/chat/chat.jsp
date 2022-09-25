<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gugi&family=Hahmlet&family=Jua&family=Lobster&family=Rubik+Beastly&family=Rubik+Burned&family=Rubik+Marker+Hatch&family=Single+Day&display=swap" rel="stylesheet">
    <script
            src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
            crossorigin="anonymous"></script>
    <style type="text/css">
        *{
            font-family: 'Jua';
        }
    </style>
</head>
<body>
<h2>오늘 날씨</h2>
<h3 class="lowtemp1">최저 온도: </h3>
<h3 class="maxtemp1">최고 온도: </h3>
<h3 class="hicon1"></h3>

<h2>날씨 예보1</h2>
<table class="table table-info">
  <thead>
    <tr>
      <td>시간</td>
      <td>날씨</td>
      <td>강수확률</td>
      <td>풍속</td>
      <td>온도 push test</td>
      
    </tr>
  </thead>
  <tbody>
<%--    <tr>--%>
<%--      <td>현재 시간</td>--%>
<%--      <td>현재 온도</td>--%>
<%--    </tr>--%>
  </tbody>
</table>


<script>
    $.getJSON("https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=44714b1973a73780b4840a89a5f87c7e&units=metric", function(result){
        // alert(result.main.temp);
        $(".lowtemp1").append(result.main.temp_min+"도(나중에 특수문자추가)");
        $(".maxtemp1").append(result.main.temp_max+"도(나중에 특수문자추가)");
        var wicon = "<img src='http://openweathermap.org/img/wn/" + result.weather[0].icon + ".png' alt='" + result.weather[0].discription+"'>"// 날씨에 따른 아이콘 변수 선언 https://openweathermap.org/weather-conditions 참조
        $(".hicon1").html(wicon);
    });
    
    $.getJSON("https://api.openweathermap.org/data/2.5/forecast?lat=37.5683&lon=126.9779&appid=36ccda560636ea50a6c38074156e4bef&units=metric", function(result) {
        // alert(result.main.temp);

        for (var i = 0; i < 40; i++) {
          var ctime = result.list[i].dt//배열 시간
          var ctemp = result.list[i].main.temp//배열 날씨
          var cgangsu = result.list[i].main.humidity//강수 확률
          var cwind = result.list[i].wind.speed//풍속
          var wicon = "<img src='http://openweathermap.org/img/wn/" + result.list[i].weather[0].icon + ".png' alt='" + result.list[i].weather[0].discription+"'>"

          function convertTime(t) {
            var ot = new Date(t * 1000);// jquery문 new Date(); 국제표준시로 변경 (Date생성자는 시간의 특정 지점을 나타내는 Date객체를 생성한다)
                                        //변수 ot에는 Sun Sep 25 2022 01:38:10 GMT+0900 (한국 표준시) <-이런식으로 시간이 담겨져 있음 수정필요
            //원하는 시간만 출력
            var d = ot.getDate();//날짜 얻기
            var hr = ot.getHours();//시간단위 얻기
            var m = ot.getMinutes();//분단위 얻기
            // var s = ot.getSeconds();//초단위 얻기

            return d + "일" + " "+hr + "시";
          }

          var currentTime = convertTime(ctime);
          var ta = "<tr>" +
                  "<td>" + currentTime + "</td>" +//날짜
                  "<td>" + ctemp + "</td>" +//날씨
                  "<td>" + cgangsu + "%</td>" +//강수확률
                  "<td>" + cwind + "m/s</td>" +//풍속
                  "<td>" + wicon + "</td>" +//아이콘
                  "</tr>";


          $("tbody").append(ta);//tbody에 ta내용을 넣어준다
        }

      });



</script>
</body>
</html>