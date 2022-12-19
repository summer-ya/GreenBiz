package approval.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.multipart.MultipartFile;

import approval.dto.AppDetail;
import approval.dto.AppFile;
import approval.dto.Approval;
import approval.dto.Paging;
import approval.service.face.ApprovalService;

@Controller
public class ApprovalController {

   private Logger logger = LoggerFactory.getLogger(ApprovalController.class);
   @Autowired ApprovalService approvarService;
   
      //전자결재 결재함
      @RequestMapping(value = "/approval/main",method = RequestMethod.GET)
      public void approvalmain( @RequestParam(defaultValue = "0") int curPage, Model model ,HttpSession session) {

         String loginId = (String) session.getAttribute("loginId");
         
         Paging paging = approvarService.getMainPaging(curPage, loginId);
         model.addAttribute("paging", paging);
         
         Map<String,Object> map = new HashMap<String,Object>();
         map.put("loginId", loginId);
         map.put("paging", paging);
         
         List<HashMap<String, String>> list = approvarService.applist(map); //기안 리스트 불러오기
         model.addAttribute("list", list);
         logger.info("list@@# 결재함!!! : {}", list);
      }
      
      @RequestMapping(value = "/approval/confirmOk",method = RequestMethod.GET)
	   public void approvalconfirmOk( @RequestParam(defaultValue = "0") int curPage, Model model ,HttpSession session) {
		   
		   String loginId = (String) session.getAttribute("loginId");

		   Paging paging = approvarService.getPaging(curPage);
		   
		   
		   
		   Map<String,Object> map = new HashMap<String,Object>();
		   map.put("loginId", loginId);
		   map.put("paging", paging);
		   
		   List<HashMap<String, String>> list = approvarService.appOklist(map); //기안 완료 리스트 불러오기
		   model.addAttribute("list", list);
		   logger.info("list@@#!!! : {}", list);
		   
		   List<Object> mapList = new ArrayList<Object>();
		   
		   for(int i = 0 ; i < list.size();i++) {
			  String appstate = String.valueOf(  list.get(i).get("APPSTATE") );
			   if( appstate.equals("1") ) {
				   HashMap<String, String> mmap = new HashMap<String, String>();
				   
				   mmap.put("RNUM", String.valueOf(list.get(i).get("RNUM")) );
				   mmap.put("STATUS", String.valueOf(list.get(i).get("STATUS")) );
				   mmap.put("APPTITLE", list.get(i).get("APPTITLE") );
				   mmap.put("AMNO", list.get(i).get("AMNO") );
				   mmap.put("MEMBERNAME", list.get(i).get("MEMBERNAME") );
				   mmap.put("APPTIME", list.get(i).get("APPTIME") );
				   mmap.put("APPROVALNO", String.valueOf(list.get(i).get("APPROVALNO")) );
				   mmap.put("DMNO", list.get(i).get("DMNO") );
				   mmap.put("APPSTATE", String.valueOf(list.get(i).get("APPSTATE")) );
				   
				   System.out.println(mmap);
				   
				   mapList.add(mmap);
			   }
		   }
		  System.out.println(mapList);
		  int totalCount = mapList.size();
		  
		  Paging realpaging = new Paging(totalCount, curPage);
		  logger.info("realpaging : {} " ,realpaging);
		  
		  model.addAttribute("paging", realpaging);
		  model.addAttribute("mapList", mapList);
		   
		   
	   }

