<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="www.db.dao.RcommentDAO"%>
<%
	RcommentDAO rdao = new RcommentDAO();

	request.setCharacterEncoding("utf-8");
	String rcno = request.getParameter("rcno");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String rno = request.getParameter("rno");
	
	String sql = "update rcomment set name=?, content=?, where rcno=?";
	rdao.update(sql, name,content,rcno);
	
	response.sendRedirect("recipe_content.jsp?rbno="+rno);

%>