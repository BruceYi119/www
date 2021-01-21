<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="www.db.dao.CafeDAO"%>
<%
	// request값 가져오기
	String name = request.getParameter("name");
	String cno = request.getParameter("cno");
	String mtype = request.getParameter("mtype");
	CafeDAO dao = new CafeDAO();

	out.print(mtype);
	String sql = "select * from cafe where cno = ?";
	dao.select(sql, cno);

	if (name.equals(session.getAttribute("nick").toString()) || mtype.equals("a")) {
		sql = "delete from cafe where cno=?";
		dao.delete(sql, cno);
		response.sendRedirect("list.jsp");
	} else {
		// 이동 
		response.sendRedirect("content.jsp?cno=" + cno + "&chk=1");
	}
%>