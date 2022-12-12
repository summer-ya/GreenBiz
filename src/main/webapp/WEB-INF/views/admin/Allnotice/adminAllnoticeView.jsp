<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title> Admin Allnotice View </title>

<link rel="icon" href="/resources/img/favicon-32x32.png">

<c:import url="../../layout/adminHeader.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/admin/Allnotice/adminAllnoticeList"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/board/update?boardNo=${viewBoard.boardNo }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/board/delete?boardNo=${viewBoard.boardNo }"
	})
})
</script>

 
<style type="text/css">


.head {
    width: 1200px;
    text-align: center;
}


.title {
    font-size: 42px;
    font-weight: bold;
    font-family: 'Binggrae', sans-serif;
    margin-top: 80px;
    color: #68ae6d;
    
}

.desc {
    margin-bottom: 50px;
    font-size: 20px;
    letter-spacing: -0.05em;
    line-height: 1.7;
    color: #68ae6d;
}

.w_box {
    width: 990px;
    height: 560px;
    margin-top: 50px;
    /* border: 1px solid #333; */
    display: inline-block;
}

.w_box h2 {
    color: #333;
    font-size: 30px;
}

.w_box .I_box {
    display: flex;
    font-weight: bold;
}

.I_box div {
    margin: 20px 40px 5px 5px;
    color: #333;
   
}

.w_box p {
    height: 150px;
    margin-top: 20px;
    text-align: left;
}

.w_box .F {
    float: right;
    margin-bottom: 50px;
    margin-top: 10px;
}

.w_box input {
    width: 60px;
    height: 35px;
    border: none;
    border-radius: 5px;
}


.w_box p {
    color: #333;
}

.w_box input#C {
    background-color: #e2e2e2;
    cursor: pointer;
    margin-top: 20px;
}

.w_box input#D {
    background-color: #68ae6d;
    color: #FFFFFF;
    cursor: pointer;
    margin-top: 20px;
}

.w_box .L {
    text-align: center;
    margin-top: 50px;
}

.w_box input#N {
    width: 100px;
    height: 40px;
    background-color: #68ae6d;
    color: #FFFFFF;
    cursor: pointer;
    font-size: 16px;
    margin-left: 15%;
}

</style>
</head>

        
        <div class="head">
        <h2 class="title">[관리자] 전자게시 </h2>
        <h3 class="desc">전사게시판</h3>
        <div class="w_box">
            <h2>${allnoticeNo.noticeTitle }</h2>
            <div class="I_box">
                <div class="name">작성자${viewAllnotice.adminNo }</div>
                <div class="date"><fmt:formatDate value="${viewAllnotice.noticeDate }" pattern="yyyy-MM-dd"/></div>
                
            </div>
          <hr width="990px">
          <div class="R">
                <p>${viewAllnotice.noticeContent }</p>
               <img src="/resources/img/${allnoticeFile.originName}">${allnoticeFile.originName}</a> 
            </div>
            <div class="F">
                <input type="submit" value="수정" id="C" onclick="location.href='/board/boardUpdate?bno=${nFileNo}'">
                <input type="submit" value="삭제" id="D" onclick="location.href='/board/delete?bno=${nFileNo}'">
            </div>
            <hr width="990px">
            <div class="L">
                <input type="button" value="목록으로" id="N" onclick="location.href='/admin/Allnotice/adminAllnoticeList'">
            </div>
            
             <hr width="990px">
    		</div>
   		 </div>
    </section>

</body>
	


<c:import url="../../layout/footer.jsp" />