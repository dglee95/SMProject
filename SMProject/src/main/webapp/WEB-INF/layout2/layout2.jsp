<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gugi&family=Hahmlet&family=Jua&family=Lobster&family=Rubik+Beastly&family=Rubik+Burned&family=Rubik+Marker+Hatch&family=Single+Day&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<c:set var="root" value="<%=request.getContextPath()%>" />
<style type="text/css">
	*{
		font-family: 'Jua';
	}
	div.mainlayout2 div.main{
		border:1px solid gray;
	}
	a:link,a:visited{
		text-decoration:none;
		color:white;
	}
	a:hover{
		text-decoration:underline;
		color:red;
		cursor:pointer;
		
	}
	
	#header{
		width:100%;
		height:130px;
		text-align:center;
		line-height:130px;
	}
	
	#info{
		position:fixed;
		top:30%;
		right:2%;
		width:200px;
		z-index:999;
	}
	
	#main{
		position:relative;
		min-height:100%;
		padding-bottom:300px;
	}
	#footer {
		height:300px;
    	position: relative; 
  		transform : translateY(-100%);
  		background-color:black;
  		color:white;
  		display:none;
	}
</style>
</head>
<body>
<div class="mainlayout2">
	<div class="main" id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div class="main" id="info">
		<tiles:insertAttribute name="info"/>
	</div>
	<div class="main" id="main">
		<tiles:insertAttribute name="main"/>
	</div>
	<div class="main" id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
</body>
</html>