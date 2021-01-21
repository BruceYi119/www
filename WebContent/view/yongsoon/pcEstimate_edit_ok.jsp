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
    String cpu=request.getParameter("cpu");
    String vga=request.getParameter("vga");
    String power=request.getParameter("power");
    String mb=request.getParameter("mb");
    String ram1=request.getParameter("ram1");
    String ram2=request.getParameter("ram2");
    String hdd=request.getParameter("hdd");
    String ssd=request.getParameter("ssd");

    //pcEstimate_edit 에서 확인용으로 입력한 패스워드
	String edit_pw=request.getParameter("edit_pw");
 	String sql = "update main_custom set cpu = ?, vga = ?, power =?, mb=?, ram1=?, ram2=?, hdd=?, ssd=? where mcno = ? and pw = ?";
 	mdao.update(sql, cpu, vga, power, mb, ram1, ram2, hdd, ssd, mcno, edit_pw);

	response.sendRedirect("/view/yongsoon/pcEstimate_content.jsp?mcno="+mcno);
%>