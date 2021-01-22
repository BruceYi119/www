<%@page import="java.util.ArrayList"%>
<%@page import="www.db.dao.Recipe_boardDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %><!-- 파일업로드와 관련된클래스 -->
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %><!-- 파일이름이 동일한것이 있을떄 파일이름을 자동으로 변경해줌 -->
<%@page import="java.io.File" %>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
/* 이미지저장 */
String path = request.getSession().getServletContext().getRealPath("/upload/img/");
int size = 1024*1024*10;
String encoding = "utf-8";

MultipartRequest multi =new MultipartRequest(request,path,size,encoding,new DefaultFileRenamePolicy());
Enumeration fileNames = multi.getFileNames();
 int i = 0;
StringBuilder builder = new StringBuilder();
ArrayList<String> imgs = new ArrayList<String>();
while(fileNames.hasMoreElements()){
	String parameter = (String)fileNames.nextElement();
	String fileName = multi.getFilesystemName(parameter);
	if (fileName != null){
		imgs.add(fileName);
	}
	i++;
}
String title = multi.getParameter("title") != null ? multi.getParameter("title") : "";
String name = multi.getParameter("name") != null ? multi.getParameter("name") : "";
//String name=session.getAttribute("id").toString();
String rcategory = multi.getParameter("rcategory") != null ? multi.getParameter("rcategory") : "";
String mainimg = multi.getFilesystemName("mainimg") != null ? multi.getFilesystemName("mainimg") : "";
String img = "";
String intro = multi.getParameter("intro") != null ? multi.getParameter("intro") : "";
String[] content = multi.getParameterValues("content");
String[] ingredients = multi.getParameterValues("ingredients");

Recipe_boardDAO dao = new Recipe_boardDAO();

builder.append("insert into recipe_board(rbno,title,name,rcategory,mainimg,");

//수정 이미지 가 있을때만 이미지 업데이트
if (imgs.size() > 0) {
	builder.append("img,intro,content,ingredients,writeday,addtype) values(s_recipe_board.nextval,?,?,?,?,?,?,?,?,sysdate,'u')");
	out.print(imgs.size());
	//이미지가 역순
	for (int j=0 ; j<imgs.size()-1 ; j++) {
		if (j < 1){
			out.print(imgs.get(j));
		}else{
			img += "," + imgs.get(j);
		}
	}
//out.print("제목 : "+title+" 이름 : "+name+" 카테고리: "+rcategory+" 메인 : "+mainimg+" 이미지 : "+intro+" 요리순서 : "+content+" 재료 : "+ingredients);
}else{
	builder.append("intro,content,ingredients,writeday,addtype) values(s_recipe_board.nextval,?,?,?,?,?,?,?,sysdate,'u')");
}

int r = 0;

if (imgs.size() > 0)
	r = dao.insert(builder.toString(),title,name,rcategory,mainimg,img,intro,String.join(",",content),String.join(",", ingredients));
else
	r = dao.insert(builder.toString(),title,name,rcategory,mainimg,intro,String.join(",",content),String.join(",", ingredients));
 
// response.sendRedirect("recipe_list.jsp");
%>