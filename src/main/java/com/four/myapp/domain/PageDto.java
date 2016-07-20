package com.four.myapp.domain;

public class PageDto {
	private int numPerPage = 6; 	// 한 페이지당 게시물 -1
	private int pagePerBlock = 5; 	// 이전, 다음 페이지로 구분 할 총 페이지의 수
	private int nowPage = 0;		// 현재 페이지
	private int nowBlock = 0;		// 현재 블럭
	
	public PageDto(){}
	public PageDto(int nowBlock, int nowPage) {
		this.nowBlock = nowBlock;
		this.nowPage = nowPage;
	}
	
	public int getNumPerPage() {
		return numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public int getNowPage() {
		return nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
}
