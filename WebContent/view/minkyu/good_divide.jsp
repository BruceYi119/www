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
<link rel="stylesheet" href="/view/css/minkyu_good_divide.css">
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
			<h3>어떤 배당주가 좋은 주식일까?</h3>
    	    <p>
	                 좋은 배당주가 되기 위한 조건에는 여러가지가 있지만 그 중에 몇가지를 꼽자면 다음과 같습니다. 
            <ul class="content-list">
            	<li class="content-item">배당 수익률이 3%~5% 정도로 만족할만한 수준인 주식</li>
            	<li class="content-item">되도록 이면 자주 배당을 주는 주식</li>
            	<li class="content-item">배당성향이 30%이상 70%미만인 적당한 주식</li>
            	<li class="content-item">배당액이 꾸준하게 유지되거나 조금이라도 올라가는 주식</li>
            	<li class="content-item">주가가 크게 오르지는 않아도 지속적으로 완만하게 오르는 주식</li>
	        </ul>
	        <h3>배당 수익률이 3%~5% 정도로 만족할만한 수준인 주식</h3>
	                 현재 은행에 단순 예금을 넣었을 때보다 더 높은 수익을 얻어야만 적어도 투자의 가치가 성립됩니다. 단순하게 은행에 넣어도 2%의 이자를 주는데 배당 수익이 1%라면 굳이 투자를
	                 할 필요가 없습니다. 기본적으로 1주당 5만원인 주식을 샀을때, 1500원의 배당금을 받아야 3%의 수익을 올릴 수 있다. 하지만 500원의 배당금을 받았다면 1%의 수익밖에 되지 않는다.
	                 그렇기 때문에 최소 3%(은행이자)보다는 높고 5% 정도면 양호한 편이라고 볼 수 있다.
            <img src="img/good_divide.png" id="img">
            <img src="img/good_divide2.png" id="img">
	        <h3>되도록 이면 자주 배당을 주는 주식</h3>
			우리나라는 보통 1년에 한번 배당을 하는 것이 일반적이지만, 때에 따라서 분기마다 배등을 하는 경우도 있습니다. 당연히 배당을 1년에 한 번 하는 것보다 자주 하는 것이 좋습니다.
			1년에 1번 배당을 받기위해 투자를 한다는 것이 생각보다 지루하고, 주식시장은 매일 열리기 때문에 많은 유혹이 있기 때문입니다. 배당을 자주 받을수록 그 금액에 따른 재투자가 발생하는점도
			있기 때문에 자주 배당할수록 투자자에게는 유리합니다.
		 	<h3>배당성향이 30%이상 70%미만인 적당한 주식</h3>
		 	회사가 최종적으로 벌어들인 돈에서 어느 정도의 비중을 배당으로 지급하는 비율을 배당성향이라고 말합니다. 가령 1000억을 벌어들인 회사가 1000억 모두 배당으로 지급한다면 좋은 경영이라고 할까요?
		 	물론 주주 입장에서는 단기적으로 좋을 수 있지만 사업이라는 것이 항상 최악의 상황을 대비해야 되기 때문에 장기적으론 좋지 않은 투자처로 꼽힐 수 있습니다. 그렇기 떄문에 어느정도
		 	인내할 수 있는 수준의 배당을 지급하는 회사가 적당한 수준을 유지한다고 볼 수 있습니다.<p>
		 	<h3>배당기배당액이 꾸준하게 유지되거나 조금이라도 올라가는 주식</h3>
		 	동일하게 주식 투자를 하더라도 배당액을 꾸준히 늘려온 기업의 주식은 어느정도 신뢰성이 있습니다. 미국의 경우는 배당에 대한 체계가 굉장히 잘 잡혀 있습니다.
		 	<img src="img/good_divide3.png" id="img">
		 	가장 상단에 배당킹 이라는 지위는 50년이상인 경우인데 경제위기에도 주주들에게 고정적인 배당을 지급했다는 부분입니다. 그 만큼 어느정도 배당과 유보율을 잘 관리했다고 볼 수 있습니다.<p>
		 	<h3>주가가 크게 오르지는 않아도 지속적으로 완만하게 오르는 주식</h3>
		 	 궁극적으로 좋은 배당주는 배당을 위해 내가 주식을 샀더라도 내가 샀을 때보다 나중에 주식이 오르는 것입니다. 연마다 배당을 위해 주식을 샀다고 하더라도 목돈이 필요해 해당 주식을 전부 정리할 때
		 	 당연히 매수한 가격보다 비싼 가격에 팔 수 있다면 좋을 것이다. 길게 보았을 때 지속적으로 상승했다면 글로벌 금융위기 때도 심하게 떨어지지 않았다면 그 주식은  좋은 주식일 것입니다.
	 		<img src="img/good_divide4.png" id="img">
	 		우리나라의 대표주식인 삼성전자를 보면 10년간의 굴곡은 있지만 꾸준하게 상승하는 모습을 볼 수 있습니다. 참 좋은 기업이라고 볼 수 있겠죠?
	 		<p>
			</div>	
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>