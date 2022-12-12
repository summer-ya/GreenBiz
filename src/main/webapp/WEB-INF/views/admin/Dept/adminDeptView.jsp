<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<title> Admin Dept View Page </title>

<!-- Header SideBar -->
<c:import url="../../layout/header.jsp" />


        <h4 class="contents" style="background-color: #2D5A36; color: white; width:1200px;
       		height: 50px; line-height: 50px; margin: 0; font-weight: bolder; padding-left: 20px;">
        	사원관리
        </h4>

        <div class="content-wrap" style="margin-top: 50px; width:1200px; height: 650px;">

        <div class="profile" style="width:200px; height: 300px; float: left;">
             <div style="border: 0.5px solid lightgray; width:200px; height: 240px; float: left;"></div>
             
         		  <button style="margin-top: 20px; width: 200px; height:30px; border-radius: 10px; 
             			  background-color: #2D5A36; color: white; border: 0.5px solid lightgray; 
             			  font-weight: lighter; ">사진첨부</button>
             </div>
        
        <table class="table" style="text-align: center; vertical-align: middle; 
        	   width: 980px; float: left; margin-left: 20px;">
               
               <!-- 인사정보 -->
               <tr>
                   <th style="background-color: #F6F6F6; width:300px;">사원번호</th>
                   <td>[DB-사원번호]</td>
               </tr>
               <tr>
                   <th style="background-color: #F6F6F6;">이름</th>
                   <td>[DB-이름]</td>
               </tr>
               <tr>
                   <th style="background-color: #F6F6F6;">생년월일</th>
                   <td>[DB-생년월일]</td>
               </tr>
               <tr>
                   <th style="background-color: #F6F6F6;">전화번호</th>
                   <td>[DB-전화번호]</td>
               </tr>
               <tr>
                   <th style="background-color: #F6F6F6;">이메일</th>
                   <td>[DB-이메일주소]</td>
               </tr>
               <tr>
                   <th style="background-color: #F6F6F6;">주소</th>
                   <td>[DB-주소]</td>
               </tr>
        </table>

        <table class="table" style="text-align: center; vertical-align: middle; width: 1200px; float: left; margin-top: 30px;">
               <tr>
                  <th style="background-color: #F6F6F6; width:300px;">부서</th>
                  <td>[DB-부서]</td>
               </tr>
               <tr>
                  <th style="background-color: #F6F6F6;">직책</th>
                  <td>[DB-직책]</td>
               </tr>
               <tr>
                  <th style="background-color: #F6F6F6;">총 연차 수</th>
                  <td>[DB-총 연차 수]</td>
               </tr>
               <tr>
                  <th style="background-color: #F6F6F6;">사용연차 / 잔여연차</th>
                  <td>[DB-사용연차] / [DB-잔여연차]</td>
               </tr>
               <tr>
                  <th style="background-color: #F6F6F6;">재직상태</th>
                  <td>[DB-재직상태]</td>
               </tr>
        </table>

        </div>
        <div class="button-wrap" style="width: 1200px; padding-left: 500px;">
            <button style="border-radius: 10px; width: 100px; height: 40px; background-color: #2D5A36; color: white; 
                    border: 0.5px solid lightgray; font-weight: lighter;">수정</button>
            <button style="border-radius: 10px; width: 100px; height: 40px; margin-left: 20px; 
                    background-color: #2D5A36; color: white; border: 0.5px solid lightgray; font-weight: lighter;">삭제</button>
        </div>
        
    
<!-- Footer -->
<c:import url="../../layout/footer.jsp" />