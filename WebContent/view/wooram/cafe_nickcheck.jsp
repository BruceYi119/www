<%@page import="www.db.dao.CmemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 입력한 nick 값을 읽어오기
	String nick = request.getParameter("nick");

	CmemberDAO dao = new CmemberDAO();
	int chk = dao.isusernick(nick);

	out.print(chk); // 0 아니면 1
%>