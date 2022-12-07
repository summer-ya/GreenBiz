package chat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chat.dao.face.ChatDao;
import chat.dto.Chat;
import chat.service.face.ChatService;
import login.dto.Member;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired ChatDao chatDao;

	
}
