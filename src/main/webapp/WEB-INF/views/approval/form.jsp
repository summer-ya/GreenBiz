<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"  rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- summernote css/js-->
   <link  href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
   <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- jsTree -->   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

<script>
/* ---------------------------------------------------------- */
/* 데이터보내기  */
  
 function submit(){
	
	var formData = $('form').serialize();
	var url = "/approval/main"
	
	$.ajax({
	    type: 'POST',
	    url: url,
	    data: data,
	    success: function (data) {
	        console.log(data)
	    },
	    error: function (xhr, status, error) {
	        console.log(error,xhr,status );
	    },
	});
}

function signPath() {

      $.ajax({
         url : "/approval/appline",
         type : "post"
      }).done(function(result) {
         $("#popupAppline").html(result);

      });

//       $("#popupUsers").modal();

   }

function fn_selectUsers(docsignpath) {
      
      $("#docsignpath").val(docsignpath);
//       $("#popupUsers").modal("hide");
      var signPath = $("#signPath");
      var signPath4Agree = $("#signPath4Agree");

      signPath.empty();
      signPath4Agree.empty();

      var typearr = [ "기안", "합의", "결재" ];
      var nos = docsignpath.split("||");
      for ( var i in nos) {
         if (nos[i] === "")
            continue;
      console.log(nos);
         var arr = nos[i].split(","); // 사번, 이름, 기안/합의/결제, 직책 
         var signArea = $("<div class='signArea'>");
        	 console.log("합의"+arr[2])
         if (arr[2] === "1"){
        	 signPath4Agree.append(signArea);
         
         } else {
            signPath.append(signArea);

         var signAreaTop = $("<div class='signAreaTop'><input type='hidden' name='rank' value="+arr[3]
         +" ><input type='hidden' name='memberNo' value="+arr[0]+">" + arr[3] + "</div>")
               .appendTo(signArea);
         var signAreaTop = $("<div class='signAreaCenter'>").appendTo(
               signArea);
         var signAreaTop = $(
               "<div class='signAreaBottom'><input type='hidden' name='confirmName' value="+arr[1]+">" + arr[1] + "</div>")
               .appendTo(signArea);
         }
      }
   }


/* ---------------------------------------------------------- */

    /*    입력값 가져오기 */

    $(function() {
        //input을 datepicker로 선언
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-48M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+12M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
        });                    
        $('#startDate').datepicker(); 
        $('#endDate').datepicker(); 
        //초기값을 오늘 날짜로 설정
        $('#startDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  
        $('#endDate').datepicker('setDate', 'today');          
    });
    
    $(document).ready(function(){
        
        function printName() {
            const name = document.getElementById('startDate').value;
            document.getElementById("result").innerHTML = name;
        }
     })
     
    function printName() {
        const name = document.getElementById('startDate').value;
        document.getElementById("result").innerHTML = name;
    }
    
    function show_alert() {
       swal("기안이 등록되었습니다.");
     }

    function newpjModal() {
       var linemodal = document.getElementById("appLineModal");
       var modal = document.getElementById("newpjModal");
       var btn = document.getElementById("new_pj_btn");
       var span = document.getElementsByClassName("close")[0];
       var span2 = document.getElementsByClassName("close_a")[0];
       var btn2 = document.getElementById("stateupdate");


       // When the user clicks the button, open the modal 
       btn.onclick = function() {
          modal.style.display = "block";
       }
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
//           location.href = "${pageContext.request.contextPath}/project/list
       }                
       }


    </script>

