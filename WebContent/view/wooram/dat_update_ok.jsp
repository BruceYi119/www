<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="www.db.dao.CdatDAO"%>
<%
	// request값 가져오기
	request.setCharacterEncoding("utf-8");
	String cno = request.getParameter("cno");
	String cdno = request.getParameter("cdno");
	String dname = request.getParameter("dname");
	String dcontent = request.getParameter("dcontent");

	CdatDAO dao = new CdatDAO();
	String sql = "select * from cdat where cdno = ?";
	dao.select(sql, cdno);
	out.print(dao.getDto().getCno() + " , " + cno + " , " + cdno + " , " + dname + " , " + dcontent);

	// 입력한 비밀번화,DB에 있는 비밀번호가 같으냐?
	if (dname.equals(session.getAttribute("nick").toString())) {
		sql = "update cdat set dcontent=? where cdno=?";
		dao.update(sql, dcontent, cdno);
		// 문서이동
		out.print(dao.getDto().getCno());
		response.sendRedirect("content.jsp?cno=" + cno);
	} else {
		out.print(dao.getDto().getCno());
		response.sendRedirect("content.jsp?cno=" + cno + "&dchk=1");
	}
%>








