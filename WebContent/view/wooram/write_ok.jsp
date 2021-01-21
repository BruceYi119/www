<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="www.db.dto.CafeDTO"%>
<%@ page import="www.db.dao.CafeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// cos.jar 라이브러리를 통해 파일을 업로드 시키다..
	request.setCharacterEncoding("utf-8");
	String path = request.getSession().getServletContext().getRealPath("/upload/img/");
	int size = 1024 * 1024 * 10;
	String han = "utf-8";
	MultipartRequest multi = new MultipartRequest(request, path, size, han, new DefaultFileRenamePolicy());

	//입력값 가져오기
	String writype = multi.getParameter("writype");
	String animal = multi.getParameter("animal");
	String title = multi.getParameter("title");
	String name = multi.getParameter("name");
	String content = multi.getParameter("content");
	String fname = multi.getFilesystemName("fname");
	String fimsi = multi.getFilesystemName("fname");

	//insert

	String sql = "insert into cafe(cno,writype,animal,title,name,content,fname,fimsi)";
	sql = sql + " values(s_cafe.nextval,?,?,?,?,?,?,?)";

	CafeDAO dao = new CafeDAO();

	int r = dao.insert(sql, writype, animal, title, name, content, fname, fimsi);
	System.out.println(r);
	//이동할 문서
	response.sendRedirect("list.jsp");
%>