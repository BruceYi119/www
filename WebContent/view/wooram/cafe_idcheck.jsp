<%@page import="www.db.dao.CmemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="www.db.dao.CafeDAO"%>
<%

	CmemberDAO dao = new CmemberDAO();
	int chk = dao.isuserid(session.getAttribute("id").toString());
	out.print(session.getAttribute("id").toString());
	
	
	if(chk==1)
	{
		Boolean login = dao.nick_login(session, session.getAttribute("id").toString());
		
		response.sendRedirect("list.jsp?chk="+chk);
		out.print(login);
	}
	else
	{
		response.sendRedirect("cafe_member.jsp?chk="+chk);
	}

	
	out.print(chk); // 0 아니면 1
%>