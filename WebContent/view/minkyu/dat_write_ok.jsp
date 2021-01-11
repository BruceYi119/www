<%@page import="www.db.dao.StockBoarddatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%
request.setCharacterEncoding("UTF-8");
String sbno = request.getParameter("sbno");
String name = request.getParameter("name");
String content = request.getParameter("content");
StockBoarddatDAO ddao = new StockBoarddatDAO();
String sql = "insert into stockboarddat (sbdno,name,content,writeday,sbno) values (s_stockboarddat.nextval,?,?,sysdate,"+sbno+")";
ddao.insert(sql,name,content);
out.print(sql);
response.sendRedirect("board_content.jsp?sbno="+sbno);
%>
    
    
    
    
    
    
    
    
    
    
    