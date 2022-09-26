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
	.icss{
		background-color:black;
		color:white;
		text-align:center;
		font-size:20px;
		opcity:0.9;
	}
	.icss img{
		border:3px solid darkgray;
	}
	.icss span{
		cursor:pointer;
	}
	.icss a:link,.icss a:visited{
		text-decoration:none;
		color:white;
	}
	.icss a:hover{
		text-decoration:underline;
	}
	.icss a:active{
		color:red;
	}
	
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
	<div class="icss">
	<br>
	QUICK MENU
	<!-- 로그인한 상태에서는 로그인한 멤버의 사진이 나오도록 한다 -->
	<c:if test="${sessionScope.loginok==null}">
		<a href="${root}/" style="text-decoration:none;"><img alt="" src="${root}/image/cv.jpg" style="border-radius:100px;width:150px;height:150px;margin:25px 25px;"></a>
	</c:if>
	<c:if test="${sessionScope.loginok!=null}">
		<a href="${root}/" style="text-decoration:none;"><img alt="" src="${root}/upload/${sessionScope.loginphoto}" style="border-radius:100px;width:150px;height:150px;margin:25px 25px;"></a>
	</c:if>
	<hr style="background:white;height:3px;border:0;">
	<span><i class='fas fa-phone'></i>&nbsp;&nbsp;010-4154-8185</span>
	<hr style="background:white;height:3px;border:0;">
	<a href="https://ko.reactjs.org/" target="_blank"><i class='fab fa-react'></i>&nbsp;React</a>
	<hr style="background:white;height:3px;border:0;">
	<a href="https://developer.mozilla.org/ko/docs/Learn/HTML/Introduction_to_HTML/Getting_started" target="_blank"><i class='fab fa-html5'></i>&nbsp;HTML</a><br>&nbsp;
	</div>
</body>
</html>