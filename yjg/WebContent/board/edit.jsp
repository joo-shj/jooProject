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
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/board_servlet/update.do"
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		document.form1.action="${path}/board_servlet/delete.do"
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
<h3>§ 수정/삭제 §</h3>
<form name="form1" method="post" enctype="multipart/form-data" class="table-responsive">
<table class="table table-striped table-sm">
	<tr>
		<td>이름</td>
		<td><input name="writer" id="writer" value="${dto.writer}"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input name="subject" id="subject" size="60" value="${dto.subject}"></td>
	</tr>
	<tr>
		<td>본문</td>
		<td><textarea rows="5" cols="60" name="content" id="content" value="${dto.content}"></textarea></td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
		<c:if test="${dto.filesize > 0}">
			${dto.filename} (${dto.filesize / 1024} KB)
			<input type="checkbox" name="fileDel">첨부파일 삭제<br>
		</c:if>
		<input type="file" name="file1">
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd" id="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<!-- 수정,삭제를 위한 글번호 -->
		<input type="hidden" name="num" value="${dto.num}">
		<input type="button" value="수정" id="btnUpdate" class="btn btn-outline-primary">
		<input type="button" value="삭제" id="btnDelete" class="btn btn-outline-primary">
		</td>
	</tr>

</table>
</form>
<hr style="margin-bottom: 50px;">
<%@ include file="../include/footer.jsp" %>
<%@ include file="../include/js_footer.jsp" %>
</body>
</html>