<%@page import="www.db.dao.StockBoardDAO"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int sbno = Integer.parseInt( request.getParameter("sbno") );
String pwd = request.getParameter("pwd");
StockBoardDAO dao = new StockBoardDAO();
String sql = "select * from stockboard where sbno="+sbno;
dao.select(sql);

if(pwd.equals(dao.getDto().getPwd())){
 sql = "delete from stockboard where sbno="+sbno;
 dao.delete(sql);
 response.sendRedirect("board.jsp");
}else{
 out.print(pwd);
 response.sendRedirect("board_content.jsp?sbno="+sbno+"&chk=1");
}
%>