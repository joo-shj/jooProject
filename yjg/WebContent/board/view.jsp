<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">

<script type="text/javascript">
$(function(){
	comment_list();
	$("#btnSave").click(function(){
		comment_add();
	});
	$("#btnList").click(function(){
		location.href="${path}/board_servlet/list.do";
	});
	$("#btnReply").click(function(){
		document.form1.action="${path}/board_servlet/reply.do";
		document.form1.submit();
	});
	$("#btnEdit").click(function(){
		document.form1.action="${path}/board_servlet/pass_check.do";
		document.form1.submit();
	});
	
});
function comment_add(){
	var param="board_num=${dto.num}&writer="+$("#writer").val()
	+"&content="+$("#content").val();
	$.ajax({
		type: "post",
		url: "${path}/board_servlet/comment_add.do",
		data: param,
		success: function(){
			$("#writer").val("");
			$("#content").val("");
			comment_list();
		}
	});
}

function comment_list(){
	$.ajax({
		type: "post",
		url: "${path}/board_servlet/commentList.do",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
		}
	});
}
</script>
<style type="text/css">
.thread{background-color: #007bff; color: white; width: 20%; font-size: 17px; text-align: center; }
.content{width: 42%; font-size: 16px;} 
.table-responsive{width: 40%; margin-left: auto; margin-right: auto;}
h3{text-align: center; margin-top: 50px; margin-bottom: 35px;}
#wrapper{width: 770px; margin: 0 auto;}
</style>
</head>
<body>
<%@ include file="../include/nav.jsp" %>
<h3>§ 상세화면 §</h3>
<form name="form1" method="post" class="table-responsive">
<table class="table table-bordered">
	<tr>
		<td class="thread">날짜</td>
		
		<td class="content"><fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<td class="thread" >조회수</td>
		<td class="content">${dto.readcount}</td>
	</tr>
	<tr>
		<td class="thread">이름</td>
		<td class="content">${dto.writer}</td>
	</tr>
	<tr>
		<td class="thread">제목</td>
		<td class="content">${dto.subject}</td>
	</tr>
	<tr>
		<td class="thread">본문</td>
		<td class="content">${dto.content}</td>
	</tr>
	<tr>
		<td class="thread">비밀번호</td>
		<td>
			<input type="password" name="passwd" id="passwd">
			<c:if test="${param.message == 'error' }">
				<span style="color:red;">
					비밀번호가 일치하지 않습니다.
				</span>
			</c:if>
		</td>
	</tr>
	<tr>
		<td class="thread">첨부파일</td>
		<td class="content">
			<c:if test="${dto.filesize > 0}">
				${dto.filename}( ${dto.filesize} bytes )
	<a href="${path}/board_servlet/download.do?num=${dto.num}">
	[다운로드]</a>
			</c:if>
		</td>
	</tr>
</table>
		
			<input type="hidden" name="num" value="${dto.num}">
			<input type="button" value="수정/삭제" id="btnEdit" class="btn btn-outline-primary">
			<input type="button" value="답변" id="btnReply" class="btn btn-outline-primary">
			<input type="button" value="목록" id="btnList" class="btn btn-outline-primary">
	
</form>
<br><br>

							
	<!-- 댓글 쓰기 폼 -->
	<div id="wrapper">
<table>
<tr><td style="color: gray;">
= 댓글달기 =
</td></tr>
 <tr>
  <td ><input id="writer" placeholder="이름">
  <button id="btnSave" type="button" class="btn btn-outline-primary">확인</button></td>
  <td rowspan="2" >
  </td>
 </tr>
 <tr>
   <td><textarea rows="5" cols="60" 
   placeholder="내용을 입력하세요" id="content"></textarea></td>
 </tr>
 
</table>							
<br>
<!-- 댓글 목록을 출력할 영역 -->
<div id="commentList"></div>

</div><br>
				
								
						
					



<hr style="margin-bottom: 50px;">
<%@ include file="../include/footer.jsp" %>
<%@ include file="../include/js_footer.jsp" %>


</body>
</html>

	