<%@page import="www.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member m = new Member();

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id") != null ? request.getParameter("id") : null; 
String pw = request.getParameter("pw") != null ? request.getParameter("pw") : null;

boolean login = m.login(session, id, pw);

if (login)
	response.sendRedirect("/");
else
	response.sendRedirect("/view/member/login.jsp?login=false");
%>