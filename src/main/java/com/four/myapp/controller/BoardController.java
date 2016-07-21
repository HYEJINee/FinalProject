package com.four.myapp.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.four.myapp.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	// �Ȱ� ���� �Խ������� �̵�
	@RequestMapping("/proposal")
	public void ProposalHandler() {
		
	}
	// ����� �Խ������� �̵�	
	@RequestMapping("/ongoing")
	public void OngoingHandler() {
		
	}
	// 
	@RequestMapping("/finished/list")
	public void FinishedHandler(Model model) throws SQLException {
		model.addAttribute("list", service.getFinishedList());
	}
	
	// ������������ �̵�
	@RequestMapping("/mypage")
	public void MypageHandler() {
		
	}
	// �ش� �Խù��� �̵�
	@RequestMapping(value="/board/read", method=RequestMethod.GET)
	public void ReadHandler(@RequestParam("topic_no") int topic_no, Model model) throws SQLException {
		model.addAttribute("mainDto", service.read(topic_no));
	}
}
