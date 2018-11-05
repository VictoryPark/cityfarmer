package com.cityfarmer.repository.domain.tip;
//페이징
public class TipPageResult {
	//전체 게시물 갯수
	private int count;
	//마지막 페이지 번호
	private int lastPage;
	private int pageNo;
	private int beginPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	public TipPageResult(int pageNo, int count) {
		this(pageNo, count, 10, 10);
	}
	public TipPageResult(int pageNo, int count, int listSize, int tabSize) {
		this.pageNo = pageNo;
		this.count = count;
		lastPage = (int)Math.ceil(count / (double)listSize);
		int currTab = (pageNo - 1) / tabSize + 1;
		beginPage = (currTab - 1) * tabSize + 1;
		endPage = (currTab * tabSize < lastPage) ? currTab * tabSize
				: lastPage;
		prev = beginPage != 1;
		next = endPage != lastPage;
	}
	public int getCount()     { return count; }
	public int getLastPage()  { return lastPage; }
	public int getPageNo()    { return pageNo; }
	public int getBeginPage() { return beginPage; }
	public int getEndPage()   { return endPage; }
	public boolean isPrev()   { return prev; }
	public boolean isNext()   { return next; }
	
	
	

}
