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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.dept.dto.Dept;
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
					
		List<Map<String, Object>> list = deptService.memberByDeptNum(map);
		logger.info("map {}", map);
		logger.info("list {}", list);
		//for( Map<String, Object> a : list )	logger.debug("{}", a);
		
		return list;
	}
	
	// adminDeptView -> /view 로 변경해주기
	@RequestMapping("/adminDeptView")
	public String view(Dept viewDept, Model model, HttpSession session) {
		logger.debug("{}", viewDept);
		
		return "redirect:/admin/Dept/adminDeptView";
	}
			
		
	
}