   @RequestMapping(value = "/approval/main" , method = RequestMethod.POST)
   public String formdata(
         @RequestParam HashMap<String, String> params ,
         Approval approval,
         AppDetail appDetail
         , String[] memberNo
         , String[] confirmName
         , String[] rank
         , HttpSession session
         , MultipartFile file
         )throws Exception {
      
      
      logger.info("file : {}",file);
      logger.info("/approval/main");
       System.out.println(params);

       logger.info("memberNos : {}", Arrays.toString(memberNo));
       logger.info("memberNos : {}", Arrays.toString(confirmName));
       
       //저장할 기안 번호(sequence)
       int approvalno = approvarService.findnextno();
       System.out.println("approvalno "+approvalno); //출력해서 확인 - 지우기
       
       //파일저장 기안번호, 파일
       approvarService.fileSave(approvalno,file);
       
       //기안자 지정 세션으로 기안자 사번 저장 후 받기
      approval = Approval.builder()
            .approvalNo(approvalno) //기안번호 pk
            .appTitle( params.get("appTitle"))
            .memberName( params.get("memberName")) //기안자 이름
            .memberNo( (String) session.getAttribute("loginId")) //기안자사번
            .appContent( params.get("appContent"))
            .deptName( params.get("deptName"))
            .build();
      
      
      List<AppDetail> appDetailList = new ArrayList<>();
      //결재자 지정
      for(int i=0 ; i<memberNo.length;i++) {
         appDetailList.add( AppDetail.builder()
                     .memberNo(memberNo[i]) //결재자 사번
                     .confirmName(confirmName[i]) //결재자이름
                     .approvalNo(approvalno) //기안번호 fk
                     .rank(rank[i]) //직급
                     .status(i+1)
                     .build());
      }
      

       logger.info("appDetailList {} :", appDetailList); //출력해서 확인 - 지우기
       Map<String,Object> map = new HashMap<>();
       map.put("list", appDetailList);
       
       
       //기안자, 결재자 저장
       approvarService.appWriterSave(approval);
       approvarService.appDetailSave(map);
       
       
      return null;
   }

    @RequestMapping("/approval/ReadConfirm")
      public void Read(Model model
            , Approval approval
            , HttpSession session
            , AppFile appFile) {
         logger.info("/approval/confirmRead");
         
         //기안번호로 기안내용 가져오기
         Approval appconfirm = approvarService.selectApprovalWriter(approval);
         
         //기안번호로 기안 첨부된 파일 가져오기
         appFile = approvarService.selectAppFile(approval);
         logger.info("appFile {} :", appFile);
         model.addAttribute("appFile", appFile);
         
         logger.info("approvalList {} :",appconfirm);
         model.addAttribute("appconfirm", appconfirm);
         
         //기안번호로 결재자 List 가져오기
         List<AppDetail> confirmList = approvarService.selectAppDetail(approval);
         String loginId = (String) session.getAttribute("loginId");
         System.out.println("loginId 2222222" + loginId);

         //기안번호 로그인사번 map에 담기
         Map<String,Object>map = new HashMap<String,Object>();
         map.put("loginId", loginId);
         map.put("approvalNo", approval.getApprovalNo());
         
         //기안번호, 로그인사번으로 로그인 사번자 기안 결재 상태 받아오기
         AppDetail confirmInfo = approvarService.selecConfirmInfo(map);
         logger.info("ReadConfirm_Info : {}",confirmInfo);
         
         logger.info("ReadConfirm_List {} :",confirmList);
         model.addAttribute("confirmList", confirmList);
         
      }
    @RequestMapping("/approval/approvalConfirm")
    public void approvalConfirm(Model model
          , Approval approval
          , HttpSession session
          , AppFile appFile) {
       logger.info("/approval/confirmRead");
       
       //기안번호로 기안내용 가져오기
       Approval appconfirm = approvarService.selectApprovalWriter(approval);
       
       //기안번호로 기안 첨부된 파일 가져오기
       appFile = approvarService.selectAppFile(approval);
       logger.info("appFile {} :", appFile);
       model.addAttribute("appFile", appFile);
       
       logger.info("approvalList {} :",appconfirm);
       model.addAttribute("appconfirm", appconfirm);
       
       //기안번호로 결재자 List 가져오기
       List<AppDetail> confirmList = approvarService.selectAppDetail(approval);
       String loginId = (String) session.getAttribute("loginId");
       System.out.println("loginId 2222222" + loginId);
       
       //기안번호 로그인사번 map에 담기
       Map<String,Object>map = new HashMap<String,Object>();
       map.put("loginId", loginId);
       map.put("approvalNo", approval.getApprovalNo());
       
       //기안번호, 로그인사번으로 로그인 사번자 기안 결재 상태 받아오기
       AppDetail confirmInfo = approvarService.selecConfirmInfo(map);
       logger.info("ReadConfirm_Info : {}",confirmInfo);
       
       logger.info("ReadConfirm_List {} :",confirmList);
       model.addAttribute("confirmList", confirmList);
       
    }
   
