<%@page import="www.db.dao.StockBoarddatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
String sbdno = request.getParameter("sbdno");
String sbno = request.getParameter("sbno");
StockBoarddatDAO ddao = new StockBoarddatDAO();
String sql = "delete from stockboarddat where sbdno=" + sbdno;
ddao.delete(sql);
response.sendRedirect("board_content.jsp?sbno=" + sbno);
%>