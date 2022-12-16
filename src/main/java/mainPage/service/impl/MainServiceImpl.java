package mainPage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import mainPage.dao.face.MainDao;
import mainPage.service.face.MainService;

public class MainServiceImpl implements MainService {

	@Autowired MainDao mainDao;
	
	@Override
	public List<HashMap<String, String>> Main(Map<String, Object> map) {
		return mainDao.mainMemberList(map);
	}
	
}
