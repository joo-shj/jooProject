<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.dto.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/test.jsp" %>
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
function checkpw() {
	if($("#passwd").val() != $("#pwcheck").val()) {
		$("#pwsame").html("비밀번호가 일치하지 않습니다.");
		return false;
	}else {
		$("#pwsame").html("");
		return false;
	}
}

$(function(){
	$("#update").click(function(){
		if($("#passwd").val()=="") {
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
		}		
		if($("#passwd").val() != $("#pwcheck").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#pwcheck").focus();
			return;
		}
		if(confirm("수정하시겠습니까?")) {			
			document.form1.action="${path}/user_servlet/userupdate.do";
			document.form1.submit();
			alert("회원정보 수정이 완료되었습니다. 재로그인해주세요");
		}
	});
	$("#dropout").click(function(){
		if(confirm("정말로 탈퇴하시겠습니까?")) {
			document.form1.action="${path}/user_servlet/delete.do";
			document.form1.submit();
			alert("탈퇴가 정상적으로 처리되었습니다.");
		}
	}); 
});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function openZipSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			$('[name=zipcode]').val(data.zonecode); // 우편번호 (5자리)
			$('[name=address1]').val(data.address);
		}
	}).open();
}
</script>
<style type="text/css">
.font{font-size: 17px; color: gray;}
.table-responsive{width: 30%; margin-left: auto; margin-right: auto;}
h3{text-align: center; margin-top: 50px; margin-bottom: 35px;}
</style>
</head>
<body>
<%@ include file="../include/nav.jsp" %>
<%
UserDTO dto = (UserDTO)request.getAttribute("dto");
%>
<h3>§ 회원 수정/삭제 §</h3>
<form name="form1" id="form1" method="post" class="table-responsive">
<table class="table table-striped table-sm">
    <tr>
		<td>아이디</td>
		<td class="font"><%=dto.getUserid() %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td class="font"><%=dto.getName() %></td>
	</tr>
	<tr>
		<td>새 비밀번호</td>
		<td><input class="form-control" type="password" 
				name="passwd" id="passwd" placeholder="새 비밀번호를 입력하세요."></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input class="form-control" type="password" id="pwcheck" 
				onkeyup="checkpw()" data-ajax="false" placeholder="비밀번호를 한 번 더 입력하세요.">
			<div id="pwsame" style="font-size:13px; color:red;"></div>
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input class="form-control" name="email" id="email" size="40" value="<%=dto.getEmail() %>"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input class="form-control" name="hp" id="hp" size="40" value="<%=dto.getHp() %>"></td>
	</tr>	
  <tr>
   <td>우편번호</td>
   <td><input class="form-control" value="<%=dto.getZipcode()%>" id="zipcode"
			name="zipcode" placeholder="Zipcode" width="10">
   <button onclick="openZipSearch()">주소검색</button>
   </td>
 </tr>
  <tr>
   <td>주소</td>
   <td><input class="form-control" value="<%=dto.getAddress1() %>" 
   name="address1" id="address1" readonly></td>
 </tr>
  <tr>
   <td>상세주소</td>
   <td><input class="form-control" value="<%=dto.getAddress2() %>" name="address2" id="address2"></td>
 </tr>
 <tr>
   <td colspan="2" align="center">
   <!-- userid가 반드시 필요함. hidden 처리 -->
  <input type="hidden" name="userid" value="<%=dto.getUserid() %>">
  <br>
  <button type="button" class="btn btn-primary" id="update">내 정보 수정하기</button>
 </tr>
</table>
</form>
<hr style="margin-bottom: 50px;">
<%@ include file="../include/footer.jsp" %>
<%@ include file="../include/js_footer.jsp" %>
</body>
</html>