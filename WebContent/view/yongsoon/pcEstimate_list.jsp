<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>

<%@page import="www.db.Db" %>
<%@page import="www.db.Idao" %>
<%@page import="www.db.dao.Main_customDAO" %>
<%@page import="www.db.dto.Main_customDTO" %>
<%@ page import = "java.util.ArrayList"%>
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
	String sql = "select * from main_custom";
	
	mdao.selectAll(sql);

// 	ArrayList<Main_customDTO> list = mdao.getList();
	pageContext.setAttribute("list", mdao.getList());
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
		<h2>견적리스트 게시판</h2>
		<table class="table">
    	<tr>
	        <td>멤버ID</td>
	        <td>CPU</td>
	        <td>VGA</td>
	        <td>POWER</td>
	        <td>MB</td>
	        <td>RAM1</td>
	        <td>RAM2</td>
	        <td>HDD</td>
	        <td>SSD</td>
	        <td></td>
		</tr>
	   	<c:forEach var="mdto" items="${list}">
	   	<tr>
	    <td> ${mdto.mcno} </td>
	    <td> ${mdto.cpu} </td>
	    <td> ${mdto.vga}</td>
	    <td> ${mdto.power} </td>
	    <td> ${mdto.mb} </td>
	    <td> ${mdto.ram1} </td>
	    <td> ${mdto.ram2} </td>
	    <td> ${mdto.hdd} </td>
	    <td> ${mdto.ssd} </td>
	    <td><a href="pcEstimate_content.jsp?mcno=${mdto.mcno}">상세보기</a></td>
	   	</tr> 
        </c:forEach>    
        <tr>
        <td><a href="pcEstimate.jsp">PC견적 작성하기 </a></td>
        </tr>
	   	</table>
		</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>