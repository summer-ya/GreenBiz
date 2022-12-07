<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.Timestamp" %>

<c:import url="../layout/header.jsp" />
   

<style>

/* reply input*/
.detail-article__reply-input{
  margin-top: 30px;
}
.detail-article__reply-input textarea, .reply-submitbtn{
  vertical-align: middle;
}

.detail-article__reply{
  text-align: justify;
  margin-left: 50px;
}

/*댓글 작성 아이콘 1개짜리 */
.reply-submitbtn{
  margin-top: -30px;
  font-family: "Font Awesome 5 Free"; 
  font-weight: 400; 
  font-size: 20px;
  font-style: normal;
  width: 50px;
  height: 40px;
  border-radius: 15px;
  margin-left: 10px;
  border:3px solid #dcedc8;;
}

.reply-submitbtn:hover{
  cursor: pointer;
  transform: translateY(3px);
  background-color: #dcedc8;
  box-shadow: inset 2px 2px 0px #33691e;
  
}

.detail-article__reply-input textarea{
  resize: none;
  width:70%;
  height:70px;
  padding:10px;
  margin-left: 10%;
  border:0.5px solid gainsboro;
  font-size: 14px;
  border-radius: 10px;
  box-shadow:  3px 3px 0px #dcedc8;

  
}

.detail-article__reply-input textarea:focus{

  outline: 1px solid #c5e1a5;
  box-shadow:  3px 3px 0px #aed581;
  border:none;
}

/* reply list */
.detail-article__reply-list{
	width: 85%;
  margin-top: 40px;
  margin-left: 5%;
}

.detail-article__reply-list h4{
  font-size: 22px;
  width:85%;
  color:rgb(78, 78, 78);
  border-bottom: 3px solid #558b2f;
  padding-bottom: 10px;
  padding-left: 20px;
}

.detail-article__reply-list h4 i{
  margin-left: 10px;
}

.reply-list{
  margin-left: 10px;
}

.reply-list tbody tr{
  border-bottom: 20px solid white;
  height: auto;
}

.reply-list__userid{
  font-size: 18px;
  font-weight: 300;
  border-right: 0.5px solid gainsboro;
  padding-left:20px;
}

.reply-list__reply{
  padding-left: 13px;
  font-weight: 200;
}

.reply-list__reply div {
	width: 800px;
}

.reply-list__reply div span{
  font-size: 11px;
  font-weight: 100;
}

.reply-list__reply div p{
	width: 800px;
}
.reply-list__btns input[name="reply-update-btn"],[name="reply-del-btn"],[name="reply-report-btn"] {
  font-family: "Font Awesome 5 Free"; 
  font-weight: 300; 
  font-size: 15px;
  font-style: normal;
  width: 35px;
  height: 30px;
  border-radius: 10px;
  margin-left: -30px;

}
/*댓글 그림자*/
.reply-list__btns input[name="reply-update-btn"]:hover,[name="reply-del-btn"]:hover,[name="reply-report-btn"]:hover{
  cursor: pointer;
  color: #003d00;
  transform: translateY(3px);
  background-color: #dcedc8;
  box-shadow: inset 2px 2px 0px #33691e;
}


   
   /* title */
.detail-article{
  text-align: center;
  margin: 50px 0px;
  
}

.detail-article__titlearea{
  display: inline-block;
   width:100%;
}

.detail-article__title, .detail-article__content{
  padding-bottom: 15px;
  border-bottom: 0.5px solid gainsboro;
 
}

.detail-article__title h2{
  font-size: 30px;
  margin-left: -30px;
}

.detail-article__undertitle{
	display: flex;
	justify-content: space-between;
}
.detail-article__blog-count{
	
	color:black;
	margin-top:15px;
	margin-left:60%;
	margin-bottom:2%;
	word-spacing: 23px;
	font-weight: bold;
}

/* buttons */
.detail-article__btn{
  margin-top: 5px;
  margin-right: 30px;
  
}
.detail-article__btn span{
	margin-right: 20px;
	font:italic 13px "Fira Sans", serif;
	
}

/*모든 버튼 색상*/
input{
  font-size:14px;
  border-radius: 2px;
  color:#558b2f;
  background-color: white;
  border: 2px solid #c5e1a5;
  border-radius: 5px;
}

