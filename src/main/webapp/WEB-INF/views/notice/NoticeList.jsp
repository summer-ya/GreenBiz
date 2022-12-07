<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    

<!DOCTYPE html>
<html>
<head>
<title> Notice List </title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

.board {
   margin-top: 3%;
   margin-bottom: 10px;
   margin-left: -13px;
   font-size: 25px;
   color: white;
   background-color: #2D5A36;
   width: 100%;
   height: 50px;
}

#container {
   width: 990px;
   margin: 0 auto;
   text-align: center;

   
}
.tab {
   list-style: none;
   margin: 0;
   padding: 0;
   overflow: hidden;
   float: left;
   display: inline-block;
   color: #000;
   text-align: center;
   text-decoration: none;
   padding: 14px 16px;
   font-size: 17px;
}

.tabmenu {
   height: 300px;
   margin-right: 20px;

}

a{
   display: inline-block;
   color: #000;
   font-size: 17px;
}

.search {
 
 width: 300px;
 margin-top: %;
 margin-left: 70%;
}

.search img {
   margin-left: 90%;
   margin-top: -23%;
   width: 17px;
}

input {
 width: 100%;
 border: 1px solid #bbb;
 border-radius: 8px;
 padding: 10px 12px;
 font-size: 14px;

}

.imgbox {

   margin-left: 15%;
   margin-bottom: 5%;
   width: 800px;
   height: 400px;
   border: 1px solid #ccc;
}
    
table {
  
  border-collapse: collapse;
  border-spacing: 0;
}

.page-title {
  margin-bottom: 60px;
}
.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}

.board-table {

  font-size: 14px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  border-top: 3px solid #68ae6d;
}

.board-table tr:hover {
   background: rgba(243, 245, 236, 0.668);
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
  font-size: 12px;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.board-table tbody th p{
  display: none;
}


#btn {
   float: right;
   margin-top:-2%;
   margin-bottom: 10%;
   margin-right: 10%;
   width: 80px; height: 35px; color: #fff; 
   background-color: #68ae6d;
   color: #FFFFFF;
   border:none; 
   border-radius: 5px;

}

#btn:hover { 
   background: #3A7F03; 
}

.page{
   padding: 5px 8px;
   border: 1px solid rgba(0,0,0,0.1);
   margin: 0;
   cursor: pointer;
   display: inline-block;
   
}
.curPage{
   font-weight: bold;
   color: #89E241;
   
}

#page_btn {
   margin-top: 3%;
   margin-bottom: 5%;
   margin-left: 40%;
   
}

</style>

<c:import url="../layout/header.jsp" />
     
        
      <div class="board"></div>
			
	  <br>		
			
      <div class="search">
      <input type="text" placeholder="검색어 입력">
      <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"></div>
    
  	
  
 	  <!-- 전사게시 탭 -->
      <ul class="nav nav-tabs">
     	 <li class="nav-item">
      		<a class="nav-link active" data-toggle="tab" href="#home"> 전사게시</a></li>
      	
      	 <li class="nav-item">
      	 	<a class="nav-link" data-toggle="tab" href="#profile"> 경조사안내</a></li>
       	
    	 <li class="nav-item dropdown show">
  	 		<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" 
  	 		aria-haspopup="true" aria-expanded="true"> 카테고리 </a>
  	 	
         <div class="dropdown-menu show" x-placement="bottom-start" style="position: absolute; 
    	  transform: translate3d(0px, 40px, 0px); top: 0px; left: 0px; will-change: transform;">
      
      		<a class="dropdown-item" href="#"> 인사이동</a>
      		<a class="dropdown-item" href="#"> 인사이동</a>
      		<a class="dropdown-item" href="#"> 인사이동</a>
      	
      	 </div>
   	  </ul>
   	  
   	  
  

	<div id="board-list">
     	<div class="container">
          	<table class="board-table">
              <thead>
              	 <tr>
                  	<th scope="col" class="th-num">No.</th>
                	<th scope="col" class="th-title">글제목</th>
                	<th scope="col" class="th-date">글작성일</th>
              	 </tr>
              </thead>
              <tbody>
              
              <br><br><br><br>

 			<c:forEach items="${list }" var="noticeDTO">
 		      <tr>
                 <td>${noticeDTO.noticeNum }</td>
                 <th><a href="#">${noticeDTO.noticeTitle }</a></th>
                 <td>${noticeDTO.noticeDate }</td>
              </tr>
    		</c:forEach>
              </tbody>
          </table>
      </div>
</div>


		<div id="page_btn">
     	   <c:if test="${page == startBlock && page != 1}">
        	    <div class="page" onclick="location.href='..'">◀</div></c:if>
        
       	   <c:forEach begin="${startBlock}" end="${endBlock}" var="i">
           		<c:if test="${page == i}">
               	<div class="page curPage" onclick="location.href='..'">1</div></c:if>
                
           <c:if test="${page != i}">
                <div class="page" onclick="location.href='..'">2</div></c:if>
                
           <c:if test="${page != i}">
            	<div class="page" onclick="location.href='..'">3</div></c:if>
            	
           <c:if test="${page != i}">
                <div class="page" onclick="location.href='..'">4</div></c:if></c:forEach>
        
           <c:if test="${page == endBlock && page != allPage}">
           		<div class="page" onclick="location.href='..'">▶</div></c:if>
    	</div>
    
    <br><br><br><br><br>

<c:import url="../layout/footer.jsp" />