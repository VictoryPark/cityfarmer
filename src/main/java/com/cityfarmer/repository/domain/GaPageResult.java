package com.cityfarmer.repository.domain;

public class GaPageResult {

	private int count;
	 private int lastPage;
	 private int pageNo;
	 private int beginPage;
	 private int endPage;
	 private boolean prev;
	 private boolean next;
	 
	 
	 /**
	  * 
	  * @param count  : 게ㅅㅣ물 전체 개수
	  */
	 	 
	 public GaPageResult(int pageNo, int count) {
		this(pageNo,count,10,10);
	 }
	 
	 public GaPageResult( int pageNo, int count,int listSize, int tabSize) {
		 this.count = count;
		 this.pageNo = pageNo;
		 
		 
		 lastPage = (int)Math.ceil(count / (double)listSize);
		 int currTab = (pageNo - 1) /tabSize +1;
		 
		 // 블럭에 해당하는 시작페이지와 끝페이지 계산하기
		 beginPage = (currTab - 1) * tabSize + 1;
		 // 화면에 출력할 마지막 페이지는 실제 데이터 개수를 가져와서 비교 처리해야 함...
		 endPage = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;
		 
		 //앞으로 이동 버튼, 뒤로 이동 버튼 존재 여부
		 prev = beginPage != 1;
		 next = endPage != lastPage;
	 }

	public int getCount() {	return count;}
	public int getLastPage() {return lastPage;}
	public int getPageNo() {return pageNo;}
	public int getBeginPage() {return beginPage;}
	public int getEndPage() {return endPage;}
	public boolean isPrev() {return prev;}
	public boolean isNext() {return next;}
}
