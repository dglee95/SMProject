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
</style>
</head>
<body>
<c:if test="${sessionScope.loginok==null}">
	<script type="text/javascript">
		alert("먼저 로그인 후 글을 써주세요");
		history.back();
	</script>
</c:if>
	<form action="insert" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="id" value="${sessionScope.loginid}">
		<input type="hidden" name="name" value="${sessionScope.loginname}">
		<input type="hidden" name="regroup" value="${regroup}">
		<input type="hidden" name="restep" value="${restep}">
		<input type="hidden" name="relevel" value="${relevel}">
		<input type="hidden" name="currentPage" value="${currentPage}">
		
		<table class="table table-bordered" style="width:500px;">
			<tr align="center" valign="middle">
				<th style="width:100px;">제목</th>
				<td align="left">
					<input type="text" name="subject" class="form-control" required="required"
					value="${subject}">
				</td>
			</tr>
			<tr align="center" valign="middle">
				<th style="width:100px;">사진</th>
				<td>
					<input type="file" name="upload" class="form-control" multiple="multiple">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" class="form-control" required="required"
					style="width:500px;height:150px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-secondary">게시글 저장</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>