<%@page import="www.db.dao.Recipe_boardDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %><!-- 파일업로드와 관련된클래스 -->
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %><!-- 파일이름이 동일한것이 있을떄 파일이름을 자동으로 변경해줌 -->
<%@page import="java.io.File" %>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 이미지저장 */
String path = "D:/wk/project/www/WebContent/img";
int size = 1024*1024*10;
String encoding = "utf-8";
MultipartRequest multi =new MultipartRequest(request,path,size,encoding,new DefaultFileRenamePolicy());

request.setCharacterEncoding("utf-8");
String title = request.getParameter("title") != null ? request.getParameter("title") : "";
String rcategory = request.getParameter("rcategory") != null ? request.getParameter("rcategory") : "";
String img = request.getParameter("fname") != null ? request.getParameter("fname") : "";
String rname = request.getParameter("rname") != null ? request.getParameter("rname") : "";
//String content = request.getParameter("content") != null ? request.getParameter("content") : "";
String[] contents = request.getParameterValues("contents");
String[] ingredients = request.getParameterValues("ingredients");

Recipe_boardDAO dao = new Recipe_boardDAO();
String sql = "insert into recipe_board(rbno,title,rcategory,img,rname,content,ingredients,writeday) values(s_recipe_board.nextval,?,?,?,?,?,?,sysdate)";
int r = dao.insert(sql,title,rcategory,img,rname,String.join(",",contents),String.join(",", ingredients));

response.sendRedirect("recipe_content.jsp");
%>