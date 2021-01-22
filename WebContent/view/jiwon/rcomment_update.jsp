<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="www.db.dao.RcommentDAO"%>
<%
RcommentDAO rdao = new RcommentDAO();

request.setCharacterEncoding("utf-8");
String rcno = request.getParameter("rcno");
String name = request.getParameter("name");
String content = request.getParameter("content");
String rbno = request.getParameter("rbno");

String sql = "update rcomment set content=? where rcno=? and name=?";
rdao.update(sql, content, rcno, name);
response.sendRedirect("recipe_content.jsp?rbno=" + rbno);
%>