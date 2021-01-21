<%@page import="www.db.dao.MymovielistDAO" %>
<%@page import="www.db.dao.MystoryDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String title = request.getParameter("title");
String id = request.getParameter("id");

MymovielistDAO mydao = new MymovielistDAO();
String sql="delete from mymovielist where title="+"'"+title+"'"+" and id="+"'"+id+"'";
mydao.delete(sql);

MystoryDAO sdao = new MystoryDAO();
sql="delete from storyboard where movietitle='"+title+"' and id='"+id+"'";
sdao.delete(sql);

response.sendRedirect("mypage.jsp");
%>