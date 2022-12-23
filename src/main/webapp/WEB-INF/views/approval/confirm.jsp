<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<c:import url="../layout/header.jsp" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- summernote css/js-->
    <link  href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
   
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"  rel="stylesheet"> 

<script type="text/javascript">
	$(document).ready(function() {
		newpjModal()
	//여기 아래 부분
	$('#summernote').summernote({
	height: 600,                 // 에디터 높이
	minHeight: null,             // 최소 높이
	maxHeight: null,             // 최대 높이
	focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	lang: "ko-KR",               // 한글 설정
	placeholder: '최대 2048자까지 쓸 수 있습니다'   //placeholder 설정
                   
		});
	});
   
		function newpjModal() {
            var mmodal = document.getElementById("newpjModal_a");
//             var bbtn = document.getElementById("new_pj_btn_a");
            var sspan = document.getElementsByClassName("cclose")[0];
            var sspan2 = document.getElementsByClassName("cclose_a")[0];
            
            var cspan2 = document.getElementsByClassName("close2")[0];
            var dgmodal = document.getElementById("newdgModal");
            var btn3 = document.getElementById("deleteupdate");
            
            var span3 = document.getElementsByClassName("close_b")[0];
            /* var btn2 = document.getElementById("stateupdate"); */
            // When the user clicks the button, open the modal 
             $("#new_pj_btn_a").click( function() {
               mmodal.style.display = "block";
            })
         
         // When the user clicks the button, open the modal 
            $("#new_pj_btn").click( function() {
               modal.style.display = "block";
            })
            $("#new_dg_btn").click( function() {
           	 dgmodal.style.display = "block";
            })
            
            // When the user clicks on <span> (x), close the modal
            $(".close").click( function() {
               modal.style.display = "none";
            })
            $(".close2").click( function() {
               dgmodal.style.display = "none";
            })
            span3.onclick = function() {
            	dgmodal.style.display = "none";
             }
            // When the user clicks on <span> (x), close the modal
            sspan.onclick = function() {
               mmodal.style.display = "none";
            }
            sspan2.onclick = function() {
               mmodal.style.display = "none";
            }
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
               if (event.target == mmodal) {
                  mmodal.style.display = "none";
               }
            }
            /* btn2.onclick = function(event) {
               location.href = 'stateupdate?apno=${apno.apno }'
            } */
            /* 결재완료 모달 */
            var modal = document.getElementById("newpjModal");
               
               var span = document.getElementsByClassName("close")[0];
               var span2 = document.getElementsByClassName("close_a")[0];
               var btn2 = document.getElementById("stateupdate");
               // When the user clicks the button, open the modal 
               
               // When the user clicks on <span> (x), close the modal
               span.onclick = function() {
                  modal.style.display = "none";
               }
               span2.onclick = function() {
                  modal.style.display = "none";
               }
               // When the user clicks anywhere outside of the modal, close it
               window.onclick = function(event) {
                  if (event.target == modal) {
                     modal.style.display = "none";
                  }
               }
               btn2.onclick = function(event) {
            	   
            	   console.log('clicked' , socket);
            	   
            	   
            	   
            	   var replyWriter = $('input#replyWriter').val();//결재자 로그인한 사원
            	   var appWriter = $('input#appWriter').val(); //작성자 사번
            	   var apptitle = $('input#apptitle').val(); //기안제목
            	   var approvalNo = $('input#approvalNo').val(); //기안번호
            	   console.log(replyWriter, appWriter , apptitle, approvalNo)
            	   
            	   if(socket){
            		   //websocket에 보내기(reply,결재자,기안작성자,기안제목,기안번호)
            		   let socketMsg = "reply,"+ replyWriter + "," + appWriter +","+ apptitle +","+approvalNo;
            		  socket.send(socketMsg)
            	   }
                  location.href = '/approval/approvalOk?approvalNo=${appconfirm.approvalNo }'
               }
               
               $('input#stateupdatea').click(function(){
            	   console.log('clicked');
            	   var replyWriter = $('input#replyWriter').val();//반려자 로그인한 사원
            	   var appWriter = $('input#appWriter').val(); //작성자 사번
            	   var apptitle = $('input#apptitle').val(); //기안제목
            	   var approvalNo = $('input#approvalNo').val(); //기안번호
            	   console.log(replyWriter, appWriter , apptitle, approvalNo)
            	   
            	   if(socket){
            		   //websocket에 보내기(reject,결재자,기안작성자,기안제목,기안번호)
            		   let socketMsg = "reject,"+ replyWriter + "," + appWriter +","+ apptitle +","+approvalNo;
            		  socket.send(socketMsg)
            	   }
            	   location.href = '/approval/reject?approvalNo=${appconfirm.approvalNo }'
               })
         };
         
