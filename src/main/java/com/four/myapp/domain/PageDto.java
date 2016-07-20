package com.four.myapp.domain;

public class PageDto {
	private int numPerPage = 6; 	// �� �������� �Խù� -1
	private int pagePerBlock = 5; 	// ����, ���� �������� ���� �� �� �������� ��
	private int nowPage = 0;		// ���� ������
	private int nowBlock = 0;		// ���� ��
	
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
