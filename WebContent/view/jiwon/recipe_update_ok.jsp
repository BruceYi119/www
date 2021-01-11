<%@page import="www.db.dao.Recipe_boardDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %><!-- 파일업로드와 관련된클래스 -->
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %><!-- 파일이름이 동일한것이 있을떄 파일이름을 자동으로 변경해줌 -->
<%@page import="java.io.File" %>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 이미지저장 */
String path =  request.getSession().getServletContext().getRealPath("/upload/img");
int size = 1024*1024*10;
String encoding = "utf-8";
MultipartRequest multi =new MultipartRequest(request,path,size,encoding,new DefaultFileRenamePolicy());

String rbno = request.getParameter("rbno");
request.setCharacterEncoding("utf-8");
String title = multi.getParameter("title") != null ? multi.getParameter("title") : "";
String rcategory = multi.getParameter("rcategory") != null ? multi.getParameter("rcategory") : "";
String img = multi.getFilesystemName("img") != null ? multi.getFilesystemName("img") : "";
//String[] img = multi.getFilesystemName("img");
String rname = multi.getParameter("rname") != null ? multi.getParameter("rname") : "";
//String content = multi.getParameter("content") != null ? multi.getParameter("content") : "";
String[] content = multi.getParameterValues("content");
String[] ingredients = multi.getParameterValues("ingredients");

Recipe_boardDAO dao = new Recipe_boardDAO();
String sql = "update recipe_board set title=? ,rcategory=? ,img=? ,rname=? ,content=?, ingredients=? where rbno=?";
int r = dao.update(sql,title,rcategory,img,rname,String.join(",",content),String.join(",", ingredients),rbno);
//int r = dao.insert(sql,title,rcategory,String.join(",",img),rname,String.join(",",content),String.join(",", ingredients));

response.sendRedirect("recipe_content.jsp?rbno="+rbno);

%>