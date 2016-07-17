package com.four.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	// 안건 건의 게시판으로 이동
	@RequestMapping("/proposal")
	public void ProposalHandler() {
		
	}
	// 토론중 게시판으로 이동	
	@RequestMapping("/ongoing")
	public void OngoingHandler() {
		
	}
	// 종료된 토론 게시판으로 이동
	@RequestMapping("/finished")
	public void FinishedHandler() {
		
	}
	// 마이페이지로 이동
	@RequestMapping("/mypage")
	public void MypageHandler() {
		
	}
}
