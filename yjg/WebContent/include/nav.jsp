<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	<a class="navbar-brand" href="${path}/index.jsp"><img
		src="${path}/images/logo.png" width="120px;" height="auto;"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarsExample03" aria-controls="navbarsExample03"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarsExample03">
		<ul class="navbar-nav mr-auto">
			<c:if test="${sessionScope.userid == null }">
				<li class="nav-item"><a class="nav-link"
					href="${path}/login/login.jsp ">로그인</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${path}/login/join.jsp">회원가입</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"></a>
				</li>
			</c:if>
			<c:if test="${sessionScope.userid != null }">
				<!-- 일반회원 -->
				<c:if test="${sessionScope.jgm_group == '1' }">
					<li class="nav-item"><a class="nav-link"
						href="${path}/user/mypage.jsp"> 마이페이지</a></li> 
					<li class="nav-item"><a class="nav-link"
						href="${path}/chat/chatIndex.jsp"> 회원채팅방</a></li>
				</c:if>
				<!-- 관리자 -->
				<c:if test="${sessionScope.jgm_group == '2' }">
					<li class="nav-item"><a class="nav-link"
						href="${path}/user/user.jsp" style="color: white;"> 회원관리</a></li>

				</c:if>
				<li class="nav-item"><a class="nav-link"
					href="${path}/board/board.jsp"> 자유게시판</a></li>
                <li class="nav-item"><a class="nav-link"
						href="${path}/guest/guest.jsp"> 문의사항</a></li> 

				<li class="nav-item"><a class="nav-link"
					href="${path}/user_servlet/logout.do"> 로그아웃</a></li>
				<li class="nav-item"><a class="nav-link" style="color: aqua;">
						| ${sessionScope.name }님 </a></li>
			</c:if>
		</ul>
		<form class="form-inline my-2 my-md-0">
			<input class="form-control" type="text" placeholder="Search">
		</form>
	</div>
</nav>