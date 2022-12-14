<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.Timestamp" %>

<c:import url="../layout/header.jsp" />

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
.board {
	margin-top: 3%;
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


.titlee {
    font-size: 35px;
    font-weight: bold;
    font-family: 'Binggrae', sans-serif;
    float: right;
    margin-top: 10px;
    margin-right: 47%;
    color: #68ae6d;
    

}

.desc {
    margin-bottom: 50px;
    margin-right: 10%;
    font-size: 21px;
    letter-spacing: -0.05em;
    line-height: 1.7;
    color: #68ae6d;
      float: right;
    margin-right: 51%;
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

#searchForm{
   text-align : center; 
   margin-top: 5%;
   margin-bottom: 2%;
   margin-left: 50%;

}

#search {
	background-color: #4D826C;
	color: #FFFFFF;
	border: none;
}

input {
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 10px 12px;
  font-size: 14px;

}


a {
    color: #000;
    text-decoration: none;
}
#btn {
	float: right;
	margin-top: 10%;
	margin-bottom: 15%;
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
	color: #4D826C;;
	
	
}
#page_btn {
	margin-top: 3%;
	margin-left: 40%;
	
}


/* main */
main {
    height: 1400px;
    width: 80%;
    min-width: 1400px;
    margin: auto;
   display: flex;
   margin-top: 10%;
    
}



/* 본문 */
.liLiWrap {
    width:70%;
    margin-left: 10%;
}




/* 게시물 */
.liLiWrap .liLiItems {
    margin-top: -15%;
    box-sizing: border-box;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.item {
    height: 370px;
    width: 300px;
    margin-top: 50px;
    box-sizing: border-box;
    border: 1px solid #BCE099;
    border-radius: 30px;
    display: flex;
    flex-direction: column;
    background-color: white;
}

.post {
    height: 100%;
    width: 100%;
    margin: auto;
    border-radius: 50px;
    box-sizing: border-box;
}

.img-wrap {
    height: 65%;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
}

main img {
    height: 100%;
    width: 100%;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
}

.caption {
    height: 10%;
    width: 100%;'
    margin-top: 10px;
    padding: 5px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    font-size: 17px
}

.postTitle {
    font-weight: bold;
}



.info {
    display: block;
    justify-content: space-evenly;
    color: gray;
    font-size: 8pt;
}

.memId {
    width: 200px;
}

select {
  width: 85px;
  height: 42px;
  border-radius: 10px;
  text-align: center;
  border: 1px solid #ADADB1;
  margin-left: 30%;

}

select option {
  background: #C5E99B;
  color: #fff;
  padding: 3px 0;
}

#form {
	padding: 2em 0 2em 0;
}

#top {
	padding: 2em 0 1em 0;
}

#g1 {
	margin-bottom: 30px;
}

.tm-paging-item {
	display: flex;
    justify-content: center;
    align-items: center;
    padding: 0 0 1em 0;
}

.tm-paging-link {
	padding: 10px 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	text-decoration: none;
	color: #5BA6A6;
	border: 1px solid #5BA6A6;
	background-color: transparent;
}

.tm-paging-link:hover{
	background-color: white;
	color: #5BA6A6;
	text-decoration: none;
}

.tm-paging-link:focus{
	background-color: white;
	color: #5BA6A6;
	text-decoration: none;
}




.l-img {
	border-radius: 1ch;
}

.form-inline {
	padding: 0 0 2em 0;
}

.card-title {
	width: 236px;
	color: #4D826C;
	padding: 0 0 0.5em 0;
	border-bottom: 3px solid;
	border-color: #4D826C;
}

.card-title2 {
	font-size: 17px;
	width: 236px;
	color: #4D826C;
	padding: 0 0 0.5em 0;
	border-bottom: 3px solid;
	border-color: #4D826C;
}

.info {
	padding: 1em 0 1em 0;
}

.card-text {
	font-size: 15px;
	color: #808080;
}

.card-text2 {
	font-size: 13px;
	color: #808080;
}

.btn-cg {
	background-color: #5BA6A6;
	color: white;
}


</style>

      
     	<div class="board"></div>
     	  <h2 class="titlee">[GREEN BIZ] </h2>
        <h3 class="desc">사내동호회</h3>

			
			
