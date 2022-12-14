<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>

#updateBtn {
	background-color: #68ae6d;
    color: #fff;
    border-radius: 5px;
    border: 1px solid;
    width: 45px;

}

#updateSendBtn {
	background-color: #68ae6d;
    color: #fff;
    border-radius: 5px;
    border: 1px solid;
    width: 45px;
}

#deleteBtn {
	background-color: #68ae6d;
    color: #fff;
    border-radius: 5px;
    border: 1px solid;
    width: 45px;
}



</style>
<c:forEach items="${list }" var="list">
<div class="cmtlist">
						<span id='memberNo'>✔️&ensp;&ensp;${list.memberno }</span>
						<span id="memberName">&ensp;|&ensp; ${list.memberName } </span>
						<span class="type"><span id=comm_userid><strong></strong></span></span>
						<span id=rdate> &nbsp;&nbsp;|&ensp;${list.cocreatedate }</span><br>
						<input type="text" id='ajaxRecontent${list.cono }'  value="${list.cocontent }" style="border:none;"><br>
<c:if test="${list.memberno eq loginId }">
						<button id='deleteBtn' type='button' onclick='deleteAjaxComment("${list.cono }")'>삭제</button>
						<button type='button' id='updateBtn' onclick='showModify("${list.cono } ")'>수정</button> 
						<button type='button' id='updateSendBtn${list.cono }' onclick='updateSendBtn("${list.cono } ")' style="visibility: hidden; background-color: #68ae6d; color: #fff; border-radius: 5px; border: 1px solid; width: 45px;">확인</button> 
</c:if>
						</div><hr>

						
</c:forEach>


<br>

<div>
	<ul class="pagingC">
	
		<%-- 현재 페이지 블럭이 1보다 크면 이전 페이지 블럭으로 이동 --%>
		<c:if test="${cmtPaging.curBlock > 1}">
			<li class="next"><a href="javascript:getCommentList('${cmtPaging.prevPage}')"> « </a></li>
		</c:if>
		
		<%-- 페이지 블럭 처음부터 마지막 블럭까지 --%>
		<c:forEach var="num" begin="${cmtPaging.blockBegin}" end="${cmtPaging.blockEnd}">
			<c:choose>
				<c:when test="${num == cmtPaging.curPage}">
					<li class="num">${num}</li>
				</c:when>
				
				<c:otherwise>
					<li class="listnum"><a href="javascript:getCommentList('${num}')">${num}</a>&nbsp;</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		
		<%-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 다음페이지로 이동 --%>
		<c:if test="${cmtPaging.curBlock <= cmtPaging.totBlock}">
			<li class="next"><a href="javascript:getCommentList('${cmtPaging.nextPage}')"> » </a><li>
		</c:if>
		
	</ul>
</div>

