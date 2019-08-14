<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function view(userid){
	document.form1.userid.value=userid;
	document.form1.submit();
}
</script>
<style type="text/css">
.table-responsive{margin-top: 30px;}
</style>
</head>
<body>
<%@ include file="../include/nav.jsp" %>

<c:if test="${sessionScope.jgm_group == '2' }">
<article class="table-responsive">
등록된 회원수 : ${map.count}명
<br>
<table class="table table-striped table-sm">
 <tr>
   <th>아이디</th>
   <th>이름</th>
   <th>이메일</th>
   <th>핸드폰</th>
   <th>우편번호</th>
   <th>주소</th>
   <th>상세주소</th>
   <th></th>
 </tr>
 <c:forEach var="dto" items="${map.list}">
  <tr>
   <td>${dto.userid}</td>
   <td>${dto.name}</td>
   <td>${dto.email}</td>
   <td>${dto.hp}</td>
   <td>${dto.zipcode}</td>
   <td>${dto.address1}</td>
   <td>${dto.address2}</td>
    <td><button type="submit" onclick="view('${dto.userid}')" class="btn btn-sm btn-primary">수정하기</button></td>
   </tr>
 </c:forEach>
</table>
<form name="form1" method="post" action="${path}/user_servlet/view.do">
	<input type="hidden" name="userid">
</form>
</article>
</c:if>

<hr style="margin-top:-9px; margin-bottom: 60px;">
<%@ include file="../include/footer.jsp" %>
<%@ include file="../include/js_footer.jsp" %>
</body>
</html>