<script type="text/javascript">
$(document).ready(function() {
	$("#searchForm select[name='category']").val('${param.category}').prop('selected', true)
	$("#searchForm input[name='search']").val('${param.search}')
})
</script>

      


<div id="searchForm">
   <form>
   <div class="selectBox">
   <select name="category">
       <option  hidden="" disabled="disabled" selected="selected" value="">선택 🔍</option>
       <option value="title">제목</option>
       <option value="content">내용</option>
     </select> 
     <input type="text" size="20" name="search" />&nbsp;
     <input type="submit" id="search" value="검색"/>
   </div>
    </form>
</div>
		

		<c:set var="community" value="${list}" />
			<div class="row">

				<c:forEach var="community" begin="0" end="3" items="${list}">
					<div class="col-sm-3">
						<div class="tm-gallery-page" id="tm-gallery-page-1">

							<div class="col-10 col-10-medium">
								<!-- Box -->
								<section class="box feature">
									<div class="mainimg">
										
										<a href="/community/cView?cno=${community.cno}"> 
										
										<img src="/upload/${community.cstoredname}" alt="이미지아님" width="250" 
											height="250" class="l-img"/></a>
									</div>
										<div class="info">
											<h6 class="card-title2">${community.ctitle}<a href="/community/cView?cno=${community.cno}"></a></h6>
											<div style="color: #808088">
												<i class="fas fa-user"></i>&nbsp;<span class="card-text" name="memberno">${community.memberno}
												</span>
												<span class="card-text" name="membername">${community.memberName}</span>
											</div>
											<span class="card-text2">Hit ${community.chit} &nbsp;
												Date&nbsp;:&nbsp;<fmt:formatDate value="${community.cdate }" pattern="yyyy-MM-dd"/> </span> <br> <br> <br>
										</div>
									</section>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

			<div class="row">

				<c:forEach var="community" begin="4" end="7" items="${list}">
					<div class="col-sm-3">
						<div class="tm-gallery-page" id="tm-gallery-page-1">

							<div class="col-10 col-10-medium">
								<!-- Box -->
								<section class="box feature">
									<div class="mainimg">
										
										<a href="/community/cView?cno=${community.cno}"> 
										<img src="/upload/${community.cstoredname}" alt="이미지아님" width="250" 
											height="250" class="l-img"/></a>
									</div>
										<div class="info">
											<h6 class="card-title2">${community.ctitle}<a href="/community/cView?cno=${community.cno}"></a></h6>
											<div style="color: #808088">
												<i class="fas fa-user"></i>&nbsp;<span class="card-text" name="memberno">${community.memberno}
												</span>
											</div>
											<span class="card-text2">조회 ${community.chit} &nbsp;
												Date&nbsp;:&nbsp;<fmt:formatDate value="${community.cdate }" pattern="yyyy-MM-dd"/> </span> <br> <br> <br>
										</div>
									</section>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

			
<c:if test="${not empty param.search }">
<c:set var="searchParam" value="&category=${param.category }&search=${param.search }"/>
</c:if>


			<div id="page_btn">
				<c:if test="${cpaging.curPage > 1 }">
					<div class="page" onclick="location.href='/community/cList?curPage=${cpaging.curPage - 1 }${searchParam}'">◀</div>
				</c:if>
				
				<c:forEach begin="${cpaging.startPage}" end="${cpaging.endPage}" var="i">
					<c:if test="${cpaging.curPage eq i}">
						<div class="page curPage" onclick="location.href='/community/cList?curPage=${i}${searchParam}'">${i}</div>
					</c:if>
					<c:if test="${cpaging.curPage ne i}">
						<div class="page" onclick="location.href='/community/cList?curPage=${i}${searchParam}'">${i}</div>
					</c:if>
				</c:forEach>
				
				
				<c:if test="${cpaging.curPage < cpaging.totalPage}">
					<div class="page" onclick="location.href='/community/cList?curPage=${cpaging.curPage +1 }${searchParam}'">▶</div>
      		    </c:if>
      		    
			</div>
			<button type="button" id="btn" onclick="location.href='/community/cWrite'">글작성</button>


	


<c:import url="../layout/footer.jsp" />