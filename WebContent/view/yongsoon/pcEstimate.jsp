<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@page import="www.db.dao.Main_customDAO" %>
<%@page import="www.db.dto.Main_customDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="/include/top.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

Main_customDAO mdao = new Main_customDAO();
Main_customDTO mdto = new Main_customDTO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/view/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title><%=title%></title>
<%=css%>
<%=js%>
<script defer src="/view/js/pcEstimateFunc.js"></script>
<style>
.sub, #amd_gen, #amd2_item, #intel_gen, #amd2_item, #amd3_item, #amd4_item, 
#intel8_item, #intel9_item, #intel10_item { display: none; }
</style>

</head>
<body>
	<input type="hidden" id="color_class" value="yongsoon" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="true"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="base_wrap">
				<h2>견적 작성하기</h2>
				<table class="table">
					<form method="post" action="pcEstimate_ok.jsp">
					    
						<tr>
						   <td>CPU</td> 
						   <td><select id="cpu_com">
					            <option value="0">기업선택</option>
					            <option value="1">AMD</option>
					            <option value="2">INTEL</option>
					           </select>
					       </td>
					       
					       <!-- cpu 세대 -->
					        <td>
					        <select id="amd_gen">
					            <option value="0">세대선택</option>
					            <option value="2">2세대</option>
					            <option value="3">3세대</option>
					            <option value="4">4세대</option>
					        </select>
					       
					        <select id="intel_gen">
					            <option value="0">세대선택(8+)</option>
					            <option value="8">8세대</option>
					            <option value="9">9세대</option>
					            <option value="10">10세대</option>
					        </select>
					       </td>
					       
					       <!-- cpu 세대 선택후 제품군 -->
					        <td>
					        <select name="cpu">
					            <option value="0">세대를 먼저 선택하시오</option>
					        </select>
					       </td> 
						</tr>
						
						<tr>
						  <td>VGA</td><td><input type = "text" name="vga"></td>
						</tr>
						
						<tr><td>POWER</td><td><input type = "text" name="power"></td></tr>
						<tr><td>MB</td><td><input type = "text" name="mb"></td></tr>
						<tr><td>RAM1</td><td><input type = "text" name="ram1"></td></tr>
						<tr><td>RAM2</td><td><input type = "text" name="ram2"></td></tr>
						<tr><td>HDD</td><td><input type = "text" name="hdd"></td></tr>
						<tr><td>SSD</td><td><input type = "text" name="ssd"></td></tr>
						<tr><td>PRICE</td><td><input type = "text" name="price"></td></tr>
						<tr><td><input type="submit" value="견적완료" id="submit"></td></tr>
					</form>
				</table>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>