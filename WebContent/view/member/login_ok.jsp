<%@page import="www.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member m = new Member();
boolean login = false;

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id") != null ? request.getParameter("id") : null;
String pw = request.getParameter("pw") != null ? request.getParameter("pw") : null;
String admin = request.getParameter("admin") != null ? request.getParameter("admin") : null;

if (admin != null && admin.equals("on"))
	login = m.adminLogin(session, id, pw);
else
	login = m.login(session, id, pw);

if (login) {
	if (admin != null && admin.equals("on"))
		response.sendRedirect("/admin/admin.jsp");
	else
		response.sendRedirect("/");
} else {
	response.sendRedirect("/view/member/login.jsp?login=false");	
}
%>