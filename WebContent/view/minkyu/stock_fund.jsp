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
<link rel="stylesheet" href="/view/css/minkyu_stock_fund.css">
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
			<h3>주식이란 무엇일까?</h3>
    	    <p>
	                 주식 이란 주식회사의 자본을 이루는 단위로 금액이나 이를 전제로한 주주의 권리를 뜻 합니다. 하지만 사전적인 의미로는 내용을 이해하기 어렵습니다.
	                 쉽게 말해서 주식이란 쉽게 투자자로부터 돈을 받고 기업에 대한 권리와 의무를 발행해주는 부분이라고 이해하시면 쉽게 접근할 수 있습니다.
	        <h3>펀드란 무엇일까?</h3>
	                 펀드 란 많은 투자자들의 돈을 모아 기업에 투자하는 것을 펀드 라고 합니다. 흔히들 들어보시는 크라우드 펀딩 역시도 펀드의 일종이라고 볼 수 있습니다. 일반적인 주식투자에서
	                 개인투자자들은 어디에 얼마나 투자할 지 어렵기 때문에 금융기관을 통해서 펀드에 가입해 전문가를 통해 여러곳에 투자를 하게 됩니다. <p>
	        <h3>주식과 펀드의 차이</h3>
			 주식은 투자자가 투자금을 가지고 직접 매수와 매도를 하며 운용하기 때문에 직접 투자 라고 합니다. 반면 펀드는 투자자들의 투자금을 펀드매니저가 대신 사고 팔고 운용하는 것으로
		 	 간접 투자라고 합니다. 주식은 거래에 대한 수수료만 부과하고, 펀드는 간접 운용이기 때문에 수수료가 주식보다 더 부과 됩니다.<p>
		 	 <img src="img/stock_fund.jpg" id="img">
		 	<h3>주식의 장점</h3>
		 	회사의 경우 기업을 성장하기 위한 투자 자본을 확보할 수 있으며, 투자자(주주)의 경우 회사가 성장할 수록 수익을 얻을 수 있는 시스템입니다. <p>
		 	<div id="contable">
			1)수익성이 좋다<p>
			위험부담이 높지만 많은 사람들이 재테크 방법으로 이용하고 있는 이유 중 하나 입니다. 안정적으로 투자만 한다면 다른 투자 재테크에 비해 압도적으로 큰 수익을 얻을 수 있습니다.<p>
			2)환금성이 좋다<br>
			주식은 매일 거래가 이루어지는 만큼 주식을 현금화하고 싶을 때 언제든지 처분할 수 있습니다. 마찬가지로 언제든 사고 싶다면 시기와 상관없이 매수를 할 수 있습니다. <p>
			3)생각만큼 어렵지 않다.<br>
			재테크라고 해서 많은 지식을 필요로 한다고 생각할 수 있지만, 일반 시중은행의 입출금처럼 간단한 방법입니다. 모든 업무를 증권사가 대신해주고 있기 때문에 조금만 알아둔다면
			누구든지 손쉽게 주식투자를 시작 할 수 있습니다.
		 	</div>
		 	<p>
		 	<p>
		 	 <img src="img/stock_fund2.jpg" id="img">
		 	<h3>펀드의 장점</h3>
		 	여러 투자자로부터 자금을 모아 만든 대규모의 기금을 자산운용회사가 주식 및 채권 및 유가 증권 등에 투자하고 그에 따른 성과를 돌려주는 방식입니다.<p>
		 	<div id="contable">
		 	1)위험을 줄일 수 있다.<p>
		 	펀드는 주식 및 채권,어음,부동산,금,선박,미술품,원유 등 여러 종목에 분산하여 투자하기 때문에 집중투자에 따른 위험을 줄일 수 있습니다.<p>
		 	2)전문가가 대신 투자를 해준다<br>
		 	펀드의 가장 큰 특징으로, 주식과 채권 및 부동산에 전문지식을 가진 펀드매니저가 투자하고 운용하기 때문에 실패의 위험이 적습니다.<p>
		 	</div>
		 	<p>
		 	<h3>주식 vs 펀드</h3>
		 	<table id="contable1">
		 		<tr>
		 			<td id="td"><p></p>
		 			<td id="td">주식</td>
		 			<td id="td">펀드</td>
		 		</tr>
		 		<tr>
		 			<td id="td1">공통점</td>
		 			<td colspan="2">본인의 책임하에 투자하여 원금손실 위험은 존재한다</td>
		 		</tr>
		 		<tr>
		 			<td id="td1">차이점</td>
		 			<td id="td2">직접투자를 하기 때문에 하이리스크 하이리턴의 성격을 갖는다</td>
		 			<td id="td2">간접투자를 하기 때문에 다수의 투자자와 수익을 분배함으로 많은 수익을 갖지 못 한다</td>
		 		</tr>
		 		<tr>
		 			<td id="td1">투자분야</td>
		 			<td id="td2">한 종목에 투자</td>
		 			<td id="td2">수 많은 상품에 나눠서 집합투자</td>
		 		</tr>
		 		<tr>
		 			<td id="td1">수익구조</td>
		 			<td id="td2">투자자 스스로 투자한 자금에서 손익을 결정</td>
		 			<td id="td2">집합 자금으로 진행된 손익을 지분으로 나눔</td>
		 		</tr>
		 		<tr>
		 			<td id="td1">위험율</td>
		 			<td id="td2">상대적으로 높다</td>
		 			<td id="td2">상대적으로 낮다</td>
		 		</tr>
		 	</table>
		 		<p>
		 		<h3>펀드와 주식의 단순 확률 비교</h3>
		 		항상 일정할 수는 없지만 국내를 기준으로 판매 되고 있는 주식과 펀드의 수를 살펴보겠습니다. 주식은 상장이 폐지되거나 새롭게 상장하는 등의 차이는 존재하지만 보편적으로
		 		1000~1300개 규모로 주식시장에서 운용되고 있습니다. <br>
		 		펀드 역시도 새롭게 펀드를 구성하거나 운용이 종료되면서 차이는 존재하나 펀드의 갯수는 7000~8000개 내외의 규모로 주식시장에서 운용되고 있습니다.<p>
		 		즉, 이말은 단순하게 아무런 지식없이 투자를 한다고 했을때 독립변수로 수익과 손실 50%의 확률을 가지겠지만 주식시장이 호황이라면 확률적으로 주식투자가 조금 더 수익을 가능성이 높다고 볼 수 있습니다.
		 		
		 		
			</div>	
		
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>