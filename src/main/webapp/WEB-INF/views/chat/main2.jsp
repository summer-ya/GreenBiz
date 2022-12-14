<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.1/font/bootstrap-icons.css">

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

<title>GREEN BIZ</title>

<style type="text/css">
body {
	margin: 0 auto;
	max-width: 90%;
	min-width: 40%;
}

.logo {
	text-align: center;
	display: inline-block;
	width: 100%;
	height: 50px;
	padding-top: 10px;
}

.member_info {
	text-align: center;
}

#hambuger {
	padding-top: 7px;
}

#hambuger>a {
	/* 	display: inline; */
	vertical-align: center;
	color: #3F4B3B;
	font-size: 40px;
}

#hambuger>a:hover {
	text-decoration: none;
}

#member_img {
	padding-top: 10px;
	font-size: 60px;
	color: gray;
	text-align: center;
}

ul>li {
	font-size: 20px;
}

.logout a {
	color: gray;
}

.logout>a:hover {
	color: #gray;
}

#memberList {
	height: 500px;
}

/* 스크롤바 가로 사이즈 */
::-webkit-scrollbar {
	width: 10px;
}

/* 스크롤바 막대기 */
::-webkit-scrollbar-thumb {
	border-radius: 20px;
	background-color: #5A9367;
}

/* 스크롤바 백그라운드 */
::-webkit-scrollbar-track {
	background-color: #fff;
}

/*말풍선 css*/
.bubble-left {
	position: relative;
	width: 50%;
	height: 60px;
	padding: 0px;
	background: #FFFFFF;
	-webkit-border-radius: 11px;
	-moz-border-radius: 11px;
	border-radius: 11px;
	border: #7F7F7F solid 1px;
}

.bubble-left:after {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 15px 15px 15px 0;
	border-color: transparent #FFFFFF;
	display: block;
	width: 0;
	z-index: 1;
	left: -15px;
	top: 15px;
}

.bubble-left:before {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 15px 15px 15px 0;
	border-color: transparent #7F7F7F;
	display: block;
	width: 0;
	z-index: 0;
	left: -16px;
	top: 15px;
}

.bubble-right {
	position: relative;
	width: 50%;
	height: 60px;
	padding: 0px;
	background: #44633F;
	-webkit-border-radius: 11px;
	-moz-border-radius: 11px;
	border-radius: 11px;
	border: #fff solid 1px;
}

.bubble-right:after {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 15px 0 15px 15px;
	border-color: transparent #44633F;
	display: block;
	width: 0;
	z-index: 1;
	right: -15px;
	top: 15px;
}

.bubble-right:before {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 15px 0 15px 15px;
	border-color: transparent #fff;
	display: block;
	width: 0;
	z-index: 0;
	right: -16px;
	top: 15px;
}
</style>

