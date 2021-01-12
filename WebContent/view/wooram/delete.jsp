<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="www.db.dao.CafeDAO"%>
<%
// request값 가져오기
String pwd = request.getParameter("pwd");
String cno = request.getParameter("cno");

CafeDAO dao = new CafeDAO();

String sql = "select * from cafe where cno = ?";
dao.select(sql, cno);

if (pwd.equals(dao.getDto().getPwd())) {
	sql = "delete from cafe where cno=?";
	dao.delete(sql, cno);
	response.sendRedirect("list.jsp");
} else {
	// 이동 
	response.sendRedirect("content.jsp?cno=" + cno + "&chk=1");
}
%>