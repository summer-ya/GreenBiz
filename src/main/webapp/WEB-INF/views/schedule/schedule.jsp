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

    eventDrop: function (info){
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
    ,
    
    select: function(arg) {
      var title = prompt('Event Title:');
    
      if (title) {
        calendar.addEvent({
          title: title,
          start: arg.start,
          end: arg.end,
          allDay: arg.allDay
        })
      }
      var events = new Array();   
        var obj = new Object();
        if (title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }
        obj.title =   title;
        /* obj.allDay = allEvent[i]._def.allDay; */
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
           location.reload();
        })
        .error(function(request,status,error){
           alert("에러발생 :"+error );
        });
         calendar.unselect()
     });
      
    },
    eventClick: function (info){
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
                    backgroundColor: item.backgroundColor
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

</style>
</head>
<body>
<div class="container">	<div>

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
	
</div>
</div>

</body>
</html>