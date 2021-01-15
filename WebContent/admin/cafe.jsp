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
<title>관리자</title>
<%=css%>
<%=js%>
</head>
<body>
	<div id="wrap">
		<input type="hidden" id="active" value="4" />
		<%@ include file="/admin/layout/header.jsp" %>
		<main>
			<div class="container-fluid">
				<div class="w3-white w3-padding notranslate fix mt-3"><h3>애완동물카페</h3></div>
			</div>
		</main>
	</div>
</body>
</html>