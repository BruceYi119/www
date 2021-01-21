<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%-- <%@ include file="/include/top.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    


<%
Header header = new Header();
String css = header.getCss();
String js = header.getJs();
String title = header.getTitle();
String headerUrl = header.getHeaderUrl();

Nav nav = new Nav();
String menu = nav.getMenu();

Footer footer = new Footer();
String footerUrl = footer.getFooterUrl();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%=title%></title>

<%=css%>
<link rel="stylesheet" href="/view/css/minkyu_basic_divide.css">
<%=js%>
</head>
<body>
	<input type="hidden" id="color_class" value="minkyu" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="true"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
				<div class="container">
					<div class="nav">
						<ul class="nav-list">
							<li class="nav-item"><a href="minkyu.jsp" class="nav-link">오늘의 증시</a></li>
							<li class="nav-item"><a href="stock_fund.jsp" class="nav-link">주식 | 펀드 차이</a></li>
							<li class="nav-item"><a href="basic_divide.jsp" class="nav-link">배당주 | 용어</a></li>
							<li class="nav-item"><a href="good_divide.jsp" class="nav-link">배당주 올바르게 투자하기</a></li>
							<li class="nav-item"><a href="ratio_divide.jsp" class="nav-link">배당수익률 | 조회</a></li>
							<li class="nav-item"><a href="finance_state.jsp" class="nav-link">재무제표 | 조회</a></li>
							<li class="nav-item"><a href="board.jsp" class="nav-link">수익 | 노하우 공유</a></li>
						</ul>
					</div>
			<div class="content">
			<h3>배당주를 알기 위한 기본 용어 정리</h3>
    	    <p>
	                 배당주에 대한 이해를 돕기 위해 이미지를 활용하여 안내드리도록 하겠습니다. 아래의 이미지는 (출처-https://kr.investing.com)에서 안내되는 일정입니다. 이를 
	                 토대로 배당주 용어에 대해서 간략히 정리해드리겠습니다.
            <img src="img/basic_divide.jpg" id="img">
	        <h3>배당락일</h3>
	                 당일 기준으로 주식을 사도 해당 주식의 배당금을 받을 수 없는 날을 뜻합니다. 그렇기 때문에 배당락일 전날 주식시장이 닫기전에 해당 주식을 매수 하여야 배당을 받을 수 있습니다.
	                 우리나라의 경우 장 마감이 오후 6시이므로, 배당락일 전일 오후 6시까지 매수하여 보유하여야만 배당을 받을 권리를 가질 수 있습니다.<p>
	        <h3>유형(TTM,3M)</h3>
			 이미지에 있는 TTM(Trailing Tweleve Months)은 영문 그대로 최근 12개월이라는 뜻으로 배당금 계산에서는 최근 1년간의 배당금을 기반으로 계산하겠다는 뜻으로 
			 이해하는게 좋습니다. 꼭 1년만 있는 것은 아닙니다. 3M의 경우는 3개월마다, 즉 분기마다 배당액을 지급한다는 뜻입니다. 우리나라의 배당주는 주로 결산배당, 중간배당, 분기배당의 용어를 주로 사용합니다.
			 특별한 사유가 있다면 이사회의 결정으로 배당을 지급할 수 있습니다.<p>
		 	<h3>지불일</h3>
		 	실제 배당액을 지불하는 시점으로 현금으로 배당을 지급하는 곳이 대부분이나 회사의 주식으로 지급하는 회사들도 있습니다. 사실상 배당을 받기위해 배당락일 전에 매수를 하고 
		 	실제 배당을 받는 일자라고 이해하면 좋습니다.<p>
		 	<h3>배당기준일</h3>
		 	배당을 지급받을 수 있는 주식 매수의 마지막날로 어떻게 보면 배당락일의 전날이라고 이해하시면 좋습니다.<p>
	 		<p>
			</div>	
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>