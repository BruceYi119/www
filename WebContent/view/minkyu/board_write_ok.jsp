<%@page import="www.db.Db"%>
<%@page import="www.db.dto.StockBoardDTO"%>
<%@page import="www.db.dao.StockBoardDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//db연결
request.setCharacterEncoding("utf-8");
String path = request.getSession().getServletContext().getRealPath("/upload/img");
int size = 1024 * 1024 * 10;
String han = "UTF-8";
MultipartRequest multi = new MultipartRequest(request, path, size, han, new DefaultFileRenamePolicy());

String sung = multi.getParameter("sung");
String kind = multi.getParameter("kind");
String name = multi.getParameter("name");
String title = multi.getParameter("title");
String content = multi.getParameter("content");
String fname = multi.getFilesystemName("fname");
String pwd = multi.getParameter("pwd");

StockBoardDAO dao = new StockBoardDAO();
String sql = "insert into stockboard (sbno,name,title,content,fname,pwd,writeday,sung,kind) values (s_stockboard.nextval,?,?,?,?,?,sysdate,?,?)";
dao.insert(sql, name, title, content, fname, pwd, sung, kind);
response.sendRedirect("board.jsp");
%>
