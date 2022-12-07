<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

	
	 <table class="table table-striped table-bordered table-hover table-sm text-center" >
		<colgroup>
			<col width='20%' />
			<col width='40%' />
			<col width='40%' />
		</colgroup>
		<thead>
			<tr>
				<th>No.</th> 
				<th>이름</th>
				<th>직위</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${mList}" varStatus="status">	
				<tr>
					<td><c:out value="${status.index+1}"/></td>
					<td><a href="javascript:fn_addUser('<c:out value="${list.memberno}"/>', '<c:out value="${list.membername}"/>', '<c:out value="${list.deptnum}"/>', '<c:out value="${list.rank}"/>')"><c:out value="${list.membername}"/></a></td>
					<td><c:out value="${list.rank}"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
