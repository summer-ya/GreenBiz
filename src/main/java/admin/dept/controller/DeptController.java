package admin.dept.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import admin.allnotice.dto.Allnotice;
import admin.allnotice.dto.AllnoticeFile;
import admin.dept.dto.Dept;
import admin.dept.dto.DeptFile;
import admin.dept.service.face.DeptService;


@Controller
@RequestMapping("/admin/Dept")
public class DeptController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired DeptService deptService;
	
	@RequestMapping("/adminDeptList")
	public void options(Model model) {
		// 왼쪽에 띄울 부서리스트 탭
		List<Dept> list = deptService.deptList();
		model.addAttribute("list", list);
	}
	
	
	@RequestMapping("/list")
	@ResponseBody
	public List<Map<String, Object>> list(Model model,
			@RequestParam Map<String, Object> map) {
					
		List<Map<String, Object>> list = deptService.memberByid(map);
		logger.info("map {}", map);
		logger.info("list {}", list);
		//for( Map<String, Object> a : list )	logger.debug("{}", a);
		
		return list;
	}
	
	// adminDeptView -> /view 로 변경해주기
	@RequestMapping("/adminDeptView")
	public String view(@RequestParam String memberNo, Model model, HttpSession session) {
		logger.info("{}", memberNo);
		//Dept viewDept
		
		Dept paramDept = new Dept();
		paramDept.setMemberNo(memberNo);
		
		Dept viewDept = deptService.view(paramDept);
		model.addAttribute("viewDept", viewDept);
		
		DeptFile deptFile = deptService.getAttachFile(viewDept);
		model.addAttribute("deptFile", deptFile);
		model.addAttribute("mFile", deptFile);
		
		// return "redirect:/admin/Dept/adminDeptView"; -> 컨트롤러 자체에게 요청하는 경우 
		//-> return 통해서 해당 컨트롤러에게 요청 
		//-> 현재 컨트롤러가 요청 받음 
		//-> adminDeptView 컨트롤러가 요청 받음 
		//-> return 통해서 해당 컨트롤러에게 요청 
		//-> 현재 컨트롤러가 요청 받음 
		//-> adminDeptView 컨트롤러가 요청 받음 
		//-> 현재 컨트롤러가 요청 받음 
		//-> adminDeptView 컨트롤러가 요청 받음 
		// ...무한루프
		return "/admin/Dept/adminDeptView"; // ->jsp 위치한 경로
	}
	
	@GetMapping("/adminDeptWrite")
	public void write() {}
	
	@PostMapping("/adminDeptWrite")
	public String writeProcess(Dept dept, MultipartFile deptFile, HttpSession session) {
		logger.debug("{}", dept);
		logger.debug("{}", deptFile);
		
		//게시글, 첨부파일 처리
		deptService.write(dept, deptFile);
		logger.info("write out");
		return "redirect:/admin/Dept/adminDeptList";
	}
	
	@RequestMapping("/download")
	public String download(DeptFile deptFile, Model model) {
		
		//첨부파일 정보 객체
		deptFile = deptService.getFile(deptFile);
		logger.debug("{}", deptFile);
		
		//모델값 전달
		model.addAttribute("downFile", deptFile);
		
		return "down";
	}
	
	@GetMapping("/adminDeptUpdate")
	public String update(Dept dept, Model model) {
		logger.debug("{}", dept);
		
		//잘못된 게시글 번호 처리
		int id = Integer.parseInt(dept.getId()); 
		
		if( id < 0) {
			return "redirect:/admin/Dept/adminDeptList";
		}
		
		//게시글 조회
		dept= deptService.view(dept);
		logger.debug("조회된 게시글 {}", dept);
		
		//모델값 전달
		model.addAttribute("updateDept", dept);
		
		
		//첨부파일 모델값 전달
		DeptFile deptfile = deptService.getAttachFile(dept);
		model.addAttribute("deptFile", deptfile);
		
		
		return "/admin/Dept/adminDeptUpdate";

	}
	
	@PostMapping("/adminDeptUpdate")
	public String updateProcess(Dept dept, MultipartFile file) {
		logger.debug("{}", dept);
		
		deptService.update(dept, file);
		
		return "redirect:/admin/Dept/adminDeptsView?deptNo=" + dept.getId();
	}
	
	@RequestMapping("/adminDeptDelete")
	public String delete(Dept dept) {
		
		deptService.delete(dept);
		
		return "redirect:/admin/Dept/adminDeptList";
	}
		
	
}