   @RequestMapping("/approval/confirm")
   public void appConfirm(Model model
         , Approval approval
         , HttpSession session
         , AppFile appFile) {
      logger.info("/approval/confirm");
      
      //기안번호로 기안내용 가져오기
      Approval appconfirm = approvarService.selectApprovalWriter(approval);
      //기안번호로 기안 첨부된 파일 가져오기
       appFile = approvarService.selectAppFile(approval);
       model.addAttribute("appFile", appFile);
      
       logger.info("appFile {} :", appFile);
      
       logger.info("approvalList {} :",appconfirm);
      model.addAttribute("appconfirm", appconfirm);
      
      //기안번호로 결재자 List 가져오기
      List<AppDetail> confirmList = approvarService.selectAppDetail(approval);
      String loginId = (String) session.getAttribute("loginId");
      System.out.println("loginId 2222222" + loginId);

      //기안번호 로그인사번 map에 담기
      Map<String,Object>map = new HashMap<String,Object>();
      map.put("loginId", loginId);
      map.put("approvalNo", approval.getApprovalNo());
      
      //기안번호, 로그인사번으로 로그인 사번자 기안 결재 상태 받아오기
      AppDetail confirmInfo = approvarService.selecConfirmInfo(map);
      logger.info("confirmInfo : {}",confirmInfo);
      
      logger.info("confirmList {} :",confirmList);
      model.addAttribute("confirmList", confirmList);
      
      
   }

   @RequestMapping("/approval/form")
   public void appform() {
      logger.info("/approval/form");
   }

   //기안함
   @RequestMapping(value="/approval/list", method = RequestMethod.GET)
      public void applist(@RequestParam(defaultValue = "0") int curPage
            , Model model) {
         logger.info("/approval/list");
         
         Paging paging = approvarService.getListPaging(curPage);
          model.addAttribute("paging", paging);
            
          List<HashMap<String, String>> list = approvarService.listpage(paging);
          model.addAttribute("list", list);
          logger.info("listPage 기안함{}", list);
          
      }

   @RequestMapping("/approval/reject")
   public String appReject( AppDetail appDetail,HttpSession session ) {
      logger.info("/approval/reject");
      
      //로그인 사번
      String loginId = (String) session.getAttribute("loginId");
      
      //결재 반려자 , 사유, 기안번호 지정
      AppDetail reject = AppDetail.builder()
                        .approvalNo(appDetail.getApprovalNo())
                        .memberNo(loginId)  //반려자 세션값으로 가져오기
                        .appReject(appDetail.getAppReject())
                        .build();
      
      //반려 업데이트
      approvarService.rejectUpdate(reject);
      
      return "redirect:/approval/main";
   }
   
   //결재 컨트롤러
   @RequestMapping("/approval/approvalOk")
   public String approvalOk( AppDetail appDetail,HttpSession session ) {
      logger.info("/approval/approvalOk");
      
      //로그인 사번
      String loginId = (String) session.getAttribute("loginId");
      
      //결재 승인자,기안번호 
      AppDetail confirmOk = AppDetail.builder()
                  .approvalNo(appDetail.getApprovalNo())
                  .memberNo(loginId)  //승인자 세션값으로 가져오기
                  .appComment(appDetail.getAppComment())
                  .build();
      
      //승인 업데이트
      approvarService.confirmOkUpdate(confirmOk);
      
      return "redirect:/approval/main";
      
      }
   
