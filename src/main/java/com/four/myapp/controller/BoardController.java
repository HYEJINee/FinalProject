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
	// 해당 게시물로 이동
	@RequestMapping(value="/board/read", method=RequestMethod.GET)
	public void ReadHandler(@RequestParam("topic_no") int topic_no, Model model) throws SQLException {
		model.addAttribute("mainDto", service.read(topic_no));
	}
}
