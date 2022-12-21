<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href='/resources/fullcalendar/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar/main.js'></script>
<script src='/resources/fullcalendar/ko.js'></script>
<script>

var calendar = null;

$(document).ready(function () {
   
   let selector = document.querySelector("#selector")
  var calendarEl = document.getElementById('calendar');

  calendar = new FullCalendar.Calendar(calendarEl, {
    
     headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay'
    },
    locale:"ko",
 /*    initialDate: '2020-09-12', */
    navLinks: true, // can click day/week names to navigate views
    selectable: true,
    selectMirror: true,
    editable: true,
    droppable: true,
      
    eventDrop: function (info){
    	var memberno = info.event.extendedProps.memberno;
    	var loginId = "<c:out value='${loginId }'/>";
    	
      	if(  memberno != loginId ){
    	  alert("수정 권한이 없습니다.");
    	  location.reload(true);
    	  return false;
      };
        if(confirm("'"+ info.event.title +"'일정을 수정하시겠습니까 ?")){
         }
        var events = new Array();
       var obj = new Object(); 
       
       obj.title = info.event._def.title;
       obj.start = info.event._instance.range.start;  // 수정된 시작날짜
       obj.end = info.event._instance.range.end;     // 수정된 종료날짜   
       
       obj.originTitle = info.oldEvent._def.title;
       obj.originOldStart = info.oldEvent._instance.range.start;  //기존 시작날짜
       obj.originOldEnd = info.oldEvent._instance.range.end;      //기존 종료날짜

        events.push(obj);
       
       console.log(events); 
       
        $(function deleteData(){
          $.ajax({
             url: "./modify" ,
             method: "POST",   
             data: JSON.stringify(events),
            /*  dataType: "json", */
             contentType: 'application/json'
          })
       })
    }
    ,

    /* 필터적용 */
     eventDidMount: function(arg) {
      let val = selector.value;
      
       console.log(arg.event.extendedProps.username)
         
      if (!(val == arg.event.extendedProps.username || val == "all")) {
        arg.el.style.display = "none";
      }
//         if(val == "admin" ){ arg.el.style.backgroundColor = "forestgreen"; } 테스트코드
    },

    eventResize: function (info){
    	var memberno = info.event.extendedProps.memberno;
    	var loginId = "<c:out value='${loginId }'/>";
    	
      	if(  memberno != loginId ){
    	  alert("수정 권한이 없습니다.");
    	  location.reload(true);
    	  return false;
      }else{ 
        if(confirm("'"+ info.event.title +"'일정을 수정하시겠습니까 ?")){
         }
        var events = new Array();
       var obj = new Object(); 
       
       obj.title = info.event._def.title;
       obj.start = info.event._instance.range.start;  // 수정된 시작날짜
       obj.end = info.event._instance.range.end;     // 수정된 종료날짜   
       
       obj.originTitle = info.oldEvent._def.title;
       obj.originOldStart = info.oldEvent._instance.range.start;  //기존 시작날짜
       obj.originOldEnd = info.oldEvent._instance.range.end;      //기존 종료날짜

        events.push(obj);
       
       console.log(events); 
       
        $(function deleteData(){
          $.ajax({
             url: "./modify" ,
             method: "POST",   
             data: JSON.stringify(events),
             /* dataType: "json", */
             contentType: 'application/json'
          })
       })
    }
    }   	
    ,
    
    select: function(arg) {
      
      if(confirm("일정을 등록하시겠습니까 ?")){
    	  
    	  var title = prompt('일정명:');
    	  if (title === '' || title == null || title.trim().length === 0 ) {
              alert('일정명은 필수입니다.');
              if (title) {
                  calendar.addEvent({
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay
                  })
                }
              return false;
          }

      var events = new Array();   
        var obj = new Object();
   
        obj.title = title;
        obj.start = arg.start ;
        obj.end = arg.end;
        obj.allDay = arg.allDay;
        
        events.push(obj);
     
     var jsondata = JSON.stringify(events);
     console.log(jsondata);
      
     $(function savedata(jsondata){
        $.ajax({
           method: "POST",
           url:"./schedule",
           data:JSON.stringify(events),
           /* dataType: "json", */
           contentType: 'application/json',
        })
        .success(function(res){
           alert("일정등록");
           calendar.refetchEvents();
        })
        .error(function(request,status,error){
           alert("에러발생 :"+error );
        });
         calendar.unselect()
     });
      
    
    }
   },
   
    eventClick: function (info){
    	//로그인아이디 작성자 아이디일치 여부 확인
    	var memberno = info.event.extendedProps.memberno;
    	var loginId = "<c:out value='${loginId }'/>";
    	
      	if(  memberno != loginId ){
    	  alert("삭제 권한이 없습니다.");
    	  location.reload(true);
    	  return false;
      };
        if(confirm("'"+ info.event.title +"'일정을 삭제하시겠습니까 ?")){
            // 확인 클릭 시
            info.event.remove();


        console.log(info.event);
        var events = new Array(); // Json 데이터를 받기 위한 배열 선언
        var obj = new Object();
            obj.title = info.event._def.title;
            obj.start = info.event._instance.range.start;
            obj.end = info.event._instance.range.end;
            events.push(obj);

        console.log(events);
        }
        $(function deleteData(){
            $.ajax({
                url: "/schedule/delete",
                method: "DELETE",
               /*  dataType: "json", */
                data: JSON.stringify(events),
                contentType: 'application/json',
            })
        })
    },
    editable: true,
    dayMaxEvents: true, // allow "more" link when too many events
    events: function ( fetchInfo, successCallback, failureCallback ) {
   
        $.ajax({
             url:"/schedule/scheduleAll",
             type:"get",
             dataType:"json",
              success:function (data) {
              var events = [];
              if(data != null){
                 
              $.each(data,function(i,item){
                 events.push({
                    start: item.start,
                    allDay: item.allDay,
                    end: item.end,
                    title: item.title,
                    username: item.username,
                    backgroundColor: item.backgroundColor,
                    memberno : item.memberno
                 })
              })
           }
            console.log( 'event',event ); // log 로 데이터 찍어주기.
            successCallback(events);
        }   
     })
   }
    
  });
 
  calendar.render();
  
   selector.addEventListener('change', function() {
      console.log(selector.value)
       calendar.refetchEvents();
     });

   
});
</script>

