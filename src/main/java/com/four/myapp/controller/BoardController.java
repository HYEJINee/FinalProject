package com.four.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
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
}
