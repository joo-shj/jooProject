<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../css/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../css/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/css/util.css">
	<link rel="stylesheet" type="text/css" href="../css/css/main.css">
<!--===============================================================================================-->

<script src="../include/jquery-3.3.1.min.js"></script>
<%@ include file="../include/header.jsp"%>
<c:if test="${param.result=='success'}">
	<script type="text/javascript">
		alert("회원가입에 성공했습니다.");
	</script>
</c:if>
<c:if test="${param.message=='error'}">
	<script type="text/javascript">
		alert("아이디나 비밀번호가 일치하지 않습니다.");
	</script>
</c:if>
</head>
<%@ include file="../include/nav.jsp"%>
<body style="background-color: #666666;">
	
	<div class="limiter">
		<div class="container">
			<div class="wrap-login100" style="background-image: url('${path}/images/about.jpg');">
				<form class="login100-form validate-form" name="form1" method="post" action="${path}/user_servlet/login.do">
					<span class="login100-form-title p-b-43">
						Login to continue
					</span>
					
					<div class="wrap-input100 validate-input" >
						<input class="input100" type="text" name="userid" id="userid">
						<span class="focus-input100"></span>
						<span class="label-input100">Userid</span>
					</div>
					
					
					<div class="wrap-input100 validate-input" >
						<input class="input100" type="password" name="passwd" id="passwd">
						<span class="focus-input100"></span>
						<span class="label-input100">Password</span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label>
						</div>

						<div>
							<a href="#" class="txt1">
								Forgot Password?
							</a>
						</div>
					</div>
			

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" id="btnLogin">
							Login
						</button>
					</div>
				

					<div class="login100-form-social flex-c-m">
						<a href="#" class="login100-form-social-item flex-c-m bg1 m-r-5">
							<i class="fa fa-facebook-f" aria-hidden="
							true"></i>
						</a>

						<a href="#" class="login100-form-social-item flex-c-m bg2 m-r-5">
							<i class="fa fa-twitter" aria-hidden="true"></i>
						</a>
					</div>
				</form>
                <br>
				<div class="login100-more" style="background-image: url('images/bg-01.jpg');">
				</div>
			</div>
		</div>
	</div>

	

	
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

</body>
</html>