<%@page import="www.db.dto.MystoryDTO"%>
<%@ page import="www.db.dao.MystoryDAO"%>
<%@ page import="www.db.dto.MystoryDTO"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String content=request.getParameter("content");
String movietitle=request.getParameter("title");
String id=request.getParameter("id");

MystoryDAO sdao = new MystoryDAO();
String sql="update storyboard set content="+"'"+content+"'"+"where movietitle="+"'"+movietitle+"'"+" and id="+"'"+id+"'";
int r = sdao.update(sql);

response.sendRedirect("mypage.jsp?");
%>