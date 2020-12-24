<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String login = "";
%>
<c:set var="login" value="<%=login%>" />
<ul id="member">
	<li><a href="#">로그인</a></li>
	<li><a href="#">회원가입</a></li>
</ul>