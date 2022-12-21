package login.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import login.dto.Admin;
import login.service.face.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {
   // 로그 객체
   private Logger logger = LoggerFactory.getLogger(this.getClass());
   @Autowired AdminService adminService;

   // 관리자 로그인
   @GetMapping("/login")
   public void login() {}
   
   @PostMapping("/login")
   public ModelAndView adminLogin(Admin admin, HttpSession session) {
      
      boolean adminLogin = adminService.adminLogin(admin);
      ModelAndView mav = new ModelAndView();
      
      logger.info("adminLogin : {}", adminLogin);
      logger.info("adminNo : {}", admin.getAdminNo());
      
      if(adminLogin) {
         session.setAttribute("adminLogin", adminLogin);
         session.setAttribute("adminId", admin.getAdminNo());
         
         mav.setViewName("redirect:/admin/Dept/adminDeptList");
         return mav;
      } else {

         session.invalidate();

         mav.addObject("msg", "아이디와 비밀번호를 확인해주세요.");
         mav.setViewName("/admin/login");

         return mav;
      }
      
   }
}