<style>

:root {
  --body-color: none;
}
    
body {
  margin: 40px 10px;
  padding: 0;
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  font-size: 14px;
}

#calendar {
  max-width: 1100px;
  margin: 0 auto;
}

.choosebox{
border: 1px solid #ccc;
width: 10%
}

.calsi{
	width:auto;
}

#selector{
	margin: 0 0 10px 0;
	width: 15%;
	font-size: 1rem;
	border: 2px solid skyblue;
}

.listheader thead { 

    border: 0px solid #c0c0c0;
    text-align: center;


}

.listheader td {

    border: 1px solid #c0c0c0;
}

.container{
   padding-bottom: 70px;
}

</style>
</head>
<div class="container">   
   <div>
      <div>
         <select id="selector" class="btn">
            <option value="all">전체 일정</option>
            <option value="admin">전사 일정</option>
            <option value="employee">개인 일정</option>
         </select>
      </div>   
      
      <div>
         <div id='calendar'></div>   
      </div>
      <br><br>
   
      <div id="List_section">
         
            <h3>일정 목록</h3>
         
         <table style="width:100%;" class="listheader table table-hover">
            <thead>
               <tr>
                  <th scope="col">순번</th>
                  <th scope="col">일정명</th>
                  <th scope="col">시작일</th>
                  <th scope="col">종료일</th>
               </tr>
            </thead>
            <c:if test="${not empty list}">
               <c:forEach var="list" items="${list}" varStatus="status">
                  <tr scope="row">
                     <td style="width:2%; text-align: center">${status.count }</td>
                     <td width="30%">${list.title}</td>
                     <td style="width:10%; text-align: center">${list.startdate}</td>
                     <td style="width:10%; text-align: center">${list.enddate}</td>
                  </tr>
               </c:forEach>
            
            </c:if>            
         </table>
      </div>
   </div>
</div><!-- container -->

</body>
</html>