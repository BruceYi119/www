<%@page import="www.db.dao.RcommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
RcommentDAO rdao = new RcommentDAO();
request.setCharacterEncoding("utf-8");
String name=request.getParameter("name");
String content=request.getParameter("content");
String rno=request.getParameter("rno");

String sql = "insert into rcomment(rcno,name,content,writeday,rno) values (s_rcomment.nextval,?,?,sysdate,?)";
rdao.insert(sql, name,content,rno);

response.sendRedirect("recipe_content.jsp?rbno="+rno);  
%>