<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- gesipan / delete.jsp => dat / dat_delete.jsp  -->
<%@page import="www.db.dao.CdatDAO"%>
<%
// request값 가져오기
String dpwd = request.getParameter("dpwd"); // 사용자가 입력한 비밀번호
String cdno = request.getParameter("cdno"); // dat테이블의 id

CdatDAO dao = new CdatDAO();
String sql = "select * from cdat where cdno = ?";
dao.select(sql, cdno);

if (dpwd.equals(dao.getDto().getDpwd())) {
	sql = "delete from cdat where cdno=?";
	dao.delete(sql, cdno);
	
	response.sendRedirect("content.jsp?cno=" + dao.getDto().getCno());
} else
	response.sendRedirect("content.jsp?cno=" + dao.getDto().getCno() + "&chk=1");
%>

