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
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.jsp"
	})
});

</script>
<script type="text/javascript">
function list(curPage){
   location.href="${path}/board_servlet/list.do?curPage="+curPage;
};
</script>
<style type="text/css">
.table-responsive{width: 80%; text-align: center; margin-top: 50px; 
margin-left: auto; margin-right: auto; margin-bottom: 90px; }
.table table-striped table-sm{margin-left: auto; margin-right: auto;}
</style>
</head>
<body>

<%@ include file="../include/nav.jsp" %>
<article class="table-responsive">
<table class="table table-striped table-sm">
<tr >
  <th style="width: 5px; padding: 10px;">NO</th>
  <th style="width: 15px;  padding: 10px;">Nickname</th>
  <th style="width: 200px;  padding: 10px;">title</th>
  <th style="width: 5px;  padding: 10px;" >Cnt</th>
  <th style="width: 5px;  padding: 10px;">File</th>
  <th style="width: 5px;  padding: 10px;">DownCnt</th>
  <th style="width: 15px;  padding: 10px;">PostDate</th>
</tr>
<c:forEach var="dto" items="${list}">
<%-- <c:choose>
<c:when test="${dto.show == 'y'}"> --%>
<tr>
  <td>${dto.num}</td>
  <td>${dto.writer}</td>
  <!-- 답글 들여쓰기 -->
  <td>
  <c:forEach var="i" begin="1" end="${dto.re_level}">
  	&nbsp;&nbsp;  
  </c:forEach>
  <a href="${path}/board_servlet/view.do?num=${dto.num}">
  ${dto.subject}</a>
  <!-- 댓글갯수표시 -->
  <c:if test="${dto.comment_count > 0}">
  <span style="color:red;">(${dto.comment_count})</span>
  </c:if>
  </td>
  <td>${dto.readcount}</td>
  <td align="center">
  	<c:if test="${dto.filesize > 0 }">
  		<a href="${path}/board_servlet/download.do?num=${dto.num}">
  		<img src="../images/file.gif">
  		</a>
  	</c:if>
  <%-- ${dto.filename} --%>
  </td>
  <td>${dto.down}</td>
   <td><fmt:formatDate value="${dto.reg_date}" pattern="yy-MM-dd hh:mm" type="both"/></td>
</tr>
<%-- </c:when>
<c:otherwise>
	<tr>
		<td>${dto.num}</td>
		<td colspan="6" align="center">삭제된 게시물입니다.</td>
	</tr>
</c:otherwise>
</c:choose> --%>
</c:forEach>
<!-- 페이지 나누기 -->
	<tr align="center">
		<td colspan="7">
			<c:if test="${page.curPage > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${page.curBlock > 1}">
				<a href="#" onclick="list('${page.prevPage}')">[이전]</a>
			</c:if>
			<c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
				<c:choose>
					<c:when test="${num == page.curPage }">
						<span style="color:red">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.curBlock < page.totBlock }">
				<a href="#" onclick="list('${page.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${page.curPage < page.totPage }">
				<a href="#" onclick="list('${page.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>
</table>
<button id="btnWrite" class="btn btn-info" >
글쓰기</button>
</article>
<hr style="margin-bottom: 50px;">
<%@ include file="../include/footer.jsp" %>
<%@ include file="../include/js_footer.jsp" %>
</body>
</html>