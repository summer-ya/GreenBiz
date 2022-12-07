<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header_login.jsp"/>
<link rel="stylesheet" href="/resources/css/findPw.css">
	
	<form action="/find/password" name="findPw" method="post">
<!-- 	<div style="height : 65px; background-color : #cff09e;"></div> -->

	<div class="logo">
		<a href="/login/login"><img alt="LOGO" src="/resources/img/LOGO.png"></a>
	</div>
	
	<div id="findMemPw">
		<div class="findMemNo" >
			<label>사 번</label><input type="text" name="memberNo" placeholder="사번을 입력해주세요">
		</div>
	
		<div class="findMemEmail" >
			<label>이메일</label><input type="text" name="email" placeholder="gb221111@greenbiz.com">
		</div>
	
	</div>
			
	<div class="findConPw">
		<div id="findPwConfirm">
				<input type="submit" class="btn" id="confirmPw" value="확인"/>
				<input type="reset" id="cancelPw" class="btn btn-danger" value="취소"/>
				<input type="button" id="findNo" class="btn" value="사원번호찾기"/>
			</div>
	</div>
	</form>

	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#cancelPw").click(function(){
			$(location).attr('href',"/login/login");
		})
		$("#findNo").click(function(){
			$(location).attr('href',"/find/memberNo");
		})
	})
	
    $(function(){
        var responseMessage = "<c:out value="${msg}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    }) 
    </script>

  </body>
</html>