<%@page import="www.db.dao.Sub_customDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="www.db.Db" %>
<%@page import="www.db.Idao" %>
<%@page import="www.db.dao.Main_customDAO" %>
<%@page import="www.db.dto.Main_customDTO" %>
<%@page import="www.db.dao.Sub_customDAO" %>
<%@page import="www.db.dto.Sub_customDTO" %>
<%@ page import = "java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	// DB연결
	request.setCharacterEncoding("utf-8");
	String mcno = request.getParameter("mcno");  
	
	Sub_customDAO sdao = new Sub_customDAO();  

	//pcEstimate_content 에서 확인용으로 입력한 패스워드
	String sub_del_pw=request.getParameter("sub_del_pw");
	String sql = "delete from sub_custom where spw = ?";	
	
	sdao.delete(sql, sub_del_pw);
	response.sendRedirect("/view/yongsoon/pcEstimate_content.jsp?mcno="+mcno);
%>