</script>

<style>
 html,
    body {
        width: 100%;
        position: relative;
        font-size: 14px;
        font-family: Noto Sans KR;
    }


a {
   text-decoration: none;
}

a:hover {
   cursor: pointer;
}

a {
   color: black;
}


/*헤더부분*/
header {
   display: flex;
   position: relative;
   height: 60px;
   padding: 0 0px;
   top: 0;
   left: 0;
   right: 0;
}

.container {
   position: relative;
   width: 1200px;
   height: 100%;
   margin: 0 auto;
   margin-top: 2%;
 
}

/*헤더부분 END*/


/*section부분  */
.page_section {
   position: absolute;
   width: 970px;
   height: 911px;
   padding: 0px 0 40px 40px;
   box-sizing: border-box;
}

/*section부분 END */
.main_section {
   padding-top: 30px;
}

.board-listheader {
   font-size: 13px;
   line-height: 140%;
}

.board-listheader td {
   padding: 15px 0;
   vertical-align: middle;
   font-size: 12px;
   border: 1px solid #c0c0c0;
   text-align: center;
}

.apwrite {
   float: right;
   padding-top: 20px;
}


.close {
   color: #333333;
   float: right;
   font-size: 20px;
   font-weight: bold;
   line-height: 50px;
}

.close:hover, .close:focus {
   color: #000;
   text-decoration: none;
   cursor: pointer;
}

.sb-modal {
   display: none;
   position: fixed;
   z-index: 20;
   padding-top: 100px;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   overflow: auto;
   background-color: rgb(0, 0, 0);
   background-color: rgba(0, 0, 0, 0.4);
}

.sb-modal-content  {
   position: relative;
   background-color: #fefefe;
   margin: auto;
   padding: 0;
   border: 1px solid #888;
   width: 23%;
   height:37%;
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
      rgba(0, 0, 0, 0.19);
   -webkit-animation-name: animatetop;
   -webkit-animation-duration: 0.4s;
   animation-name: animatetop;
   animation-duration: 0.4s;
}

.sb-modal-header {
   padding: 2px 16px;
   background-color: #f4f4f4;
   color: #333333;
   border-radius: 10px 10px 0 0;
}

.sb-modal-body {
   width: 100%;
   /* padding: 2px 16px; */
   display: flex;
   flex-direction: column;
   height: 200px;
   display: inline-block;
   margin: 0 auto;
   text-align: center;
}

 .sb-modal-body>#stateupdate {
   width: 22%;
   height: 45px;
   margin-right: 20px;
   line-height: 25px;
   font-size: 13px;
   border: 1px solid black;
   border-radius: 6px;
   cursor: pointer;
   display: inline-block;
   vertical-align: middle;
   color: black;
   font-weight: 600;
   text-align: center;
   background-color: white;
}

.cclose {
   color: #333333;
   float: right;
   font-size: 20px;
   font-weight: bold;
   line-height: 50px;
}

.cclose:hover, .cclose:focus {
   color: #000;
   text-decoration: none;
   cursor: pointer;
}

.ssb-modal {
   display: none;
   position: fixed;
   z-index: 20;
   padding-top: 100px;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   overflow: auto;
   background-color: rgb(0, 0, 0);
   background-color: rgba(0, 0, 0, 0.4);
}

.ssb-modal-content {
   position: relative;
   background-color: #fefefe;
   margin: auto;
   padding: 0;
   border: 1px solid #888;
   width: 23%;
   height:37%;
/*    border-radius: 10px; */
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
      rgba(0, 0, 0, 0.19);
   -webkit-animation-name: animatetop;
   -webkit-animation-duration: 0.4s;
   animation-name: animatetop;
   animation-duration: 0.4s;
}

.ssb-modal-header {
   padding: 2px 16px;
   background-color: #f4f4f4;
   color: #333333;
   border-radius: 10px 10px 0 0;
  /*  text-align: center; */
}

.ssb-modal-body {
   width: 100%;
   /* padding: 2px 16px; */
   display: flex;
   flex-direction: column;
   height: 125px;
   display: inline-block;
   margin: 0 auto;
   text-align: center;
}


#pname {
   position: relative;
   text-align: center;
   padding: 15px 0 15px 0;
   left: 3%;
}
#pname2 {
   text-align: center;
   padding: 15px 0 15px 0;
}

:root {
   --body-color: none;
}

hr{
width: 104%
}
.signPath {
   float:right;
}

