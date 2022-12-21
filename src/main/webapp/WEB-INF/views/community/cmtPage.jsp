<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">



//댓글 수정버튼 클릭시 
	function updateCmt(e){
		var btnReviewUpdate = document.getElementById('btnReviewUpdate')
		var btnReview = document.getElementById('btnReview')
		
		var area = document.getElementById('reviewContents')
		var contentElement = document.getElementById('content'+e)
		var content = contentElement.innerText
		
		// 댓글 등록버튼은 사라지고 댓글 수정 버튼이 나타나도록 함
		btnReviewUpdate.style.display = 'block'
		btnReview.style.display = 'none'
		
		// 수정 버튼에 수정 댓글의 no 저장 
		btnReviewUpdate.name = e
			
		// textarea 엘리먼트에 focus
		area.focus()
		// textarea 엘리먼트에 수정할 댓글 내용 불러오기
		area.value = content
		
	}
	
	// 댓글 등록 버튼 
	$('#btnReview').click(function (e) {
		e.preventDefault()
		// textarea element를 변수에 저장
		var cno = ${param.cno};
		var content = $("#reviewContents").val();
		// textarea에 있는 값 불러오기
		console.log("글번호 :"  + cno);
		console.log("내용 : " + content);
		
		 var data = {
				cno : cno,
				cocontent : content }
				
		// ajax로 저장 해주기 
		$.ajax({
			type: "post"
		   , url : "/community/writeCmt"
		   , data: data
		   , dataType: "html"
		   , success: function( c ) {
		   		if(c === 'success'){
		   		 alert('댓글이 등록되었습니다.')
		   		 getComments()
		   		$("#reviewContents").val('');
		   		} else{
					 alert('댓글 등록에 실패하였습니다')
		 		}
		   }
		
		})
	}) 
	
	 // 댓글 삭제버튼 클릭시
	function deleteCmt(e){
		var result = window.confirm('선택하신 댓글을 삭제하시겠습니까?')
		if(result){
			$.ajax({
				type: "get"
			   , url: "/community/deleteCmt?cono="+e
			   , dataType: "text"
			   , success: function(c) {
				   console.log(c)
				   if(c === 'success'){
					   alert('선택하신 댓글이 삭제되었습니다.')
					 getComments()
					 
				   }else{
					   alert('댓글 삭제 중 오류가 발생하였습니다.')
				   }
			   }
				
			})
		}
	} 
	
	
	

	// 수정 댓글 submit 버튼 
	$('#btnReviewUpdate').click(function (e) {
		e.preventDefault()
		
		var area = document.getElementById('reviewContents')
		var no = e.target.name
		
		var data = {
				cocontent : area.value,
				cono : no
		}
		
		 $.ajax({
			type: "post" // 요청 방식 :@PostMapping
		   , url: "/community/updateCmt" // 컨트롤러 url  :("/updateCommt")
		   , data: data // 전송 데이터 :@RequestBody Map<String, Object> map (dto일 경우 @RequestBody DTO dto)
		   , dataType: "text" // 컨트롤러 리턴 타입 :public *String* updateCommt
		   , success: function( c ) { // 컨트롤러에서 응답해준 데이터 :return "success"
			   if(c === 'success'){
				   alert('댓글이 수정되었습니다.')
				   getComments()
			   }else{
				   alert('댓글 수정 중 오류가 발생하였습니다.')
			   }
		   }
		}) 
	}) 
	
	function getComments() {
		$.ajax({
				type: "Get"
			   , url: "/community/cmtPage"
			   , data: {
				   curPage:1
				   , cno: ${param.cno}
			   }
			   , dataType: "html"
			   , success: function( c ) {
				   $("#commtPage").html(c)
			   }
				
			})
	}
</script>


 <!-- 댓글작성 -->
<input type="hidden" name="cno" value="${param.cno }">
	<div>
		<textarea class="col-auto form-control" id="reviewContents" name="commtContent"
				  placeholder="댓글을 입력해주세요"></textarea>
	</div>	
	 <button type="button" class="btn btn-primary" id="btnReview">등록</button>
	 <button type="button" class="btn btn-primary" id="btnReviewUpdate" style="display:none" >수정</button>
<!-- </form>	 -->
<br><br>
<!-- 댓글 끝 -->    


	
<h6>댓글 (<span class="reply_cnt" style="font-weight: bold;"> ${CntCommt } </span>)</h6>
<br>	
<c:forEach items="${cmt }" var="cmt">
	<ul class="reply_content_ul">
	<!-- 첫번째 댓글 -->
	<li>
		<div class="comment_wrap">
		<div class="reply_top">
			<span class="id_span">☁️ ${cmt.membername  } ☁️</span>
			<span class="date_span"><fmt:formatDate pattern="yyyy-MM-ddㅤHH:mm" value="${cmt.cocreatedate }"/></span>
			<a class="updateCmbtn updateCmt${cmt.cono}" data-commtno="${cmt.cono}" onclick="updateCmt(${cmt.cono})">수정</a>	
			<a class="deleteCmbtn deleteCmt${cmt.cono}" data-commtno="${cmt.cono}" onclick="deleteCmt(${cmt.cono})">삭제</a>
		</div>
		<div class="reply_bottom">
		<div class="reply_bottom_txt" id="content${cmt.cono}">
		${cmt.cocontent  }
			</div>
			</div>
		</div>
	</li>
	</ul>
</c:forEach>


           