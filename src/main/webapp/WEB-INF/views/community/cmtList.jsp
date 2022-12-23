<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		
<style>
#listContent{
 	border-bottom: 1px solid #e8e8e8;
    margin-bottom: 10px;
    padding-bottom: 12px;
    width: 1018px;
    display: inline-block;
}
#btnModify{ 
	float: right; 
	border: none; 
	background: none; 
	color: #337ab7;
}
.text_bar2{
	margin: 0px 9px 0 9px;
    display: inline-block;
    float: right;
    width: 1px;
    height: 18px;
    background-color: #ebebeb;
}
.btnReplyDelete{
	float: right;
    border: none;
    background: none;
    color: #f84720;
}
.pagingC { text-align: center; font-size: 18px; padding-bottom: 10px;}
.pagingC > li{ display: inline-block; }


/* .num:hover { color: #2e9cdf; } */
.pagingC a { text-decoration: none; color: #96a0ad;}


.num{
	background: #6bacce;
    text-align: center;
    color: #fff;
    border-radius: 100%;
    width: 30px;
    height: 30px;
    line-height: 30px;
}
.listnum{ padding: 10px; }

.listnum a:hover { color: #ccc; }

.next { padding: 10px; }

.next a:hover { color: #ccc; }
  
.btnReplyClose{ 
	float: right;
    font-size: 13px;
    border: none;
    background-color: #5c5c5c;
    color: #fff;
    width: 38px;
    height: 30px;
    margin-right: 10px;
}

.btnReplyUpdate{ 
	float: right;
    font-size: 13px;
    border: none;
    background-color: #6bacce;
    color: #fff;
    width: 38px;
    height: 30px;
}

</style>



<!-- 댓글 목록 -->
<c:forEach var="cboard" items="${list}">
<span id="listUserid"><strong>${cboard.memberno }</strong>(<fmt:formatDate value="${cboard.cocreatedate}" pattern="yyyy.MM.dd HH:mm"/>)</span><br>

<div id="listContent">
	<span class="comm_txt" id="comm_txt${cboard.cono}">${cboard.cocontent }</span>
	
	<c:if test="${sessionScope.loginId == cboard.loginId}">
		<button type="button" class="btnReplyDelete" id="rplyDelete_${cboard.cono}">삭제</button>
		<span class="text_bar2" id="text_bar2_${cboard.cono}"></span>
		<input type="button" id="btnModify" class="bm_btn_${cboard.cono}" value="수정" onclick="showReplyModify('${cboard.cono}','${cboard.cocontent}',this)">
		
		<div class="modi_wrap" id="mw_${cboard.cono}" style="display:none;">
			<div class="textarea_wrap"></div> <!-- 댓 수정 입력창 영역 -->
			
			<button type="button" class="btnReplyUpdate" id="rplyUpdate_${cboard.cono}">완료</button>
			<button type="button" class="btnReplyClose" id="rplyClose_${cboard.cono}" >취소</button>
		</div>
	</c:if>
	
</div><br>
</c:forEach>

<br>

<div>

<script> 
 $(document).ready(function() {
	
 	$(".btnReplyClose").click(function(){
		var cono = $(this).attr("memberno").replace("rplyClose_","");
		
 		console.log(cono)
		
 		$("#mw_"+ cono).hide(); //댓글 수정 입력칸
 		$("#comm_txt" + cono).show(); //댓글
		$("#rplyDelete_" + cono).show(); //삭제버튼
        $("#text_bar2_" + cono).show(); // |
 		$(".bm_btn_" + cono).show(); // 수정버튼
 	});
	
	
	
 	$(".btnReplyUpdate").click(function(){
 	    var detailCommContent = $("#detailCommContent").val().replace("\n", "<br>");
        	var cono = $(this).attr("memberno").replace("rplyUpdate_","");
 	    console.log("e")
	    
	    $.ajax({
 	        url: "/cboard/cmt/cmtUpdate/" + cono
 	        , type: "put"
 	        , headers: { "Content-Type":"application/json" }
 	        , data: JSON.stringify({ cocontent : cocontent })
	        , dataType: "text"
 	        , success: function(result){
	        	
	            if(result == "success"){
	            	$("#mw_" + cono).hide();
 	            	$("#comm_txt" + cono).show();
 	                listReplyRest("1");
 	            }
	            
 	        } // success
 	    }); // ajax
 	}); //updateBtn click
	
	
 	$(".btnReplyDelete").click(function(){
 		var cono = $(this).attr("id").replace("rplyDelete_","");
		
 	    if(confirm("삭제하시겠습니까?")){
 	        $.ajax({
	            url: "/cboard/cmt/cmtDelete/" + cono
 	            , type: "delete"
	            , success : function(result){
 	                if(result == "success"){
 	                    alert("삭제되었습니다.");
 	                    count();
 	                    listReplyRest("1");
 	                }
	            } // success
 	        }); //ajax
 	    } // if
 	}); //deleteBtn click
	
 }); //document end
</script>