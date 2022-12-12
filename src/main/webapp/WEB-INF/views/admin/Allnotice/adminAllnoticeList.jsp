<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<title> Admin Allnotice List </title>

<link rel="icon" href="/resources/img/favicon-32x32.png">

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
 
 width: 250px;
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

<c:import url="../../layout/adminHeader.jsp" />
     
        
    <div class="board"></div>
	
			
    <div class="search" style="margin-top: 5%; margin-left:72%">
    <input type="text" placeholder="🔍 검색어 입력">
    </div>
   	  
  

	<div id="board-list" style="margin-top: 3%">
     	<div class="container">
          	<table class="board-table">
              <thead>
              	 <tr>
                  	<th scope="col" class="th-num">No.</th>
                	<th scope="col" class="th-title">글제목</th>
                	<th scope="col" class="th-date">작성일</th>
              	 </tr>
              </thead>
            

 			  <tbody>
 			  <c:forEach items="${list }" var="allnotice">
 		      <tr>
				<td>${allnotice.allnoticeNo}</td>
				<td><a href="/admin/Allnotice/adminAllnoticeView?allnoticNo=${allnotice.allnoticeNo}">${allnotice.noticeTitle}</a></td>
				<td><fmt:formatDate value="${allnotice.noticeDate}" pattern="yyyy-MM-dd"/></td>
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
           		
           		
       	<!-- 글작성 버튼   -->  		
        <div class="WriteButton" style="text-align:center; display: inline-block;">
        <input type="button" value="글작성"
      		   style="width: 100px; height: 40px; background-color: #2D5A36; color: #FFFFFF;
               cursor: pointer; font-size: 16px; margin-left: 400%;" 
               onclick="location.href='/admin/Allnotice/adminAllnoticeWrite'">
        </div>	
           		
           		
           		
    	</div>
    
    	<br>

<c:import url="../../layout/footer.jsp" />