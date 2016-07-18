package com.four.myapp.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	// ����� ��� �Խ������� �̵�
	@RequestMapping("/finished")
	public void FinishedHandler() {
		
	}
	// ������������ �̵�
	@RequestMapping("/mypage")
	public void MypageHandler() {
		
	}
	// �ش� �Խù��� �̵�
	@RequestMapping(value="/board/read", method=RequestMethod.GET)
	public void ReadHandler(@RequestParam("topic_no") int topic_no, Model model) throws SQLException {
		model.addAttribute(service.Read(topic_no));
	}
}