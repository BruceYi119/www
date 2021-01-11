<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>      
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/su";
	String userid="su";
	String pw="0323";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번

	request.setCharacterEncoding("utf-8");
	String rdate=request.getParameter("rdate");
	String rtime=request.getParameter("rtime");
	String rname=request.getParameter("rname");
	String rphone=request.getParameter("rphone");
	String radult_cnt=request.getParameter("radult_cnt");
	String rchild_cnt=request.getParameter("rchild_cnt");
	String reat=request.getParameter("reat");
	String rbigo=request.getParameter("rbigo");
	
	String sql="insert into reservation(rdate,rtime,name,phone,adult_cnt,child_cnt,eat,bigo,writedate) values(?,?,?,?,?,?,?,?,now())";
	PreparedStatement pstmt= conn.prepareStatement(sql);
	pstmt.setString(1,rdate);
	pstmt.setString(2,rtime);
	pstmt.setString(3,rname);
	pstmt.setString(4,rphone);
	pstmt.setString(5,radult_cnt);
	pstmt.setString(6,rchild_cnt);
	pstmt.setString(7,reat);
	pstmt.setString(8,rbigo);
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("reservation_thanks.jsp");
%>