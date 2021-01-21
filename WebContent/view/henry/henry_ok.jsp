<%@page import="www.db.dao.MoviesDAO" %>
<%@page import="www.db.dto.MoviesDTO" %>
<%@page import="www.db.dao.MymovielistDAO" %>
<%@page import="www.db.dao.MymovielistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String mno = request.getParameter("mno") != null ? request.getParameter("mno") : null;
String id = request.getParameter("id") != null ? request.getParameter("id") : null;
MoviesDAO mdao = new MoviesDAO();
out.print(mno);
out.print(id);

String sql="select rownum, t.* from movies t where mno="+mno;
mdao.select(sql);
MoviesDTO mdto = mdao.getDto();

String title = mdto.getTitle() != null ? mdto.getTitle() : null;
String viewrating = mdto.getViewrating() != null ? mdto.getViewrating() : null;
String salesrating = mdto.getSalesrating() != null ? mdto.getSalesrating() : null;
String genre = mdto.getGenre() != null ? mdto.getGenre() : null;
String runtime = mdto.getRuntime() != null ? mdto.getRuntime() : null;
String releasedate = mdto.getReleasedate() != null ? mdto.getReleasedate() : null;
String filmdirector = mdto.getFilmdirector() != null ? mdto.getFilmdirector() : null;
String imgtitle = mdto.getImgtitle() != null ? mdto.getImgtitle() : null;

MymovielistDAO mydao = new MymovielistDAO();
sql="insert into mymovielist(mno, title, viewrating, salesrating, genre, runtime, releasedate, filmdirector, imgtitle, id)";
sql=sql+" values(mymovielist_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
int r = mydao.insert(sql, title, viewrating, salesrating, genre, runtime, releasedate, filmdirector, imgtitle, id);

response.sendRedirect("mypage.jsp");
%>

