<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String id = (String)session.getAttribute("loginId"); %>
<c:import url="../layout/header.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>


 
<style type="text/css">


.head {
    width: 1200px;
    text-align: center;
}


.title {
    font-size: 42px;
    font-weight: bold;
    font-family: 'Binggrae', sans-serif;
    margin-top: 80px;
    color: #68ae6d;
    
}

.desc {
    margin-bottom: 50px;
    font-size: 20px;
    letter-spacing: -0.05em;
    line-height: 1.7;
    color: #68ae6d;
}

.w_box {
    width: 990px;
    height: 560px;
    margin-top: 50px;
    /* border: 1px solid #333; */
    display: inline-block;
}

.w_box h2 {
    color: #333;
    font-size: 30px;
}

.R {
margin-top: -20%;
}

.w_box .I_box {
    display: flex;
    font-weight: bold;
}

.I_box div {
    margin: 20px 40px 5px 5px;
    color: #333;
   
}

.w_box p {
    height: 300px;
    margin-top: 20px;
    text-align: left;
}

.w_box .F {
    float: right;
    margin-bottom: 50px;
    margin-top: 10px;
}

.w_box input {
    width: 60px;
    height: 35px;
    border: none;
    border-radius: 5px;
}


.w_box p {
    color: #333;
}

.w_box input#C {
    background-color: #e2e2e2;
    cursor: pointer;
    margin-top: 20px;
}

.w_box input#D {
    background-color: #68ae6d;
    color: #FFFFFF;
    cursor: pointer;
    margin-top: 20px;
}

.w_box .L {
    text-align: center;
    margin-top: 50px;
}

.w_box input#B {
    width: 100px;
    height: 40px;
    background-color: #68ae6d;
    color: #FFFFFF;
    cursor: pointer;
    font-size: 16px;
    margin-left: 15%;
}

.reply {
float: right;
margin-top: px;

}

.reply input#J {
    background-color: #68ae6d;
    color: #FFFFFF;
}



/* 댓글영역 전체 */

.reply_area {
    width: 90%;
    min-width: 1000px;
    max-width: 1200px;
    margin: 0 auto;
}


.reply_list{
	width: 90%;
    min-width: 1000px;
    max-width: 1200px;
    padding-bottom: 30px;
}

#list_content{
	border-bottom: 1px solid #e8e8e8;
    padding-bottom: 10px;
    width: 1018px;
    display: inline-block;
}

/* 댓글 작성 전체 */
.reply_box{
	border-top: 1px solid #e8e8e8;
    background-color: #fafafa;
    position: relative;
    height: 200px;
    border-bottom: 1px solid #e8e8e8;
}

/* 댓글 작성자 */
.writer_info{
	margin-bottom: 5px;
    position: relative;
    left: 13px;
}


.write_area{
	position: relative;
    left: 13px;
    padding: 7px 12px;
    border: 1px solid #e8e8e8;
    background-color: #fff;
    height: 130px;
    min-width: 980px;
    max-width: 980px;
}

/* 댓글 input창 */
#recontent{
	width: 100%;
    height: 70px;
    border: none;
    font-size: 13px;
    resize: none;
    box-sizing: border-box;
}

/* 댓글 등록 버튼 */
#replyBtn{
	float: right;
    width: 54px;
    height: 34px;
    border-radius: 5px;
    font-size: 13px;
    border: none;
    background-color: #68ae6d;
    color: #fff;
}

#updateBtn {
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

#btn {
	background-color: #68ae6d;
    color: #fff;
    border-radius: 5px;
    border: 1px solid;
    width: 45px;
}

#cancelBtn {
	background-color: #68ae6d;
    color: #fff;
    border-radius: 5px;
    border: 1px solid;
    float: right;
    width: 54px;
    height: 35px;
}

#childReplyBtn {
	background-color: #68ae6d;
    color: #fff;
    border-radius: 5px;
    border: 1px solid;
    width: 100px;
    height: 40px;
}


