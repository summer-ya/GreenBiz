<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
    <c:import url="../layout/header.jsp" />
 <style>

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

.memListShow:hover {
	text-decoration: none;
	color : black;
}
.memListShow{
	color : black;
}
</style>

<%-- <c:if test="${empty login }">
	<script type="text/javascript">
		alert("비정상적인 접근입니다. 로그인 후에 사용해주세요");
		location.href = "/login/login";
	</script>
</c:if>
<c:if test="${not empty login }">
	<script type="text/javascript">
		alert("오늘도 즐거운 하루 되세요.");
	</script>
</c:if> --%>



        <div class="col-md-12" id="mainTop"
							style="height: 50px; background-color: #44633F;"></div>
		<div style="margin-left : 16%">
		<div>
			<div class="col-md-9">
				<div class="row">

					<!-- 주소록 시작 -->
					<div class="col-md-6" id="memberList" style="padding-top: 100px;">
						<div class="col-md-12" id="mainTop"
							style="height: 50px; background-color: #68ae6d;">
							<p style="margin-bottom: 0; padding-top: 10px; font-size: 22px; color: white; font-weight: bold;">주소록</p>
						</div>
						<div
							style="margin: 10px 10px 0 10px; height: 420px; overflow: auto;">
							<ul style="list-style: none; padding: 0 10px 0 10px;">
							
							<c:forEach items="${list }" var="member">
								<c:if test="${member.memState eq '유'}">
								<li class="list-item">
									<h4>
										<i class="bi bi-person-circle"></i>&nbsp;<a class="memListShow"href="/chat/chat?memberNo=${member.memberNo }">${member.memberName }</a>
									</h4>
									<hr>
								</li>
								</c:if>
							</c:forEach>
							</ul>
						</div>
					</div>
					<!-- 주소록 끝 -->


					<!-- 채팅창 시작 -->
					<div class="col-md-6" style="padding-top: 100px;">
					
					<c:import url="../chat/chat.jsp"/>
					
							</div> <!--  채팅창 끝 -->
				</div>
			</div>
			</div>
			</div>
        
<c:import url="../layout/footer.jsp" />