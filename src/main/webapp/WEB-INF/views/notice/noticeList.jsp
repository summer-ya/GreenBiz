<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<title> Notice List </title>

<link rel="icon" href="/resources/img/favicon-32x32.png">

<c:import url="../layout/header.jsp"/>

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
table tbody tr:hover{
    background-color: #f4f4f4;
    cursor: pointer;
}

</style>



		<div id="page_btn">
     	  <c:if test="${paging.curPage > 1 }">
		<div class="page" onclick="location.href='/notice/noticeList?curPage=${paging.curPage - 1 }'">◀</div>
	    </c:if>
				
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
					<c:if test="${paging.curPage eq i}">
						<div class="page curPage" onclick="location.href='/notice/noticeList?curPage=${i}'">${i}</div>
					</c:if>
					<c:if test="${paging.curPage ne i}">
						<div class="page" onclick="location.href='/notice/noticeList?curPage=${i}'">${i}</div>
					</c:if>
				</c:forEach>
				
				<c:if test="${paging.curPage < paging.totalPage}">
					<div class="page" onclick="location.href='/notice/noticeList?curPage=${paging.curPage +1 }'">▶</div>
        </c:if>
           		
           		
    	</div>
    
    	<br>

<script type="text/javascript">
// 검색 버튼 클릭시 호출되는 함수
function searchAllnotice(){
	if(allnoticeNo === undefined || allnoticeNo === '' || allnoticeNo < 1){
		allnoticeNo = 1
	}
	
	// 셀렉트 옵션에서 선택된 값 (사번/이름)
	var type = document.getElementById('type').value
	// 인풋창에 입력된 값
	var keyword = document.getElementById('keyword').value
	
	// ajax data값  
	var data = { allnoticeNo : allnoticeNo, type: type, keyword: keyword }
	// ajax를 이용하여 사원 리스트 출력하는 함수 호출
	getMemberByAjax(data)
}
</script>

<c:import url="../layout/footer.jsp" />