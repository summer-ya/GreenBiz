package mainPage.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class mainPage {
	
	@RequestMapping(value = "/mainPage/mainPage", method = RequestMethod.GET)
	public String hi( ) {
		return "/mainPage/mainPage";
	}
	
}


