<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="www.db.dao.CafeDAO"%>
<%
	//request 값
	String cno = request.getParameter("cno");

	CafeDAO dao = new CafeDAO();

	String sql = "update cafe set readnum=readnum + 1 where cno = ?";

	dao.update(sql, cno);

	// 이동
	response.sendRedirect("content.jsp?cno=" + cno);
%>