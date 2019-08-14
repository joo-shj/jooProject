<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign Up</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="../images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../css/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../css/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../css/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../css/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../css/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../css/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../css/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../css/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../css/css/util.css">
<link rel="stylesheet" type="text/css" href="../css/css/main.css">

<!--===============================================================================================-->
<script src="../include/jquery-3.3.1.min.js"></script>
<%@ include file="../include/header.jsp"%>


<script type="text/javascript">
$(function(){
$("#userfind").click(function(){
	$.ajax({
		   type:"post",
		   url:"${path}/user_servlet/idCheck.do",
		   data: {"userid":$("#userid").val()},
		   success: function(result){
			   if(result==1){
				   $("#msg").html("이미 존재하는 아이디입니다.");
				   return;
			   }else if($("#userid").val()==""){
				   $("#msg").html("아이디를 입력해주세요.");
				   return;
			   }else {
				   $("#msg").html("사용 가능한 아이디입니다.");
				   $("#passwd").focus();
			   }
		   }

		});	
});

	
 $("#btnJoin").click(function(){
	document.form1.action="${path}/user_servlet/insertBCrypt.do";
	document.form1.submit();	
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
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<form class="login100-form validate-form" 
	method="post" name="form1" style="margin-left: auto; margin-right: auto;">
		<span class="login100-form-title p-b-43"
			style="margin-top: -70px;">=&nbsp;회원가입&nbsp;=</span>

		<div class="wrap-input100 validate-input"
			data-validate="Userid is required">
			<input class="input100" type="text" name="userid" id="userid">
			<span class="focus-input100"></span> <span class="label-input100">Userid</span>
		</div>
		<button
			style="background-color: #6675df; border-radius: 20px; color: white;"
			type="button" id="userfind">&nbsp;&nbsp;중복확인&nbsp;&nbsp;</button>
		<div id="msg" style="color: red;"></div>

		<div class="wrap-input100 validate-input"
			data-validate="Passwd is required">
			<input class="input100" type="password" name="passwd" id="passwd">
			<span class="focus-input100"></span> <span class="label-input100">Passwd</span>
		</div>

		<div class="wrap-input100 validate-input"
			data-validate="Name is required">
			<input class="input100" type="text" name="name" id="name"> <span
				class="focus-input100"></span> <span class="label-input100">Name</span>
		</div>

		<div class="wrap-input100 validate-input"
			data-validate="Valid email is required: ex@abc.xyz">
			<input class="input100" type="text" name="email" id="email">
			<span class="focus-input100"></span> <span class="label-input100">Email</span>
		</div>

		<div class="wrap-input100 validate-input"
			data-validate="HP is required">
			<input class="input100" type="text" name="hp" id="hp"> <span
				class="focus-input100"></span> <span class="label-input100">Hp</span>
		</div>

		<br> &nbsp;&nbsp;&nbsp;<input type="text" id="zipcode"
			name="zipcode" placeholder="Zipcode"
			style="border: #6675df; background-color: #efefef;">

		<button
			style="background-color: #6675df; border-radius: 20px; color: white;"
			type="button" onclick="openZipSearch()">&nbsp;&nbsp;주소
			검색&nbsp;&nbsp;</button>
		<div class="wrap-input100 validate-input"
			data-validate="Address is require">
			<input class="input100" type="text" name="address1" id="address1"
				readonly> <span class="focus-input100"></span> <span
				class="label-input100">Address</span>
		</div>

		<div class="wrap-input100 validate-input"
			data-validate="ExtraAdd is required">
			<input class="input100" type="text" name="address2" id="address2">
			<span class="focus-input100"></span> <span class="label-input100">ExtraAdd</span>
		</div>

		<div class="container-login100-form-btn">
			<button class="login100-form-btn" id="btnJoin">Sign Up</button>
		</div>

	</form>

	<!--===============================================================================================-->
	<script src="../css/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="../css/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="../css/vendor/bootstrap/js/popper.js"></script>
	<script src="../css/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="../css/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="../css/vendor/daterangepicker/moment.min.js"></script>
	<script src="../css/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="../css/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="../css/js/main.js"></script>

<br>
	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/js_footer.jsp"%>
</body>
</html>