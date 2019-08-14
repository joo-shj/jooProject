<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<style type="text/css">
table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
</head>

<body>
<article style="margin-left: auto; margin-right: auto;">
<table class="type09">
<c:forEach var="row" items="${list}">
    <thead>
    <tr>
        <th scope="cols">${row.writer}
        (<fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd hh:mm:ss" />)</th>
    </tr>
       <tr>
        <td>${row.content}</th>
    </tr>
    </thead>
</c:forEach>
</table>
</article>
</body>
</html>