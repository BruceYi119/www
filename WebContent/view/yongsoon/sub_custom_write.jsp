<%@page import="www.db.dao.Sub_customDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String mcno = request.getParameter("mcno");
	String scontent = request.getParameter("scontent");
	String sname = request.getParameter("sname");
	String spw = request.getParameter("spw");
	
	Sub_customDAO sdao = new Sub_customDAO();
	String sql = "insert into sub_custom values(s_sub_custom.nextval, ?, ?, ?, ?)";
	
	sdao.insert(sql, sname, scontent, spw, mcno);
	response.sendRedirect("/view/yongsoon/pcEstimate_content.jsp?mcno=" + mcno);
%>