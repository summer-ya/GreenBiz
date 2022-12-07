package chat.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chat.service.face.ChatService;
import login.dto.Member;
import login.service.face.MemberService;

@Controller
public class ChatController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ChatService chatService;
	@Autowired MemberService memberService;
	
	@RequestMapping("/chat/main")
	public void chatMain(Model model, Member member) {
		
		List<Member> list = memberService.list();
		model.addAttribute("list", list);
		
	}

	//--------------------------------------------------------------
	
	@RequestMapping(value="/chat/chat", method=RequestMethod.GET)
	public void chat() {
		
	}

	
}
