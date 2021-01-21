<%@page import="www.db.dao.Main_customDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="www.db.Db" %>
<%@page import="www.db.Idao" %>
<%@page import="www.db.dao.Main_customDAO" %>
<%@page import="www.db.dto.Main_customDTO" %>
<%@ page import = "java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
  
<%@page import="java.sql.*" %>      
<%
	// DB연결
	Main_customDAO mdao = new Main_customDAO();
	String mcno =request.getParameter("mcno");    
	
    //pcEstimate_content 에서 확인용으로 입력한 패스워드
	String del_pw=request.getParameter("del_pw");
	String sql = "delete from main_custom where mcno = ? and pw = ?";	

	mdao.delete(sql, mcno, del_pw);
	response.sendRedirect("pcEstimate_list.jsp");
%>