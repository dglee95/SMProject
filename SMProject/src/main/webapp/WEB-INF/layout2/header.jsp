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
<c:set var="root" value="<%=request.getContextPath()%>"/>
<style type="text/css">
	*{
		font-family: 'Jua';
	}
	.himg{
		background-image:url("${root}/image/headerimg.jpg");
		background-repeat:no-repeat;
		background-size:cover;
	}
</style>
</head>
<body>

	<div class="himg" style="background-image:url('${root}/image/headerimg.jpg')">
	<a href="${root}/" style="text-decoration:none;"><h1 style="color:white;height:100px;line-height:100px;padding-left:30px;"><i class='fab fa-linux' style="font-size:50px;"></i>&nbsp;비트캠프</h1></a>
	</div>
</body>
</html>