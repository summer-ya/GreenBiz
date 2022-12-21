package schedule.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.joda.time.LocalDateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.dept.dto.Dept;
import admin.dept.dto.DeptFile;
import admin.dept.service.face.DeptService;
import login.service.face.MemberService;
import lombok.RequiredArgsConstructor;
import schedule.dto.Schedule;
import schedule.service.face.ScheduleService;


@Controller
@RequiredArgsConstructor
public class ScheduleController {

   private Logger logger = LoggerFactory.getLogger(ScheduleController.class);
   @Autowired ScheduleService scheduleService; 
   @Autowired DeptService deptService;
   @Autowired MemberService memberService;
   
   private DateTimeFormatter dtf = ISODateTimeFormat.dateTime();
   private String customFormat = "yyyy-MM-dd HH:mm:ss";
   
   @RequestMapping("/schedule/schedule")
   public void scheduleMain(Model model, HttpSession session) {
      //캘린더 하단 일정 목록 리스트
       Map<String,Object> map = new HashMap<String, Object>();
       map.put("loginId", (String) session.getAttribute("loginId"));
       map.put("admin", "admin");
       
       List<Schedule> list = scheduleService.findAll(map);
       
       model.addAttribute("list", list);
       
       //로그인 프로필 사진
       String loginId = (String) session.getAttribute("loginId");
       HashMap<String,String> memInfo = memberService.getMemInfo(loginId);
         
        Dept dept = new Dept();
            //   System.out.println("member : "+ member);
         dept.setMemberNo(memInfo.get("MEMBERNO"));
         DeptFile deptFile = deptService.getAttachFile(dept);
         model.addAttribute("file", deptFile);
   }
   
   //DB 일정 가져오기
   @GetMapping("/schedule/scheduleAll")
   @ResponseBody
   public List<Map<String, Object>> showAllEvent(
         Model model
         ,HttpSession session
         ) throws Exception {
      
      JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
        
        //로그인 아이디가 등록한 일정과 관리자(admin)가 등록한 일정만 받아오기
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("loginId", (String) session.getAttribute("loginId"));
        map.put("admin", "admin");
        
        
        List<Schedule> list = scheduleService.findAll(map);
        logger.info("findAll {}", list);
        
        
        HashMap<String, Object> hash = new HashMap<String, Object>();
        for (Schedule schedule : list) {
           
           hash.put("memberno", schedule.getMemberno());
            hash.put("title", schedule.getTitle());
            hash.put("start", schedule.getStartdate());
            hash.put("end", schedule.getEnddate());
            hash.put("username", schedule.getUsername());
            hash.put("backgroundColor", schedule.getBackgroundcolor());
            if(schedule.getAllDay().equals("1")) {
               hash.put("allDay", true);
            } else {
               hash.put("allDay", false);
               
            }
 
            jsonObj = new JSONObject(hash);
            jsonArr.add(jsonObj);
        }
        
        logger.info("list: {}", list);
        logger.info("jsonArrCheck: {}", jsonArr);
        
     return jsonArr;
 
    }

