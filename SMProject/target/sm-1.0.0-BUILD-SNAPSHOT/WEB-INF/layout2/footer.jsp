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
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	*{
		font-family: 'Jua';
	}
	
	#foot1{
		position:relative;
		width:60%;
		left:10%;
		float:left;
		text-align:center;
			
	}
	.footmenu{
		float:left;
		width:30%;
	}
	#ft {
		position:relative;
		bottom:0;
		background:#1f1f27;
		margin:0 auto;
		text-align:center; 
		padding:70px 0;
		width:100%;
		
	}
	
</style>
</head>
<body>
<div id="ft">
	<div id="foot1">
		<div class="footmenu">회사소개</div>
		<div class="footmenu">이용약관</div>
		<div class="footmenu">개인정보처리방침</div>
		<div class="footmenu">사고대응매뉴얼</div>
		<div class="footmenu">제휴문의</div>
	</div>
	<br>
	<div id="foot2">
		주식회사 비트캠프(대표 조현정)<br>
		<a href="${root}/help/map"><i class='fas fa-map-marked-alt'></i>&nbsp;서울 강남구 강남대로94길 20 삼오빌딩 (5층~9층)</a><br>
		사업자등록번호 : 214-85-24928<br>
		문의 : 02-3486-9600<br>
		<a href="https://www.instagram.com/"><i class='fab fa-instagram'></i>&nbsp;인스타그램</a><br>
	</div>
</div>
		
	
</body>
</html>