<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<title> Admin Dept Write </title>
<link rel="icon" href="/resources/img/favicon-32x32.png">
<!-- 메뉴 텍스트가 너무 커서 일단 주석처리 -->
<%-- <c:import url="../../layout/adminHeader.jsp" /> --%>
   
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

   <!-- Optional JavaScript; choose one of the two! -->
   
   <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" ></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

:root{
   
    /* --body-color: #E4E9F7; */
    --sidebar-color: #FFF;
    --primary-color: #4D826C;
    --primary-color-light: #F6F5FF;
    --toggle-color: #DDD;
    --text-color: #383838;
    --tran-03: all 0.2s ease;
    --tran-03: all 0.3s ease;
    --tran-04: all 0.3s ease;
    --tran-05: all 0.3s ease;
}

body{
    min-height: 100vh;
    background-color: var(--body-color);
    transition: var(--tran-05);
}

::selection{
    background-color: var(--primary-color);
    color: #fff;
}

body.dark{
    --body-color: #18191a;
    --sidebar-color: #242526;
    --primary-color: #3a3b3c;
    --primary-color-light: #3a3b3c;
    --toggle-color: #fff;
    --text-color: #ccc;
}

/* ===== Sidebar ===== */
 .sidebar{
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 250px;
    padding: 10px 14px;
    background: var(--sidebar-color);
    transition: var(--tran-05);
    z-index: 100;  
}
/* .sidebar.close{
    width: 88px;
} */

/* ===== Reusable code - Here ===== */
.sidebar li{
    height: 50px;
    list-style: none;
    display: flex;
    align-items: center;
    margin-top: 10px;
}

.sidebar header .image,
.sidebar .icon{
    min-width: 60px;
    border-radius: 6px;
}

.sidebar .icon{
    min-width: 60px;
    border-radius: 6px;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
}

.sidebar .text,
.sidebar .icon{
    color: var(--text-color);
    transition: var(--tran-03);
}

.sidebar .text{
    font-size: 17px;
    font-weight: 500;
    white-space: nowrap;
    opacity: 1;
}
/* .sidebar.close .text{
    opacity: 0;
} */
/* =========================== */

.sidebar header{
    position: relative;
}

.sidebar header .image-text{
    display: flex;
    align-items: center;
    margin-top: 0;
}
.sidebar header .logo-text{
    display: flex;
    flex-direction: column;
}
header .image-text .name {
    margin-top: 2px;
    font-size: 18px;
    font-weight: 600;
}

header .image-text .profession{
    font-size: 13px;
    margin-top: -5px;
    margin-left: 4px;
    display: block;
}

.sidebar header .image{
    display: flex;
    align-items: center;
    justify-content: center;
}

.sidebar header .image img{
    width: 40px;
    border-radius: 6px;
}

.sidebar header .dropdown-toggle{
    position: absolute;
    top: 50%;
    right: -35px;
    transform: translateY(-50%) rotate(180deg);
    height: 40px;
    width: 40px;
    background-color: #4D826C;
    color: var(--sidebar-color);
    border-radius: 3px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    cursor: pointer;
    transition: var(--tran-05);
}

body.dark .sidebar header .dropdown-toggle{
    color: var(--text-color);
}

/* .sidebar.close .dropdown-toggle{
    transform: translateY(-50%) rotate(0deg);
}
 */
.sidebar .menu{
    margin-top: 0px;
}

.sidebar li.search-box{
    border-radius: 6px;
    background-color: var(--primary-color-light);
    cursor: pointer;
    transition: var(--tran-05);
}

.sidebar li.search-box input{
    height: 100%;
    width: 100%;
    outline: none;
    border: none;
    background-color: var(--primary-color-light);
    color: var(--text-color);
    border-radius: 6px;
    font-size: 17px;
    font-weight: 500;
    transition: var(--tran-05);
}

.sidebar li a{
    list-style: none;
    height: 100%;
    background-color: transparent;
    display: flex;
    align-items: center;
    height: 100%;
    width: 100%;
    border-radius: 6px;
    text-decoration: none;
    transition: var(--tran-00);
}

.sidebar li a:hover{
    background-color: var(--primary-color);
}

.sidebar li a:hover .icon,
.sidebar li a:hover .text{
    color: var(--sidebar-color);
}

body.dark .sidebar li a:hover .icon,
body.dark .sidebar li a:hover .text{
    color: var(--text-color);
}

.sidebar .menu-bar{
    height: calc(100% - 55px);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    overflow-y: scroll;
}

.menu-bar::-webkit-scrollbar{
    display: none;
}

.sidebar .menu-bar .mode{
    border-radius: 6px;
    background-color: var(--primary-color-light);
    position: relative;
    transition: var(--tran-05);
}

.menu-bar .mode .sun-moon{
    height: 50px;
    width: 60px;
}

