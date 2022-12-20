<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<c:import url="../layout/header.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

function selectConfirm(event, remain){
	var confirm = event.target.value 
	var attr = event.target.id
	var id = attr.substring(13)
	var c = window.confirm('상태를 변경하시겠습니까?') // 문구수정
	 if(c){
			var data = {
					no : id,
					confirm : confirm
			}
			$.ajax({
				type: "get"
				, url: "/leave/confirm"
				, data: data
				, dataType: "text"
				, success: function( data ) {
					console.log(data)					
				}, error: function() {
					console.log("실패");
				}
			})	
	}
} 

$(function(){
	
	
	// DB값이 옵션 셀렉트 되도록 
	$("select[name='state']").each(function(e){
		// 0: 결재중 1: 반려 2: 승인
		var el = $(this)[0]
		var classId =  el.id
		var value = el.className
		
		$("#"+classId).val(value).prop("selected", true);	
		
	})
	
})
</script>

<c:if test="${result}"> 
<h4 class="contents" style="background-color: #4D826C; color: white; width:1200px; height: 50px; line-height: 50px; margin: 0; font-weight: bolder; padding-left: 20px; margin-top: 15px;">
   	${team} 연차 요청 내역
</h4>
	
	<div class="container mt-5">

        <div class="row" style="margin-left: -110px; margin-right: 40px;">

          <div class="col-md-12 mx-auto" >

            <table class="table bg-white rounded border">
			  <thead>
			    <tr>
			      <th scope="col">번호</th>
			      <th scope="col">요청자</th>
			      <th scope="col">사번</th>
			      <th scope="col">직급</th>
			      <th scope="col">요청일</th>
			      <th scope="col">상태</th>
			    </tr>
			  </thead>
			  <tbody>
			    <c:forEach items="${list}" var="list">
			     <tr>
			      <th scope="row">${list.LEAVENO}</th>
			      <td>${list.MEMBERNAME }</td>
				  <td>${list.MEMBERNO }</td>
				  <td>${list.RANK }</td>
				  <td>${list.LEAVETIME }</td>
				  <td>
					  <select name="state" id="selectConfirm${list.LEAVENO}" class="${list.LEAVECONFIRM}" onchange="selectConfirm(event,'${list.LEAVEREMAIN}')">
					  	<option value="0">결재중</option>
					  	<option value="1">반려</option>
					  	<option value="2" >승인</option>
					  </select>
				  </td>
			  	</tr>
           		</c:forEach>
			  </tbody>
			</table>
            
          </div>
          
        </div>
        

      </div>
	</c:if>
 	<c:if test="${!result}">
		권한이 없는 페이지입니다.
	</c:if> 

<c:import url="../layout/footer.jsp" />