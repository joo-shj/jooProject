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
<style type="text/css">
.table-responsive{width: 40%; margin-left: auto; margin-right: auto;}
h3{text-align: center; margin-top: 50px; margin-bottom: 35px;}
.thread{background-color: #007bff; color: white;}
</style>
</head>
<body>
<%@ include file="../include/nav.jsp" %>
<h3>§ 문의사항 §</h3>
<body>

<c:if test="${sessionScope.userid==null}">
	<script>
		alert(" 로그인 후 확인해주시기 바랍니다.");
		location.href="${path}/login/login.jsp";
	</script>
</c:if> 
<c:forEach var="dto" items="${list}">
<form method="post" 
action="${path}/guest_servlet/passwd_check.do" class="table-responsive">
<!-- 편집을 위해서는 게시물 번호가 필요함 -->
<input type="hidden" name="idx" value="${dto.idx}">

<table border="1" width="600px" class="table table-striped table-sm">
	<tr>
		<td class="thread">이메일</td>
		<td>${dto.email}</td>
		<td >날짜</td>
		<td><fmt:formatDate value="${dto.post_date}" pattern="yyyy-MM-dd HH:mm:ss E"/></td>
	</tr>
	
	<tr>
		<td colspan="4">${dto.content}</td>
	</tr>
	<tr>
		<td colspan="4">	
			비밀번호 <input type="password" name="passwd">
			<input type="submit" value="수정/삭제">
		</td>
	</tr>
</table>
</form>
</c:forEach>

<hr style="margin-bottom: 50px;">
<%@ include file="../include/footer.jsp" %>
<%@ include file="../include/js_footer.jsp" %>
</body>
</html>