<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
</style>

<!-- 사이드바 -->
<c:import url="../layout/header.jsp" />

<!-- 본문 -->
	
<h4 class="contents" style="background-color: #3B538C; color: white; width:1200px; height: 50px; line-height: 50px; margin: 0; font-weight: bolder; padding-left: 20px; margin-top: 15px;">
   	나의 연차 사용 내역
</h4>

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
			      <th scope="col">직급</th>
			      <th scope="col">기안일</th>
			      <th scope="col">상태</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">1</th>
			      <td>이술</td>
				  <td>A221105</td>
				  <td>사원</td>
				  <td>2022-04-11</td>
				  <td>완료</td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td>이술</td>
				  <td>A221105</td>
				  <td>사원</td>
				  <td>2022-04-11</td>
				  <td>완료</td>
			    </tr>
			    <tr>
			      <th scope="row">3</th>
			      <td>이술</td>
				  <td>A221105</td>
				  <td>사원</td>
				  <td>2022-04-11</td>
				  <td>완료</td>
				 </tr>
			     <tr>
			      <th scope="row">4</th>
			      <td>이술</td>
				  <td>A221105</td>
				  <td>사원</td>
				  <td>2022-04-11</td>
				  <td>완료</td>
			    </tr>
			    <tr>
			      <th scope="row">5</th>
			      <td>이술</td>
				  <td>A221105</td>
				  <td>사원</td>
				  <td>2022-04-11</td>
				  <td>완료</td>
			    </tr>
			  </tbody>
			</table>
            
          </div>
          
        </div>
        

      </div>
	
	
<%-- 	<!-- 조회할 연차가 없을 경우 -->	
		<c:if test="${empty mainList }">
			<h3>조회된 연차 목록이 없습니다</h3>
		</c:if> --%>


</form>











<!-- 사이드바 끝 -->

<c:import url="../layout/footer.jsp" />