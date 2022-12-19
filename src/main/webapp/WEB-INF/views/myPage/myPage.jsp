<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<c:import url="../layout/header.jsp"/>

        <h4 class="contents" style="background-color: #3B538C; color: white; width:1200px; height: 50px; line-height: 50px; margin: 0; font-weight: bolder; padding-left: 20px; margin-top: 15px;">
            인사정보
        </h4>
		
		
        <div class="content-wrap" style="margin-top: 50px; width:1200px; height: 340px;">
			
            <div class="profile" style="width:200px; height: 300px; float: left;">
                <div style="border: 0.5px solid lightgray; width:200px; height: 240px; float: left;"></div>
                <button style="margin-top: 20px; width: 200px; height:30px; border-radius: 10px; background-color: #3B538C; color: white; border: 0.5px solid lightgray; font-weight: lighter; ">사진첨부</button>
            </div>
            <table class="table" style="text-align: center; vertical-align: middle; width: 980px; float: left; margin-left: 20px;">
            <c:forEach items="${listMember }" var="listMember">
            <c:if test="${loginId eq listMember.memberNo }">
                <tr>
                    <th style="background-color: #F6F6F6; width:300px;">사번</th>
                    <td>${listMember.memberNo }</td>
                </tr>
                <tr>
                    <th style="background-color: #F6F6F6;">이름</th>
                    <td>${listMember.memberName }</td>
                </tr>
                <tr>
                    <th style="background-color: #F6F6F6;">생년월일</th>
                    <td>${listMember.birth }</td>
                </tr>
                <tr>
                    <th style="background-color: #F6F6F6;">연락처</th>
                    <td>${listMember.phone}</td>
                </tr>
                <tr>
                    <th style="background-color: #F6F6F6;">이메일</th>
                    <td>${listMember.email}</td>
                </tr>
                <tr>
                    <th style="background-color: #F6F6F6;">주소</th>
                    <td>${listMember.address }</td>
                </tr>
                </c:if>
                </c:forEach>
            </table>

           <!--  <table class="table" style="text-align: center; vertical-align: middle; width: 1200px; float: left; margin-top: 30px;">
                <tr>
                	<td colspan="3" style="text-align: left;">연차 / 휴가계 사용 내역</td>
                </tr>
                <tr>
                    <th style="background-color: #F6F6F6; width:300px;">날짜</th>
                    <th style="background-color: #F6F6F6; width:300px;">사유</th>
                    <th style="background-color: #F6F6F6; width:300px;">승인여부</th>
                </tr>
                <tr>
                    <td style="background-color: #F6F6F6;">10/11</td>
                    <td>개인일정</td>
                    <td>승인</td>
                </tr>
                <tr>
                    <td style="background-color: #F6F6F6;">11/1</td>
                    <td>외근</td>
                    <td>승인</td>
                </tr>
                <tr>
                    <td style="background-color: #F6F6F6;">11/06</td>
                    <td>세미나</td>
                    <td>미결재</td>
                </tr>
            </table> -->

        </div>

	<!-- <form name="myPagePage" method="post" action="/myPage/myPageModify"> -->  
        <div class="button-wrap" style="width: 1200px; margin-left: 950px;">
            <button id="memberUpdateBtn" type="submit" style="border-radius: 10px; width: 100px; height: 40px; background-color: #3B538C; color: white; border: 0.5px solid lightgray; font-weight: lighter; margin-left: 148px">수정</button>
        </div>
<!--     </form>-->
 <c:import url="../layout/footer.jsp" />

<script>
	$("#memberUpdateBtn").on("click", function(){
		location.href="/myPage/myPageModify";
	})
</script>