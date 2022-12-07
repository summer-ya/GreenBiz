<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../layout/header_login.jsp"/>
<link rel="stylesheet" href="/resources/css/changePw.css">

</head>
<body>

	<form action="/find/changePw" id="changePw" name="changePw" method="post">
<!-- 		<div style="height: 65px; background-color: #cff09e;"></div> -->

		<div class="logo">
			<a href="/login/login"><img alt="LOGO"
				src="/resources/img/LOGO.png""></a>
		</div>


		<div id="findId">
			<div class="chPw">
				<label>비밀번호 입력</label><input type="password" name="password"
					class="password" id="password_1" placeholder="비밀번호 입력">
			</div>

			<div class="chPw2">
				<label>비밀번호 확인</label><input type="password" name="password2"
					class="password" id="password_2" placeholder="비밀번호 확인"><br>
				<font id="checkPw" size="3"></font>
			</div>
		</div>

		<div class="findConNo">
			<div id="findNoConfirm">
				<button type="button" class="btn" id="changeOk">확인</button>
				<!-- 			<input type="reset" id="cancel" class="btn btn-danger" style="width : 90px; height : 40px;" value="취소"/> -->
				<input type="button" id="goLogin" class="btn" value="로그인" />
			</div>

		</div>



	</form>

	<script>
	$(document).ready(function(){
// 		$("#cancel").click(function(){
// 			$(location).attr('href',"/login/login");
// 		})
		$("#goLogin").click(function(){
			$(location).attr('href',"/login/login");
		})
	})
	
    $(function(){
        var responseMessage = "<c:out value="${msg}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    }) 
    
    /* 비밀번호 유효성 검사 */
    	$('.password').keyup(function(){
	    	let pass1 = $("#password_1").val();
	        let pass2 = $("#password_2").val();
	        
	        if (pass1 != "" || pass2 != ""){
	        	if (pass1 == pass2){
	            	$("#checkPw").html('비밀번호가 일치합니다.');
	            	$("#checkPw").attr('color','green');
	            	
	            } else {
	            	$("#checkPw").html('비밀번호가 일치하지 않습니다.');
	                $("#checkPw").attr('color','red');
	
	            }
	       	 }
       	 })

    	 $('#changeOk').click(function(){
    		let pass1 = $("#password_1").val();
	        let pass2 = $("#password_2").val();
	        var change = document.changePw
	        
	   		if (pass1 != "" || pass2 != ""){
	           	if (pass1 == pass2){
		      		alert('비밀번호 변경이 완료되었습니다.')
		      		$(location).attr('href',"/login/login");
		      		
	         	} else {
	         		alert('비밀번호 재확인 해주세요.')
		       		$(location).attr('href',"/find/changePw");
	         		
	         		return false;
	         	} 
	   		}
	   		change.submit();
	    }) 

    </script>

</body>
</html>