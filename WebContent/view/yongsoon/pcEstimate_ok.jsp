<%@page import="www.db.dao.Main_customDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>      
<%
	// DB연결
	Main_customDAO dao = new Main_customDAO();
	    
    // request값
    request.setCharacterEncoding("utf-8");
    String cpu=request.getParameter("cpu");
    String vga=request.getParameter("vga");
    String power=request.getParameter("power");
    String mb=request.getParameter("mb");
    String ram1=request.getParameter("ram1");
    String ram2=request.getParameter("ram2");
    String hdd=request.getParameter("hdd");
    String ssd=request.getParameter("ssd");
    String pw=request.getParameter("pw");
    //String price=request.getParameter("price");
    
    //price는 일단 빼놨음
	String sql = "insert into main_custom(mcno, cpu,vga,power,mb,ram1,ram2,hdd,ssd,pw) values(s_main_custom.nextval,?,?,?,?,?,?,?,?,?)";
	dao.insert(sql, cpu,vga,power,mb,ram1,ram2,hdd,ssd,pw);
	
    response.sendRedirect("pcEstimate_list.jsp");
    
%>