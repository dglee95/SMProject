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
	.maincontainer{
		height:1000px;
		font-family: 'Hahmlet';
		font-size:20px;
		text-align:center;
		border-radius:5px;
	}
	.maincontainer figure img{
		width:170px;
		height:255px;
		box-shadow:3px 3px 3px gray;
	}
	.maincontainer figure{
		float:left;
		margin-left:30px;
		margin-top:20px;
		display:inline-block;
		overflow:visible;
	}
	
	.maincontainer figure:hover{
		cursor:pointer;
	}
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div class="maincontainer">
	<figure>
		<img alt="" src="${root}/image/10.jpg" class="img-thumbnail">
		<figcaption>김태희<br><i class='fas fa-phone'></i>&nbsp;010-532-4562</figcaption>
	</figure>
	<figure>
		<img alt="" src="${root}/image/hwangjeongeum.jpg" class="img-thumbnail">
		<figcaption>황정음<br><i class='fas fa-phone'></i>&nbsp;010-345-5421</figcaption>
	</figure>
	<figure>
		<img alt="" src="${root}/image/jeonjeehyeon.jpg" class="img-thumbnail">
		<figcaption>전지현<br><i class='fas fa-phone'></i>&nbsp;010-831-3931</figcaption>
	</figure>
	<figure>
		<img alt="" src="${root}/image/9.jpg" class="img-thumbnail">
		<figcaption>강동원<br><i class='fas fa-phone'></i>&nbsp;010-912-3249</figcaption>
	</figure>
	<figure>
		<img alt="" src="${root}/image/youahin.jpg" class="img-thumbnail">
		<figcaption>유아인<br><i class='fas fa-phone'></i>&nbsp;010-622-1925</figcaption>
	</figure>
	<figure>
		<img alt="" src="${root}/image/kojoonhee.jpg" class="img-thumbnail">
		<figcaption>고준희<br><i class='fas fa-phone'></i>&nbsp;010-912-3249</figcaption>
	</figure>
	
</div>
</body>
</html>