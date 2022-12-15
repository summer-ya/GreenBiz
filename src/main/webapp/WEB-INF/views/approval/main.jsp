<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
   rel="stylesheet">
   
   <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   
   
<style>
 html,
    body {
        width: 100%;
       /*  height: 100%; */
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

a:link {
   color: black;
}

a:visited {
   color: black;
}

/*헤더부분*/
header {
   background-color: #F2F2F2;
   display: flex;
   position: relative;
   height: 60px;
   padding: 0 32px;
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

.wrap_title {
   display: flex;
   flex: 1;
}

.doc_title {
   display: flex;
   align-items: center;
   font-size: 20px;
}

.util_user {
   padding-top: 11px;
   line-height: 0;
}

.userinfo {
   display: inline-block;
   font-size: 14px;
   color: #505050;
}

.userprofile {
   vertical-align: middle;
   display: inline-block;
   margin-left: 16px;
}

.userprofile .icon {
   width: 29px;
   height: 29px;
}



/*헤더부분 END*/

/*aside부분*/
#apaside {
   width: 210px;
   height: 100%;
   display: inline-block;
   position: absolute;
   /* padding-top: 24px; */
}

/* .menu {
         padding: 17px 44px 14px 32px;
      } */
.menu li a {
   padding: 16px 0 16px 19px;
}

ul{
   list-style:none;
}

/*       .menu_list:nth-child(1) {
         border-bottom: none;
      }

      .menu_list {
         border: 1px solid black;
      }
 */
.menu_list:hover {
   background-color: #e7e7e7;
}

.link_menu {
   text-decoration: none;
   display: block;
   position: relative;
   min-height: 55px;
   padding: 17px 44px 14px 32px;
   box-sizing: border-box;
   color: #333333;
   font-size: 14px;
   font-weight: 600;
}

/*aside부분 END*/

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

.apwritebtn {
   float: right;
   padding-top: 20px;
}

#apwritebtn {
   width: 100px;
   line-height: 30px;
   text-align: center;
   border: 1px solid #5A3673;
   background-color: #5A3673;
   color: #fff;
   font-size: 12px;
   cursor: pointer;
}

.menu {
    width: 195px;
}

</style>
<title>Green-Biz</title>
</head>

<body>

   <!-- <header>
      <div class="wrap_title">
         <h1 class="doc_title">
            <a href="#" style="color: black;">전자결재</a>
         </h1>
      </div>
      <div class="util_user">
         <div class="userinfo">
            <strong>사용자명</strong>
         </div>
         <div class="userprofile">
            <a href="#"><img src="./img/user3.png" class="icon"></a>
         </div>

      </div>
   </header> -->

   <div class="container">
      
	<h5>로그인 : ${loginId }</h5>


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