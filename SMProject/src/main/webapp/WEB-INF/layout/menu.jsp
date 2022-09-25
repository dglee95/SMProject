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
	.mcss{
		position:fixed;
		top:100px;
		font-size:30px;
		background-color:white;
		width:100%;
		border-bottom:1px solid lightgray;
		display:flex;
		justify-content:space-evenly;
		height:80px;
		line-height:80px;
		text-align:center;
	}
	
	.mcss a{
		text-decoration:none;
		color:#A7A7A7;
	}
	.mcss a:hover{
		color:black;
	}

</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div class="mcss">
	<span class="d1"><a href="${root}/">&emsp;Home&emsp;</a></span>
	<span class="d1"><a href="${root}/board/list">&emsp;게시판&emsp;</a></span>
	<span class="d1"><a href="${root}/board/form">&emsp;게시글쓰기&emsp;</a></span>
	<span class="d1"><a href="${root}/member/list">&emsp;회원리스트&emsp;</a></span>
	<span class="d1"><a href="${root}/member/form">&emsp;회원가입&emsp;</a></span>
	<span class="d1"><a href="${root}/help/map">&emsp;구글맵&emsp;</a></span>
	<span class="d1"><a href="${root}/chat/chat">&emsp;채팅&emsp;</a></span>
</div>
</body>
</html>