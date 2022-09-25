<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gugi&family=Hahmlet&family=Jua&family=Lobster&family=Rubik+Beastly&family=Rubik+Burned&family=Rubik+Marker+Hatch&family=Single+Day&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<style type="text/css">
	*{
		font-family: 'Jua';
	}
	.himg{
		background-image:url("${root}/image/headerimg.jpg");
		background-repeat:no-repeat;
		background-size:cover;
		position:fixed;
		top:0;
		left:0;
		right:0;
	}
	
	#loginstate{
		position:fixed;
		top:30px;
		right:200px;
		color:white;
	}

</style>
</head>
<body>
	<div class="himg" style="background-image:url('${root}/image/headerimg.jpg')">
	<a href="${root}/" style="text-decoration:none;">
		<h1 style="color:white;height:100px;line-height:100px;padding-left:30px;"><i class='fab fa-linux' style="font-size:50px;"></i>&nbsp;비트캠프</h1>
	</a>
	</div>
	
	<span id="loginstate">
		<c:if test="${sessionScope.loginok==null}">
			<button type="button" class="btn btn-success" id="btnlogin" data-bs-toggle="modal" data-bs-target="#myModal">로그인</button>
		</c:if>
		
		<c:if test="${sessionScope.loginok!=null}">
			<b>${sessionScope.loginname}님</b>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-danger" id="btnlogout">로그아웃</button>
		</c:if>
	</span>
	
	
	
	<!-- 로그인 창 -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-sm">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">회원 로그인</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">LoginId</span> 
						<input type="text" class="form-control" id="loginid" >
					</div>
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">LoginPass</span>
						<input type="password" class="form-control" id="loginpass">
					</div>
				</div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="btnloginok">Login</button>
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
		      </div>
		
		    </div>
 		</div>
	</div>
	<script type="text/javascript">
		//Modal 창에 있는 로그인 버튼
		$("#btnloginok").click(function(){
			var id=$("#loginid").val();
			var pass=$("#loginpass").val();
			var root="${root}";
			console.log("root"+root);
			$.ajax({
				type:"get",
				url:root+"/member/login",
				dataType:"json",
				data:{"id":id,"pass":pass},
				success:function(res){
					if(res.result=="fail"){
						alert("아이디나 비밀번호가 틀렸습니다");
					}else{
						location.reload();
					}
							
				},
			});
		});
		
		//로그아웃
		$("#btnlogout").click(function(){
			var root="${root}";
			$.ajax({
				type:"get",
				url:root+"/member/logout",
				dataType:"text",
				success:function(res){	
					location.reload();							
				},
			});
		});
	</script>
</body>
</html>