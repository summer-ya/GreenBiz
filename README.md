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

# 개요

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
  - 이지현 : 
  - 이슬기 : 
  - 김소연 : 

* 설계의 주안점
  - 사내 인프라를 구축하여 편리한 조직원 관리를 가능케 한다.
  - 전자결재를 이용하여 조직원의 업무 효율성을 높인다.
  - 커뮤니티 게시판 및 사내 메신저를 통해 조직원간 소통이 활성화 되도록 돕는다.


* DB 설계<br>
![ERD](https://user-images.githubusercontent.com/100750066/209282002-4af54210-db5a-402d-b034-6eb5dce37309.png)






<details>
<summary><h2 id="main">메인화면</h2></summary>
<div markdown="1">
</div>
</details>

<!-- 움짤넣을자리 -->










<details>
<summary><h2 id="mypage">나의정보</h2></summary>
<div markdown="1">
</div>
</details>

<!-- 움짤넣을자리 -->




<details>
<summary><h2 id="allnotice">전사게시</h2></summary>
<div markdown="1">
</div>
</details>

<!-- 움짤넣을자리 -->




<details>
<summary><h2 id="board">사내게시판</h2></summary>
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

*  게시글 댓글 / 대댓글
  - 게시글 댓글 읽기 /작성 / 수정 / 삭제
  - 게시글 대댓글 읽기/ 작성 / 수정/ 삭제
  - 원댓글 삭제 시 대댓글도 함께 삭제
  
* 댓글 알림
  - 작성 게시글에 댓글이 달리면 사이트 상단에 알림

</div>
</details>

![녹화_2022_12_23_14_04_47_302](https://user-images.githubusercontent.com/106301280/209301563-c50ce7e9-42b9-40c5-83f8-ef7e6ef75226.gif)
<br>

![녹화_2022_12_23_14_43_22_856](https://user-images.githubusercontent.com/106301280/209298760-f611596b-cc43-4773-88ba-312a809ada4f.gif)
<br>
![녹화_2022_12_23_14_50_49_473](https://user-images.githubusercontent.com/106301280/209298837-144a2c1f-10eb-44d2-8c76-955d1fc5a00f.gif)
<br>
![녹화_2022_12_23_14_54_20_894](https://user-images.githubusercontent.com/106301280/209298866-c4006729-f177-413a-9afc-0c6d283394c8.gif)
<br>



<details>
<summary><h2 id="community">사내동호회</h2></summary>
<div markdown="1">
</div>
</details>

<!-- 움짤자리 -->




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

  

<details>
<summary><h2 id="chat">메신저</h2></summary>
<div markdown="1">
</div>
</details>

<!-- 움짤자리 -->


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
<img width="80%" src="https://user-images.githubusercontent.com/110447398/209291914-06f08001-a149-47c1-94bc-e11b8c94d430.gif"/>