</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">
				<div class="row">
					<div class="col-md-7">
						<div class="logo">
							<a href="/"><img alt="LOGO" src="/resources/img/LOGO.png"
								class="img-fluid" /></a>
						</div>
					</div>
					<!-- 로고 옆  햄버거 메뉴 -->
					<div class="col-md-5">
						<div id="hambuger">
							<a href="/"> <i class="bi bi-list"></i>
							</a>
						</div>
					</div>
				</div>

				<div id="member_img">
					<i class="bi bi-person-circle"></i>
				</div>

				<div class="member_info">
					<h3>[DB-사원이름]</h3>
					<p>[DB-부서] / [DB-직함]</p>

					<div class="logout" onclick="memLogout()">
						<a href="../login/logout"><p>로그아웃</p></a>
					</div>
				</div>

				<ul style="list-style: none;">
					<br>
					<li class="list-item"><i class="bi bi-chat" /></i> 메신저</li>
					<br>

					<li class="list-item"><i class="bi bi-calendar-event"></i>
						일정관리</li>
					<br>

					<li class="list-item"><i class="bi bi-person"></i> 사원관리</li>
					<br>

					<li class="list-item"><i class="bi bi-search"></i> 사원조회</li>
					<br>

					<li class="list-item"><i class="bi bi-buildings"></i> 부서정보</li>
					<br>

					<li class="list-item"><i class="bi bi-view-list"></i> 게시글관리</li>

				</ul>

			</div>


			<div class="col-md-9">
				<div class="row">
					<div class="col-md-12"
						style="height: 65px; background-color: #cff09e;"></div>
				</div>
				<div class="row">

					<!-- 주소록 시작 -->
					<div class="col-md-6" id="memberList" style="padding-top: 70px;">
						<div class="col-md-12" id="mainTop"
							style="height: 50px; background-color: #44633F;">
							<p
								style="margin-bottom: 0; padding-top: 10px; font-size: 22px; color: white; font-weight: bold;">주소록</p>
						</div>
						<div
							style="margin: 10px 10px 0 10px; height: 420px; overflow: auto;">
							<ul style="list-style: none; padding: 0 10px 0 10px;">
								<li class="list-item">
									<h4>
										<i class="bi bi-person-circle"></i>&nbsp;김인사<i
											class="bi bi-star" style="float: right;"></i>
									</h4>
									<hr>
								</li>
								<li class="list-item">
									<h4>
										<i class="bi bi-person-circle"></i>&nbsp;강사원<i
											class="bi bi-star" style="float: right;"></i>
									</h4>
									<hr>
								</li>
								<li class="list-item">
									<h4>
										<i class="bi bi-person-circle"></i>&nbsp;이이사<i
											class="bi bi-star" style="float: right;"></i>
									</h4>
									<hr>
								</li>
								<li class="list-item">
									<h4>
										<i class="bi bi-person-circle"></i>&nbsp;윤행정<i
											class="bi bi-star" style="float: right;"></i>
									</h4>
									<hr>
								</li>
								<li class="list-item">
									<h4>
										<i class="bi bi-person-circle"></i>&nbsp;박인턴<i
											class="bi bi-star" style="float: right;"></i>
									</h4>
									<hr>
								</li>
								<li class="list-item">
									<h4>
										<i class="bi bi-person-circle"></i>&nbsp;박디비<i
											class="bi bi-star" style="float: right;"></i>
									</h4>
									<hr>
								</li>
								<li class="list-item">
									<h4>
										<i class="bi bi-person-circle"></i>&nbsp;윤과장<i
											class="bi bi-star" style="float: right;"></i>
									</h4>
									<hr>
								</li>
								<li class="list-item">
									<h4>
										<i class="bi bi-person-circle"></i>&nbsp;이대리<i
											class="bi bi-star" style="float: right;"></i>
									</h4>
									<hr>
								</li>
								<li class="list-item">
									<h4>
										<i class="bi bi-person-circle"></i>&nbsp;강차장<i
											class="bi bi-star" style="float: right;"></i>
									</h4>
									<hr>
								</li>
								<li class="list-item">
									<h4>
										<i class="bi bi-person-circle"></i>&nbsp;김사장<i
											class="bi bi-star" style="float: right;"></i>
									</h4>
									<hr>
								</li>
							</ul>
						</div>
					</div>
					<!-- 주소록 끝 -->


					<!-- 채팅창 시작 -->
					<div class="col-md-6" style="padding-top: 70px;">

<!-- 						<div style="display: inline; font-size: 50px;"> -->
<!-- 							<i class="bi bi-person-circle"></i> -->
<!-- 						</div> -->
<!-- 						<p style="display: inline; font-size: 24px; font-weight: bold;">강디비 -->
<!-- 							사원</p> -->
<!-- 						<p style="display: inline; font-size: 16px; color: gray;">A221118</p> -->
<!-- 						<br> -->
						
						<c:import url="../chat/chat.jsp"/>


<!-- 						<div class="row"> -->
<!-- 						<h1>to2.kr/aGk</h1> -->

						
<!-- 						<div class="chat-form"> -->
<!-- 						    <form onsubmit="sendChatMessage(this); return false;"> -->
<!-- 						        div*3>span+input -->
<!-- 						        <div><span>이름</span><input type="text" name="writer" placeholder="이름을 입력해주세요."></div> -->
<!-- 						        <div><span>내용</span><input type="text" name="body" placeholder="내용을 입력해주세요."></div> -->
<!-- 						        <div><span>입력</span><input type="submit" value="입력"></div> -->
<!-- 						    </form> -->
<!-- 						</div> -->
						
<!-- 						<div class="chat-messages"> -->
						    
<!-- 						</div> -->
						
<!-- 							<div class="col-md-12" -->
<!-- 								style="background-color: #cff09e; height: 350px;"> -->
<!-- 								<div class="msgForm" style="padding: 10px 0 10px 0;"> -->
<!-- 									<div class="form-row float-left bubble-left" -->
<!-- 										style="padding-top: 10px;"> -->
<!-- 										<p style="padding-top: 5px;">&nbsp;안녕하세요&nbsp;</p> -->
<!-- 									</div> -->

<!-- 									<br> -->
<!-- 									<br> -->
<!-- 									<br> -->

<!-- 									<div class="form-row float-right bubble-right" -->
<!-- 										style="padding-top: 10px;"> -->
<!-- 										<p style="color: white; padding-top: 5px;">&nbsp;반가워용~&nbsp;</p> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<div class="col-md-12" style="padding: 10px 0 0 0"> -->
<!-- 								<div class="row"> -->
<!-- 									<div class="col-md-9" style="padding-right: 0;"> -->
<!-- 										<input type="text" style="width: 100%; height: 40px;"> -->
<!-- 									</div> -->
<!-- 									<div class="col-md-3" style="padding-left: 0;"> -->
<!-- 										<input type="submit" -->
<!-- 											style="width: 100%; height: 40px; background-color: #44633F; color: white;" -->
<!-- 											value="전송"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 						</div> -->
<!-- 					</div> 채팅창 끝 -->
				</div>
			</div>


<c:import url="../layout/footer.jsp" />
</html>