<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
div.header {
	position: sticky;
	top: 0;
	background-color: blue;
}

* {
	margin: 0px;
	padding: 0px;
}
.header > h3{
	padding-top: 10px;
}
.chat_wrap .header {
	font-size: 14px;
/* 	padding: 15px 0px; */
	height : 50px;
	background: #68ae6d;
	color: white;
/* 	text-align: center; */
}

.chat_wrap #chat {
/* 	padding-bottom: 100px; */
	width: 100%;
}

.chat_wrap #chat .left {
	text-align: left;
}

.chat_wrap #chat .right {
	text-align: right;
}

.chat_wrap #chat {
	font-size: 12px;
}

.chat_wrap #chat .sender {
	margin: 10px 25px 0px 10px;
	font-weight: bold;
}

.chat_wrap #chat .message {
	display: inline-block;
	margin: 5px 20px 0px 10px;
	max-width: 75%;
	border: 1px solid gray;
	padding: 5px;
	border-radius: 5px;
	background-color: #FCFCFC;
	text-align: left;
}

.chat_wrap #chat .date {
	margin: 5px 20px 10px 10px;
	font-size: 10px;
}

.chat_wrap .input-div {
	position: fixed;
	bottom: 0px;
	width: 24%;
	background-color: #FFF;
	text-align: center;
	border-top: 1px solid #68ae6d;
	padding-top: 5px;
}

#txtMessage {
	width: 100%;
	height: 70px;
	margin-bottom: 50px;
	border: none;
	padding: 5px;
}

</style>
</head>
<body>
	<div class="chat_wrap">
			<div class="header">
				<p style="margin-bottom: 0; padding: 10px 0 0 15px; font-size: 22px; color: white; font-weight: bold;">채팅방(${chatId.memberNo })</p>
			</div>
		<div id="chat" style="margin: 10px 10px 0 10px; height: 420px; overflow: auto;"></div>
		<!-- 채팅저장출력 -->
		<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
       <div class="{{printLeftRight sender}}">
          <div class="sender">{sender}}</div>
          <div class="message">{{message}}</div>
          <div class="date">{{regdate}}</div>
       </div>
		{{/each}}
       </script>
		<!-- 새로운채팅출력 -->
		<script id="temp1" type="text/x-handlebars-template">
       <div class="{{printLeftRight sender}}">
          <div class="sender">{{sender}}</div>
          <div class="message">{{message}}</div>
          <div class="date">{{regdate}}</div>
       </div>
       </script>
		<div class="input-div">
			<textarea id="txtMessage" cols="30" rows="10"
				placeholder="메시지를 입력한 후에 엔터키를 누르세요."></textarea>
		</div>
	</div>
</body>
</html>
<!-- 메시지 입력시 오른쪽 왼쪽으로 기입되는 방식 지정 -->
<script>
	var uid = "${memberNo}";
	console.log(uid);
	Handlebars.registerHelper("printLeftRight", function(sender) {
		if (uid != sender) {
			return "left";
		} else {
			return "right";
		}
	});
</script>
<script>
	var uid = "${memberNo}"
	getList();
	$("#txtMessage").on("keypress", function(e) {
		if (e.keyCode == 13 && !e.shiftKey) {
			e.preventDefault();
			var message = $("#txtMessage").val();
			if (message == "") {
				alert("메시지를 입력하세요.");
				$("#txtMessage").focus();
				return;
			}

			// 서버로 메시지 보내기
			sock.send(uid + "|" + message);
			$("#txtMessage").val("");
		}
	})


	// 채팅 데이터 받아오기
	function getList() {
		$.ajax({
			type : 'get',
			url : '/chat/chat',
			dataType : 'json',
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#chat").append(temp(data));
			}
		});
	}

	// 웹소캣 생성
	var sock = new SockJS("http://localhost:8888/chat/chat");
	sock.onmessage = onMessage;

	// 서버로부터 메시지 받기
	function onMessage(msg) {
		var items = msg.data.split("|");
		var sender = items[0];
		var message = items[1];
		var date = items[2];
		var data = {
			"message" : message,
			"memberNo" : sender,
			"regdate" : date
		}
		var temp = Handlebars.compile($("#temp1").html());
		$("#chat").append(temp(data));
		window.scrollTo(0, $("#chat").prop("scrollHeight"))
	}
</script>
