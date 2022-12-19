package mainPage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import approval.dto.Paging;
import approval.service.face.ApprovalService;
import login.service.face.MemberService;
import schedule.dto.Schedule;
import schedule.service.face.ScheduleService;

@Controller
public class mainPage {
   private Logger logger = LoggerFactory.getLogger(mainPage.class);
   @Autowired ApprovalService approvarService;
   @Autowired ScheduleService scheduleService;
   @Autowired private MemberService memberService;
   
   @RequestMapping(value = "/mainPage/mainPage", method = RequestMethod.GET)
   public String hi(HttpSession session
         , Model model
         , @RequestParam(defaultValue = "0") int curPage
         ) {
        String loginId = (String) session.getAttribute("loginId");
        
        HashMap<String,String> memInfo = memberService.getMemInfo(loginId);
		logger.info("memInfo : {}", memInfo);
		session.setAttribute("memInfo",memInfo);
		
		model.addAttribute("memInfo",memInfo);
		
        
        Paging paging = approvarService.getMainPaging(curPage, loginId);
        model.addAttribute("paging", paging);
        
        
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("loginId", loginId);
        map.put("paging", paging);
        
        List<HashMap<String, String>> list = approvarService.applist(map); //기안 리스트 불러오기
        model.addAttribute("list", list);
        
        //상신함(기안함)
          
         List<HashMap<String, String>> list2 = approvarService.listpage(paging);
         model.addAttribute("list2", list2);
         
         //완료함
         List<HashMap<String, String>> list3 = approvarService.appOklist(map); //기안 완료 리스트 불러오기
         
         List<Object> mapList = new ArrayList<Object>();
         
         for(int i = 0 ; i < list3.size();i++) {
           String appstate = String.valueOf(  list3.get(i).get("APPSTATE") );
            if( appstate.equals("1") ) {
               HashMap<String, String> mmap = new HashMap<String, String>();
               
               mmap.put("RNUM", String.valueOf(list3.get(i).get("RNUM")) );
               mmap.put("STATUS", String.valueOf(list3.get(i).get("STATUS")) );
               mmap.put("APPTITLE", list3.get(i).get("APPTITLE") );
               mmap.put("AMNO", list3.get(i).get("AMNO") );
               mmap.put("MEMBERNAME", list3.get(i).get("MEMBERNAME") );
               mmap.put("APPTIME", list3.get(i).get("APPTIME") );
               mmap.put("APPROVALNO", String.valueOf(list3.get(i).get("APPROVALNO")) );
               mmap.put("DMNO", list3.get(i).get("DMNO") );
               mmap.put("APPSTATE", String.valueOf(list3.get(i).get("APPSTATE")) );
               
               mapList.add(mmap);
            }
         }
     
        model.addAttribute("mapList", mapList);
      
      //캘린더 하단 일정 목록 리스트
        Map<String,Object> map1 = new HashMap<String, Object>();
        map1.put("loginId", (String) session.getAttribute("loginId"));
        map1.put("admin", "admin");
        
        List<Schedule> list1 = scheduleService.findAll(map1);
        
        model.addAttribute("list1", list1);
        
      return "/mainPage/mainPage";
   }
   
}