.mode .sun-moon i{
    position: absolute;
}
.mode .sun-moon i.sun{
    opacity: 0;
}
body.dark .mode .sun-moon i.sun{
    opacity: 1;
}
body.dark .mode .sun-moon i.moon{
    opacity: 0;
}

.menu-bar .bottom-content {
   margin-bottom: 0;
   margin-left: 12px;
   margin-top: -20px;
}

.menu-bar .bottom-content .toggle-switch{
    position: absolute;
    right: 0;
    height: 100%;
    min-width: 60px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 6px;
    cursor: pointer;
}

.toggle-switch .switch{
    position: relative;
    height: 22px;
    width: 40px;
    border-radius: 25px;
    background-color: var(--toggle-color);
    transition: var(--tran-05);
}

.switch::before{
    content: '';
    position: absolute;
    height: 15px;
    width: 15px;
    border-radius: 50%;
    top: 50%;
    left: 5px;
    transform: translateY(-50%);
    background-color: var(--sidebar-color);
    transition: var(--tran-04);
}

body.dark .switch::before{
    left: 20px;
}

.home{
    position: absolute;
    top: 0;
    left: 250px;
    height: 100vh;
    width: calc(100% - 250px);
    background-color: #ffffff;
    transition: var(--tran-05);
}

.home .text{
    font-size: 30px;
    font-weight: 500;
    color: var(--text-color);
    padding: 12px;
    padding-left: 0;
}

/* .sidebar.close ~ .home{
    left: 78px;
    height: 100vh;
    width: calc(100% - 78px);
} */

body.dark .home .text{
    color: var(--text-color);
}

/* 프로필 */
.card__img {
    height: 116px;
    width: 116px;
    border-radius: 50%;
    background-color: white;
    margin: 0 auto 15px;
    border: 4px solid var(--primary-color);
    overflow: hidden;
    transition: 0.4s;
    transform: translateY(25px);
}

.card__img img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position:70% 0%;
}

.card__name {
    font-weight: 600;
    color: var(--white-color);
    margin-top: 20px;
    margin-left: 45px;
}

.card__job {
    color: var(--primary-color);
    margin-left: 36px;
}

.card {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: none;
    border-radius: 0.25rem;
    margin-top: -10px;
}

.nav-link {
    display: block;
    padding: 0;
}
</style>
</head>