/* 모든 버튼 아이콘 색 변경 */
.detail-article__btn input[type="submit"], [type="button"] {
	width: 60px;
	height: 30px;
	font-weight: bold;
	transition: 0.25s;
	margin-left: 10px;

}

/* content */
.detail-article__content{
  margin: 50px 40px;
  padding-bottom: 10px;
  margin-bottom: 30px;
}

/* likes */
.detail-article__content-likes{
  text-align: justify;
  margin-left: 200px;
  margin-top:50px;
  position: relative;
}

.detail-article__content-likes>span{
  color:#444444;
  font-size: 12px;
  font-weight: 200;
  margin-left: 25px;
}



.detail-article__content-likes i, .detail-article__content-likes h6{
  display: inline-block;
}

.detail-article__content-likes>i{
  position: absolute;

  color:rgb(255, 119, 95);
  margin-right: 100px;
}

.detail-article__content-likes>i:hover{
  cursor: pointer;
}

.detail-article__content-likes>i:nth-child(2){
  display: none;
}

.detail-article__content-likes h6{
  font-size: 13px;
  font-weight: 300;
  color:rgb(243, 151, 135);
  margin-left: 10px;
  margin-top: -3%;
}


.reply-update__modal{
  position:fixed;
  width:100%;
  height:100%;
  top:0;
  left:0;
  display:none;
 
}

.reply-update__modal-content{
  width:500px; 
  height:300px;
  background:#fff; border-radius:10px;
  position:relative; 
  top:25%; 
  left:40%;
  margin-top:-20px; 
  margin-left:-200px;
  text-align:center;
  box-sizing:border-box; 
  padding:40px 30px;
  line-height:23px; 

}

.fa-times{
  float: right;
  cursor: pointer;
}

.reply-update__modal-content h5{
  font-size: 20px;
  font-weight: 500;

  padding-bottom: 10px;
}

.reply-update__modal-content form {
  text-align: center;
  font-size: 15px;
  line-height:35px;
 
}

.reply-update__modal-content form textarea{
  resize: none;
  width:99%;
  height:110px;
  padding:10px;
  border:0.5px solid gainsboro;
  font-size: 14px;
  text-align: justify;
}

.reply-update__modal-content form input[name="reply-update-submit"]{
  font-family: "Font Awesome 5 Free"; 
  font-weight: 300; 
  font-size: 20px;
  font-style: normal;
  width: 35px;
	height: 35px;
  border-radius: 10px;
  transition: 0.25s;
	margin-left: 7px;
  border:0.5px solid #dcedc8;
  background-color: #dcedc8;
  box-shadow: 3px 3px 0px #dcedc8;
  cursor: pointer;
}

.reply-update__modal-content input[name="reply-update-submit"]:hover{
  cursor: pointer;


}

.fa-times{
  float: right;
}
.fa-times:hover{
	cursor: pointer;
}

table td {
	margin-left: 40%;
}

</style>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style type="text/css">
.blog-detail__top{
  width:100%;
  height:300px;
  background: url('resources/images/blog-detail.png') no-repeat;
  background-size: cover;
  overflow: hidden;
  display: table;
  border: none;
  background-position: 20% 30%;
}
.blog-detail__top-txt{
  color:white;
  opacity: 0.6;
  display: table-cell;
  vertical-align: bottom;
}
.blog-detail__top-txt h1, .blog-detail__top-txt h2{
  display: inline;
}
.blog-detail__top-txt h1{
  font-weight: 700;
  font-size:120px;
  height:100px;
  line-height: 90px;
}
.blog-detail__top-txt h2{
  margin-left: 350px;
  font-size: 15px;
}

.maintitle {
	 margin-bottom: 10px;
	 width: 80%; 
	 margin-left: 10%; 
	 text-align : center;
	 border-bottom:3px solid #558b2f;
	 font-size: 25px;
	 font-weight: bord;
	 line-height: 30px;
	 
}

img{
	width: 380px;
	
}

.content_text {
	text-align: center;
	margin-top: 30px;
}

