# ⭐️Portfolio - GreenBiz


<!-- contents -->
<details open="open">
  <summary>Contents</summary>
  <ol>
    <li>
      <a href="#개요">개요</a>
    </li>
    <li>
      <a href="#내용">내용</a>
    </li>
    <li><a href="#구현 및 기능">구현 및 기능</a>
      <ul>
        <li><a href="#main">메인화면</a></li>
        <li><a href="#mypage">나의정보</a></li>
        <li><a href="#allnotice">전사게시판</a></li>
        <li><a href="#board">사내게시판</a></li>
        <li><a href="#community">사내동호회</a></li>    
        <li><a href="#approval">전자결재</a></li>
        <li><a href="#schedule">일정관리</a></li>
        <li><a href="#chat">메신저</a></li>
        <li><a href="#admin">관리자페이지</a></li>
      </ul>
    </li>
  </ol>
</details>

# 👔 개요

* 프로젝트 명 : GreenBiz

* 일정 : 2022년 11월 01일 ~ 2021년 12월 22일

* 개발 목적 : 사내 인프라 구축으로 인한 조직원의 업무 효율성 상승

* 개발 환경
  - O/S : Windows
  - Server : Apache-Tomcat 9.0
  - Java EE IDE : Eclipse, STS
  - Database : Oracle SQL Developer
  - Programming Language : JAVA, HTML, CSS, JavaScript, JSP, SQL
  - Framework/flatform : Spring, mybatis, jQuery, Bootstrap v4.6.x
  - API : WebSocket, Summernote, FullCalendar, JStree
  - Version management : Git

------------

# 📝내용

* 팀원별 역할
  - 공통 : 기획, 요구 사항 정의, 와이어 프레임, DB 설계
  - 윤석현 : 전자결재 CRUD, 일정관리 CRUD
  - 김명진 : 전자결재 CRUD, 일정관리 CRUD
  - 이지현 : 사내게시판 CRUD, 페이징, 검색/정렬, 파일업로드, 파일 다운로드, 댓글/대댓글 CRUD, 댓글알림 / 
             동호회게시판 CRUD, 페이징, 검색, 좋아요, 파일첨부, 댓글CRUD,댓글알림
  - 이슬기 : 메인페이지, 나의정보-인사정보수정, 연차휴가계 사용 및 확인
  - 김소연 : 관리자 인사정보 CRUD, 인사정보 검색, 파일업로드, 관리자 전사게시 CRUD, 페이징

* 설계의 주안점
  - 사내 인프라를 구축하여 편리한 조직원 관리를 가능케 한다.
  - 전자결재를 이용하여 조직원의 업무 효율성을 높인다.
  - 커뮤니티 게시판 및 사내 메신저를 통해 조직원간 소통이 활성화 되도록 돕는다.


