<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header_login.jsp"/>
<link rel="stylesheet" href="/resources/css/findId.css">

	<form action="/find/memberNo" name="findNo" method="post">
<!-- 	<div style="height : 65px; background-color : #cff09e;"></div> -->
	
	<div class="logo">
		<a href="/login/login"><img alt="LOGO" src="/resources/img/LOGO.png"></a>
	</div>
	
	
	<div id="findId">
		<div class="findName" >
			<label>성 명</label><input type="text" name="memberName"  placeholder="성명을 입력해주세요">
		</div>
	
		<div class="findEmail" >
			<label>이메일</label><input type="text" name="email" placeholder="gb221111@greenbiz.com">
		</div>
	</div>
	
	<div class="findConNo">
<!-- 		<div id="findNoConfirm"> -->
<!-- 			<button type="submit" class="btn" style="background-color: #44633F; color:white; width : 90px; height : 40px;" onclick="window.open('/find/ok','테스트', 'width=500 height=500')"	>확인</button> -->
<!-- 		</div>  -->
		<div id="findNoConfirm">
			<input type="submit" class="btn" id="confirmNo" value="확인"/>
			<input type="reset" id="cancelNo" class="btn btn-danger"  value="취소"/>
			<input type="button" id="findPw" class="btn"  value="비밀번호찾기"/>
		</div>
		
	</div>
	
	</form>
	<!-- 이름과 이메일이 디비값과 같으면 사번 띄우고
	같지 않다면 확인팝업창과 함께 사번 찾기 화면으로 고고-->

<!-- ------------------1117 Test----------------------------- -->

	<script>
	$(document).ready(function(){
		$("#cancelNo").click(function(){
			$(location).attr('href',"/login/login");
		})
		$("#findPw").click(function(){
			$(location).attr('href',"/find/password");
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