.signArea { 
   display:inline-block; 
   border:1px solid #dedede; 
   text-align:center; 
   width:100px; 
   vertical-align: middle;
   margin: 0px 5px;
}
.signAreaCenter { 
   border-top: 1px solid #dedede; 
   border-bottom: 1px solid #dedede; 
   height:50px; 
   width:100%; 
   padding-top: 15px;
   
}

.signAreaBottom { 
   height:20px; 
   vertical-align: middle;
}
.signAreaTop { 
   height:20px;
   vertical-align: middle; 
}
.signTitle { 
   height:90px; 
   width:30px; 
   border: 1px solid #dedede; 
   text-align:center; 
   vertical-align:middle; 
   float:right;
   position: absolute;
   margin-top: 10px;
}

 .sb-modal-body>#deleteupdate {
   width: 22%;
   height: 45px;
   margin-right: 20px;
   line-height: 25px;
   font-size: 13px;
   border: 1px solid black;
   border-radius: 6px;
   cursor: pointer;
   display: inline-block;
   vertical-align: middle;
   color: black;
   font-weight: 600;
   text-align: center;
   background-color: white;
}

.close_b {
   width: 22%;
   height: 45px;
   margin: 0 auto;
   line-height: 25px;
   font-size: 13px;
   border: 1px solid black;
   border-radius: 6px;
   cursor: pointer;
   display: inline-block;
   vertical-align: middle;
   color: black;
   font-weight: 600;
   text-align: center;
   background-color: white;
}


.close2:hover, .close2:focus {
   color: #000;
   text-decoration: none;
   cursor: pointer;
}

.close2 {
    color: #333333;
    float: right;
    font-size: 20px;
    font-weight: bold;
    line-height: 50px;
}

.menu {
    width: 200px;
}
</style>
<title>Green-Biz</title>
</head>

