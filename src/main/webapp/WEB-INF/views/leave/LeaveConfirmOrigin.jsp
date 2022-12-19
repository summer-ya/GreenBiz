<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="../layout/header.jsp" />

<style>
    * {font-family: 'InfinitySans-RegularA1'; }
    
    /* 휴가 구분 css */
   .form-radio{
       display: inline-block; 
       line-height: 20px; 
       vertical-align: middle;
       font-size: 14px; 
   }
   .form-chek::before, .form-radio::before{
       content: ""; 
       display: inline-block; 
       width: 10px; 
       height: 10px; 
       background: #ffffff; 
       border: 1px solid #3d3d3e; 
       margin-right: 8px;
   }
   .form-radio::before{ border-radius: 50%; }
   .input-chek, .input-radio{ display: none; }
   .input-chek:checked + .form-chek::before, .input-radio:checked + .form-radio::before{ background: #5b18ff; }
   .input-chek:checked + .form-chek, .input-radio:checked + .form-radio{ color: #5b18ff; }
   .leaveDetailTextArea { font-size: 25px; }
   .leaveDate { padding: 10px; }
</style>
   
   <c:if test="${!empty approval.appReason}">
      <div style="position:absolute; margin-left:400px; margin-top:30px">
         <img src="${path}/images/rejected.png" style="width:200px; height:200px" />
      </div>
   </c:if>
    <form action="${path}/leave/leaveApplication" method="post">
       <div class="cash-form-section" style="height: 100%; width:68%; margin: 0 300px 0 300px;">
           <div class="cash-disbursement" style="text-align: center; margin: 80px 0px 80px 200px; border: 2px solid black;">
               <table border="2px" style="width: 100%; font-size: 20px; border-collapse: collapse;">
                   <tr>
                       <td rowspan="3" colspan="4" style="width: 300px; height: 140px; font-size: 40px; font-weight: 600;">휴 가 신 청 서</td>
                       <td rowspan="3" style="width: 20px; padding-top: 30px; font-size: 25px;">결 재</td>
                       <td style="width: 100px;">최종승인자</td>
                   </tr>
                   <tr>
                       <c:choose>
                     <c:when test="${approval.appPresent eq 'A'}">
                         <td name="firstA" id="firstA">${approval.firstApprover}</td>
                         <td name="interimA" id="interimA">${approval.interimApprover}</td>
                         <td name="finalA" id="finalA">${approval.finalApprover}</td>
                      </c:when>
                     <c:when test="${approval.appPresent eq 'B'}">
                          <td name="firstA" id="firstA">${approval.firstApprover}<img src="${path}/images/approved.png" style="position:absolute; width:130px; height:130px; margin-left:-92px; margin-top:-50px" /></td>
                          <td name="interimA" id="interimA">${approval.interimApprover}</td>
                          <td name="finalA" id="finalA">${approval.finalApprover}</td>
                      </c:when>
                     <c:when test="${approval.appPresent eq 'C'}">
                          <td name="firstA" id="firstA">${approval.firstApprover}<img src="${path}/images/approved.png" style="position:absolute; width:130px; height:130px; margin-left:-92px; margin-top:-50px" /></td>
                          <td name="interimA" id="interimA">${approval.interimApprover}<img src="${path}/images/approved.png" style="position:absolute; width:130px; height:130px; margin-left:-92px; margin-top:-50px" /></td>
                          <td name="finalA" id="finalA">${approval.finalApprover}</td>
                      </c:when>
                     <c:when test="${approval.appPresent eq 'D'}">
                          <td name="firstA" id="firstA">${approval.firstApprover}<img src="${path}/images/approved.png" style="position:absolute; width:130px; height:130px; margin-left:-92px; margin-top:-50px" /></td>
                          <td name="interimA" id="interimA">${approval.interimApprover}<img src="${path}/images/approved.png" style="position:absolute; width:130px; height:130px; margin-left:-92px; margin-top:-50px" /></td>
                          <td name="finalA" id="finalA">${approval.finalApprover}<img src="${path}/images/approved.png" style="position:absolute; width:130px; height:130px; margin-left:-92px; margin-top:-50px" /></td>
                      </c:when>
                     <c:otherwise>
                          <td name="firstA" id="firstA">${approval.firstApprover}</td>
                          <td name="interimA" id="interimA">${approval.interimApprover}</td>
                          <td name="finalA" id="finalA">${approval.finalApprover}</td>
                     </c:otherwise>
                  </c:choose>
                   </tr>
                   <tr style="height: 30px;">
                       <c:choose>
                          <c:when test="${!empty approval.appReason}">
                             <td><input type="button" name="Approver1" id="Approver1" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" disabled /></td>
                        <td><input type="button" name="Approver2" id="Approver2" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" disabled /></td>
                        <td><input type="button" name="Approver3" id="Approver3" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" disabled /></td>
                          </c:when>
                          <c:otherwise>
                             <c:choose>
                           <c:when test="${loginMember.user_name eq approval.firstApprover && approval.appPresent eq 'A'}">
                               <td><input type="button" name="Approver1" id="Approver1" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" /></td>
                               <td><input type="button" name="Approver2" id="Approver2" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" disabled /></td>
                               <td><input type="button" name="Approver3" id="Approver3" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" disabled /></td>
                           </c:when>
                           <c:when test="${loginMember.user_name eq approval.interimApprover && approval.appPresent eq 'B'}">
                               <td><input type="button" name="Approver1" id="Approver1" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" disabled /></td>
                               <td><input type="button" name="Approver2" id="Approver2" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" /></td>
                               <td><input type="button" name="Approver3" id="Approver3" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" disabled /></td>
                           </c:when>
                           <c:when test="${loginMember.user_name eq approval.finalApprover && approval.appPresent eq 'C'}">
                                   <td><input type="button" name="Approver1" id="Approver1" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" disabled /></td>
                                   <td><input type="button" name="Approver2" id="Approver2" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" disabled /></td>
                                   <td><input type="button" name="Approver3" id="Approver3" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" /></td>
                           </c:when>
                           <c:otherwise>
                              <td><input type="button" name="Approver1" id="Approver1" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" disabled /></td>
                              <td><input type="button" name="Approver2" id="Approver2" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" disabled /></td>
                              <td><input type="button" name="Approver3" id="Approver3" style="font-size:15px; width:70px; height:25px; border: none; text-align: center; border-radius:20px;" value="결재서명" disabled /></td>
                           </c:otherwise>
                        </c:choose>
                          </c:otherwise>
                       </c:choose>
                   </tr>
                   <tr>
                       <td style="height: 70px; width: 80px;">성 명</td>
                       <td><input type="text"  value="${memInfo.userName}" readonly></td>
                       <td style="width: 80px;">부 서</td>
                       <td><input type="text"  value="${memInfo.deptName}" readonly></td>
                       <td style="width: 80px;">직 급</td>
                       <td colspan="3"><input type="text"  value="${memInfo.rank}" readonly></td>
                   </tr>
                   <tr>
                       <td colspan="3" style="height: 70px; width: 80px;">기 간</td>
                       <td colspan="5">
                           <fmt:formatDate value="${leave.leaveStart}" pattern="yyyy 년 MM 월 dd 일"/><label>&nbsp;&nbsp; ~ &nbsp;&nbsp;</label>
                           <fmt:formatDate value="${leave.leaveEnd}" pattern="yyyy 년 MM 월 dd 일"/>&nbsp;까지
                       </td>
                   </tr>
                   <tr>
                      <td style="width: 80px; height: 70px; font-family: 'InfinitySans-RegularA1'; font-size: 15px;">휴가 구분</td>
                      <td colspan="8">
                       <div class="form-checkbox-wrap">
                          <sapn class="form-inline">
                              <label>${leave.leaveReason }</label>
                          </sapn>
                      </div>
                      </td>
                   </tr>
                   <tr>
                       <td style="width: 80px;">세부사항</td>
                       <td colspan="8">
                           <input style="height: 300px;" type="text" value="${leave.leaveDetail }" readonly>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="8" style="text-align: center; height: 100px; border-bottom: none;">위와 같이 휴가를 신청하오니 허락하여 주시기 바랍니다.</td>
                   </tr>
                   <tr style="border: white;">
                       <td colspan="8" style="text-align: center; height: 100px;">
                           <input type="text" style="text-align:center; font-size: 30px;" readonly><fmt:formatDate value="${leave.appWriteDate}" pattern="yyyy 년 MM 월 dd 일"/></input>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="8" style="text-align: right; height: 100px; padding-right: 50px;">
                           신청자 : <input type="text" style=" width:200px; border: none; text-align: center;" maxlength="4" value="${memInfo.memberName}" readonly>
                           (인)
                       </td>
                   </tr>
               </table>
           </div>
       </form>
           <div id="button">
           <input type="hidden" name="appNo" value = "${approval.appNo}"/>
              
           <%-- <c:if test="${loginMember.user_name eq approval.firstApprover || approval.interimApprover || approval.finalApprover}">
                 --%><c:choose>
                   <c:when test="${!empty approval.appReason}">
                      <button type="button" class="openRejectionWhy">반려사유</button>
                    <input type="text" style="border: none; width: 40px;" disabled>
                 </c:when>
                 <c:otherwise>
                    <c:choose>
                       <c:when test="${(loginMember.user_name eq approval.firstApprover && approval.appPresent eq 'A') || 
                                (loginMember.user_name eq approval.interimApprover && approval.appPresent eq 'B') ||
                                (loginMember.user_name eq approval.finalApprover && approval.appPresent eq 'C')}">
                          <button type="button" id="approveddone">결재</button>
                          <input type="text" style="border: none; width: 40px;"disabled >
                       </c:when>
                       <c:otherwise>
                          <button type="button" id="approveddone" disabled>결재</button>
                          <input type="text" style="border: none; width: 40px;"disabled >
                       </c:otherwise>
                    </c:choose>
                 </c:otherwise>
              </c:choose>
         <%-- </c:if> --%>
         
         <button><a href="${path}/leave/leaveMain" style="color:black">취소</a></button>
        </div>
       </div>
    
    <!-- 결재승인버튼 스크립트 -->
    <script>
       $("#Approver3").one("click",function(){
          
          $.ajax({
                type: "post",
                url: "${path}/leave/LeaveMain?appNo="+${leave.leavNo},
                success: function(){
                	Swal.fire({
 	     			   icon: 'success',
 	     			   title: '결재서명이 \n완료되었습니다.'
 	     			})
                  $("#firstA").append('<img src="${path}/images/approved.png" id="checkIfApproved" style="position:absolute; width:130px; height:130px; margin-left:-92px; margin-top:-50px" />');
               },
                error: function(){ alert("잠시 후 다시 시도해주세요."); }
          });
       });
      </script>
      
      <!-- 하단 결재버튼 -->
   	<script>
   		$("#approveddone").click(function() {
   			if($('#checkIfApproved').length > 0) {
   				var url = "${path}/approval/approvalMain";
	   			alert("결재가 완료되었습니다.");
	   	        $(location).attr('href', url);  			
   			} else {
   				var url = "${path}/approval/letterOfApprovalView?appNo="+${approval.appNo};
   				alert("결재서명 후 결재를 진행해주세요.");
   			}
   		});
   		
   		/* function checkIfApproved() {
		    if(document.getElementById('checkIfApproved')){
		        alert("결재가 완료되었습니다.");
		        
				return true;
			} else {
		        alert("결재서명 후 결재를 진행해주세요.");
		        
		        return false;
			}
		} */
   	</script>

      
      <script type="text/javascript">
/*       <input type="hidden" id="hiddenStartDate"><fmt:formatDate value="${approval.leaveStart}" pattern="yyyy - MM - dd"/></input>
   <input type="hidden" id="hiddenFinishDate"><fmt:formatDate value="${approval.leaveFinish}" pattern="yyyy - MM - dd"/></input> */
      function leaveStartAndFinish() {
         var StartDate = document.getElementById('hiddenStartDate');
         var leaveFinish = document.getElementById('leaveFinish');
         var leaveDate = document.getElementById('leaveDate');
         
         StartDate = ${approval.leaveStart};
         leaveFinish = ${approval.leaveFinish};
         
         leaveDate.innerHTML += StartDate + "  ~  " + leaveFinish;
      
      }
   </script>

<c:import url="../layout/footer.jsp" />