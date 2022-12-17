<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<% Calendar today =  Calendar.getInstance(); %>
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
   
      table input{
       font-size: 30px;
       width: 100%;
       height: 100%; 
       border: none; 
       text-align: center;
   }
   
   #button{
       text-align: center;
       padding-left: 210px;
       margin-bottom: 40px;
   }
   
   button {
       border-radius: 8px;
       background: none;
       font-size: 30px;
   }
</style>

<c:import url="../layout/header.jsp" />

<!-- 본문 -->
   
<h4 class="contents" style="background-color: #3B538C; color: white; width:1200px; height: 50px; line-height: 50px; margin: 0; font-weight: bolder; padding-left: 20px; margin-top: 15px;">
      연차 신청서
</h4>
<form name="LeaveApplication" action="${path}/leave/LeaveApplication" method="POST" onsubmit="return check_onclick()">  
<div class="cash-form-section" style="height: 100%; width:95%; margin-left: -180px">
        <div class="cash-disbursement" style="text-align: center; margin: 80px 0px 80px 200px; border: 2px solid black;">
            <table border="2" style="width: 100%; font-size: 20px; border-collapse: collapse;">
                <tr>
                    <td rowspan="2" colspan="4" style="width: 300px; height: 120px; font-family: 'InfinitySans-RegularA1'; font-size: 40px; font-weight: 600;">휴 가 신 청 서</td>
                    <td rowspan="2" style="width: 15px; padding-top: 20px; font-family: 'InfinitySans-RegularA1'; font-size: 20px;">결 재</td>
                    <td style="width: 100px; font-family: 'InfinitySans-RegularA1'; font-size: 15px;">최종승인자</td>
                </tr>
                <tr>
                   <td style=""> 
                      <input type="text" value="" id="firstApprover" name="Approval" class="nameView">
                      <!-- <input type="button" value="검색" class="searchMember" id="firstBtn" name="memberName"> -->
                     <!--  <select name="ApprovalNo">
                         <option value="A190912">박팀장</option>
                      </select> -->
                      <input type="text" value="${approvalMember.membername}" name="approvalName"/>
                   		<input type="hidden" value="${approvalMember.memberno}" name="approvalNo"/>
                   </td>
                </tr>
                <!-- <tr>
                    <td colspan="2" style="height: 70px;">
                        <button class="send-open" type="button">수신참조자 +</button>
                    </td>
                    <td colspan="6" style="height: 70px;">
                       <textArea readonly name="referList" id="referList" style="border:none;margin-bottom:-12px; font-size:19px; width:600px; height:60px; text-align: center; resize: none;"></textArea>
                    </td>
                 </tr> -->
                <tr>
                    <td style="height: 70px; width: 80px; font-family: 'InfinitySans-RegularA1'; font-size: 15px;">성 명</td>
                    <td><input type="text" name="memberName" value="${memInfo.MEMBERNAME }" readonly></td>
                    <td style="width: 80px; font-family: 'InfinitySans-RegularA1'; font-size: 15px;">부 서</td>
                    <td><input type="text" name="deptname" value="${memInfo.NAME }" readonly></td>
                    <td style="width: 80px; font-family: 'InfinitySans-RegularA1'; font-size: 15px;">직 급</td>
                    <td colspan="3"><input type="text" value="${memInfo.RANK }"></td>
                </tr>
                <!-- <tr>
                    <td colspan="3" style="height: 70px; width: 80px; font-family: 'InfinitySans-RegularA1'; font-size: 15px;">비 상 연 락 망</td>
                    <td colspan="5"><input type="tel" placeholder="전화번호만 입력하세요." class="callNumber" name="appEmergncyCall" style="font-size: 18px;" required/></td>
                </tr>
                   <script>
                       $(document).on("keyup", ".callNumber", function() {
                          $(this).val( $(this).val()
                                .replace(/[^0-9]/g, "")
                                .replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
                       });
                   </script> -->
                <tr>  
                   <td><b>ⓐ</b> 총 보유연차 <input type="text" name="leavetotal" id="leavetotal" value="${memInfo.LEAVETOTAL }" style="text-align:center;" readonly></td>
                   <td><b>ⓑ</b> 사용연차 <input type="text" name="leaveuse" id="days" style="text-align:center;" onchange="onChangetotalcnt()" readonly></td>
                   <td><b>ⓒ</b> 잔여연차 <input type="text" name="leaveremain" id="leaveremain" style="text-align:center;" readonly></td>
                    <td colspan="5">
                        <span>
                            <input style="width: 160px; font-size: 18px;" type="date" name="leaveStart" id="startDate" onchange="call()" />
                        </span>
                        &nbsp;&nbsp; ~ &nbsp;&nbsp;
                        <span>
                            <input style="width: 160px; font-size: 18px;" type="date" name="leaveEnd" id="endDate" onchange="call()" /> 
                        </span>
                           <script type="text/javascript">
                              // 시작일 < 종료일
                              $(function() {
								
                              var start = document.getElementById('startDate');
                              var end = document.getElementById('endDate');
                              start.addEventListener('change', function() {
                                if (start.value)
                                  end.min = start.value;
                              }, false);
                              
                              
                              $('#endDate').change(function(){
                            	  var endValue = $('#endDate').val()
                            	  console.log(endValue)
                            	  if (endValue){
                            		  start.max = end.value;
                            	  }
                                     
                              })
                          	});
                           </script>
                    </td>
                </tr> 
                <tr>
                   <td style="width: 80px; height: 70px; font-family: 'InfinitySans-RegularA1'; font-size: 15px;">휴가 구분</td>
                   <td colspan="8">
                      <!-- <input type="checkbox" id="ex_chk3"> https://webdir.tistory.com/433
                    <label for="ex_chk3">연차</label>  --> 
                    <div class="form-checkbox-wrap">
                       <sapn class="form-inline">
                           <input type="radio" name="leaveReason" class="input-radio" id="radio1" value="연차"> &nbsp;&nbsp;&nbsp;
                           <label for="radio1" class="form-radio">연차</label>
                       </sapn>
                       <sapn class="form-inline">
                           <input type="radio" name="leaveReason" class="input-radio" id="radio2" value="반차"> &nbsp;&nbsp;&nbsp;
                           <label for="radio2" class="form-radio">반차</label>
                       </sapn>
                       <sapn class="form-inline">
                           <input type="radio" name="leaveReason" class="input-radio" id="radio3" value="병가"> &nbsp;&nbsp;&nbsp;
                           <label for="radio3" class="form-radio">병가</label>
                       </sapn>
<!--                        <sapn class="form-inline"> -->
<!--                            <input type="radio" name="leaveReason" class="input-radio" id="radio4" value="보상휴가"> &nbsp;&nbsp;&nbsp; -->
<!--                            <label for="radio4" class="form-radio">보상휴가</label> -->
<!--                        </sapn> -->
                       <sapn class="form-inline">
                           <input type="radio" name="leaveReason" class="input-radio" id="radio5" value="기타"> &nbsp;&nbsp;&nbsp;
                           <label for="radio5" class="form-radio">기타(세부사항 상세 기술)</label>
                       </sapn>
                   </div>
                   </td>
            </tr>
                <tr>
                    <td style="width: 80px; font-family: 'InfinitySans-RegularA1'; font-size: 15px;">세부사항</td>
                    <td colspan="8">
                        <input style="height: 300px; width: 100%;" type="text" name="leaveEtc" class="leaveDetailTextArea">
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center; height: 100px; border-bottom: none;">위와 같이 휴가를 신청하오니 허락하여 주시기 바랍니다.</td>
                </tr>
                <tr style="border: white;">
                    <td colspan="8" style="text-align: center; height: 100px;">
                         <%= today.get(java.util.Calendar.YEAR) %> 년 &nbsp;
                        <%= today.get(java.util.Calendar.MONTH) + 1 %> 월 &nbsp;
                        <%= today.get(java.util.Calendar.DATE) %> 일 &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: right; height: 100px; padding-right: 50px;">
                        신청자 : 
                        <input type="button" name="memberName" id="proposer" style="font-size:15px; width:70px; height:30px; border: none; text-align: center; border-radius:20px; margin-right:10px" value="${ memInfo.MEMBERNAME }" />
                        서명 :
                        <textArea name="proposerText" id="proposerText" style="width:130px; border: none; text-align: center; resize: none; font-size:20px; margin-bottom:-35px" readonly></textArea>
                    </td>
                </tr>
            </table>
      </div>
        <div id="button" style="margin: 0 auto; margin-left: 1088px;">
           <input type="hidden" name="appKinds" value="휴가신청서">
           <button type="submit" class="goToLeave btn-primary">등록</button>
           <input type="text" style="border: none; width: 40px;" disabled>
           <button type="reset" class="resetLeave" onclick="">취소</button>
        </div>
    </div>
</form>

<c:import url="../layout/footer.jsp" />

 <!-- 필수 입력 스크립트 -->
   <script>
      function check_onclick() {
          var LeaveApplication = document.LeaveApplication;
          
          if(LeaveApplication.leaveReason.value=="" || LeaveApplication.leaveDetail.value==""){
              
              Swal.fire({
                 icon: 'error',
                 title: '상세내용 또는 \n제목란이 비어있습니다.',
                 text: '확인 후 등록하세요!'
           })
              
              return false;
          } else if(LeaveApplication.proposerText.value=="") {
             Swal.fire({
              icon: 'error',
              title: '서명 후 등록을 완료해주세요.',
              text: '확인 후 등록하세요!'
         })
             
             return false;
         } else {
            return true;
         }
          
      }
      
      function call(){
    	  console.log(document.getElementById('leavetotal').value)
          var sdd = document.getElementById("startDate").value;
          var edd = document.getElementById("endDate").value;
          var ar1 = sdd.split('-');
          var ar2 = edd.split('-');
          var da1 = new Date(ar1[0], ar1[1], ar1[2]);
          var da2 = new Date(ar2[0], ar2[1], ar2[2]);
          var dif = da2 - da1;
          var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
          var cMonth = cDay * 30;// 월 만듬
          var cYear = cMonth * 12; // 년 만듬
       if(sdd && edd){
          document.getElementById('days').value = parseInt(dif/cDay)+1;
          document.getElementById('leaveremain').value 
          = document.getElementById('leavetotal').value-(parseInt(dif/cDay)+1);
       }
      }
      
   </script>
   
   <!-- 서명 클릭 스크립트  -->
    
    <script>
       $("#proposer").one("click",function(){
           var proposerValue = $("input[name='memberName']").val();
        
           $("#proposerText").append(proposerValue);
       });
    </script>
    
<%-- <%@ include file="../leave/selectRefer.jsp" %> 
 --%> 
<%-- <%@ include file="../leave/appAutocomplete.jsp" %> <!-- 자동완성 Ajax & script -->
 --%>