   @RequestMapping(value="/approval/read", method=RequestMethod.POST)
      public String approvalupdate(Approval approval, HttpSession session) {
         logger.info("/approval/read");
         
         String loginId = (String) session.getAttribute("loginId");
         
         Approval readUpdate = Approval.builder()
               .approvalNo(approval.getApprovalNo())
               .memberNo(loginId)
               .appContent(approval.getAppContent())
               .build();
         
         logger.info("readUpdate {}", readUpdate);
         approvarService.approvalUpdate(readUpdate);
         
         return "redirect:/approval/list";
      }
   
   @RequestMapping(value="/approval/delete", method=RequestMethod.POST)
   public String approvalDelete(Approval approval, AppDetail appdetail, AppFile appfile, HttpSession session) {
      logger.info("/approval/delete");
      String loginId = (String) session.getAttribute("loginId");
      
      
      Approval approvalDelete = Approval.builder()
            .approvalNo(approval.getApprovalNo())
               .memberNo(loginId)
               .build();
      AppDetail detailDelete = AppDetail.builder()
            .approvalNo(appdetail.getApprovalNo())
            .build();
      
      AppFile appfileDelete = AppFile.builder()
            .approvalNo(appfile.getApprovalNo())
            .build();
      
      logger.info("approvalDelete {}", approvalDelete);
      logger.info("detailDelete {}", detailDelete);
      logger.info("detailDelete {}", appfileDelete);
      
      approvarService.approvalDelete(approvalDelete);
      approvarService.appdetailDelete(detailDelete);
      approvarService.appfileDelete(appfileDelete);
      
      return "redirect:/approval/list";
      
   }
   
   @RequestMapping(value="/approval/confirmdelete", method=RequestMethod.POST)
   public String confirmDelete(Approval approval, AppDetail appdetail, AppFile appfile, HttpSession session) {
      logger.info("/approval/confirmdelete");
      String loginId = (String) session.getAttribute("loginId");
      
      
      Approval approvalDelete = Approval.builder()
            .approvalNo(approval.getApprovalNo())
               .memberNo(loginId)
               .build();
      
      AppDetail detailDelete = AppDetail.builder()
            .approvalNo(appdetail.getApprovalNo())
            .build();
      
      AppFile appfileDelete = AppFile.builder()
            .approvalNo(appfile.getApprovalNo())
            .build();
      
      logger.info("approvalDelete {}", approvalDelete);
      logger.info("detailDelete {}", detailDelete);
      logger.info("detailDelete {}", appfileDelete);
      
      approvarService.approvalDelete(approvalDelete);
      approvarService.appdetailDelete(detailDelete);
      approvarService.appfileDelete(appfileDelete);
      
      return "redirect:/approval/main";
      
   }
   
   @RequestMapping(value="/approval/appconfirmdelete", method=RequestMethod.POST)
   public String appconfirmDelete(Approval approval, AppDetail appdetail, AppFile appfile, HttpSession session) {
      logger.info("/approval/appconfirmdelete");
      String loginId = (String) session.getAttribute("loginId");
      
      
      Approval approvalDelete = Approval.builder()
            .approvalNo(approval.getApprovalNo())
            .memberNo(loginId)
            .build();
      
      AppDetail detailDelete = AppDetail.builder()
            .approvalNo(appdetail.getApprovalNo())
            .build();
      
      AppFile appfileDelete = AppFile.builder()
            .approvalNo(appfile.getApprovalNo())
            .build();
      
      logger.info("approvalDelete {}", approvalDelete);
      logger.info("detailDelete {}", detailDelete);
      logger.info("detailDelete {}", appfileDelete);
      
      approvarService.approvalDelete(approvalDelete);
      approvarService.appdetailDelete(detailDelete);
      approvarService.appfileDelete(appfileDelete);
      
      return "redirect:/approval/confirmOk";
      
   }
   
}