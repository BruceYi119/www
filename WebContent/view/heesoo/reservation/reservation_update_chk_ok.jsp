<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="www.db.dto.ReservationDTO" %>
<%@page import="www.db.dao.ReservationDAO" %>
<%
request.setCharacterEncoding("utf-8");
String rname = request.getParameter("rname");
String rphone = request.getParameter("rphone");

String sql = "select * from (select * from reservation where rname=? and rphone=? order by rwritedate desc) where rownum=1";

ReservationDAO dao = new ReservationDAO();
dao.select(sql,rname,rphone);

if(dao.getDto()!=null && dao.getDto().getRchk() != 0)
	response.sendRedirect("reservation_update.jsp?rno="+dao.getDto().getRno());
else{
	response.sendRedirect("reservation_update_chk.jsp?chk=1");
}
%>