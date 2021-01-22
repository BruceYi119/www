<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="www.db.dao.RcommentDAO"%>
<%
String name=request.getParameter("name");	//지우는사람이름
String rbno=request.getParameter("rbno");		//글 기준번호
String rcno=request.getParameter("rcno");	//댓글번호
RcommentDAO	dao = new RcommentDAO();

String sql = "delete from rcomment where rcno=? and name=?";
dao.delete(sql,rcno,name);

response.sendRedirect("recipe_content.jsp?rbno="+rbno);
%>