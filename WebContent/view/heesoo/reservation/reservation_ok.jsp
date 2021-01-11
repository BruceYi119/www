<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String date = request.getParameter("date");
String time = request.getParameter("time");
String adult_cnt = request.getParameter("adult_cnt");
String child_cnt = request.getParameter("child_cnt");
String eat = request.getParameter("eat");
String bigo = request.getParameter("bigo");

String sql = "insert into reservation values(rno_seq.next(),?,?,?,?,?,?,?,?)";
%>