<%@page import="www.db.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id") != null ? request.getParameter("id") : "";

MemberDAO dao = new MemberDAO();
String sql = "select rownum, t.* from member t where id = ?";

dao.select(sql, id);

if (dao.getDto() != null) {
	out.print("{ \"check\": true }");
} else {
	out.print("{ \"check\": false }");
}
%>