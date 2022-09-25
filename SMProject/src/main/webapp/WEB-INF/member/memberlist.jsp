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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	*{
		font-family: 'Jua';
	}

</style>
</head>

<body>
<script type="text/javascript">
	$(function(){
		$("#btnnewphoto").click(function(){
			$("#newphoto").trigger("click");
			
		});
		
		$("#newphoto").change(function(){
			var num=$("#newphoto").attr("num");
			console.log(num);
			
			var form=new FormData();
			form.append("photo",$("#newphoto")[0].files[0]);
			form.append("num",num);
			console.dir(form);
			
			$.ajax({
				type:"post",
				dataType:"text",
				url:"updatephoto",
				processData:false,
				contentType:false,
				data:form,
				success:function(res){
					location.reload();
				}
			});
			
		});
		
		//삭제
		$(".btndelete").click(function(){
			var num=$(this).attr("num");
			var ans=confirm("정말 탈퇴하시겠습니까?");
			if(ans){
				$.ajax({
					type:"get",
					dataType:"text",
					url:"delete",
					data:{"num":num},
					success:function(res){
						alert("탈퇴하였습니다");
						location.reload();
					}
				});
			}
		});
		
		//수정버튼 클릭시 모달
		$(".btnupdate").click(function(){
			 updatenum=$(this).attr("num");
			 console.log(updatenum);
			 $.ajax({
					type:"get",
					dataType:"json",
					url:"updateform",
					data:{"num":updatenum},
					success:function(res){
						$("#updatename").val(res.name);
						$("#updatehp").val(res.hp);
						$("#updateemail").val(res.email);
						$("#updateaddr").val(res.address);
					}
				});
		});
		$("#btnupdateok").click(function(){
			var uname=$("#updatename").val();
			var uhp=$("#updatehp").val();
			var uemail=$("#updateemail").val();
			var uaddr=$("#updateaddr").val();
			
			$.ajax({
				type:"post",
				dataType:"text",
				url:"update",
				data:{"num":updatenum,"name":uname,"hp":uhp,"email":uemail,"address":uaddr},
				success:function(res){
					location.reload();
				}
			});
		});
	});
</script>
	<h2 class="alert alert-danger">총 ${totalCount}명의 회원이 있습니다</h2>
	<br>
	<table class="table table-bordered">
		<c:forEach var="dto" items="${list}">
			<tr>
				<td style="width:250px;" align="center" rowspan="5">
					<img alt="" src="../upload/${dto.photo}" width="230" height="250" border="1">
					<br>
					<!-- 로그인한 사람꺼만 버튼이 보이도록 한다 -->
					<c:if test="${sessionScope.loginid==dto.loginid}">
					<input type="file" id="newphoto" style="display:none;" num="${dto.num}"><!-- 사진 수정시 호출 -->
						<button type="button" class="btn btn-secondary" id="btnnewphoto">사진 수정</button>
					</c:if>
				</td>
				<td style="width:250px">회원명 : ${dto.name}</td>
					<td rowspan="5" align="center" valign="middle">
				<!-- 로그인한 사람꺼만 버튼이 보이도록 한다 -->
				<c:if test="${sessionScope.loginid==dto.loginid}">
						<button type="button" class="btn btn-warning btnupdate" num="${dto.num}" 
						data-bs-toggle="modal" data-bs-target="#myUpdateModal">수정</button>
						<br><br>
						<button type="button" class="btn btn-danger btndelete" num="${dto.num}">삭제</button>
				</c:if>
					</td>
			</tr>
			<tr>
				<td>아이디 : ${dto.loginid}</td>
			</tr>
			<tr>
				<td>이메일 : ${dto.email}</td>
			</tr>
			<tr>
				<td>핸드폰 : ${dto.hp}</td>
			</tr>
			<tr>
				<td>주소 : ${dto.address}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 로그인 창 -->
	<div class="modal" id="myUpdateModal">
		<div class="modal-dialog modal-sm">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">회원 정보 수정</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">회원명</span> 
						<input type="text" class="form-control" id="updatename" >
					</div>
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">핸드폰</span>
						<input type="text" class="form-control" id="updatehp">
					</div>
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">이메일</span>
						<input type="text" class="form-control" id="updateemail">
					</div>
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">주소</span>
						<input type="text" class="form-control" id="updateaddr">
					</div>
				</div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-warning" data-bs-dismiss="modal" id="btnupdateok">수정</button>
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
		      </div>
		
		    </div>
 		</div>
	</div>
</body>
</html>