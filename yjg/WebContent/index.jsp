<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page session="true"%>	 --%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<title>진구야 꽃길만 걷자</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@ include file="include/header.jsp"%>
<c:if test="${param.message=='login'}">
	<script type="text/javascript">
		alert("환영합니다.");
	</script>
</c:if>
<style type="text/css">
.del {
	margin-top: 150px;
	margin-left: -200px;
}

#navbarsExample03 {
	padding-left: 30px;
}
</style>
</head>

<body>
	<div class="page">
		<%@ include file="include/nav.jsp"%>

		<div id="colorlib-page">

			<section class="hero-wrap js-fullheight">
				<div class="container-fluid px-0">
					<div
						class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
						data-scrollax-parent="true">
						<div class="col-md-12 ftco-animate text-center">
							<div class="desc">
								<span class="subheading">Magazine</span>
								<h1 style="background-image: url(images/jingu.gif);">YJG</h1>
								<span class="subheading-2">신현주 Edition</span>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="ftco-section ftco-no-pb ftco-no-pt">
				<div class="container-fluid px-0">
					<div class="row no-gutters">
						<div class="col-md-12 blog-wrap">
							<div class="row no-gutters align-items-center">
								<div class="col-md-6 img js-fullheight"
									style="background-image: url(images/jg1.jpg);"></div>
								<div class="col-md-6">
									<div class="text p-md-5 p-4 ftco-animate">
										<div class="icon d-flex align-items-center mb-5">
											<div class="img"
												style="background-image: url(images/love.jpg);"></div>
											<div class="position pl-3">
												<h4 class="mb-0">여진구의 연기내공</h4>
												<span>아역배우부터 성인배우까지</span>
											</div>
										</div>
										<h2 class="mb-4">
											<a href="blog-single.html">JinGu&nbsp;&nbsp;Profile</a>
										</h2>
										<p>
											소속사&nbsp;:&nbsp; JANUS ENT<br> 학력&nbsp;:&nbsp; 중앙대학교
											연극영화학<br>
										<P>
											[ 수상 ]<br> 2016년 SBS 연기대상 장편드라마부문 남자 우수연기상 <br>
											2015년 KBS 연기대상 남자 신인연기상 <br> 2013년 제34회 청룡영화상 신인남우상<br>
											공식사이트, 인스타그램, 트위터, 페이스북
										</p>
										<p class="mb-0 mt-4">
											<a href="#" class="btn btn-primary">Read more <span
												class="ion-ios-arrow-forward"></span></a>
										</p>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-12 blog-wrap bg-darken"
							style="padding-top: -200px;">
							<div class="row no-gutters align-items-center">
								<div
									class="col-md-6 d-flex justify-content-center align-items-center order-md-last js-fullheight">
									<div class="del">
										<iframe width="1100" height="650"
											src="https://www.youtube.com/embed/LDU5yOR57Bk"
											frameborder="0"
											allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
											allowfullscreen></iframe>

									</div>
								</div>
								<div class="col-md-6">
									<div class="text p-md-5 p-4 ftco-animate">
										<div class="icon d-flex align-items-center mb-5">
											<div class="img"
												style="background-image: url(images/youtube.png);"></div>
											<div class="position pl-3">
												<h4 class="mb-0">2019.07.13&nbsp;tvN&nbsp;Drama</h4>
												<span>Hotel_deluna.com</span>
											</div>
										</div>
										<div style="margin-top: 10px; margin-left: 50px;">
											<h2 class="mb-4">
												<a href="blog-single.html">호텔 델루나</a>
											</h2>

											편성 &nbsp;: &nbsp; tvN(토, 일) 오후 09:00 <br> 시청률 7.6%
											(닐슨코리아 제공)<br> 연출&nbsp;: &nbsp;오충환&nbsp;|&nbsp;극본&nbsp;:
											&nbsp; 홍정은, 홍미란<br> 소개&nbsp;: &nbsp;엘리트 호텔리어가 운명적인 사건으로
											호텔 델루나의 지배인을 맡게 되면서 <br> 달처럼 고고하고 아름답지만 괴팍한 사장과 함께 델루나를
											운영하며 생기는 특별한 이야기<br> 사이트&nbsp;: &nbsp; 공식 홈페이지 현장 포토, 대표
											이미지, 클립영상, 스페셜

											<p class="mb-0 mt-4">
												<a href="#" class="btn btn-primary">Read more <span
													class="ion-ios-arrow-forward"></span>
												</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="col-md-12 blog-wrap">
							<div class="row no-gutters align-items-center">
								<div class="col-md-6 img js-fullheight"
									style="background-image: url(images/oyjg.gif);"></div>
								<div class="col-md-6">
									<div class="text p-md-5 p-4 ftco-animate">
										<div class="icon d-flex align-items-center mb-5">
											<div class="img"
												style="background-image: url(images/oy.jpg);"></div>
											<div class="position pl-3">
												<h4 class="mb-0">문의 사항</h4>
												<span>관리자에게 문의를 남겨주세요.</span>
											</div>
										</div>

										<!-- 문의하기 -->
										<div>
											<form name="form1" method="post"
												action="${path}/guest_servlet/insert.do">
												<table>
													<tr>
														<td>이메일</td>
														<td><input type="hidden" name="idx" id="idx">
															<input name="email" id="email" size="40"></td>
													</tr>
													<tr>
														<td>비번</td>
														<td><input type="password" name="passwd" id="passwd"
															size="40"></td>
													</tr>
													<tr align="center">
														<td colspan="2"><textarea rows="5" cols="55"
																name="content" id="content"></textarea></td>
													</tr>
													<tr align="center">
														<td colspan="2"><input type="submit" value="확인"
														class="btn btn-primary">
															<input type="reset" value="취소"
															class="btn btn-primary"></td>
													</tr>
												</table>
										</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<footer class="ftco-footer ftco-section img">
	    	<div class="overlay"></div>
	        <div class="row">
	          <div class="col-md-12 text-center">
	          <img src="${path }/images/yjg.png" style="width: 150px; height: auto;"><br><br>
              <a href="${path}/index.jsp">[ Home ]</a> | <a href="${path}/index.jsp">개발자 : 신현주 | HP : 010.3526.7683 </a>
	            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	          </div>
	        </div>
	      </footer>
    <!-- loader -->
      <div id="ftco-loader" class="show fullscreen">
     
       </div>
      </div>
	</div>
	<%@ include file="include/js_footer.jsp"%>
</body>
</html>