<script type="text/javascript">
$(document).ready(function() {
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

</script>


<style>
html, body {
   width: 100%;
   /*  height: 100%; */
   position: relative;
   font-size: 14px;
   font-family: Noto Sans KR;
   line-height: 1.15;
}

a {
   text-decoration: none;
}

/*헤더부분*/
header {
   background-color: #F2F2F2;
   display: flex;
   position: relative;
   height: 60px;
   padding: 0 32px;
   top: 0;
   left: 0;
   right: 0;
}

.container {
   position: relative;
   width: 1200px;
   height: 100%;
   margin: 0 auto;
   padding-top: 0px;
}

.signTitle { 
   height:90px; 
   width:30px; 
   border: 1px solid #dedede; 
   text-align:center; 
   vertical-align:middle; 
   float:left;
   position: absolute;
   margin-top: 10px;
}

.signPath {
   float:right;
}

.signArea { 
   display:inline-block; 
   border:1px solid #dedede; 
   text-align:center; 
   width:100px; 
   vertical-align:top;
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
}
.signAreaTop { 
   height:20px; 
}

.wrap_title {
   display: flex;
   flex: 1;
}

.doc_title {
   display: flex;
   align-items: center;
   font-size: 20px;
}

.util_user {
   padding-top: 11px;
   line-height: 0;
}

.userinfo {
   display: inline-block;
   font-size: 14px;
   color: #505050;
}

.userprofile {
   vertical-align: middle;
   display: inline-block;
   margin-left: 16px;
}

.userprofile .icon {
   width: 29px;
   height: 29px;
}

/*헤더부분 END*/

/*aside부분*/
#apaside {
   width: 210px;
   /* height: 100% */;
   display: inline-block;
   /* position: absolute; */
   /* padding-top: 24px; */
}

ul {
   list-style: none;
}

.menu li a {
   padding: 16px 0 16px 19px;
}

.menu_list:hover {
   background-color: #e7e7e7;
}

.link_menu {
   text-decoration: none;
   display: block;
   position: relative;
   min-height: 55px;
   padding: 17px 44px 14px 32px;
   box-sizing: border-box;
   color: #333333;
   font-size: 14px;
   font-weight: 600;
}

/*aside부분 END*/

/*section부분  */
.page_section {
   position: absolute;
   width: 970px;
   height: 100%;
/*    padding: 40px 0 40px 40px;
   border-left: 1px solid #e7e7e7; */
   box-sizing: border-box;
}

/*section부분 END */


.board-listheader {
   font-size: 13px;
   margin-top: 11px;
   line-height: 140%;
}

.board-listheader td {
   padding: 10px 0;
   vertical-align: middle;
   font-size: 12px;
   border: 1px solid #c0c0c0;
   font-weight: 700;
}

.board-listheader tbody tr {
   text-align: center;
}

/* .board-listheader tbody tr td {
         padding-top: 20px;
         padding-bottom: 20px;
      } */
.apwrite {
   float: right;
   padding: 10px;
}

#apwritebtn {
   width: 50px;
   line-height: 30px;
   text-align: center;
   font-size: 12px;
}

.opt_bt {
   width: 200px;
   height: 30px;
   color: #787878;
   border: 1px solid #c0c0c0;
   box-sizing: border-box;
}

.opt_bt_a {
   width: 200px;
   height: 28px;
   color: #787878;
   border: 1px solid #c0c0c0;
   box-sizing: border-box;
}

.opt_bt_b {
   width: 330px;
   height: 36px;
   color: #787878;
   border: 1px solid #c0c0c0;
   box-sizing: border-box;
}

.opt_bt_c {
   height: 30px;
   font-size: 15px;
   background-color: white;
}

.section_a {
   font-weight: 600;
}

.ftext {
   padding-right: 10px;
}

.text_a {
   padding-left: 25px;
   padding-right: 10px;
}

