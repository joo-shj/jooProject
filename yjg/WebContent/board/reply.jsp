<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous">
</script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous"> 

<script type="text/javascript">
$(function(){
	$("#btnSave").click(function(){
		document.form1.submit();
	});
});

</script>
<style type="text/css">
.table-responsive{width: 40%; margin-left: auto; margin-right: auto;}
h3{text-align: center; margin-top: 50px; margin-bottom: 35px;}
</style>
</head>
<body>
<%@ include file="../include/nav.jsp" %>
<h3>§ 답변쓰기 §</h3>
<form name="form1" method="post" action="${path}/board_servlet/insertReply.do"  class="table-responsive">
<table class="table table-striped table-sm">
	<tr>
		<td>이름</td>
		<td><input name="writer" id="writer"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input name="subject" id="subject" value="Re: ${dto.subject}" size="60"></td>
	</tr>
	<tr>
		<td>본문</td>
		<td><textarea rows="5" cols="60" name="content" id="content">
		${dto.content}
		</textarea></td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td><input type="file" name="file1"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd" id="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<!-- 게시물 번호 처리 -->
		<input type="hidden" name="num" value="${dto.num}">
		<input type="button" value="확인" id="btnSave" class="btn btn-primary"></td>
	</tr>

</table>
</form>
<hr style="margin-bottom: 50px;">
<%@ include file="../include/footer.jsp" %>
<%@ include file="../include/js_footer.jsp" %>
</body>
</html>