<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<c:import url="../layout/header.jsp" />

 
        <h4 class="contents" style="background-color: #3B538C; color: white; width:1200px; height: 50px; line-height: 50px; margin: 0; font-weight: bolder; padding-left: 20px;">
            인사정보
        </h4>

	<form action="/myPage/myPageModify" method="post">
	<input type="hidden" name="memberNo" value="${param.memberNo}">	
        <div class="content-wrap" style="margin-top: 100px; width:1200px; height: 400px;">

            <div class="profile" style="width:200px; height: 300px; float: left;">
                <div style="border: 0.5px solid lightgray; width:200px; height: 240px; float: left;"></div>
                <button style="margin-top: 20px; width: 200px; height:30px; border-radius: 10px; background-color: #3B538C; color: white; border: 0.5px solid lightgray; font-weight: lighter; ">사진첨부</button>
            </div>
            <table class="table" style="text-align: center; vertical-align: middle; width: 980px; float: left; margin-left: 20px;">
                <tr>
                    <th style="background-color: #F6F6F6;">이름</th>
                    <td>
                    	<input type="text" name="memberName"  value="${myPageModify.memberName}" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <th style="background-color: #F6F6F6;">생년월일</th>
                    <td>
                    	<input type="text" name="birth" value="${myPageModify.birth}" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <th style="background-color: #F6F6F6;">연락처</th>
                	<td>
                    	<input type="text" name="phone" value="${myPageModify.phone}">
                    </td>
                </tr>
                <tr>
                    <th style="background-color: #F6F6F6;">이메일</th>
                    <td>
                    	<input type="text" name="email" value="${myPageModify.email}">
                    </td>
                </tr>
                <tr>
                    <th style="background-color: #F6F6F6;">주소</th>
                    <td>
                    	<input type="text" id="address" name="address" value="${myPageModify.address}">
                    </td>
                </tr>
            </table>


        </div>
        <div class="button-wrap" style="width: 1200px; margin-left: 950px;">
            <button id="BtnConfirm" type="submit" style="border-radius: 10px; width: 100px; height: 40px; background-color: #3B538C; color: white; border: 0.5px solid lightgray; font-weight: lighter;">수정</button>
            <button id="back_Btn" type="submit" style="border-radius: 10px; width: 100px; height: 40px; margin-left: 20px; background-color: #3B538C; color: white; border: 0.5px solid lightgray; font-weight: lighter;">취소</button>
        </div>
	</form>
	
<script>
$("#BtnConfirm").on("click", function(){
	location.href="/myPage/myPage";
})

$("#back_Btn").click(function(){
	history.back();
})
</script>

<c:import url="../layout/footer.jsp" />