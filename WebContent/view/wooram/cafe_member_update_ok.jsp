<%@page import="www.db.dao.CmemberDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// cos.jar 라이브러리를 통해 파일을 업로드 시키다..
	request.setCharacterEncoding("utf-8");

	//입력값 가져오기
	String cmno = request.getParameter("cmno");
	String reason = request.getParameter("reason");
	String pobu = request.getParameter("pobu");

	//insert

	String sql = "update cmember set reason=?,pobu=? where cmno=?";

	CmemberDAO dao = new CmemberDAO();

	int r = dao.update(sql, reason, pobu, cmno);
	out.println(r);
	//이동할 문서
	response.sendRedirect("list.jsp");
%>