</style>
</head>

        
          <div class="head">
        <h2 class="title">[GREEN BIZ] </h2>
        <h3 class="desc">사내게시판</h3>

        <div class="w_box">
            <h2>${viewBoard.btitle }</h2>
            <div class="I_box">
                <div class="name">작성자&nbsp;&nbsp;&nbsp;${viewBoard.memberno }</div>
                <div class="hit">조회수&nbsp;&nbsp;&nbsp;${viewBoard.bhit }</div>
                <div class="date">작성일&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${viewBoard.bdate }" pattern="yy-MM-dd"/></div>
                
            </div>
            <hr width="990px">
                <p>${viewBoard.bcontent }</p>
            <div class="R">
                  <img src="/upload/${boardFile.storedname}"  style="margin-left: 1%; width: 300px" alt=""><br>
                <a href="/board/download?bfileno=${boardFile.bfileno }">${boardFile.originname }</a>
            </div>
            <div class="F">
                <input type="submit" value="수정" id="C" onclick="location.href='/board/boardUpdate?bno=${viewBoard.bno }'">
                <input type="submit" value="삭제" id="D" onclick="location.href='/board/delete?bno=${viewBoard.bno }'">
            </div>
            <hr width="990px">
            <div class="L">
                <input type="button" value="목록으로" id="B" onclick="location.href='/board/boardMain'">
            </div>
            
             <hr width="990px">
             
             <div class="reply_area">
<form method="POST" id="replyForm" name="replyForm">
<input type="hidden" id="hiddenId" value="<%= id %>">
	<strong class="reply_num">
		<span id="cCnt"></span> <b>✨comment✨</b><hr>
	</strong>
	
	<!-- 댓글 박스 -->
	<div class="reply_result"> 
		<strong><span id="list_userid"></span></strong>
		<span id="list_content"></span>
	</div>

	<div class="reply_box" style="padding-top: 10px;">
		<div class="writer_info" style="margin-bottom: 5px;">
			<strong><span id="memberno">${memberno }</span></strong>
		</div>
		
		<div class="write_area">
			<textarea id="recontent" name="recontent" placeholder="댓글을 입력해주세요."></textarea>
			<button id="replyBtn" type="button" onclick="postComment(this)">등록</button>
			<button id="childReplyBtn" type="button" onclick="postChildReplyComment(this)" style="visibility: hidden;">답댓글 등록</button>
			<button id="cancelBtn" type="button" onclick="cancel()">취소</button>
		</div>
	</div> <!--끝-->
	
</form>
</div> <!-- comm_area -->

           <!--  <div class="reply">
                <input type="button" value="수정" id="J" >
                <input type="button" value="삭제" id="K">
            </div> -->
     
          
        </div>
    </div>
    </section>

</body>

<script type="text/javascript">



