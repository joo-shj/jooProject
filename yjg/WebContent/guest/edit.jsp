<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">

<script type="text/javascript">

function jgupdate(){
	var form1 = $("#form1");
	var email = $("#email");
	var passwd = $("#passwd");
	var content = $("#content");
	
	 if(email.val() == ""){
		alert("이메일을 입력하세요");
		email.focus();
		return;
	} if(passwd.val() == ""){
		alert("비밀번호를 입력하세요");
		passwd.focus();
		return;
	} if(content.val() == ""){
		alert("내용을 입력하세요");
		content.focus();
		return;
	}
	document.form1.action="${path}/guest_servlet/update.do";
	document.form1.submit();
}
function jgdelete(){
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/guest_servlet/delete.do";
		document.form1.submit();
	}
}
</script>
<style type="text/css">
.table-responsive{width: 40%; margin-left: auto; margin-right: auto;}
h3{text-align: center; margin-top: 50px; margin-bottom: 35px;}
.thread{background-color: #007bff; color: white;}
</style>
</head>
<body>
<%@ include file="../include/nav.jsp" %>
<h3>§ 수정/삭제 §</h3>
<form name="form1" id="form1" method="post" class="table-responsive">
<table width="500px" class="table table-striped table-sm">

 <tr>
   <td class="thread">이메일</td>
   <td><input name="email" id="email" size="40"
         value="${dto.email}"></td>
 </tr>
 <tr>
   <td class="thread">비밀번호</td>
   <td><input type="password" name="passwd" id="passwd" size="40"></td>
 </tr>
 <tr align="center">
   <td colspan="2"><textarea rows="5" cols="55" name="content"
    id="content">${dto.content}</textarea></td>
 </tr>
 <!-- textarea는 input태그처럼 태그안에 value를 쓰면 안되며
 태그와 태그사이에 값만 코딩한다. 또한 단독태그가 아닌 짝태그로만 써야한다. -->
 <tr align="center">
   <td colspan="2">
   
     <input type="hidden" name="idx" value="${dto.idx}">
     <input type="button" value="수정" class="btn btn-primary" onclick="jgupdate()">
     <input type="button" value="삭제" class="btn btn-primary" onclick="jgdelete()">
     <input type="button" value="목록" class="btn btn-outline-primary"
     onclick="location.href='${path}/guest_servlet/list.do'">
   </td>
 </tr>
</table>
</form>
<hr style="margin-bottom: 50px;">
<%@ include file="../include/footer.jsp" %>
<%@ include file="../include/js_footer.jsp" %>
</body>
</html>