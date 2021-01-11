<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="www.db.dao.Recipe_boardDAO"%>
<%

Recipe_boardDAO	dao = new Recipe_boardDAO();

String rbno = request.getParameter("rbno");
String sql = "delete from recipe_board where rbno=?";
dao.delete(sql,rbno);

response.sendRedirect("recipe_list.jsp");
%>