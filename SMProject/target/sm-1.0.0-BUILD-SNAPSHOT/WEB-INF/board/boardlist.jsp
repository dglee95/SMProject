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
	.paging{
		display:flex;
		justify-content:center;
	}
	.input-group .btn{position:relative;z-index:-999}
	.input-group .btn:focus{z-index:-999}
</style>
</head>
<body>
<div class="searcharea" style="width:100%;text-align:center;">
<!-- 검색창 -->
	<form action="list">
		<div class="input-group" style="width:450px;">
		<select class="form-select" name="searchcolumn">
			<option value="subject">제목</option>
			<option value="content">내용</option>
			<option value="id">아이디</option>
			<option value="name">작성자</option>
		</select>
		&nbsp;&nbsp;&nbsp;
		<input type="text" name="searchword" class="form-control" style="width:140px;" placeholder="검색 단어" value="${param.searchword}">
		
		<button type="submit" class="btn btn-success" style="margin-left:10px;">검색</button>
		</div>
	</form>
	
	<a href="list?searchcolumn=id&searchword=${sessionScope.loginid}">내가 쓴 글</a>
</div>
<div class="boardlist" style="margin-top:10px;">
	<h3 class="alert alert-danger">총 ${totalCount}개의 글이 있습니다</h3>
	<br>
	<table class="table table-bordered">
		<tr style="background-color:#ddd;" valign="middle" align="center">
			<th style="width:50px;">번호</th>
			<th style="width:350px;">제목</th>
			<th style="width:80px;">작성자</th>
			<th style="width:100px;">작성일</th>
			<th style="width:50px;">조회</th>
			<th style="width:70px;">좋아요</th>
		</tr>
		<c:if test="${totalCount==0}">
			<tr>
				<td colspan="6" align="center" valign="middle">
					<h4>등록된 글이 없습니다</h4>
				</td>
			</tr>
		</c:if>
		<c:if test="${totalCount>0}">
			<c:forEach var="dto" items="${list}">
				<tr>
					<td align="center">${no}</td>
					<c:set var="no" value="${no-1}"/>
					<td>
						<!-- 답글일 경우 level 1당 2칸 띄우기 -->
						<c:forEach begin="1" end="${dto.relevel}">
							&nbsp;&nbsp;
						</c:forEach>
						<!-- 답글일 경우 답글 이미지 넣기 -->
						<c:if test="${dto.relevel>0}">
							<img alt="" src="../image/re.png" width="10" style="margin-bottom:7px;">
						</c:if>
						<c:if test="${dto.restep==0}">
						<a href="detail?num=${dto.num}&currentPage=${currentPage}" style="color:black;text-decoration:none;">
						${dto.subject}
							<c:if test="${dto.photo!='no'}">
								<img alt="" src="../image/ci.PNG" width="20">
							</c:if>
						<c:if test="${dto.acount>0}">
							<b style="color:red;">(${dto.acount})</b>
						</c:if>
						
						
						</a>
						</c:if>
						<c:if test="${dto.restep>0}">
						<a href="detail?num=${dto.num}&currentPage=${currentPage}" style="color:gray;text-decoration:none;">
						${dto.subject}&nbsp;
							<c:if test="${dto.photo!='no'}">
								<img alt="" src="../image/ci.PNG" width="20">
							</c:if>
						<c:if test="${dto.acount>0}">
							<b style="color:red;">(${dto.acount})</b>
						</c:if>
						
						</a>
						</c:if>
						<td align="center">${dto.name}</td>
						<td align="center">
							<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
						</td>
						<td align="center">${dto.readcount}</td>
						<td align="center">${dto.likes}</td>
						
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${sessionScope.loginok!=null}">
		<tr>
			<td colspan="6" align="right">
				<button type="button" class="btn btn-outline-success"
				onclick="location.href='form'">글쓰기</button>
			</td>
		</tr>
		</c:if>
	</table>
</div>
<div class="paging">
	<ul class="pagination">
		<c:if test="${startPage>1}">
			<li class="page-item"><a href="list?currentPage=${startPage-1}" class="page-link">이전</a></li>
		</c:if>
		<!-- 페이지 번호 -->
		<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			<c:if test="${pp==currentPage}">
				<li class="page-item active"><a class="page-link" href="list?currentPage=${pp}">${pp}</a></li>
			</c:if>
			<c:if test="${pp!=currentPage}">
				<li class="page-item"><a class="page-link" href="list?currentPage=${pp}">${pp}</a></li>
			</c:if>
			
		</c:forEach>
		
		<c:if test="${totalPage>endPage}">
			<li class="page-item"><a href="list?currentPage=${endPage+1}" class="page-link">다음</a></li>
		</c:if>
	</ul>
</div>
</body>
</html>

