   //일정수정
   @PostMapping("/schedule/modify")
   @ResponseBody
    public String modifyEvent(@RequestBody List<Map<String, Object>> param) {
      logger.info("/schedule/modify");
      logger.info("스케쥴 수정 param : {}", param);
        
          for (Map<String, Object> list : param) {
         //기존데이터 받아오기
        String oldTitle = (String) list.get("originTitle");
        String oldStart = (String) list.get("originOldStart");
        String oldEnd = (String) list.get("originOldEnd");
   
         
        LocalDateTime startdate = dtf.parseLocalDateTime(oldStart);
        LocalDateTime endDate = dtf.parseLocalDateTime(oldEnd);
         
        //포멧형식으로 변환
        String originsDate = startdate.toString(DateTimeFormat.forPattern(customFormat));
        String origineDate = endDate.toString(DateTimeFormat.forPattern(customFormat));
         
        Schedule schedule = Schedule.builder()
            .title(oldTitle)
            .startdate(originsDate)
            .enddate(origineDate)
            .build(); 
      
         //수정할 일정의  scheduleno 받아오기 /
        int scheduleno  = scheduleService.getScheduleNoBy(schedule);
        logger.info("기존 scheduleno : {}", scheduleno); 
        
        //수정할 일정받아오기
        String start = (String) list.get("start");
        String end = (String) list.get("end");
        
        //String 형식으로 날짜변환
        LocalDateTime updatestartdate = dtf.parseLocalDateTime(start);
        LocalDateTime updateendDate = dtf.parseLocalDateTime(end);
        
        String sDate = updatestartdate.toString(DateTimeFormat.forPattern(customFormat));
        String eDate = updateendDate.toString(DateTimeFormat.forPattern(customFormat));
   
        //builder로 setter
        Schedule upschedule = Schedule.builder()
              .startdate(sDate) //시작일시
              .enddate(eDate)   //종료일시
              .scheduleno(scheduleno)
              .build();
        
        scheduleService.scheduleUpdate(upschedule);

      }
      
      
      return null;
   }
   
   
   // 일정 저장
   @PostMapping("/schedule/schedule")
   public void scheduleUpdate(@RequestBody List<Map<String, Object>> alldata, HttpSession session) throws ParseException {
      logger.info("/schedule/schedule");
      logger.info("test : {}", alldata);
      
   
      Schedule schedule = null;
      for( int i = 0; i < alldata.size(); i++) {
         String allDay="0"; //false
         //String으로 저장할 parameter  받기
         String start = (String) alldata.get(i).get("start");
         String end = (String) alldata.get(i).get("end");
         String title = (String) alldata.get(i).get("title");
         if((Boolean) alldata.get(i).get("allDay")) {
           allDay = "1";
         } 
         
         //로컬타임 변환
         LocalDateTime startdate = dtf.parseLocalDateTime(start);
         LocalDateTime endDate = dtf.parseLocalDateTime(end);
         
         //포멧형식으로 변환
         String sDate = startdate.plusHours(9).toString(DateTimeFormat.forPattern(customFormat));
         String eDate = endDate.plusHours(9).toString(DateTimeFormat.forPattern(customFormat));

         System.out.println("시작시간 : "+sDate);
         System.out.println("종료시간 : "+eDate);
         
         String username = "employee";
         String memberno = (String) session.getAttribute("loginId");
         String backgroundcolor = "backgoundcolor";
         System.out.println("memberno" + memberno);
         //manager 테이블 사번 유무 확인 1-true , 0 - false
         boolean isAdmin = scheduleService.findAdmin(memberno);
         
         //true 일경우 관리자
         if(isAdmin) {
            username = "admin";
            backgroundcolor = "forestgreen";
//            session.setAttribute("membernoid", "admin");
         }
         
         //builder로 setter
            schedule = Schedule.builder()
                  .memberno(memberno)  //사원번호
                  .startdate(sDate)    //시작일시
                  .enddate(eDate)      //종료일시
                  .title(title)        //일정명
                  .allDay(allDay)      //종일 여부
                  .username(username)   // 관리자 / 일반사원 구분
                  .backgroundcolor(backgroundcolor) //일정등록 바탕색상
                  .build();
                  
            
            
            
            logger.info("schedule : {}",schedule);
            
          scheduleService.scheduleSave(schedule);
   
      }
            
   }
   
   
   //일정 삭제

   @DeleteMapping("/schedule/delete")
   @ResponseBody   
    public String deleteEvent(@RequestBody List<Map<String, Object>> param
          ,HttpSession session) {
       
       for (Map<String, Object> list : param) {
          
        System.out.println("list = " + list);
       
       String title = (String) list.get("title");
       String start = (String) list.get("start");
       String end = (String) list.get("end");
       
       System.out.println("start = " + start);
       
      //로컬타임 변환
         LocalDateTime startdate = dtf.parseLocalDateTime(start);
         LocalDateTime endDate = dtf.parseLocalDateTime(end);
         
         //포멧형식으로 변환
         String sDate = startdate.toString(DateTimeFormat.forPattern(customFormat));
         String eDate = endDate.toString(DateTimeFormat.forPattern(customFormat));

         System.out.println("시작시간 : "+sDate);
         System.out.println("종료시간 : "+eDate);
         
         String memberno = (String) session.getAttribute("loginId");
         
         //builder로 set
         Schedule schedule = Schedule.builder()
               .memberno(memberno)   //관리자
                 .startdate(sDate) 
                 .enddate(eDate)  
                 .title(title)    
                 .build();
         
         int scheduleno = scheduleService.findScheduleNo(schedule);
         
         logger.info("scheduleno : {}", scheduleno);
         if(scheduleno != 0) {
         scheduleService.deleteData(scheduleno);
         }
          }
       
       return "/schedule/schedule";
    }
   

}