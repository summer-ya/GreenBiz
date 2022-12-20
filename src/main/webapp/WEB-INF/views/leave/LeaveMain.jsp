<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 사이드바 -->
<c:import url="../layout/header.jsp" />

<!-- 본문 -->
<h4 class="contents" style="background-color: #4D826C; color: white; width:1200px; height: 50px; line-height: 50px; margin: 0; font-weight: bolder; padding-left: 20px; margin-top: 15px;">
   	나의 연차 사용 내역
</h4>
        <form action="">
            <h2>연차 현황</h2>
            <div id="e-pay-status">
            <span>
                    <p></p>
                    <a style="color:rgb(59, 211, 39);">사용 연차</a>
                    <div><c:out value="${leaveMap.LEAVETOTAL-leaveMap.AVAILABLE}"></c:out></div>
                </span>
                <span>
                    <p></p>
                    <a style="color:rgb(59, 211, 39);">결재중 </a>
                    <div><c:out value="${leaveMap.APPROVAL}"></c:out></div>
                </span>
                <span>
                    <p></p>
                    <a style="color:rgb(59, 211, 39);">사용 가능한 연차</a>
                    <div><c:out value="${leaveMap.AVAILABLE}"></c:out></div>
                </span> 
            </div>
        </form>

<form action="">
	
	<div class="container mt-5">

        <div class="row" style="margin-left: -110px; margin-right: 40px;">
          <div class="col-md-12 mx-auto" >
            <table class="table bg-white rounded border">
			  <thead>
			    <tr>
			      <th scope="col">번호</th>
			      <th scope="col">기안자</th>
			      <th scope="col">사번</th>
			      <th scope="col">기안일</th>
			      <th scope="col">상태</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${list}" var="list">
			     <tr>
			      <th scope="row">${leave.leaveNo }</th>
			      <td>${list.memberName }</td>
				  <td>${list.memberNo}</td>
				  <td>${list.leaveTime}</td>
				  <td>${list.leaveConfirm eq '0'? '결재중' : (list.leaveConfirm eq '1'? '반려' :'승인')} </td>
			    </tr> 
			      </c:forEach>
			  </tbody>
			</table>
            
          </div>
          
        </div>
        

      </div>
	
	
	<!-- 조회할 연차가 없을 경우 -->	
	<c:if test="${empty list}">
		<h3>조회된 연차 목록이 없습니다</h3>
	</c:if> 
</form>

<!-- 페이징 -->
<c:import url="../leave/paging.jsp" />

<!-- 사이드바 끝 -->
<c:import url="../layout/footer.jsp" />