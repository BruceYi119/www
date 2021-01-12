<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="www.db.dao.CafeDAO"%>
<%
// cos.jar 라이브러리를 통해 파일을 업로드 시키다..
String path = "C:/WK/workspace/cafe/WebContent/img";
int size = 1024 * 1024 * 10;
String han = "utf-8";
MultipartRequest multi = new MultipartRequest(request, path, size, han, new DefaultFileRenamePolicy());

//입력값 가져오기
String writype = multi.getParameter("writype");
String animal = multi.getParameter("animal");
String title = multi.getParameter("title");
String name = multi.getParameter("name");
String pwd = multi.getParameter("pwd");
String content = multi.getParameter("content");
String fname = multi.getFilesystemName("fname");
String fimsi = multi.getParameter("fimsi");
String cno = multi.getParameter("cno");

if (fname == null)
	fname = multi.getParameter("fimsi");
else
	fimsi = multi.getFilesystemName("fname");

CafeDAO dao = new CafeDAO();
String sql = "select * from cafe where cno = ?";
dao.select(sql, cno);
out.print(dao.getDto().getPwd());

if (pwd.equals(dao.getDto().getPwd())) //비밀번호 확인용 메소드
{
	
	sql = "update cafe set name=?,title=?,writype=?,animal=?,content=?,fname=?,fimsi=? where cno=?";
	int r=dao.update(sql, name, title, writype, animal, content, fname, fimsi, cno);
	
	//out.print(sql);
	//out.print(r);
	//out.print(name+" "+title+" "+writype+" "+animal+" "+content+" "+fname+" "+fimsi+" "+cno);
	
	//이동할 문서
	//response.sendRedirect("content.jsp?cno=" + cno);

} else {
	//response.sendRedirect("update.jsp?cno=" + cno + "&chk=1");
}
%>