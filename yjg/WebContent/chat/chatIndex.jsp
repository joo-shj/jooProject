<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../css/css/bootstrap.css">
<link rel="stylesheet" href="../css/css/chat.css">
<title>회원제 실시간채팅</title>
<%@ include file="../include/test.jsp"%>

<%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="../css/js/js/bootstrap.js"></script>
<script>
var lastID = 0;
  function submitFunction(){
    var chatName = $('#chatName').val();
    var chatContent = $('#chatContent').val();
   $.ajax({
     type: "post",
     url : "${path}/chatSubmitServlet",    
     data : {
         chatName : encodeURIComponent(chatName),
         chatContent : encodeURIComponent(chatContent)
     },
    success : function(result) {
      if(result == 1){
          autoClosingAlert('#successMessage',2000);
        }else if(result == 0){
          autoClosingAlert('#dangerMessage',2000);
        }else{
          autoClosingAlert('#warningMessage',2000);
        }
  }
});
$('#chatContent').val('');   
}


function autoClosingAlert(selector, delay){
   var alert = $(selector).alert();
   alert.show();
   window.setTimeout(function() { 
    alert.hide()}, delay);}


 function chatListFunction(type){
$.ajax({
     type: "post",
     url : "${path}/chatListServlet",  
     data : {
         listType : type
     },
    success : function(data) {
      if(data == "") return;
      var parsed = JSON.parse(data);
      var result = parsed.result;
      for(var i=0; i<result.length; i++){
        addChat(result[i][0].value, result[i][1].value, esult[i][2].value);
    }
lastID = Number(Parsed.last);
  }
});
}

 function addChat(chatName, chatContent ,chatTime){
  $('#chatList').append('<div class="row"' +
    '<div class="col-lg-12">'+
   '<div class="media">' + 
'<a class="pull-left" href="#">'+
'<img class="media-object img-circle" src="${path}/images/oy.jpg">'+ 
'</a>'+
'<div class="media-body">'+
'<h4 class="media-heading">'+
chatName+
' <span class="small pull-right">'+
chatTime+
'</span>'+
'</h4>'+
'<p>'+
chatContent+
'<p>'+
'</div>'+
'</div>'+
'</div>'+
'</div>'+
'<hr>');
$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
}

function getInifiniteChat() {
  setInterval(function(){
     chatListFunction(lastID);
},5000);
}
</script>
</head>
<body>
<br><br>
<div class="container bootstrap snippet">
    <div class="row">
        <div class="col-xs-12">
            <div class="portlet portlet-default">
                <div class="portlet-heading">
                    <div class="portlet-title">
                        <h4><i class="fa fa-circle text-green"></i>실시간 채팅방</h4>
                    </div>
                    <div class="clearfix"></div>
</div>

 <div id="chat" class="panel-collapse collapse in">
<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 600px;"> 
</div>   

<div class="portlet-footer">   
  <div class="row">
     <div class="form-grop col-xs-4">  
<input style="height:40px;" type="text" id="chatName" class="form-cotrol" placeholder="이름"  maxlength="8">
           </div>
        </div>
<div class="row" style="height:90px;" >
     <div class="form-grop col-xs-10">  
<textarea style="height:80px;" id="chatContnet" class="form-control" placeholder="메세지를 입력해주세요."  maxlength="100"></textarea>
    </div>
<div class="form-grop col-xs-2" >
<button type="button" class="btn btn-default pull-right" onclick="submitFunction()">전송</button>
    <div class="clearfix" ></div>
</div>
    </div>
       </div>
    </div>
 </div>
</div>  
 </div>
</div>

<div class="alert alert-success" ids="successMessage" style="display: none;">
  <strong>메세지 전송에 성공하였습니다.</strong>
</div>       
<div class="alert alert-danger" ids="dangerMessage" style="display: none;">
  <strong>이름과 내용을 모두 입력해주세요.</strong>
</div>  
<div class="alert alert-warning" ids="warningMessage" style="display: none;">
  <strong>DB 오류가 발생하였습니다.</strong>
</div>
<script>  
 $(document).ready(function() {
    chatListFunction('ten');
getInifiniteChat();
});
</script>  

</body>
</html>
