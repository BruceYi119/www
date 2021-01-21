<%@page import="www.db.dao.StockBoardDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
String path = "C:\\tom\\projects\\www\\WebContent\\view\\minkyu\\img";
int size = 1024*1024*10;
String han = "UTF-8";
MultipartRequest multi = new MultipartRequest(request,path,size,han,new DefaultFileRenamePolicy());

int sbno = Integer.parseInt(multi.getParameter("sbno"));
String name = multi.getParameter("name");
String title = multi.getParameter("title");
String content = multi.getParameter("content");
String fname = multi.getFilesystemName("fname");
String sung  =  multi.getParameter("sung");
String pwd = multi.getParameter("pwd");
String kind = multi.getParameter("kind");

StockBoardDAO dao = new StockBoardDAO();
String sql = "select * from stockboard where sbno="+sbno;
dao.select(sql);

if(pwd.equals(dao.getDto().getPwd())){
	sql = "update stockboard set name=?, title=?, content=?, fname=?, sung=?, kind=? where sbno="+sbno;
	dao.update(sql,name,title,content,fname,sung,kind);
	response.sendRedirect("board.jsp?sbno="+sbno);
}else{
	response.sendRedirect("board_update.jsp?sbno="+sbno+"&chk=1");
}
%>