package com.cityfarmer.repository.domain.exchange;

/**
 * 	화면에 페이지 부분을 처리하기 위한 데이터를 표현하는 클래스
 */
public class ExPageResult {
	private int count;
	private int lastPage;
	private int pageNo;
	private int beginPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	/**
	 * @param count : 게시물 전체 갯수
	 */
	public ExPageResult(int pageNo, int count) {
		this(pageNo, count, 6, 10);
	}
	
	public ExPageResult(int pageNo, int count, int listSize, int tabSize) {
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













