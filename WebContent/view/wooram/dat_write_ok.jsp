<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="www.db.dao.CdatDAO"%>
<%
//request값
request.setCharacterEncoding("utf-8");
String cno = request.getParameter("cno");
String dname = request.getParameter("dname");
String dcontent = request.getParameter("dcontent");
String dpwd = request.getParameter("dpwd");

CdatDAO dao = new CdatDAO();
String sql = "insert into cdat(cdno,dname,dcontent,dpwd,cno)";
sql = sql + " values(s_cdat.nextval,?,?,?,?)";

dao.insert(sql, dname, dcontent, dpwd, cno);

response.sendRedirect("content.jsp?cno=" + cno);
%>
