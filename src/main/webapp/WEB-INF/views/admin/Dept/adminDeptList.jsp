<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<title> Admin Dept List </title>
   
   <link rel="icon" href="/resources/img/favicon-32x32.png">
   
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   
   <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" ></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

:root{
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
    transition: var(--tran-03);
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

table tbody tr:hover{
    background-color: #f4f4f4;
    cursor: pointer;
}
</style>
</head>

<body>
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
        
        <!-- Admin Dept List Content -->
        <h4 class="contents" style="background-color: #2D5A36; color: white; width:1200px; height: 50px; 
            line-height: 50px; margin: 0; font-weight: bolder; padding-left: 20px;">
            인사정보
        </h4>

        <div class="content-wrap" style="margin-top: 50px; width:1200px;">
            <div class="w3-sidebar w3-bar-block" style="width:130px; height:500px; border-right: 1px solid #ccc; background-color: white;">
                <c:forEach items="${list}" var="depts">
                <button class="w3-bar-item w3-button tablink" onclick="tabClick(event, '${depts.id}')"><b>${depts.name}</b></button>
           		</c:forEach>
            </div>
              
            <div id="dept_name_wrap" class="title" style="width:900px; height: 50px; color: black; 
            	 margin-left: 180px; line-height: 50px; font-weight: bolder;">
            </div>
			
            <div class="search" style="width:550px; height: 50px; float: right; margin-left: 70px">
                <select name="type" id="type" style="width:150px; height:32px;">
                    <option value="memberno">사번</option>
                    <option value="membername">이름</option>
              <c:forEach items="${list }" var="dept">
 		      <tr>
				<td>${dept.id}</td>
				<td><a href="/admin/Dept/adminDeptView?deptNum=${dept.id}"></a></td>
              </tr>
              </c:forEach>
                </select>
               		<input id="keyword" type="text" placeholder=" 검색어 입력" style="border:1px solid lightgrey; 
               			   width: 300px; height: 32px;">
                    <button type="type" onclick="searchMember()" style="border:none; background-color: #2D5A36; 
                            color: white; font-size: small; height: 30px; width: 50px;">검색</button>
            </div>

			
            <table id="members" class="table" style="text-align: center; vertical-align: middle; width: 1000px; float: left; margin-left: 180px;">
                <thead>
                <tr>
                    <th style="background-color:rgba(221, 221, 221, 0.4);">사번</th>
                    <th style="background-color:rgba(221, 221, 221, 0.4);">이름</th>
                    <th style="background-color:rgba(221, 221, 221, 0.4);">직책</th>
                </tr>
                </thead>
                <tbody id="members_body">
                </tbody>
            </table>
            
            <br>
            
            <!-- 사원등록 버튼 -->
            <div class="button-wrap" style="width: 1200px; padding-left: 1000px;">
            <button style="border-radius: 10px; width: 100px; height: 40px; background-color: #2D5A36; color: white; 
                    border: 0.5px solid lightgray; font-weight: lighter;">등록</button>

        </div>
            
 

        </div>

<script type="text/javascript">

var id;
var name;

// DOM이 모두 로드되었을때 
$(function(){
	// 기본값은 인사팀 
	var defalutData = {id : 10}
	// 인사팀 사원 리스트 조회
	getMemberByAjax(defalutData)
});


	// 검색 버튼 클릭시 호출되는 함수
	function searchMember(){
		if(id === undefined || id === ''){
			id = 10
		}
		
		// 셀렉트 옵션에서 선택된 값 (사번/이름)
		var type = document.getElementById('type').value
		// 인풋창에 입력된 값
		var keyword = document.getElementById('keyword').value
		
		// ajax data값  
		var data = { id : id, type: type, keyword: keyword }
		// ajax를 이용하여 사원 리스트 출력하는 함수 호출
		getMemberByAjax(data)
	}

	// 탭 클릭시 호출되는 함수
	function tabClick(e, num){
		// 버튼 엘리먼트의 텍스트 = 부서이름
		name = e.target.innerText	
		
		// 혹시 모를 오류 방지를 위해 기본 값 처리
		if(name === undefined || name === ''){
			name = '인사팀'
		}
		
		// 부서 이름 나타내기		
		var nameElement =  document.getElementById('dept_name_wrap')
		nameElement.innerText = name
		
		// 전역변수에 값 할당
		id = num
		
		// ajax data값 
		var data = {id : num}
		// ajax를 이용하여 사원 리스트 출력하는 함수 호출
		getMemberByAjax(data)
	}

	// ajax를 이용하여 사원 리스트 출력하는 함수
	function getMemberByAjax(value){
		// 멤버정보가 출력되는 테이블의 <tbody> 엘리먼트 
		var tr = $('#members_body').eq(0)
		
		$.ajax({
			url : "/admin/Dept/list"
			, data : value
			, type : "get"
			, dataType : "json"
			, success : function(data){
				// ajax결과를 엘리먼트에 동적으로 추가
				var str = "";
				var result = data
				$.each(result, function(i){
					str += "<tr onclick='location.href=\"/admin/Dept/adminDeptView?memberNo="+result[i].MEMBERNO+"\"'>";
					str += "<td calss='tb_no'>" + result[i].MEMBERNO + "</td>";
					str += "<td class='tb_name'>" + result[i].MEMBERNAME + "</a></td>";
					str += "<td class='tb_rank'>" + result[i].RANK + "</td>";
					str += "</tr>"
				})
				tr.html(str)
			},
			error : function(e){
				console.log("ajax 통신 실패");
				console.log(e)
			}
		}); //ajax end
	}


</script>

</html>