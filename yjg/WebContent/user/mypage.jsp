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
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
function view(userid){
	document.form1.userid.value=userid;
	document.form1.submit();
}
</script>

<style type="text/css">
.table-responsive{width: 50%; margin-left: auto; margin-right: auto;}
h3{text-align: center; margin-top: 50px; margin-bottom: 35px;}
</style>
</head>
<body>
<%@ include file="../include/nav.jsp" %>
<h3>§ 개인정보 확인 §</h3>
	<article class="table-responsive">
		<form method="post" name="form1" id="form1"
			action="${path}/user_servlet/mypageView.do" class="table-responsive">
			<input type="hidden" name="userid">
			<table class="table table-striped table-sm" class="table table-striped table-sm">
			    <tr>
			 		<th>아이디</th>
					<td>${sessionScope.userid}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${sessionScope.name}</td>
				</tr>
			
				<tr>
					<th>이메일</th>
					<td>-</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>-</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>-</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>-</td>
				</tr>
				
			</table>
			<br>
					<button type="submit" onclick="view('${dto.userid}')"
							class="btn btn-primary"> > 정보 Detail</button>

		</form>
	</article>
	<hr style="margin-bottom: 50px;">
<%@ include file="../include/footer.jsp" %>
<%@ include file="../include/js_footer.jsp" %>
</body>
</html>