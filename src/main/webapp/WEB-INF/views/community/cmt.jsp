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





