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
	
	#showimg{
		border:1px solid gray;
		width:150px;
		height:180px;
	}
	div.idsuccess{
		text-align:center;
	}
</style>
<script type="text/javascript">
	$(function(){
		//버튼 클릭시 사진 불러오는 이벤트 주기
		$("#btnphoto").click(function(){
			$("#myphoto").trigger("click");
		});
		
		//사진 불러오면 미리보기하기
		$("#myphoto").change(function(){
			  //정규표현식
			var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
			var f=$(this)[0].files[0];//현재 선택한 파일
			if(!f.type.match(reg)){
			   alert("확장자가 이미지파일이 아닙니다");
			   return;
			}
			  if($(this)[0].files[0]){
			   var reader=new FileReader();
			   reader.onload=function(e){
			    $("#showimg").attr("src",e.target.result);
			   }
			   reader.readAsDataURL($(this)[0].files[0]);
			  }
		});
		//아이디 입력시 .idsuccess 값 지움
		$("#loginid2").keyup(function(e){
			$("div.idsuccess").text("");
		});
		
		//중복체크 버튼 시 아이디 체크
		$("#btnidcheck").click(function(){
			$.ajax({
				type:"get",
				dataType:"json",
				url:"idcheck",
				data:{"id":$("#loginid2").val()},
				success:function(res){
					if(res.count==0){
						$("div.idsuccess").css("background-color","green");
						$("div.idsuccess").css("color","white");
						$("div.idsuccess").text("ok");
					}else{
						$("div.idsuccess").css("background-color","red");
						$("div.idsuccess").css("color","white");
						$("div.idsuccess").text("fail");
					}
				}
			})
		});
		
		//2번째 비밀번호 입력시 체크
		$("#pass2").keyup(function(){
			var p1=$("#pass").val();
			var p2=$(this).val();
			if(p1==p2){
				$("div.passsuccess").text("ok");
			}else{
				$("div.passsuccess").text("");
			}
		});
			
	});//function
	
	//onsubmit : submit 전에 호출
	function check(){
		//사진
		if($("#myphoto").val()==""){
			alert("사진을 넣어주세요");
			return false;
		}
		
		//중복체크
		if($("div.idsuccess").text()!="ok"){
			alert("아이디 중복체크를 해주세요");
			return false;
		}
		//비밀번호
		if($("div.passsuccess").text()!="ok"){
			alert("비밀번호가 서로 다릅니다");
			return false;
		}
		

	}
</script>
</head>

<body>
<form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
	<table class="table table-bordered" style="width: 600px">
		<caption align="top"><h4 class="alert alert-danger"><b>회원가입</b></h4></caption>
		<tr>
			<td style="width:250px" rowspan="4" align="center">
				<div class="input-group">
					<input type="file" id="myphoto" name="myphoto" style="display: none;">
					<button type="button" id="btnphoto" class="btn btn-secondary">사진선택</button>
					<br>
					<img id="showimg">
				</div>
			</td>
			<td>
				<div class="input-group mb-3">
					<input type="text" placeholder="아이디입력" id="loginid2" name="loginid"
					class="form-control" style="width: 120px;" required="required">
					<button type="button" class="btn btn-danger btn-sm" id="btnidcheck">중복체크</button>
					&nbsp;
					<div class="idsuccess" style="width:60px;">check</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
					<input type="password"  style="width:120px;" class="form-control"
					name="pass" id="pass" placeholder="숫자4자리" maxlength="4" pattern="[0-9]{4,}"
					required="required">
					
					<input type="password"  style="width:120px;" class="form-control"
					 id="pass2" placeholder="숫자4자리" maxlength="4" pattern="[0-9]{4,}"
					  required="required">
					 &nbsp;
					<div class="passsuccess" style="width:60px;">check</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="name" class="form-control" style="width: 150px;"
				placeholder="이름을 입력하세요" required="required">
			</td>
		</tr>
		<tr>
			<td>
				<input type="email" name="email" class="form-control" 
				placeholder="이메일을 입력하세요" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="input-group">
					<input type="text" name="hp" placeholder="(-)없이 HP번호만 입력"  class="form-control"
					style="width: 200px;" required="required">
					
					<input type="text" name="address" placeholder="주소입력"  class="form-control"
					style="width: 300px;" required="required">
				</div>
			</td>		
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-info" style="width: 180px;">회원가입</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>