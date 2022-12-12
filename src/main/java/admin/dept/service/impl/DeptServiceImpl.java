package admin.dept.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dept.dao.face.DeptDao;
import admin.dept.dto.Dept;
import admin.dept.service.face.DeptService;

@Service
public class DeptServiceImpl implements DeptService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired DeptDao deptDao;

	@Autowired ServletContext context;

	@Override
	public List<Dept> list(Dept deptNum) {
		return deptDao.selectDeptList(deptNum);
	}
	
	@Override
	public Dept view(Dept viewDept) {
		logger.info("view test");
		//상세보기 조회 결과 리턴
		return deptDao.selectDept(viewDept);
	}

	@Override
	public List<Dept> deptList() {
		return deptDao.deptList() ;
	}

	@Override
	public List<Map<String, Object>> memberByDeptNum(Map<String, Object> map) {
		return deptDao.memberByDeptNum(map);
	}
	
	
}
