package www.pagination;

import org.json.JSONObject;

public class Pagination {

	private int listSize = 10; // 초기값으로 목록개수를 10으로 셋팅
	private int rangeSize = 10; // 초기값으로 페이지범위를 10으로 셋팅
	private int page;
	private int range;
	private int listCnt;
	private int pageCnt;
	private int startPage;
	private int startList;
	private int endPage;
	private String prev;
	private String next;
	private JSONObject info = new JSONObject();

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String isPrev() {
		return prev;
	}

	public void setPrev(String prev) {
		this.prev = prev;
	}

	public String isNext() {
		return next;
	}

	public void setNext(String next) {
		this.next = next;
	}

	public void setInfo(JSONObject info) {
		this.info = info;
	}

	public void setInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;

		// 전체 페이지수
		pageCnt = (int) Math.ceil(listCnt / listSize);

		// 시작 페이지
		startPage = page == 1 ? 1 : (range - 1) * rangeSize + 1;

		// 끝 페이지
		endPage = range * rangeSize;

		// 게시판 시작번호
		startList = page == 1 ? 1 : (page - 1) * listSize + 1;

		// 이전 버튼 상태
		prev = range == 1 ? "" : "true";

		// 다음 버튼 상태
		next = endPage > pageCnt ? "" : "true";

		if (endPage > pageCnt) {
			endPage = pageCnt;

			next = "";
		}
	}

	public String getInfo() {
		info.put("listSize", Integer.toString(listSize));
		info.put("rangeSize", Integer.toString(rangeSize));
		info.put("page", Integer.toString(page));
		info.put("range", Integer.toString(range));
		info.put("pageCnt", Integer.toString(pageCnt));
		info.put("startPage", Integer.toString(startPage));
		info.put("startList", Integer.toString(startList));
		info.put("endPage", Integer.toString(endPage));
		info.put("prev", String.valueOf(prev));
		info.put("next", String.valueOf(next));

		return info.toString();
	}

}