<nav class="sidebar">
        <header>
            <div class="image-text">
                <span class="image">
                    <img src="https://ifh.cc/g/aDgZtG.png" alt="logo">
                </span>

                <div class="text logo-text">
                    <span class="name" style="font-size: 28px; font-style: bold; margin-left: 3px;">Green-Biz</span>
                    <span class="profession">Groupware</span>
                </div>
            </div>

        </header>

        <div class="menu-bar">
        
           <!-- 프로필 -->
         <div class="card">
              <div class="card__img">
                  <img src="https://ifh.cc/g/9mN2BZ.jpg" alt="janmang" width="227">
              </div>
              <div class="card__name">
                  <h2>잔망 루피</h2>
              </div>
              <div class="card__job">
                  <span>Fullstack Developer</span>
               </div>
            </div>
            
            <!-- 사이드 메뉴 -->
            <div class="menu">

                <li class="search-box">
                    <i class='bx bx-search icon'></i>
                    <input type="text" placeholder="Search">
                </li>

                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-home-alt icon' ></i>
                            <span class="text nav-text">메인화면</span>
                        </a>
                    </li>
                    
                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-bell icon'></i>
                            <span class="text nav-text">전사게시</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-heart icon' ></i>
                            <span class="text nav-text">자유게시판</span>
                        </a>
                    </li>
                    
                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
                            <span class="text nav-text">전자결재</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-pie-chart-alt icon' ></i>
                            <span class="text nav-text">일정관리</span>
                        </a>
                    </li>


                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-wallet icon' ></i>
                            <span class="text nav-text">메신저</span>
                        </a>
                    </li>

                </ul>
            </div>

            <div class="bottom-content">
                <li class="">
                    <a href="#">
                        <i class='bx bx-log-out icon' ></i>
                        <span class="text nav-text">Logout</span>
                    </a>
                </li>

            </div>
        </div>

    </nav>

    <section class="home">
        <div class="text">
        
        <div class="dropdown">
        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          연차/휴가계
        </a>
      
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">연차정보</a>
          <a class="dropdown-item" href="#">연차/휴가계 사용 신청</a>
          <a class="dropdown-item" href="#">연차/휴가계 사용 내역</a>
        </div>
      </div>
    </div>
		
        <h4 class="contents" style="background-color: #2D5A36; color: white; width:1200px;
       		height: 50px; line-height: 50px; margin: 0; font-weight: bolder; padding-left: 20px;">
        	${deptName} 사원관리
        </h4>
  <form action="${pageContext.request.contextPath}/admin/Dept/adminDeptWrite" method="post" enctype="multipart/form-data" >
        <div class="content-wrap" style="margin-top: 50px; width:1200px; height: 550px;">

        <div class="profile" style="width:200px; height: 300px; float: left;">
             <div style="border: 0.5px solid lightgray; width:200px; height: 240px; float: left;"></div>
             <input type="file" name="deptFile" id="member_picture" >
            <!--  <img src="" style="margin-left:-200px;"/> -->
         		  <button style="margin-top: 20px; width: 200px; height:30px; border-radius: 10px; 
             			  background-color: #2D5A36; color: white; border: 0.5px solid lightgray; 
             			  font-weight: lighter; ">사진첨부</button>
             </div>
        
        <table class="table" style="text-align: center; vertical-align: middle; 
        	   width: 980px; float: left; margin-left: 20px;">
        	 
               <!-- 인사정보 -->
               <tr>
                   <th style="background-color: #F6F6F6; width:300px;">사원번호</th>
                   <td><input type="text" id="memberNo" name="memberNo"/></td>
               </tr>
               <tr>
                   <th style="background-color: #F6F6F6;">이름</th>
                   <td><input type="text" id="memberName" name="memberName"/></td>
               </tr>
               <tr>
                   <th style="background-color: #F6F6F6;">생년월일</th>
                   <td><input type="date" id="birth" name="birth"/></td>
               </tr>
               <tr>
                   <th style="background-color: #F6F6F6;">성별</th>
                   <td>
                   	<select name="gender" id="gender">
					    <option value="">--성별을 선택해주세요--</option>
					    <option value="남">남</option>
					    <option value="여">여</option>
					</select> 
					</td>
               </tr>
               <tr>
                   <th style="background-color: #F6F6F6;">전화번호</th>
                   <td><input type="tel" id="phone" name="phone" /></td>
               </tr>
               <tr>
                   <th style="background-color: #F6F6F6;">이메일</th>
                   <td><input type="email" id="email" name="email"/></td>
               </tr>
               <tr>
                   <th style="background-color: #F6F6F6;">주소</th>
                   <td><input type="text" id="address" name="address"/></td>
               </tr>
        </table>

        <table class="table" style="text-align: center; vertical-align: middle; width: 1200px; float: left; margin-top:30px;">
               <tr>
                  <th style="background-color: #F6F6F6; width:300px;">부서</th>
                  <td>
                  	<input type="text" value="${deptName}" name="deptName" readonly=readonly>
                  	<input type="hidden" value="${deptNum}" name="deptNum" >
                  	<!-- <select name="deptNum" id="deptNum">
					    <option value="">--부서를 선택해주세요--</option>
					    <option value="10">영업팀</option>
					    <option value="20">회계팀</option>
					    <option value="30">총무팀</option>
					    <option value="40">인사팀</option>
					</select> -->
                  </td>
               </tr>
               <tr>
                  <th style="background-color: #F6F6F6;">직책</th>
                  <td>
                  	<select name="rank" id="rank">
					    <option value="">--직책을 선택해주세요--</option>
					    <option value="사원">사원</option>
					    <option value="대리">대리</option>
					    <option value="과장">과장</option>
					    <option value="부장">부장</option>
					    <option value="전무">전무</option>
					</select>
                  </td>
               </tr>
               <tr>
                  <th style="background-color: #F6F6F6;">총 연차 수</th>
                  <td><input type="number" id="leaveTotal" name="leaveTotal"/></td>
               </tr>
        </table>

        </div>
        <div class="button-wrap" style="width: 1200px; padding-left: 500px;">
            <button  style="border-radius: 10px; width: 100px; height: 40px; background-color: #2D5A36; color: white; 
                    border: 0.5px solid lightgray; font-weight: lighter;">등록</button>
            <button style="border-radius: 10px; width: 100px; height: 40px; margin-left: 20px;
                    background-color: #2D5A36; color: white; border: 0.5px solid lightgray; font-weight: lighter;"
                    onclick="location.href='/admin/Dept/adminDeptList'">취소</button>
        </div>
        </form>
        <br><br>
        
    	</section>
    
<script type="text/javascript">
const body = document.querySelector('body'),
sidebar = body.querySelector('nav'),
toggle = body.querySelector(".dropdown-toggle"),
searchBtn = body.querySelector(".search-box"),
modeSwitch = body.querySelector(".toggle-switch"), 
modeText = body.querySelector(".mode-text");


toggle.addEventListener("click", () => {
sidebar.classList.toggle("close");
})


searchBtn.addEventListener("click", () => {
sidebar.classList.remove("close");
})

modeSwitch.addEventListener("click", () => {
body.classList.toggle("dark");

if (body.classList.contains("dark")) {
    modeText.innerText = "Light mode";
} else {
    modeText.innerText = "Dark mode";

}
});
</script>

<c:import url="../../layout/footer.jsp" />