package www;

public class Pagination {

	private int curPage = 1;				// 현재 페이지
	private int pageCnt = 10;				// 총 페이지 수
	private int pageSize = 10;				// 한페이지의 게시글 수
	private int listCnt = 0;				// 총 게시글 수
	private int curRange = 1;				// 현재 블럭 수
	private int rangeCnt = 10;				// 총 블럭 수
	private int startPage = 1;				// 시작 페이지
	private int endPage = 1;				// 마지막 페이지
	private int prevPage = 1;				// 이전 페이지
	private int nextPage = 1;				// 다음 페이지	
	private int startIndex = 1;				// 시작 index	

	public Pagination() {}

	public Pagination(int listCnt) {
		this.listCnt = listCnt;
	}

	public Pagination(int listCnt, int pageCnt, int pageSize) {
		this.listCnt = listCnt;
		this.pageCnt = pageCnt;
		this.pageSize = pageSize;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getCurRange() {
		return curRange;
	}

	public void setCurRange(int curRange) {
		this.curRange = curRange;
	}

	public int getRangeCnt() {
		return rangeCnt;
	}

	public void setRangeCnt(int rangeCnt) {
		this.rangeCnt = rangeCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
}