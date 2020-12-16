<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// request.setCharacterEncoding("utf-8");
// String aa = request.getParameter("aa");
// out.print(aa);

session.setAttribute("id", "dooly");
out.print("<p>" + session.getAttribute("id") + "</p>");
session.invalidate();
if (session.getAttribute("id") == null)
	out.print("<p>invalidate</p>");
%>