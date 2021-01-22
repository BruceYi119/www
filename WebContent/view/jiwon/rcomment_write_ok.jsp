<%@page import="www.db.dao.RcommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
RcommentDAO rdao = new RcommentDAO();
request.setCharacterEncoding("utf-8");
String name=request.getParameter("name");
String content=request.getParameter("content");
String rbno=request.getParameter("rbno");
//out.print(name+content+rbno);
String sql = "insert into rcomment(rcno,name,content,writeday,rbno) values (s_rcomment.nextval,?,?,sysdate,?)";
rdao.insert(sql,name,content,rbno);

response.sendRedirect("recipe_content.jsp?rbno="+rbno);  
%>