<body>

   <div class="container">
         
      <div class="page_section">
      
         <!--  ----- -->
      <input type="hidden" name="approvalNo" value="${appconfirm.approvalNo}">   

         <!--  ----- -->
         <h2 style="FONT-SIZE: 29PX;">전자결재 결재함</h2>
         <hr >
         <div class="main_section">

                  <div class="row" style="margin-top: 10px; width: 106%; justify-content: flex-end;">
                       <div class="signPath" style="border:1px solid #dedede;">
                        <br>결<br> <br>재 
                     </div>
                   <c:forEach items="${confirmList }" var="list">  
                     <div id="signPath" class="signPath ">
                              <div class="signArea">
                                 <div class="signAreaTop">
                                    <c:out value="${list.rank }" />
                                 </div>
                                 <div class="signAreaCenter">
                                     <c:choose>
                                       <c:when test='${list.appState == "0"}'></c:when>
                                       <c:when test='${list.appState == "1"}'>승인</c:when>
                                       <c:when test='${list.appState == "2"}'>반려</c:when>
                                    </c:choose>
                                 </div>
                                 <div class="signAreaBottom">
                                    <c:out value="${list.confirmName }" />
                                 </div>
                              </div>
                     </div>
                     </c:forEach>
       
                  </div>

            <hr style="border: solid #dedede;  border-width: 1px 0 0; width:100%; position: absolute; top: 23.2%;">

            <table  style="width: 100%; position: absolute; top: 27%; "  class="board-listheader" >
               <tr>
                   <td>소속부서</td>
                   <td colspan="2"><input type="text" disabled="disabled" value="${appconfirm.deptName }" style="width: 95%; border: 0; background:white; text-align: center;"> 
                   </td>
                   <td>기안자</td>
                   <td colspan="2"><input type="text" disabled="disabled" value="${appconfirm.memberName }" style="width: 95%; background:white; border: none; text-align: center;">
                   </td>
                   <td>기안일시</td>
                   <td colspan="2"><input type="text" disabled="disabled" value="${appconfirm.appTime }" style="width: 95%; border: 0; background:white; text-align: center;">
                   </td>
               </tr>
               <tr>
                  <td>제 목</td>
                  <td colspan="8">${appconfirm.appTitle }</td>
               </tr>
               <tr>
                  <td>내 용</td>
                  <td colspan="8" style="height: 300px;">${appconfirm.appContent }</td>
               </tr>
               <c:if test="${appFile ne null }">
               <tr >
                  <td style="border: none; font-weight: bolder;">첨부파일</td>
                 <td style="text-align: left; border: none;">
                 <a href="/upload/${appFile.appFileSaveName}" download="${appFile.appFileName }">
                     ${appFile.appFileName }
                     </a>
                  </td>
               </tr>
              </c:if>

         <!--  결재 의견 -->
            </table>
           <div style="top: 510px; position: relative; width: 104%"> 
              <table  class="table table-striped">
               <thead>
                  <tr>
                     <th width="15%">승인자</th>
                     <th width="80%">결재의견</th>
                  </tr>
                  </thead>
                  <tbody>
                      <c:forEach items="${confirmList }" var="list"> 
                      <tr>
                         <c:if test="${list.appComment ne null}">
                           <td>${list.confirmName }</td>
                          </c:if>
                         <c:if test="${list.appComment ne null}">
                           <td colspan="3">${list.appComment }</td>
                          </c:if>
                       </tr>
                          </c:forEach>
                </tbody>
              </table>      
               </div>
         
         </div>
         
         <div class="apwrite" style="position: absolute; top: 70%; right: -4%;">
            <c:forEach items="${confirmList }" var="list">
            <c:if test="${list.memberNo eq loginId }">
            <c:if test= "${list.appState == 0}">

                     <button type="button" id="new_pj_btn_a" class="btn btn-secondary" name="apwritebtn"
                     onclick="newpjModal_a">반려</button>
            <div id="newpjModal_a" class="ssb-modal">
               <!-- Modal content -->
               <div class="ssb-modal-content">
                  <div class="ssb-modal-header">
                     <span class="cclose">&times;</span>
                     <h5>반려사유입력</h5>
                  </div>
                  <form action="/approval/reject" method="get">
                     <input type="hidden" name="approvalNo" value="${appconfirm.approvalNo }">
                     <div id="pname">
                        <textarea cols="40" rows="8" placeholder="반려 사유를 입력해주세요(50자 내외)"
                           name="appReject" style="resize: none;"></textarea>
                     </div>
                     <div class="ssb-modal-body">

                        <input type="button" id="stateupdatea" class="btn btn-primary" value="확 인" /> <input
                           type="button" class="cclose_a btn btn-secondary" value="취 소" />
                     </div>
                  </form>
               </div>
            </div>

            <%-- <button type="button" id="apwritebtn" onclick="window.location='stateupdate?apno=${apno.apno }'">결재완료</button> --%>
             
                  <button type="button" id="new_pj_btn" class="btn btn-primary" onclick="newpjModal">결재완료</button>
            	</c:if>
            </c:if>
            </c:forEach>

			<c:if test="${appconfirm.memberNo eq loginId }">  
            <button type="button" class="btn btn-danger" onclick="newpjModal()" id="new_dg_btn">삭제</button>
        	</c:if>

            <div id="newpjModal" class="sb-modal">
               <!-- Modal content -->
               <div class="sb-modal-content">
                  <div class="sb-modal-header">
                     <span class="close">&times;</span>
                     <h5>결재 의견 입력</h5>
                  </div>
                  <div class="sb-modal-body">
                     <form action="/approval/approvalOk" method="get">
                     <input type="hidden" name="approvalNo" value="${appconfirm.approvalNo }">
                     <div id="pname2">
                        <textarea cols="40" rows="8" placeholder="결재 의견을 입력해주세요(50자 내외)"
                           name="appComment" style="resize: none;"></textarea>
                     </div>
                     <input type="button" id="stateupdate" class="btn btn-primary" value="확 인" /> 
                     <input type="button" class="close_a btn btn-secondary" value="취 소" />
                  </form>
                  </div>
               </div>
            </div>
         </div>
	
            
            <div id="newpjModal" class="sb-modal">
               <!-- Modal content -->
               <div class="sb-modal-content">
                  <div class="sb-modal-header">
                     <span class="close">&times;</span>
                  </div>
                  <div class="sb-modal-body">
                     <h5>수정사항을 저장 하시겠습니까</h5>
                     <input type="submit" id="stateupdate" onclick='submit()' value="확 인" /> 
                     <input type="button" class="close_a" value="취 소" />
                  </div>
               </div>
            </div>
		
		<form action="/approval/confirmdelete" method="post">
      <input id="approvalNo" type="hidden" name="approvalNo" value="${appconfirm.approvalNo}">   
      <div id="newdgModal" class="sb-modal">
               <!-- Modal content -->
               <div class="sb-modal-content">
                  <div class="sb-modal-header">
                     <span class="close2">&times;</span>
                  </div>
                  <div class="sb-modal-body">
                     <h5>해당 문서를 삭제 하시겠습니까</h5>
                     <input type="submit" id="deleteupdate" onclick='submit()' value="확 인" /> 
                     <input type="button" class="close_b" value="취 소" />
                  </div>
               </div>
            </div>
      </form>	
<input type="hidden" id="replyWriter" value="${memInfo.MEMBERNAME }">
<input type="hidden" id="apptitle" value="${appconfirm.appTitle }">
<input type="hidden" id="appWriter" value="${appconfirm.memberNo }">

      </div><!-- p_s -->
   </div><!-- con -->




<c:import url="../layout/footer.jsp" />