* DB 설계<br>
![ERD](https://user-images.githubusercontent.com/100750066/209282002-4af54210-db5a-402d-b034-6eb5dce37309.png)






<details>
<summary><h2 id="main">메인화면</h2></summary>
<div markdown="1">

* 메인페이지
  - 일정 조회
  - 결재함 조회
  - 전사게시판 조회
  - 다른 페이지와 연결되며 로고 클릭시 메인페이지로 돌아감

</div>
</details>


![image](https://user-images.githubusercontent.com/114119469/209310710-0601c3d4-dce0-463e-ab8e-5b6a62b27861.png)


<hr>
<br>

<details>
<summary><h2 id="mypage">나의정보</h2></summary>
<div markdown="1">

* 나의 정보 수정 
  - 나의 인사정보 조회 가능
  - 나의 인사정보 수정 가능

* 연차 휴가계 사용 신청
  - 전체 연차 수에서 사용할 연차수 자동 차감
  - 등록시 최종 승인자에게 결재가 올라감
  
* 연차 휴가계 사용 내역
  - 사용시 전체 연차, 남은 연차, 결재여부 출력
 
* 연차 휴가계 사용 요청 내역 
  - 연차휴가계를 사용한 사원의 사번과 요청일 출력
  - 반려/승인으로 결재
  - 이 페이지는 권한이 있는 직급에게만 표시됨

</div>
</details>

<!-- 움짤넣을자리 -->
* 나의 정보 수정 
![녹화_2022_12_23_18_46_24_901](https://user-images.githubusercontent.com/114119469/209313622-2e62da9a-164a-4664-843b-dc8d74cbb774.gif)
<br>

* 연차 휴가계 사용 신청
![녹화_2022_12_23_18_53_20_447](https://user-images.githubusercontent.com/114119469/209314638-648aed8d-e229-4bc1-b811-a533f8690cce.gif)
<br>

* 연차 휴가계 사용 내역(결재자 승인 전)
![image](https://user-images.githubusercontent.com/114119469/209315004-61fceb14-de39-4b41-a6c0-cc702220d8c8.png)
<br>

* 연차 휴가계 사용 요청 내역(결재자)
![녹화_2022_12_23_18_58_47_495](https://user-images.githubusercontent.com/114119469/209315280-6a1f6637-26c5-4ab1-a8ae-6efcfd8f2fa5.gif)
<br>

* 연차 휴가계 사용 내역(결재자 승인 후)
![image](https://user-images.githubusercontent.com/114119469/209315444-37fed998-3210-4035-a093-4c71b376534b.png)
<br>

<hr>
<br>


<details>
<summary><h2 id="allnotice">전사게시</h2></summary>
<div markdown="1">
</div>

* 전자게시 리스트 
  - 관리자에서 등록한 글의 목록을 볼 수 있다.
  
* 전자게시 상세내용
  - 글의 리스트를 누른 상세내용을 볼 수 있다.
  
</details>

* 전사게시 List, View
<img width="80%" src="https://user-images.githubusercontent.com/110447398/209368143-08e271a6-8e9b-4f32-93d2-58d6dd6860e6.gif"/>

<hr>
<br>

<details>
<summary><h2 id="board">사내게시판(click!🖱️)</h2></summary>
<div markdown="1">
  
* 게시판 리스트 
  - 게시판 리스트 불러오기, 제목/내용 키워드로 검색 조회
  - 원하는 페이지로 이동(페이징처리)
  - 조회수순 , 등록일자순으로 정렬 조회
  

* 게시글 등록 / 읽기 / 수정 / 삭제
  - 로그인 한 사원 글 등록 가능
  - 파일 업로드 시 첨부파일 미리보기
  - 업로드한 사진 본문 이미지로 띄우기
  - 파일 클릭시 다운로드 가능
  - 수정시 제목, 내용 변경
  - 기존 업로드 파일 삭제 후 새로 업로드
  - 게시글 삭제

* 게시글 댓글 / 대댓글
  - 게시글 댓글 읽기 /작성 / 수정 / 삭제
  - 게시글 대댓글 읽기/ 작성 / 수정/ 삭제
  - 원댓글 삭제 시 대댓글도 함께 삭제
  
* 댓글 알림🔔
  - 작성 게시글에 댓글이 달리면 사이트 상단에 알림창 

</div>
</details>
<br>

* 게시판 리스트

![녹화_2022_12_23_14_04_47_302](https://user-images.githubusercontent.com/106301280/209301563-c50ce7e9-42b9-40c5-83f8-ef7e6ef75226.gif)
<br><br>

* 게시글 CRUD
 
![녹화_2022_12_23_14_43_22_856](https://user-images.githubusercontent.com/106301280/209298760-f611596b-cc43-4773-88ba-312a809ada4f.gif)
<br><br>

* 게시글 댓글 / 대댓글 CURD
 
![녹화_2022_12_23_14_50_49_473](https://user-images.githubusercontent.com/106301280/209298837-144a2c1f-10eb-44d2-8c76-955d1fc5a00f.gif)
<br><br>

* 댓글 알림🔔
 
![녹화_2022_12_23_14_54_20_894](https://user-images.githubusercontent.com/106301280/209298866-c4006729-f177-413a-9afc-0c6d283394c8.gif)
<br><br>

<hr>
<br>

<details>
<summary><h2 id="community">사내동호회(click!🖱️)</h2></summary>
<div markdown="1">
  
  * 게시판 리스트 
  - 게시판 리스트 불러오기, 제목/내용 키워드로 검색 조회
  - 원하는 페이지로 이동(페이징처리)


* 게시글 등록 / 읽기 / 수정 / 삭제
  - 로그인 한 사원 글 등록 가능
  - 파일 업로드 시 첨부파일 미리보기
  - 업로드한 사진 본문 이미지로 띄우기
  - 수정시 제목, 내용 변경
  - 기존 업로드 파일 삭제 후 새로 업로드
  - 게시글 삭제

* 댓글 CRUD
  - 게시글 댓글 읽기 /작성 / 수정 / 삭제
  
* 댓글 알림🔔
  - 작성 게시글에 댓글이 달리면 사이트 상단에 알림창 
  
</div>
</details>
<br>

  * 게시글 등록
   
![ezgif com-gif-maker](https://user-images.githubusercontent.com/106301280/209305320-ac67c244-0448-444a-b10d-473b6c2337ec.gif)

<br>

  * 게시글 수정 / 삭제 / 좋아요❤️
  
![녹화_2022_12_23_14_57_22_301](https://user-images.githubusercontent.com/106301280/209304034-db6e1e79-624b-4b24-b336-5cc5bab2bfb6.gif)

<br>

  * 댓글CRUD / 댓글 알림🔔
  
![녹화_2022_12_23_14_59_24_18](https://user-images.githubusercontent.com/106301280/209304054-ce16e072-0c07-4f8b-a335-a80b934cd1df.gif)

<br>

<hr>
<br>


<details>
<summary><h2 id="approval">전자결재</h2></summary>
<div markdown="1">

* 전자결재
  - 기안함, 결재함, 완료함 3가지로 분류

* 기안함
  - 로그인 아이디로 요청한 결재 중 진행중문서, 반려문서를 확인
  - 기안작성 - 기안작성 폼으로 연결 된다.

* 기안작성 폼
  - 결재선 지정 및 내용 작성 후 결재 요청


* 결재함
  - 결재대기 문서들을 조회
  - 결재 문서 클릭 후 결재 반려(반려사유 입력) 및 결재완료(결재의견 입력)
  
* 결재완료함
  - 최종 결재완료 문서를 조회

* 결재알림
  - 결재, 반려 시 결재 신청자에게 실시간 알림 기능 
</div>  
</details>
<img width="80%" src="https://user-images.githubusercontent.com/100750066/209275512-c581409a-3a22-4518-9c8e-63a25631bea4.gif"/>



<hr>
<br>


<details>
<summary><h2 id="schedule">일정관리</h2></summary>
<div markdown="1">

* 일정구분
  - 전체일정, 전사일정, 개인일정을 구분하여 조회할 수 있다.

* 일정 등록
  - 일정 등록 시 일정 TITLE, 일수 선택 후 저장
  - 관리자 아이디로 로그인시 전사 일정을 등록 가능

* 월, 주, 일 단위 검색
  - 등록 일정의 월 단위, 주 단위, 일 단위로 조회 검색 가능

* 삭제 및 수정
  - 일정 클릭 시 삭제 가능하며, 일정 드래그 또는 드롭다운시 일정 수정 가능. 
</div>  
</details>
<img width="80%" src="https://user-images.githubusercontent.com/100145167/209276725-263c7893-4c21-4983-8b35-81e449515d27.gif"/>  

<hr>
<br>  

<details>
<summary><h2 id="chat">메신저</h2></summary>
<div markdown="1">
</div>
  
* 메신저(채팅)
  - 다른 아이디로 로그인 되어 있는 사원끼리 서로 메신저가 가능하다.
  - 메신저(채팅)은 실시간으로 할 수 있다.
  
</details>
<img width="80%" src="https://user-images.githubusercontent.com/110447398/209365744-fa05ebf7-13e4-4dde-afb6-0ca9d487c74d.gif"/>


<hr>
<br>

<details>
<summary><h2 id="admin">관리자 페이지</h2></summary>
<div markdown="1">
</div>

[관리자 페이지(인사정보)]

* 인사정보 관리
  - 부서(인사팀, 기획팀, 사업팀, 개발팀, 운영팀, 보안팀) 선택 후 해당부서 안의 사원의 사번, 이름, 직책을 조회할 수 있다.

* 인사정보 등록
  - 새로운 인사정보를 등록할 수 있다.
  
* 인사정보 수정
  - 등록되어 있는 사원의 인사정보를 수정할 수 있다.
  
* 인사정보 삭제
  - 등록되어 있는 사원의 인사정보를 삭제할 수 있다.

</details>
* 인사정보 CRUD, 검색, 파일업로드
<img width="80%" src="https://user-images.githubusercontent.com/110447398/209291914-06f08001-a149-47c1-94bc-e11b8c94d430.gif"/>

<hr>
<br>

<details>
<summary><h2 id="admin">관리자 페이지</h2></summary>
<div markdown="1">
</div>

[관리자 페이지(전사게시)]

* 전사게시
  - 전사게시의 리스트를 볼 수 있다.
  - 전사게시의 글을 새로 등록할 수 있다.
  - 등록할 전사게시물에 파일을 올릴 수 있다.
  - 전사게시의 글을 수정할 수 있다.
  - 전사게시의 글을 삭제할 수 있다.
  - 전사게시의 페이징 처리를 할 수 있다.

</details>
* 전사게시 CRUD, 파일업로드, 페이징
<img width="80%" src="https://user-images.githubusercontent.com/110447398/209365611-a95dd687-7443-4d2d-bf96-a3a9e2efb899.gif"/>

<hr>
<br>