</style>
        
        </div>
        <body style="margin-top:155px;">
   <div id="header">
  
   </div>
  <main class="blog-detail">
    <!-- main img -->
    <div class="maintitle">
      <h2>${cboard.ctitle }</h2>
    </div>

       <div class="detail-article__blog-count">
                <span style="display:none" id="maintt"></span>
             <span>작성자&nbsp;&nbsp;&nbsp;</span>
                  <span>조회수&nbsp;&nbsp;</span>
                  <span>작성일자&nbsp;&nbsp;</span>
               </div>
	
          <div class="img-wrap">
           <img src="/upload/${commImg.cstoredname}>"  style="margin-left: 35%"; alt="">
			<div class="content_text">
			<p>${cboard.ccontent }</p>
                <a href="/community/download?cfileno=${commImg.cfileno }">${commImg.cstoredname }</a>
			</div>
          </div>


           
    <div class="detail-article">
      <div class="detail-article__titlearea">
        <!-- title -->
        <div class="detail-article__title">
          
          <div class="blog-index" style="display:none;"><span id="blog_each_no"></span></div>
        </div>
          
           
           <!-- buttons -->
           <div class="detail-article__btn">
             <input type="button" value="목록" onclick="location.href='/community/cList'">
             <input type="button" value="수정" onclick="location.href='/community/cUpdate?cno=${cboard.cno}'">
             <input type="button" value="삭제" onclick="location.href='/community/delete?cno=${cboard.cno}'">
           </div>
        </div>
      </div>

      <!-- content -->
      <div class="detail-article__content">
        <p></p>

        <!-- click likes area -->
        <div class="detail-article__content-likes">
             <i class="far fa-heart fa-lg emptyheart" onclick="likeFunction()"></i>
             <i class="fas fa-heart fa-lg fullheart" onclick="unlike()"></i>
          <span class="count-likes" id="like-count"></span>
          <h6>관심있는 동호회라면 하트를 눌러주세요! <i class="far fa-hand-point-left fa-sm"></i></h6>
        </div>
      </div>
      
      <!-- reply -->
      <div class="detail-article__reply">
        <!-- insert reply -->
        <div class="detail-article__reply-input">
          <form name="replyForm" method="post" id="replyForm">
            <textarea id="reply_content" name="reply_content" placeholder="댓글을 작성해주세요."></textarea>
            <input type="button" id="replyBtn" title="댓글 입력" class="reply-submitbtn" value="&#xf4ad" onclick="replySubmit()" >
          </form>
        </div>
        
        <!-- reply list -->
        <div class="detail-article__reply-list">
          <h4>댓글 목록<i class="fas fa-comment-dots"></i></h4>
          
          <table class="reply-list">
            <colgroup>
              <col width="13%"><col width="70%"><col width="15%">
            </colgroup>
            <tbody>
                   <tr>
                     <td class="reply-index" style="display:none;"><span id="reply_each_no"></span></td>
                     <td class="reply-list__userid"></td>
                     <td class="reply-list__reply">
                    
                     </td>
                     <td class="reply-list__btns">
                       <input type="hidden" id="index" value="">
                       <input type="button" title="댓글 수정" name="reply-update-btn" id="update-btn" value="&#xf044" onclick="openUpdateModal(this)">
                       <input type="button" title="댓글 삭제" name="reply-del-btn" value="&#xf2ed" onclick="replyDelete(this)">
                       <input type="button" title="댓글 신고" name="reply-report-btn" id="report-btn" value="&#xf1d8" onclick="openReportModal(this)">
                     </td>
                   </tr>
                </tbody>
          </table>
          
        </div>
      </div>
  </main>
  
  <!-- update reply modal -->
   <div class="reply-update__modal">
      <div class="reply-update__modal-content">
         <i title="창 닫기" class="fas fa-times fa-lg"></i>
         <h5>댓글 수정</h5>
       <form name="reply_update" method="post" id="reply_update_form">
           <input type="hidden" id="reply_no" name="reply_no">
           <input type="hidden" id="user_id_update" name="user_id">
           <input type="hidden" id="blog_no" name="blog_no" value="">
                
           <textarea id="reply_content_update" name="reply_content_update" ></textarea>
           <input type="button" id="replyUpdateBtn" name="reply-update-submit" title="수정 완료" class="reply-updatebtn" onclick="replyUpdate()" >
       </form>
    </div>
   </div>
  
 <c:import url="../layout/footer.jsp" />