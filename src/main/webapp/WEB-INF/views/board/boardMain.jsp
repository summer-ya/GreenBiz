<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.Timestamp" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">

.board {
	margin-top: 3%;
	margin-bottom: 10px;
	margin-left: -13px;
	font-size: 25px;
	color: white;
	background-color: #4D826C;
	width: 100%;
	height: 50px;
}

#container {
	width: 990px;
	margin: 0 auto;
	text-align: center;

}

.title {
	font-size: 42px;
	font-weight: bold;
	font-family: 'Binggrae', sans-serif;
	margin-top: 80px;
	margin-right: 10%;
	color: #68ae6d;

}

.desc {
	margin-bottom: 50px;
	margin-right: 10%;
	font-size: 20px;
	letter-spacing: -0.05em;
	line-height: 1.7;
	color: #68ae6d;
}

a{
	display: inline-block;
	color: #000;
	font-size: 18px;
}

#searchForm{
	text-align : center;
	margin-top: 5%;
	margin-bottom: 2%;
	margin-left: 50%;
}

#search {
	background-color: #68ae6d;
	color: #FFFFFF;
}

input {
	border: 1px solid #bbb;
	border-radius: 8px;
	padding: 10px 12px;
	font-size: 15px;

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
	font-size: 13px;
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

#bbtn {
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
	margin-left: -10%;
}

select {
	width: 85px;
	height: 42px;
	border-radius: 10px;
	text-align: center;
	border: 1px solid #ADADB1;

}

select option {
	background: #E9F8E0;
	color: black;
	padding: 3px 0;
}

</style>
</head>

<body>

        <div class="board">

        </div>


    <div id="container">

  <div class="head">
        <h2 class="title">[GREEN BIZ] </h2>
        <h3 class="desc">사내게시판</h3>

<script type="text/javascript">
$(document).ready(function() {
	$("#searchForm select[name='category']").val('${param.category}').prop('selected', true)
	$("#searchForm input[name='search']").val('${param.search}')
</script>

<div id="searchForm">
   <form>
      <div class="selectBox">
   <select name="category">
       <option  hidden="" disabled="disabled" selected="selected" value="">선택 🔍</option>
       <option value="title">제목</option>
       <option value="content">내용</option>
     </select> 
     <input type="text" size="20" name="search" placeholder="검색어를 입력하세요." />&nbsp;
     <input type="submit" id="search" value="검색"/>
   </div>
    </form>
</div>
 <!-- 정렬, 검색 -->
<div class="row">
	<!-- 정렬방식 -->
	<div class="col-sm-2">
	<div class="btn-group">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		정렬방식 <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
		<li><a href="/board/boardMain?category=${category }&sort=READ">조회순</a></li>
		<li><a href="/board/boardMain?category=${category }&sort=TIME">등록순</a></li>
    	</ul>
    </div>
    </div><!-- 정렬방식 END -->

</div>

<div class="imgbox"></div>

<div id="board-list">
      <div class="container">
          <table class="board-table">
              <thead>
              <tr>
                  <th scope="col" class="th-num">번호</th>
                  <th scope="col" class="th-title">제목</th>
                  <th scope="col" class="th-bhit">조회수</th>
                  <th scope="col" class="th-date">등록일</th>
              </tr>
              </thead>
              <tbody>
          	  <c:forEach items="${list }" var="board">
              <tr>
                  <td>${board.bno}</td>
                  <th style="padding-left: 80px">
                    <a href="/board/boardView?bno=${board.bno }"> ${board.btitle }</a>
                    <td>${board.bhit}</td>
                  <td><fmt:formatDate value="${board.bdate }" pattern="yyyy-MM-dd"/></td>
              </tr>
          	  </c:forEach>
              </tbody>
          </table>
      </div>
  </div>

<c:if test="${not empty param.search }">
<c:set var="searchParam" value="&category=${param.category }&search=${param.search }"/>
</c:if>

<div id="page_btn">
				<c:if test="${paging.curPage > 1 }">
					<div class="page" onclick="location.href='/board/boardMain?curPage=${paging.curPage - 1 }${searchParam}'">◀</div>
				</c:if>
				
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
					<c:if test="${paging.curPage eq i}">
						<div class="page curPage" onclick="location.href='/board/boardMain?curPage=${i}${searchParam}'">${i}</div>
					</c:if>
					<c:if test="${paging.curPage ne i}">
						<div class="page" onclick="location.href='/board/boardMain?curPage=${i}${searchParam}'">${i}</div>
					</c:if>
				</c:forEach>
				
				<c:if test="${paging.curPage < paging.totalPage}">
					<div class="page" onclick="location.href='/board/boardMain?curPage=${paging.curPage +1 }${searchParam}'">▶</div>
        </c:if>
    </div>

<button type="button" id="bbtn" onclick="location.href='/board/boardWrite'">글작성</button>
<br>
<br>


<c:import url="../layout/footer.jsp" />


  