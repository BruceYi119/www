<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="www.db.dao.Recipe_boardDAO"%>
<%
	Recipe_boardDAO dao = new Recipe_boardDAO();
	
	String rbno = request.getParameter("rbno");
	String sql = "update recipe_board set readnum=readnum+1 where rbno=?";
	dao.update(sql,rbno);
	
	response.sendRedirect("recipe_content.jsp?rbno="+rbno);
%>