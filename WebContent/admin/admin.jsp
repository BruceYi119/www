<%@page import="www.html.header.Header"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Header h = new Header();
String css = h.getCss("admin");
String js = h.getJs("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/view/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title>관리자</title>
<%=css%>
<%=js%>
</head>
<body>
	<div id="wrap">
		<input type="hidden" id="active" value="1" />
		<%@ include file="/admin/layout/header.jsp" %>
		<main>
			<div class="container-fluid">
				<div class="w3-white w3-padding notranslate fix mt-3"><h3>관리자 메인</h3></div>
			</div>
		</main>
	</div>
</body>
</html>