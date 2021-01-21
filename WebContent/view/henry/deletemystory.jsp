<%@page import="www.db.dao.MystoryDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sno = request.getParameter("sno");
String id = request.getParameter("id");

MystoryDAO sdao = new MystoryDAO();
String sql="delete from storyboard where sno="+sno+" and id="+"'"+id+"'";
sdao.delete(sql);

response.sendRedirect("mypage.jsp");
%>