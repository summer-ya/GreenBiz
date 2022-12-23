<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
   
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

	<!-- 부트스트랩 3 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   
   
<style>
 html,
    body {
        width: 100%;
        position: relative;
        font-size: 14px;
        font-family: Noto Sans KR;
        line-height: 1.15;
    }


a {
   text-decoration: none;
}

a:hover {
   cursor: pointer;
}

a {
   color: black;
}


/*헤더부분*/
header {
   display: flex;
   position: relative;
   height: 60px;
   padding: 0 0px;
   top: 0;
   left: 0;
   right: 0;
}

.container {
   position: relative;
   width: 1200px;
   height: 100%;
   margin: 0 0;
   padding-top: 63px;
}

/*헤더부분 END*/


/*section부분  */
.page_section {
   position: absolute;
   /* width: 970px; */
   height: 860px;
   left: 210px;
   padding: 0px 0 40px 40px;
   border-left: 1px solid #e7e7e7;
   box-sizing: border-box;
}

/*section부분 END */
.main_section {
   padding-top: 30px;
   width: 970px;
}

.board-listheader {
   font-size: 13px;
   line-height: 140%;
}

.board-listheader th {
   padding: 20px 0;
   vertical-align: middle;
   font-size: 12px;
   border: 1px solid #c0c0c0;
   background: #e8e8e8;
   text-align: center;
}

.board-listheader td {
   padding: 20px 0;
   vertical-align: middle;
   font-size: 12px;
   border: 1px solid #c0c0c0;
}

.board-listheader tbody tr {
   text-align: center;
}

.board-listheader tbody tr td {
   padding-top: 20px;
   padding-bottom: 20px;
}

.section_title {
   padding-bottom: 10px;
   display: inline-block;
}

.menu {
    width: 200px;
}

</style>
<title>Green-Biz</title>
</head>

<body>

   <div class="container">
      
      <div class="page_section">
         <div>
            <h2>전자결재 결재함</h2>
            <hr>
            <div class="main_section">
               <span class="section_title">결재요청건 ${paging.totalCount }건</span>
               <!-- <table width="100%" align="center" cellpadding="0" cellspacing="0"> -->
               <table style="width:100%; cellspacing:0; " class="board-listheader"  >
                  <thead>
                     <tr>
                     	<th>순번</th>
                        <th width="40%;">기안제목</th>
                        <!-- <th width="50%;">제목</th> -->
                        <th>기안자</th>
                        <th>결재상태</th>
                        <th>결재요청일</th>
                        <th>반려사유</th>
                     </tr>
                  </thead>
                  <c:if test="${not empty list}">
                     <c:forEach var="list" items="${list}" varStatus="status">
                        <tr>
                           <td>${status.count}</td>
                           <td><a href="confirm?approvalNo=${list.APPROVALNO}">
                                 ${list.APPTITLE }</a></td>
                           <td>${list.MEMBERNAME }</td>
                           <td><c:choose>
                                 <c:when test="${list.APPSTATE eq '2' }">반려</c:when>
                                 <c:when test="${list.APPSTATE eq '1' }">결재완료</c:when>
                                 <c:when test="${list.APPSTATE eq '0' }">결재대기</c:when>
                              </c:choose></td>
                           <td>${list.APPTIME }</td>
                           <td>${list.APPREJECT }</td>
                        </tr>
                     </c:forEach>
                  </c:if>

               </table>
            </div>
         </div>
         <c:import url="/WEB-INF/views/layout/mainpaging.jsp" />
      </div>
   </div>


</body>

</html>