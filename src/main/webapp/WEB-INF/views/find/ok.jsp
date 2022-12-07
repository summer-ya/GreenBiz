<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

    <style type="text/css">
    	body {
    		margin : 0 auto;
    		max-width: 90%;
    		min-width: 40%;
    	}
    	
    	.logo{
    		text-align: center;
    		max-width: 100%;
    		min-width: 40%;
    	}
    	
    	label{
    	  font-weight: bold;
    	  width: 100px;
    	}
    	
    	.findOk{
    		padding-top : 5%;
    		text-align: center;
    	}
    	
    	#goLogin{
    		padding-top : 5%;
    		text-align: center;
    	}
   	</style>


</head>
<body>
<!-- 	<div style="height: 65px; background-color: #cff09e;"></div> -->

	<div class="logo">
		<a href="/login/login"><img alt="LOGO"
			src="/resources/img/LOGO.png"
			style="height: 100%; padding-top: 60px;"></a>
	</div>

	<div class="findOk">
		<h4>${memberName}님의 사원 번호는 [ ${memberNo} ]입니다.</h4>
	</div>

	<div id="goLogin">
		<a href="/login/login">
			<button type="submit" class="btn" style="background-color: #68ae6d; color:white; width : 150px; height : 40px;">로그인</button>
		</a>
	</div>

</body>
</html>