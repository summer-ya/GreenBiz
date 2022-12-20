<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Admin Allnotice Write</title>

<link rel="icon" href="/resources/img/favicon-32x32.png">

<c:import url="../../layout/adminHeader.jsp" />

<form action="/admin/Allnotice/adminAllnoticeWrite" id="writeForm"
	method="post" enctype="multipart/form-data">

	<!-- Admin Dept Write Content -->
	<h4 class="contents"
		style="background-color: #2D5A36; color: white; width: 1200px; height: 50px; line-height: 50px; margin: 0; font-weight: bolder; padding-left: 20px;">
		게시글 관리</h4>

	<div class="title"
		style="width: 900px; height: 50px; color: black; margin-left: 180px; line-height: 50px; font-weight: bolder;">
	</div>

	<div class="profileWrap"
		style="margin-left: 105px; width: 1000px; float: left;">
		<div class="infoWrap"
			style="float: left; height: 50px; margin-top: 20px; margin-left: 20px;">
			<span style="font-size: 27px;">  ADMIN</span>
		</div>
	</div>

	<div
		style="margin-left: 105px; margin-top: 20px; width: 1200px; float: left;">
		<table class="table"
			style="text-align: center; vertical-align: middle; width: 980px; float: left; margin-left: 20px;">

			<tr>
				<th style="width: 100px;">범위</th>
				<td>
					<div style="float: left;">
						<input type="radio" id="select" name="show"><label
							for="select"> 공개🔓</label>&nbsp; <input type="radio" id="select2"
							name="show"><label for="select2"> 비공개🔒</label>
					</div>
				</td>
			</tr>


			<!-- 글 작성 부분 -->
			<tr>
				<th style="width: 100px;">제목</th>
				<td><input name="noticeTitle" type="text"
					style="width: 400px; margin-right: 500px;"></td>

			</tr>

			<tr>
				<th>내용</th>
				<td><textarea name="noticeContent"
						style="width: 900px; height: 400px;"></textarea></td>
			</tr>

			<!-- 인풋 네임 바꿔야 함. -->
			<tr>
				<th style="width: 100px;">첨부파일</th>
				<td><input name="noticeFile" type="file"
					style="width: 400px; margin-right: 500px;"></td>
			</tr>
		</table>
	</div>


	<!-- 버튼 -->
	<div class="button-wrap" style="width: 1200px; padding-left: 870px;">
		<button id="btnWrite"
			style="border-radius: 10px; width: 100px; height: 40px; background-color: #2D5A36; color: white; border: 0.5px solid lightgray; font-weight: lighter;">등록</button>
		<a href ="/admin/Allnotice/adminAllnoticeList"><input type="button" value="취소"
           style="border-radius: 10px; width: 100px; height: 40px; margin-left: 20px; background-color: #2D5A36; color: white; border: 0.5px solid lightgray; font-weight: lighter;"></a>
	</div>

</form>


<script type="text/javascript">
$(document).ready(function(){

	$("#btnWrite").click(function(){
	$('#writeForm' ).submit()	
	
	})

})
</script>



<c:import url="../../layout/footer.jsp" />