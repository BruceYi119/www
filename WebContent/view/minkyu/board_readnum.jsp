<%@page import="www.db.dao.StockBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 
//db연결
String sbno =request.getParameter("sbno");
String pager=request.getParameter("pager");
String search = request.getParameter("search");
String sword  = request.getParameter("sword");
StockBoardDAO dao = new StockBoardDAO();
String sql = "update stockboard set readnum=readnum+1 where sbno="+sbno;
dao.update(sql);
response.sendRedirect("board_content.jsp?sbno="+sbno+"&pager="+pager+"&search="+search+"&sword="+sword);
%>