$(document).ready(function() {
	
	//댓글 리스트 가져오는 함수
	
	getCommentList();
		
		//댓글등록 -  [등록]버튼 클릭 시
		$("#commBtn").click(function(){
			
			//변수 선언
			var bno = ${viewBoard.bno};
			var recontent = $("#recontent").val().replace("\n", "<br>");
			
			
			//로그인 여부 검사
			if(${empty memberno}){
				alert("로그인 후 이용해주세요");
				$("#recontent").val("");
				return;
			} else if(recontent == "") {
				alert("내용을 입력하세요");
			}
				
			$.ajax({
				url : "/board/cmtWrite"
				, type : "POST"
				, data : { "bno" : bno, "recontent" : recontent }
				, dataType : "text"
				, success : function(data){
					if(data == "success"){        
						console.log("댓글 등록 완료");
						getList2();
					} else {
						console.log("댓글 등록 실패");
					}
				},
				error : function(){
					console.log("ajax 통신 실패");
				}
			}); //ajax end
		
			$("#recontent").val("");
			
		}); // click end
	}) // document end
	function getList(){
		$.ajax({
			url : "/board/boardView?bno=${viewBoard.bno}"
			, type : "get"
			, success : function(res){
				$(".comm_result").html(res);
			}
		}); //ajax end
	}//  end
	
	

	//댓글 리스트 조회 함수 (json방식)
	function getCommentList(){
		var memberno  = document.getElementById('hiddenId').value
		$.ajax({
			url : "/board/reply?bno=${viewBoard.bno}"
			, type : "get"
			, contentType : "application/json"
			, success : function(res){
				 
				if(res.list.length > 0){
					var list = res.list;
					console.log(list)

					var output = "<div>";
					
					for(i = 0; i < list.length; i++){
						var type =  list[i].parentno == 0 ? 'parent' :  'child' ;	
					
						if(type === 'child') {
							output += "↪"
						} else {
							output += "🔒"	
						}
						
						
						output += "<span id='memberNo'>" + '&ensp;'+list[i].memberno + '&ensp;|&ensp;'+"</span>";
						output += "<span class='" + type + "'><span id='comm_userid'><strong>" + list[i].memberName + "</strong></span>";
						output += "<span id='rdate'>" +'&nbsp;&nbsp;|&ensp;'+ list[i].recreatedate +"</span></br>";
						output += "<span id='ajaxRecontent"+list[i].replyno+"'>" + list[i].recontent +"</span>";
//	 					if(list[i].userid == userid){

						if(memberno === list[i].memberno){
//	 						output += "<span id='delete' style='cursor:pointer;' data-id ="+list[i].comContent+">[삭제]</span><br></div><hr>";
							output += " <span id='updelete'> "
							
							output += " <button id='deleteBtn' type='button' onclick='deleteAjaxComment("+list[i].replyno+")'>삭제</button> ";
							
							// 일반댓글일 경우에만 댓글 버튼 표시
							if(type === 'parent'){
								output += " <button type='button' id='updateBtn' onclick='focusModifyForm("+ list[i].replyno +")'>수정</button> ";
								output += "<button type='button' id='btn' onclick='focusChildReplyForm("+ list[i].replyno+")'>댓글</button></span><br></div></div><hr> ";
								
							} else {
								output += " <button type='button' id='updateBtn' onclick='focusChildModifyForm("+ list[i].replyno +")'>수정</button> ";
								output += "</div><hr> "
							}
							 
						}
						else{
							output += "</div><hr>";
						}
						
					} //for end
					$(".reply_result").html(output);
					
				} else {
					var output = "<div>등록된 댓글이 없습니다.</div>";
					$(".reply_result").html(output);
				}
			}
				
		}); //ajax end
	} //getCommentList end
	
	
	//댓글 수정화면 생성 함수
	function showModify(cno){
		$.ajax({
			type: "get",
			url: "/board/cmtView"+replyno,
			success: function(res){
				$("#comm_modify").html(res);
				// 태그.css("속성", "값")
				$("#comm_modify").css("visibility", "visible");
			}
		})
	}
	
	$("#updateBtn").click(function(){
		showModify();
		console.log("수정버튼 클릭");
		
	}); //updateBtn

	
	// 댓글 등록버튼 
	// 등록 & 수정 기능 
	function postComment(e) {
		var replyno = e.value
	 	var isCreate = (replyno == "" || replyno.length < 1)
		
	 	var message = isCreate ? "댓글을 작성하시겠습니까?" : "댓글을 수정하시겠습니까?"
	 	var cf = confirm(message)
	 
		if(cf){
			var content = document.getElementById('recontent')
		
			if(!isCreate){
				var replyno = e.value
				
				// 댓글 수정
				$.ajax({
					url : "/board/reply/update"
					, type : "POST"
					, data : { "replyno" : replyno, "recontent" : content.value }
					, dataType : "text"
					, success : function(data){
						if(data == "success"){        
							console.log("댓글 수정 완료");
							getCommentList();
						} else {
							console.log("댓글 수정 실패");
						}
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				}); // update ajax end
			
			}else {
				console.log(${viewBoard.bno})
				// 댓글 등록
				// 추후 로그인 유저의 사번 가져오기
				var memberno  = document.getElementById('hiddenId').value
			
				$.ajax({
					url : "/board/reply"
					, type : "POST"
					, data : { 
						"recontent" : content.value, "bno" : ${viewBoard.bno},"memberno" :  memberno, "parentNo" :  0}
					, dataType : "text"
					, success : function(data){
						if(data == "success"){        
							console.log("댓글 등록 완료");
							getCommentList();
						} else {
							console.log("댓글 등록 실패");
						}
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				}); // post ajax end
			}
			content.value = ""
		} 
	}
	
	// 댓글 수정 버튼 클릭시 입력 폼에 포커스, 기존 댓글 내용 불러오기
	function focusModifyForm(reply) {
		var area = document.getElementById('recontent')
		var content = document.getElementById('ajaxRecontent'+reply)
		var replyBtn = document.getElementById('replyBtn')
		replyBtn.value = reply
		area.value = content.innerText
		area.focus()
	}
	
	// 대댓글 수정 버튼 클릭, 기능은 위와 동일 
	function focusChildModifyForm(reply) {
		var area = document.getElementById('recontent')
		var content = document.getElementById('ajaxRecontent'+reply)
		var childReplyBtn = document.getElementById('childReplyBtn')
		childReplyBtn.value = reply
		area.value = content.innerText
		area.focus()
		// 작성버튼을 대댓글 작성 버튼으로 변경
		replyBtn.style.visibility = 'hidden';
		childReplyBtn.style.visibility = 'visible';
	}

	// 댓글 삭제
	function deleteAjaxComment(no) {
		var cf = confirm('댓글을 삭제하시겠습니까?')
		if(cf){
			$.ajax({
				url : "/board/reply/delete?no="+no
				, type : "get"
				, success : function(data){
					console.log(data)			
					if(data == "success"){        
						console.log("댓글 삭제 완료");
						getCommentList();
					} else {
						console.log("댓글 삭제 실패");
					}
				},
				error : function(){
					console.log("ajax 통신 실패");
				}
			}); // update ajax end	
		} // if end
	}


	// 대댓글
	function focusChildReplyForm(no){
		// no : 원댓글의 no (=부모댓글)
		var area = document.getElementById('recontent')
		var replyBtn = document.getElementById('replyBtn')
		var childReplyBtn = document.getElementById('childReplyBtn')
		area.focus()
		// 작성버튼을 대댓글 작성 버튼으로 변경
		replyBtn.style.visibility = 'hidden';
		childReplyBtn.style.visibility = 'visible';
		
		childReplyBtn.name = "to_"+no
	}

	function cancel(){
		var btn = document.getElementById('replyBtn')
		var childReplyBtn = document.getElementById('childReplyBtn')
		var area = document.getElementById('recontent')
		btn.value = ""
		area.value = ""
		
		// 대댓글 작성 버튼을 작성버튼으로 변경
		replyBtn.style.visibility = 'visible';
		childReplyBtn.style.visibility = 'hidden';		
	
	}
	
	// 대댓글 작성 & 수정 기능 함수
	function postChildReplyComment(e){
		var childReplyBtn = document.getElementById('childReplyBtn')
		var replyno = e.value
		console.log(e.name)
		// 새로 작성하는 글인지에 대한 여부
		var isCreate = (replyno == "" || replyno.length < 1)
		
		var message = isCreate ? "답댓글을 작성하시겠습니까?" : "답댓글을 수정하시겠습니까?"
	 	var cf = confirm(message)
		
		if(cf){
			var content = document.getElementById('recontent')
			var memberno  = document.getElementById('hiddenId').value
			
			if(isCreate){
				var parentno = e.name.split('_')[1]
				console.log(e.name)
				$.ajax({
					url : "/board/reply"
					, type : "POST"
					, data : { 
						"recontent" : content.value, "bno" : ${viewBoard.bno},"memberno" :  memberno, "parentno" : parentno }
					, dataType : "text"
					, success : function(data){
						if(data == "success"){        
							console.log("댓글 등록 완료");
							getCommentList();
							
						} else {
							console.log("댓글 등록 실패");
						}
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				}); // post ajax end	
			} else {
				$.ajax({
					url : "/board/reply/update"
					, type : "POST"
					, data : { 
						"recontent" : content.value, "replyno" :  e.value}
					, dataType : "text"
					, success : function(data){
						if(data == "success"){        
							console.log("댓글 등록 완료");
							getCommentList();
							
						} else {
							console.log("댓글 등록 실패");
						}
					},
					error : function(){
						console.log("ajax 통신 실패");
					}
				}); // update ajax end	
				
				
			} // end if
				
			content.value = ""
			childReplyBtn.value = ""
			childReplyBtn.name = ""
			
			// 대댓글 작성 버튼을 작성버튼으로 변경
			replyBtn.style.visibility = 'visible';
			childReplyBtn.style.visibility = 'hidden';		
		} 
	}
	
	
</script>

<c:import url="../layout/footer.jsp" />