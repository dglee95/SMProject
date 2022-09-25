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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
	*{
		font-family: 'Jua';
	}
	span.likes{
		cursor:pointer;
	}
	span.day{
		color:#333;
		float:right;
		font-size:0.8em;
	}
	span.writer{
		color:red;
		border:1px solid red;
		border-radius:40px;
		margin-left:5px;
		font-size:0.8em;
		padding:3px;
	}
	.adel{
		cursor:pointer;
		color:red;
		margin-left:5px;
	}
	div.alist pre{
		padding-left:10px;
	}
	div.alist img{
		width:40px;
		height:40px;
		cursor:pointer;
		border:1px solid gray;
		border-radius:10px;
		margin-left:10px;
	}
</style>
<script type="text/javascript">
	var num=${dto.num};
	$(function(){
			console.log("num="+num);
			
			list();//처음 시작시 댓글 출력
			
			$(document).on("click",".adel",function(){
				var yes=confirm("삭제하시겠습니까?");
				if(yes){
					$.ajax({
						type:"get",
						url:"../answer/delete",
						dataType:"text",
						data:{"idx":$(".adel").attr("idx")},
						success:function(res){
							list();
						}
					});
				}
			});
	});
	
	function list(){
		var loginok='${sessionScope.loginok}';
		var loginid='${sessionScope.loginid}';
		var writeid='${dto.id}';
// 		console.log(loginok);
// 		console.log(loginid);
		var s="";
		$.ajax({
			type:"get",
			url:"../answer/list",
			dataType:"json",
			data:{"num":num},
			success:function(res){
				$("b.banswer").text(res.length);
				$.each(res, function(i,elt){
					s+="<div>"+elt.name;
					if(elt.photo!='no'){
						s+="<a href='../upload/"+elt.photo+"' target='_new'>";
						s+="<img src='../upload/"+elt.photo+"'>";
						s+="</a>";
					}
					if(writeid==elt.id){
						s+="<span class='writer'>&nbsp;작성자&nbsp;</span>";
					}
					if(loginok=='yes' && loginid==elt.id){
						s+='<i class="fa fa-close adel" style="font-size:17px" idx='+elt.idx+'></i>';
					}
					s+="<pre>"+elt.message;
					s+="<span class='day'>"+elt.writeday+"</span>";
					s+="</pre>";
					s+="</div>";
				});
				$("div.alist").html(s);
			}
		});
		
		
	}
</script>
</head>
<body>
	<table class="table table-bordered" style="width:600px;">
		<tr>
			<td>
				<h2><b>${dto.subject}</b></h2>
				<c:if test="${memphoto!='no'}">
				<img alt="" src="../upload/${memphoto}" width="60" height="60" class="rounded-circle"
				align="left" onerror="this.src='../image/noimage.png'" hspace="15">
				</c:if>
				<b>${dto.name}(${dto.id})</b><br>
				<span style="color:#ccc;font-size:13px;">
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
					&nbsp;&nbsp;
					조회&nbsp;${dto.readcount}
				</span>
			</td>
		</tr>
		<tr height="300" valign="top">
			<td>
				<pre>${dto.content}</pre>
				<br><br>
				<c:if test="${dto.photo!='no'}">
					<c:forTokens var="photo" items="${dto.photo}" delims=",">
						<img alt="" src="../upload/${photo}" width="250" class="img-thumbnail" 
						onerror="this.style.display='none'"><!-- 해당 폴더에 없는 사진은 안보이게 처리 -->
					</c:forTokens>
				</c:if>
				<br><br>
				<span class="likes">
<!-- 				<i class='fas fa-heart'></i> -->
				<i class='far fa-heart'></i>&nbsp;
				좋아요 <b>${dto.likes}</b></span>
				&nbsp;&nbsp;
				<i class='far fa-comment-dots'></i>
				&nbsp;<b class="banswer">0</b>
				<br>
				<div class="alist">
					댓글목록
				</div>
				<c:if test="${sessionScope.loginok!=null}">
				<div class="aform">
					<form id="aform">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="id" value="${sessionScope.loginid}">
						<input type="hidden" name="name" value="${sessionScope.loginname}">
						<input type="file" id="upload" style="display:none;">
						<button type="button" class="btn btn-info btn-sm" id="btnphoto">사진</button>
						<img id="aphoto" src="" width="50" height="50" onerror="this.style.display='none'">
						<br>
						<div class="input-group">
						<textarea name="message" id="message" style="width:400px;height:60px;" 
						class="form-control"></textarea>
						<button type="button" class="btn btn-secondary btn-sm" id="btnasave">등록</button>
						</div>
					</form>
				</div>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" class="btn btn-outline-info"
				onclick="location.href='form'">새글</button>
				
				<button type="button" class="btn btn-outline-info"
				onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup}&restep=${dto.restep}&relevel=${dto.relevel}&currentPage=${currentPage}'">답글</button>
				
				<button type="button" class="btn btn-outline-info"
				onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				
				<!-- 로그인 중이면서 세션의 아이디와 글의 아이디가 같을 경우에만 수정,삭제 가능 -->
				<c:if test="${sessionScope.loginok!=null && sessionScope.loginid==dto.id}">
					<button type="button" class="btn btn-outline-info"
					onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage}'">수정</button>
					
					<button type="button" class="btn btn-outline-info"
					onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage}'">삭제</button>
				</c:if>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
	$("span.likes").click(function(){
		var heart=$(this).find("i").attr("class");
		if(heart=='far fa-heart'){
			$(this).find("i").attr("class","fas fa-heart").css("color","red");
		}else{
			$(this).find("i").attr("class","far fa-heart").css("color","black");
		}
		//ajax이용해서 좋아요 수 증가 후 출력
		$.ajax({
			type:"get",
			url:"likes",
			dataType:"json",
			data:{"num":${dto.num}},
			success:function(res){
				$("span.likes>b").html(res.likes);
			}
															
		});
	});
	//사진버튼
	$("#btnphoto").click(function(){
		$("#upload").trigger("click");
	});
	
	//file태그
	$("#upload").change(function(){
		var form=new FormData();
		form.append("photo",$("#upload")[0].files[0]);
		
		$.ajax({
			type:"post",
			dataType:"json",
			url:"../answer/updatephoto",
			processData:false,
			contentType:false,
			data:form,
			success:function(res){
				$("#aphoto").attr("src","../upload/"+res.aphoto);
				$("#aphoto").css("display","inline-block");
			}
		});
	});
	
	//댓글 저장
	$("#btnasave").click(function(){
		var fdata=$("#aform").serialize();//form태그 안의 name을 쿼리 스트링 형태로 읽어온다
		$.ajax({
			type:"post",
			url:"../answer/insert",
			dataType:"text",
			data:fdata,
			success:function(res){
				list();//댓글 목록을 다시 db에서 가져와서 출력
				
				//입력값이랑 사진 안보이게 처리
				$("#message").val("");
				$("#aphoto").attr("src","").css("display","none");
			}
		});
	});
	</script>
</body>
</html>