.mainsection input {
   border: 1px solid #c0c0c0;
   box-sizing: border-box;
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

.sb-modal-content {
   position: relative;
   background-color: #fefefe;
   margin: auto;
   padding: 0;
   border: 1px solid #888;
   width: 23%;
   border-radius: 10px;
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

.close {
   color: #333333;
   float: right;
   font-size: 20px;
   font-weight: bold;
   line-height: 50px;
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

.close_a {
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

#new_pj_btn {
   width: 100px;
   line-height: 30px;
   text-align: center;
   font-size: 12px;
}

:root {
   --body-color: none;
}

.appdiv{
   float:left;
}
</style>

</head>

<body>


   <div id="apaside">
      <ul class="menu">
         	<li class="menu_list">
			<a href="${pageContext.request.contextPath}/approval/list" class="link_menu">전자결재 기안함</a></li>
            <li class="menu_list">
            <a href="${pageContext.request.contextPath}/approval/main" class="link_menu">전자결재 결재함</a></li>
            <li class="menu_list">
            <a href="${pageContext.request.contextPath}/approval/confirmOk" class="link_menu">전자결재 완료함</a></li>   
            <li><h5>로그인 : ${loginId }</h5></li>
      </ul>
   </div>

   <div class="container">

      <form action="${pageContext.request.contextPath}/approval/main" method="post" >
         <div class="page_section">
            <h2 style="font-size: 29px;">기안 작성하기</h2>
            <hr>



	

            <button type="button" class="btn btn-primary" onclick="signPath()"
               data-toggle="modal" data-target="#exampleModal">결재선 지정</button>

		<input type="hidden" data-toggle="modal" data-target="#exampleModal" id="test">


<!-- ----------------------------------------------------------------------------- -->

            <div>
        	      <div>
                         
                  <c:set value="0" var="cnt" />

                  <div class="row" style="margin-top: 10px; width: 101%; justify-content: flex-end;">
                     <div class="signPath" style="border:1px solid #dedede; ">
	                  	<br>결<br> <br>재<br>  
	                  </div>
                     <div id="signPath" class="signPath ">
                        <c:forEach var="signlist" items="${signlist}" varStatus="status">
                           <c:if test="${signlist.sstype ne '1'}">
                              <div class="signArea">
                                 <div class="signAreaTop">
                                    <c:out value="${signlist.userpos}" />
                                 </div>
                                 <div class="signAreaCenter">
                                    <c:choose>
                                       <c:when test='${signlist.ssresult == "1"}'>승인</c:when>
                                       <c:when test='${signlist.ssresult == "2"}'>반려</c:when>
                                       <c:otherwise></c:otherwise>
                                    </c:choose>
                                 </div>
                                 <div class="signAreaBottom">
                                    <c:out value="${signlist.usernm}" />
                                 </div>
                              </div>
                           </c:if>
                           <c:if test="${signlist.sstype eq '1'}">
                              <c:set var="cnt" value="${cnt + 1}" />
                           </c:if>
                        </c:forEach>
                     
                     </div>
       
                  </div>
                  
                  <c:if test="${cnt>0}">
                     <div class="row" style="margin-top: 10px">
                        <div id="signPath4Agree" class="signPath">
                           <c:forEach var="signlist" items="${signlist}"
                              varStatus="status">
                              <c:if test="${signlist.sstype eq '1'}">
                                 <div class="signArea">
                                    <div class="signAreaTop">
                                       <c:out value="${signlist.userpos}" />
                                    </div>
                                    <div class="signAreaCenter">
                                       <c:choose>
                                          <c:when test='${signlist.ssresult == "1"}'>결재</c:when>
                                          <c:when test='${signlist.ssresult == "2"}'>반려</c:when>
                                          <c:otherwise></c:otherwise>
                                       </c:choose>
                                    </div>
                                    <div class="signAreaBottom">
                                       <c:out value="${signlist.usernm}" />
                                    </div>
                                 </div>
                              </c:if>
                           </c:forEach>
                        </div>
                        <div class="signTitle">
                           <br>합<br> <br>의
                        </div>
                     </div>
                  </c:if>
               </div>
               <!-- /#page-wrapper -->


            </div>





<!-- ----------------------------------------------------------------------------- -->
            <div class="main_section">
            <hr>
               <table style="width: 100%; cellspacing: '0';"
                  class="board-listheader">
                  <tr>
                     <td>소속부서</td>
                     <td colspan="2"><input type="text" name="deptName" value="${memInfo.NAME }"
                        class="opt_bt_c" style="text-align:center; width: 95%; border: 0; outline:none; background-color: white;" readonly="true"></td>
                     <td>기안자</td>
                     <td colspan="2"><input type="text" name="memberName" value="${memInfo.MEMBERNAME }"
                        class="opt_bt_c" style="text-align:center; width: 95%; border: 0; outline:none; background-color: white;" readonly="true"></td>
                     <td>기안일시</td>
                     <td colspan="2"><div class="section_a dropdown">
                           <input type="text"
                              style="width: 95%; border: 0; text-align: center;"
                              disabled="disabled" class="opt_bt_c" id="startDate"
                              onchange="printName()" name="appTime">
                        </div></td>
                  </tr>
                  <tr>
                     <td>제목</td>
                     <td colspan="8"><input type="text" name="appTitle"
                        class="opt_bt_c" style="width: 95%; border: 0;"></td>
                  </tr>

                  <tr>
                     <td>참조</td>
                     <td colspan="8"><input type="text" name="appEtc"
                        class="opt_bt_c" style="width: 95%; border: 0;"></td>
                  </tr>

               </table>
            </div>

            <!-- 썸머노트 -->
            <div>
               <div>
                  <textarea id="summernote" name="appContent"></textarea>
               </div>
            </div>

            <div class="apwrite">
               <!-- <button type="submit" onclick="show_alert();" id="apwritebtn" name="apwritebtn">기안등록하기</button> -->
               <button type="button" class="btn btn-primary" onclick="newpjModal();" id="new_pj_btn">기안등록</button>

               <button type="button" class="btn btn-secondary" onclick="window.location='list'"
                  id="apwritebtn" name="apwritebtn">취소</button>
            </div>


            <div id="newpjModal" class="sb-modal">
               <!-- Modal content -->
               <div class="sb-modal-content">
                  <div class="sb-modal-header">
                     <span class="close">&times;</span>
                  </div>
                  <div class="sb-modal-body">
                     <h5>등록 하시겠습니까</h5>
                     <input type="submit" id="stateupdate" onclick='submit()' value="확 인" /> 
                     <input type="button" class="close_a" value="취 소" />
                  </div>
               </div>
            </div>
         </div>

      </form>

   <div id="popupUsers" class="modal fade bs-example-modal-lg"
      tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"></div>

   <!--  -->
   <!-- Modal window -->
   <div class="modal fade" id="exampleModal" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true" tabindex="-1"
      role="dialog">
      <div class="modal-dialog">
         <div class="modal-content" style="width: 138%">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div id="popupAppline" class="modal-body">...</div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-dismiss="modal" id="close">Close</button>
               <button type="button" class="btn btn-primary"
                  onclick="fn_closeUsers()" data-dismiss="modal">확인</button>
            </div>

         </div>
      </div>
   </div>
   <!--  -->
</div>
</body>

</html>