<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
   <%@page import="www.db.dao.ReservationDAO" %>
<%
request.setCharacterEncoding("utf-8");
String rno=request.getParameter("rno");

String sql = "update reservation set rchk=0 where rno= "+rno;

ReservationDAO dao = new ReservationDAO();
dao.update(sql);
/* out.print(rname);
out.print(rphone);
out.print(rdate);
out.print(rtime);
out.print(radult_cnt);
out.print(rchild_cnt);
out.print(reat);
out.print(rbigo); */
response.sendRedirect("reservation_thanks.jsp?rno="+rno+"&rchk=0");

%>