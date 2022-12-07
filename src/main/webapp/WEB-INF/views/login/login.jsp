<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header_login.jsp"/>
<link rel="stylesheet" href="/resources/css/login.css">
	
	<form action="/login/login" name="login" method="POST" >
<!-- 	<div style="height : 65px; background-color : #cff09e;"></div> -->

	<div class="logo">
		<a href="./login"><img alt="LOGO" src="/resources/img/LOGO.png"></a>
	</div>
	
	<div class="user_icon_id" >
		<img alt="user_icon_id" src="/resources/img/user_id.png" class="login_icon_id">
		<input type="text" name="memberNo" value="${cookie.memberNo.value}"  placeholder="사번을 입력하세요." autofocus>
	</div>
	
	<div class="user_icon_pw" >
		<img alt="user_icon_pw" src="/resources/img/user_pw.png" class="login_icon_pw">
		<input type="password" name="password"  value="${cookie.password.value}" placeholder="비밀번호">
		
	</div>
	
	<div class="memoryIdLogin">
		<input type="checkbox" name="memoryId" value="on" ${empty cookie.memberNo.value ? "":"checked"}><span class="memLogId">&nbsp;아이디기억</span>
		
		
		<input type="checkbox" name="memoryPw" value="on" ${empty cookie.password.value ? "":"checked"}>&nbsp;비밀번호기억
	</div>
	
	<div class="loginButton">
		<div id="loginBtn"><button type="submit" class="btn" style="background-color: #cff09e; color: black;">로그인</button></div>
<!-- 		<button type="button" class="btn">취소</button> -->
	</div>
	
	<div class="lostMemId">
		<ul>
			<li><a href="/find/memberNo">사원번호 찾기</a></li>
			<li>&nbsp;|&nbsp;</li>
			<li><a href="/find/password">비밀번호 변경</a></li>
			<li>&nbsp;|&nbsp;</li>
			<li><a href="/admin/login">관리자 로그인</a></li>
		</ul>
	</div>
	
	<div class="inquiry"><p>별도의 문의는 02) 0000-0000으로 연락주세요.</div>

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