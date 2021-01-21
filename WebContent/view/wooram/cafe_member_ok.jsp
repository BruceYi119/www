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
	String reason = request.getParameter("reason");
	String pobu = request.getParameter("pobu");

	out.println(session.getAttribute("id").toString());
	out.print(nick + reason + pobu);

	//insert

	String sql = "insert into cmember(cmno,nick,id,reason,pobu)";
	sql = sql + " values(s_cmember.nextval,?,?,?,?)";

	CmemberDAO dao = new CmemberDAO();

	int r = dao.insert(sql, nick, session.getAttribute("id").toString(), reason, pobu);
	Boolean login = dao.nick_login(session, session.getAttribute("id").toString());

	//이동할 문서
	response.sendRedirect("list.jsp?chk=1");
	out.println(r);
%>