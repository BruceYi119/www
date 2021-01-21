<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="www.db.dto.ReservationDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/view/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title>갈비대첩</title>
<%
pageContext.setAttribute("TimeBtn",ReservationDTO.getTimebtn());
%>
<link rel="stylesheet" href="/view/css/heesoo_layout.css">
<link rel="stylesheet" href="/view/css/heesoo_reservation_layout.css">
<script defer src="/core/jquery-3.5.1/jquery-3.5.1.min.js"></script>
<script defer src="/core/bootstrap-4.5.3/js/bootstrap.bundle.js"></script>
<script defer src="/view/js/reservation_write_cal.js"></script>
</head>
<body>
	<jsp:include page="/view/heesoo/top.jsp" flush="false" />
	<main>
	<div id="submenu" class="item" >
		<button type="button" class="subitem" onclick="location.href='reservation_write_cal.jsp'">예약하기</button>
		<hr>
		<button type="button" class="subitem" onclick="location.href='reservation_update_chk.jsp'"> 예약수정 / 취소</button>
		<hr>
	</div>
	<div class="item">
	<div id="title">
		<h2>예약하기</h2>
	</div>
	<hr>
		<section>
			<table id="cal">
				<thead>
					<tr>
						<th colspan="7">
							<!-- <button id="today">오늘</button> -->
							<button id="prev">이전</button> 
							<!--  <select id="year"></select> <select id="month"></select>-->
							<span id="year"></span>년 <span id="month"></span>월
							<button id="next">다음</button>
						</th>
					</tr>
					<tr>
						<td class="sun">일</td>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td class="sat">토</td>
					</tr>
				</thead>
				<tbody>
					<!-- 달력 생성 영역 -->
				</tbody>
			</table>
		</section>
		<aside>
	<form method="post" action="reservation_ok.jsp" onsubmit="return check()">
	<input type="hidden" id="rtime" name="rtime">
	<input type="hidden" id="rdate" name="rdate">
			<table id="detail">
				<tr>
					<td class="title">성함</td>
					<td class="input"><input type="text" name="rname"/></td>
				</tr>
				<tr>
					<td class="title">핸드폰 <br />번호
					</td>
					<td class="input"><input id="rphone" type="text" name="rphone" maxlength="11" placeholder=" - 없이 입력하세요"></td>
				</tr>
				<tr>
					<td class="title">시간</td>
					<td class="input"><span id="t">요일을 먼저 선택해 주세요</span>
					<c:forEach items="${TimeBtn }" var="t" >
						<div time="${t }" class="rtimeBtn">${fn:substring(t,0,2) }:${fn:substring(t,2,4) }</div>
                   	</c:forEach>
				</tr>
				<tr>
					<td class="title">인원</td>
					<td class="input">성인 <select name="radult_cnt" id="adult">
							<%for(int i=0;i<11;i++){ %>
							<option value="<%=i%>"><%=i %></option>
							<%} %>
					</select> &nbsp;&nbsp;아이(10세 이하) <select name="rchild_cnt" id="child">
							<%for(int i=0;i<11;i++){ %>
							<option value="<%=i%>"><%=i %></option>
							<%} %>
					</select>
					</td>
				</tr>
				<tr>
					<td class="title">매장식사/포장</td>
					<td class="input"><select name="reat">
							<option value="s">매장식사</option>
							<option value="p">포장</option>
					</select></td>
				</tr>
				<tr>
					<td class="title">비고</td>
					<td class="input"><textarea name="rbigo" cols="42" rows="5" placeholder="가족 모임입니다~ / 4인분 포장인데 1인분씩 포장해주세요"></textarea></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="예약하기">
					</td>
				</tr>
			</table>
		</aside>
	</form>
	</div>
	</main>
	<jsp:include page="/view/heesoo/bottom.jsp" flush="false" />
	<a href="../../../index.jsp"><div id="home">
			홈페이지
		</div></a>
</body>
</html>