<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<div class="base_wrap">
		<h1 id=logo><a href="/"><span>Doogle</span></a></h1>
		<jsp:include page="/view/layout/member.jsp" flush="false"/>
		<div class="search_wrap">
			<div class="search_event_wrap">
				<input type="text" id="search" placeholder="검색" value="" />
				<button class="btn btn-success" id="btn_search">검색</button>
				<select class="custom-select hide" id="searchType">
					<option value="NEWS" selected="selected">뉴스</option>
					<option value="BLOG">블로그</option>
					<option value="BOOK">책</option>
					<option value="ENCYC">백과사전</option>
					<option value="MOVIE">영화</option>
					<option value="CAFE">카페글</option>
					<option value="KIN">지식iN</option>
					<option value="LOCAL">지역</option>
					<option value="ERRATA">오타변환</option>
					<option value="WEBKR">웹문서</option>
					<option value="IMAGE">이미지</option>
					<option value="SHOP">쇼핑</option>
					<option value="DOC">전문자료</option>
				</select>
			</div>
		</div>
	</div>
</header>