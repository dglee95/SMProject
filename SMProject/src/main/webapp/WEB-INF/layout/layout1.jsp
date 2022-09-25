<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<meta charset="UTF-8">
<title>Spring5+Tiles3+Mybatis</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gugi&family=Hahmlet&family=Jua&family=Lobster&family=Rubik+Beastly&family=Rubik+Burned&family=Rubik+Marker+Hatch&family=Single+Day&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	*{
		font-family: 'Jua';
	}
	html { overflow-y:scroll; }
	div.mainlayout1 div.main{
		border:0px solid gray;
		
	}

	#menu{
		width:100%;
		margin-top:-10px;
	}
	
	#info{
		position:fixed;
		top:30%;
		right:2%;
		width:200px;
		height:550px;
	}
	#main{
		position:relative;
		top:180px;
		left:27%;
		right:30%;
		width:50%;
		display:inline-block;
	}

		

	
</style>
</head>
<body>
<div class="mainlayout1">
	<div class="main" id="main">
		<tiles:insertAttribute name="main"/>
	</div>
	<div class="main" id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div class="main" id="menu">
		<tiles:insertAttribute name="menu"/>
	</div>
	<div class="main" id="info">
		<tiles:insertAttribute name="info"/>
	</div>
</div>
</body>
</html>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring5+Tiles3+Mybatis</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<c:set var="root" value="<%=request.getContextPath() %>"/>
<style type="text/css">
   body *{
       font-family: 'Jua';
   }
   
   div.mainlayout1 div.main{
      border:0px solid gray;      
   }
   
   a:link,a:visited {
      text-decoration: none;
   }
   a:hover {
      cursor: pointer;
   }
   
   #header{
      width: 80%;
      height: 130px;
      text-align: center;
      line-height: 130px;
      background-color: #c0c0c0;
   }
   
   #menu{
      width: 100%;
      height: 130px;
      text-align: center;      
      margin-left: 150px;
   }
   
   #info{
      float: left;
      width: 250px;
      height: 500px;
      background-color: #000;
      color: #fff;
      padding-left: 30px;
      padding-top: 30px;
   }
   
   #main{
      /* float:right; */
      position:absolute;
      left:400px;
      top:240px;
      width:800px;
      height: 500px;
   }
</style>
</head>
<body>
<div class="mainlayout1">
   <div class="main" id="header">
      <tiles:insertAttribute name="header"/>
   </div>
   <div class="main" id="menu">
      <tiles:insertAttribute name="menu"/>
   </div>
   <div class="main" id="info">
      <tiles:insertAttribute name="info"/>
   </div>
   <div class="main" id="main">
      <tiles:insertAttribute name="main"/>
   </div>   
</div>
</body>
</html>
 --%>
