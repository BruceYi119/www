<%@page import="www.member.Member"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member m = new Member();

boolean login = m.isLogin(session);
pageContext.setAttribute("login", login);

if (login)
	pageContext.setAttribute("name", session.getAttribute("name"));
%>
<c:if test="${login}">
<ul id="member">
	<li><a href="/view/member/member_info.jsp">${name}</a> 님 환영합니다!</li>
	<li><a href="/view/member/member_info.jsp">회원정보</a></li>
	<li><a href="/view/member/logout.jsp">로그아웃</a></li>
</ul>
</c:if>
<c:if test="${!login}">
<ul id="member">
	<li><a href="/view/member/login.jsp">로그인</a></li>
	<li><a href="/view/member/terms.jsp">회원가입</a></li>
</ul>
</c:if>