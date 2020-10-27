package com.kh.onairstudy.common;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PageMaker {
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private PagingCriteria cri;
	
	public PageMaker(PagingCriteria cri, int total) {
		this.cri = cri;
		int realEnd = (int) (Math.ceil(total * 1.0) / cri.getAmount()) ;
		this.endPage = (int) (Math.ceil(cri.getPageNum() /10.0) * 10);
		this.startPage = getEndPage() - 9;
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.next = getEndPage() < realEnd;
		this.prev = getStartPage() > 1;
	}




}
