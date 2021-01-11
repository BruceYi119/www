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
<style type="text/css">

	h2{ text-align: center;}
	#first li{
		list-style-type: none;
		display: inline-block;
		margin-left: 30px;
		padding-left:15px;
		padding-top: 10px;
		text-align: center;
		}
/* --------------------------------------------- */
	.container {
  	overflow: hidden;
	}
	.first{
		text-align: center;
	}
	.nav {
		float: left;  
		width: 180px;
		background: #7b9acc;
		color: #fff;
		padding: 10px;
	}
	
	.nav-list {
		list-style: none;
		padding: 10px 0;
		
	}
	
	.nav-item {
		margin: 4px 0;
	}
	
	.nav-link {
		display: block;
		text-decoration: none;
		color: #FCF6F5;
		text-align: center;
	}
	.nav-link:visited{
		color:#FCF6F5;
	}
	.nav-link:hover {
		background: #5CC8D7;
	}
	.content{
		width:930px;
		height:1350px;
		float: right;
	}
	#second{
	
		width:100%;
		height:600px;
	}
	#table{
		padding-left: 20px;
		border: 1px solid #cccccc;
		margin: auto;
		width:800px;
	}
	#table #tr1 td{
		padding: 20px;
		border: 1px solid #cccccc;
		
		}
		
	#table #tr2 td{
	text-align: center;
	border: 1px solid #cccccc;
		
		}
</style>
<%=css%>
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
			<h1>오늘의 증시</h1>
     		 <iframe width="100%" style="height:100%" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vSmT6rcdguvt1m-t81z2TCagyqCoMZ_GiB6Rim3v3svDJGa7c9JaF7FJnqBJ3qVhn7NiClUJqzzWbrI/pubhtml?widget=true&amp;headers=false"></iframe>
			</div>		
		
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>