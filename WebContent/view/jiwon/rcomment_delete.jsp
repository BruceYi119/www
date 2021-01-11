<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="www.db.dao.RcommentDAO"%>
<%

String rno=request.getParameter("rno");		//글 기준번호
String rcno=request.getParameter("rcno");	//댓글번호
RcommentDAO	dao = new RcommentDAO();

String sql = "delete from rcomment where rcno=?";
dao.delete(sql,rcno);

response.sendRedirect("recipe_content.jsp?rbno="+rno);
%>