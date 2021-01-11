<%@page import="www.db.dao.StockBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*" %>      
<% 
//db연결
String sbno = request.getParameter("sbno");
String sql = "update stockboard set bad=bad-1 where sbno="+sbno;
StockBoardDAO dao = new StockBoardDAO();
dao.update(sql);
response.sendRedirect("board_content.jsp?sbno="+sbno);
%>