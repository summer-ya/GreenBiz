<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<style>

#board_form{
	margin-top: 5%;
	margin-left: 20%;
	width: 600px;
	
}
.board_form_tab{
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
	word-break: break-all;
	border-top: 3px solid #68ae6d;
}
.board_form_tab th,.board_form_tab td{
	border-top: 1px solid gray;
	padding: 12px 0 12px 12px;
	
}
.board_form_tab th{
	border-right: 1px solid gray;
	padding: 12px 0;
	
}
textarea[name="ccontent"]{
	border: 0;
	outline: 0;
	height: 280px;
	width: 380px;
	resize: none;
}
.write_btn,.cancel_btn{
	border: 0;
	background-color: rgba(0,0,0,0.1);
	border-radius: 2px;
	cursor: pointer;
	
	padding: 4px 7px;
	margin: 0 4px;
	outline: 0;
	background-color: #68ae6d;
    color: #FFFFFF;
}
.title_input{
	border: none;
	outline: none;
	
	padding: 5px;
	font-size: 14px;
	width: 75%;
}


</style>

 

   <div id="board_form" align="center">
	<h3>동호회 게시 수정</h3>
	<form action="" method="post" enctype="multipart/form-data">
	<input type="hidden" name="cno" value="${updateCboard.cno}">		
		<table class="board_form_tab">
			<colgroup>
				<col width="25%" />
				<col width="75%" />
			</colgroup>
			<tr>
				<th>제목</th>
				<td><input type="text" name="ctitle" placeholder="제목을 입력하세요." class="title_input" value="${updateCboard.ctitle }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="ccontent" placeholder="내용을 입력하세요." required maxlength="1000">${updateCboard.ccontent }</textarea></td>
			</tr>
			<tr>
				<th><label for="board_filename" width="100">첨부파일</label>
				<td><input type="file" name="board_filename" id="board_filename"  multiple="multiple"><td class="select_img"><img src="" style="margin-left:-200px;"/></th>
			</tr>
			<tr>
				<tr>
			<th>원본 파일</th>
			<td >
			<div id="originFile">
			  <a href="/board/download?bfileno=${commImg.cfileno }">${commImg.coriginname }</a>
			  <span id="deleteFile">X</span></div>
			</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="작성완료" class="write_btn">
					<input type="button" value="취소" onclick="location.href='/community/cList'" class="cancel_btn">
				</td>
			</tr>
		</table>
	</form>
</div>

<script type="text/javascript">

$("#board_filename").change(function(){
    if(this.files && this.files[0]) {
     var reader = new FileReader;
     reader.onload = function(data) {
      $(".select_img img").attr("src", data.target.result).width(100);        
     }
     reader.readAsDataURL(this.files[0]);
    }
   });
   
$(document).ready(function() {
	


	if( ${empty boardFile} ) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	$("#deleteFile").click(function() {
		$("#originFile").toggle()
		
// 		$("#originFile").toggle()
		$("#newFile").toggleClass("through")
	})
	
})


</script>
<c:import url="../layout/footer.jsp" />
