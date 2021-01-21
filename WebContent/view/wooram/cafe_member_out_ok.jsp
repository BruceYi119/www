<%@page import="www.db.dao.CmemberDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// cos.jar 라이브러리를 통해 파일을 업로드 시키다..
	request.setCharacterEncoding("utf-8");

	//입력값 가져오기
	String nick = request.getParameter("nick");
	String del_yn = "y";

	String sql2 = "select * from cmember where nick = ?";
	String sql = "update cmember set id=?, del_yn=? where nick=?";
	CmemberDAO dao = new CmemberDAO();

	dao.select(sql2, nick);

	String id = "(강퇴)" + dao.getDto().getId();
	int r = dao.update(sql, id, del_yn, nick);
	//out.println(r);
	out.print(nick + " " + id + " " + del_yn);
	//이동할 문서
	response.sendRedirect("list.jsp");
%>