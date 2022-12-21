<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>


<title>GREEN BIZ</title>
<!-- 	<link rel="icon" href="/resources/img/favicon-32x32.png" type="image/x-icon"> -->
	<link rel="icon" href="/resources/img/favicon-32x32.png">
   
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

   <!-- Optional JavaScript; choose one of the two! -->
   
   <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" ></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

   <!-- Option 2: Separate Popper and Bootstrap JS -->
   <!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    -->

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

.sidebar header .toggle{
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

body.dark .sidebar header .toggle{
    color: var(--text-color);
}

/* .sidebar.close .toggle{
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
   margin-left: -1px;
   margin-top: -30px;
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
    margin-left: 65px;
}

.card__job {
    color: var(--primary-color);
    margin-left: 95px;
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

.menu > ul > li > ul {
      width:150px;
      display:none;
      position: absolute;
      font-size:16px;
      background: #fff;
   }

.menu > ul > li:hover > ul {
      display:block;
      color: black;
   }
   
a{
   color: black;
}

a:hover {
    color: black;
    text-decoration: none;
}
   
/* #appmenu > li:hover > ul {
      display:block;
      color: black;
   }

#appmenu > li > ul {
      display:none;
      background: #fff; */
}
</style>
</head>

<body>
<nav class="sidebar">
        <header>
            <div class="image-text">
                <span class="image">
                <a href="/mainPage/mainPage">
                    <img src="https://ifh.cc/g/aDgZtG.png" alt="logo">
                </a>
                </span>

                <div class="text logo-text">
                <a href="/mainPage/mainPage">
                    <span class="name" style="font-size: 28px; font-style: bold; margin-left: 3px;">Green-Biz</span>
                    <span class="profession">Groupware</span>
                 </a>
                </div>
            </div>

        </header>

        <div class="menu-bar">
        
           <!-- 프로필 -->
         <div class="card">
              <div class="card__img">
                  <%-- <img src="/resources/img/${file.originName}" alt="사원증" width="227"> --%>
                   <img src="/upload/${file.storedName}" width="227" alt="">
              </div>
              <div class="card__name">
                  <h2>${memInfo.MEMBERNAME }</h2>
              </div>
              <div class="card__job">
                  <span style="font-size: 16px;">${memInfo.RANK }</span>
               </div>
            </div>
            
            <!-- 사이드 메뉴 -->
            <div class="menu">

            <!-- search->toggle -->
                <!-- <li class="search-box">
                    <i class='bx bx-search icon'></i>
                    <input type="text" placeholder="Search">
                </li> -->
                <ul class="menu-links">
                
                <li class="nav-link">
                    <a href="/mainPage/mainPage">
                        <i class='bx bx-home-alt icon' ></i>
                        <span class="text nav-text">메인화면</span>
                    </a>
                </li>
                    
                <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
                            <span class="text nav-text">나의 정보</span>
                        </a>
                        <ul style="margin-left: 215px;">
                           <li style="margin-left: 25px; "><a href="/myPage/myPage">나의 정보 수정</a></a>
                           <li style="margin-left: 25px; "><a href="/leave/LeaveApplication">연차/휴가계 사용 신청</a>
                           <li style="margin-left: 25px; "><a href="/leave/LeaveMain">연차/휴가계 사용 내역</a>
                           <c:if test="${memInfo.RANK == '과장'}">
                          <li style="margin-left: 25px; "><a href="/leave/LeaveConfirm">연차/휴가계 사용 요청 내역</a>
                      </c:if>
                        </ul>
                    </li>

                    <li class="nav-link">
                        <a href="/notice/noticeList">
                            <i class='bx bx-heart icon' ></i>
                     		<span class="text nav-text">전사게시판</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-heart icon' ></i>
                            <span class="text nav-text">자유게시판</span>
                        </a>
                        <ul style="margin-left: 215px;">
                           <li style="margin-left: 25px; "><a href="/board/boardMain" style="color: black;">사내 게시판</a>
                           <li style="margin-left: 25px; "><a href="/community/cList" style="color: black;">사내 동호회</a>
                        </ul>
                    </li>
                    
                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
                            <span class="text nav-text">전자결재</span>
                        </a>
                        <ul style="margin-left: 215px;">
                           <li style="margin-left: 25px; "><a href="/approval/list" style="color: black;">전자결재 기안함</a>
                           <li style="margin-left: 25px; "><a href="/approval/main" style="color: black;">전자결재 결재함</a>
                           <li style="margin-left: 25px; "><a href="/approval/confirmOk" style="color: black;">전자결재 완료함</a>
                        </ul>
                    </li>

                    <li class="nav-link">
                        <a href="/schedule/schedule">
                            <i class='bx bx-pie-chart-alt icon' ></i>
                            <span class="text nav-text">일정관리</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="/chat/main">
                            <i class='bx bx-wallet icon' ></i>
                            <span class="text nav-text">메신저</span>
                        </a>
                    </li>

                </ul>
            </div>

            <c:if test="${not empty loginId}">
            <div class="bottom-content">
                <li class="">
                    <a href="/login/logout">
                        <i class='bx bx-log-out icon' ></i>
                        <span class="text nav-text">LogOut</span>
                    </a>
                </li>
            </div>
            </c:if>
            
            <c:if test="${empty loginId}">
            <div class="bottom-content">
                <li class="">
                    <a href="/login/login">
                        <i class='bx bx-log-out icon' ></i>
                        <span class="text nav-text">LogIn</span>
                    </a>
                </li>
            </div>
            </c:if>
        </div>

    </nav>

    <section class="home">
        <%-- <div class="text">
        
        <div class="dropdown">
        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          나의 정보
        </a>
      
        <div class="dropdown-menu">
          <a class="dropdown-item" href="/myPage/myPage">나의 정보 수정</a>
          <a class="dropdown-item" href="/leave/LeaveApplication">연차/휴가계 사용 신청</a>
          <a class="dropdown-item" href="/leave/LeaveMain">연차/휴가계 사용 내역</a>
         <c:if test="${memInfo.RANK == '과장'}">
               <a class="dropdown-item" href="/leave/LeaveConfirm">연차/휴가계 사용 요청 내역</a>
           </c:if>
        </div>
      </div>
        
        </div> --%>
  
       <div id="appAlert" class="alert alert-success" role="alert" style="display: none;" ></div>
<script>
var socket = null;
$(document).ready(function(){
   connectWS();
})

function connectWS(){
   var ws = new WebSocket("ws://"+location.origin.substr(7)+"/replyEcho");
    socket = ws;
   
   ws.onopen = function(){
      console.log('Info: connection opend.');

   }
   
   ws.onmessage = function (event){
      console.log('receivedMessage : ',event.data+'\n');
      let $appAlert = $('div#appAlert');
      $appAlert.html(event.data);
      $appAlert.css('display','block');
      
      setTimeout(() => {
         $appAlert.css('display','none');
      }, 3000);
      
   }
   
   ws.onclose = function(event){ 
      console.log('Info:connection closed.');
      //setTimeout(() => {   connect();   }, 1000);   //retry connection!
   };
   ws.onerror = function(err){ console.log('Error:',err); };
}

</script>  