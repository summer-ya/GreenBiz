<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header_login.jsp"/>
<link rel="stylesheet" href="/resources/css/login.css">
	
	<form action="/admin/login" name="login" method="POST" >
<!-- 	<div style="height : 65px; background-color : #cff09e;"></div> -->

	<div class="logo">
		<a href="/login/login"><img alt="LOGO" src="/resources/img/LOGO.png"></a>
	</div>
	
	<div class ="text-center" >
		<span style="border-bottom: 2px solid #44633f; font-size: 28px;">Admin Page</span>
	</div>
	
	<div class="user_icon_id" >
		<img alt="user_icon_id" src="/resources/img/user_id.png" class="login_icon_id">
		<input type="text" name="adminNo" placeholder="아이디를 입력하세요." autofocus>
	</div>
	
	<div class="user_icon_pw" >
		<img alt="user_icon_pw" src="/resources/img/user_pw.png" class="login_icon_pw">
		<input type="password" name="adminPw" placeholder="비밀번호">
		
	</div>
	
	<div class="loginButton">
		<div id="loginBtn"><button type="submit" class="btn" style="background-color: #cff09e; color: black;">로그인</button></div>
<!-- 		<button type="button" class="btn">취소</button> -->
	</div>
	
	</form>
	
<script type="text/javascript">
	
    $(function(){
        var responseMessage = "<c:out value="${msg}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    }) 
</script>

</body>
</html>