package com.dabom.ui;

public class TheMessagePager {
	
	private int pageSize;//한 페이지당 데이터 개수
	private int pagerSize;//번호로 보여주는 페이지 Link 개수
	private int dataCount;//총 데이터 수
	
	private int currentPage;//현재 페이지 번호
	private int pageCount;//총 페이지 수
	
	private String linkUrl;//페이저가 포함되는 페이지의 주소
	
	public TheMessagePager(int dataCount, int currentPage, 
		int pageSize, int pagerSize, String linkUrl, String string) {
		
		this.linkUrl = linkUrl;
		
		this.dataCount = dataCount;
		this.pageSize = pageSize;
		this.pagerSize = pagerSize;
		this.currentPage = currentPage;		
		pageCount = (dataCount / pageSize) + ((dataCount % pageSize) > 0 ? 1 : 0);
	}
	
	public String toString(){
		StringBuffer linkString = new StringBuffer();
		
		//1. 처음, 이전 항목 만들기		
		if (currentPage > 1) {
			linkString.append(String.format("<button class='btn btn-dark' type='button'><i class='fa fa-angle-left'></i></button>", linkUrl, currentPage - 1));
		} else {
			linkString.append("<button class='btn btn-dark' type='button'><i class='fa fa-angle-left'></i></button>");
		}
		linkString.append("&nbsp;");
		
		
//		//2. 페이지 번호 Link 만들기
//		int pagerBlock = (currentPage - 1) / pagerSize;
//		int start = (pagerBlock * pagerSize) + 1;
//		int end = start + pagerSize;
//		for (int i = start; i < end; i++) {
//			if (i > pageCount) break;
//			linkString.append("&nbsp;&nbsp;");
//			if (currentPage == i) {
//				linkString.append(String.format("<span style='text-decoration:underline;font-weight:bold'>%d</span>", i));
//			} else {
//				linkString.append(String.format("<a href='%s?pageNo=%d'>%d</a>", linkUrl, i, i));
//			}
//			linkString.append("&nbsp;&nbsp;");
//		}
		
		//3. 다음, 마지막 항목 만들기
		linkString.append("&nbsp;");
		if (currentPage < pageCount) {
			linkString.append(String.format("<button class='btn btn-dark' type='button'><i class='fa fa-angle-right'></i></button>",linkUrl, currentPage + 1));
		} else {
			linkString.append("<button class='btn btn-dark' type='button'><i class='fa fa-angle-right'></i></button>");
		}
		linkString.append("&nbsp;");
		linkString.append("&nbsp;");	
		
		return linkString.toString();
	}

}













