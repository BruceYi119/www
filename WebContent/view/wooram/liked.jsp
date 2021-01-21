<%@page import="www.db.dao.CafeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//request 값
	String cno = request.getParameter("cno");

	CafeDAO dao = new CafeDAO();
	String sql = "update cafe set liked = liked + 1 where cno = ?";
	dao.update(sql, cno);
	sql = "select rownum, t.* from cafe t where cno = ?";
	dao.select(sql, cno);

	out.print(dao.getDto().getLiked());
%>