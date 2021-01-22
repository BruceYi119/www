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

StringBuilder builder = new StringBuilder();
ArrayList<String> imgs = new ArrayList<String>();
int i = 0;
while(fileNames.hasMoreElements()){
	if (i == 0) {
		String parameter = (String)fileNames.nextElement();
		String fileName = multi.getFilesystemName(parameter);
		if (fileName != null)
			imgs.add(fileName);
	}
	i++;
}
String name = multi.getParameter("name");
String rbno = multi.getParameter("rbno");
String title = multi.getParameter("title") != null ? multi.getParameter("title") : "";
String rcategory = multi.getParameter("rcategory") != null ? multi.getParameter("rcategory") : "";
String img = "";
String intro = multi.getParameter("intro") != null ? multi.getParameter("intro") : "";
String[] content = multi.getParameterValues("content");
String[] ingredients = multi.getParameterValues("ingredients");

Recipe_boardDAO dao = new Recipe_boardDAO();
// build 초기화
builder.setLength(0);
builder.append("update recipe_board set title=? ,rcategory=?");
// 수정 이미지 가 있을때만 이미지 업데이트
if (imgs.size() > 0) {
	builder.append(" ,img=?");
	
	for (int j = 0;j < imgs.size();j++) {
		if (j < 1)
			img += imgs.get(j);
		else
			img += "," + imgs.get(j);
	}
}
builder.append(" ,intro=? ,content=?, ingredients=? where rbno=? and name=?");
out.print("img"+img);
/* int r = 0;

if (imgs.size() > 0){
	r = dao.update(builder.toString(),title,rcategory,img,intro,String.join(",",content),String.join(",", ingredients),rbno);

}else{
	r = dao.update(builder.toString(),title,rcategory,intro,String.join(",",content),String.join(",", ingredients),rbno);

}
response.sendRedirect("recipe_content.jsp?rbno="+rbno); */
%>