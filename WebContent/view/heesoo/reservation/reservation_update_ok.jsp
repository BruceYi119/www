<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
   <%@page import="www.db.dao.ReservationDAO" %>
<%
request.setCharacterEncoding("utf-8");
String rno=request.getParameter("rno");
String rname = request.getParameter("rname");
String rphone = request.getParameter("rphone");
String rdate = request.getParameter("rdate");
String rtime = request.getParameter("rtime");
String radult_cnt = request.getParameter("radult_cnt");
String rchild_cnt = request.getParameter("rchild_cnt");
String reat = request.getParameter("reat");
String rbigo = request.getParameter("rbigo");

String sql = "update reservation set rdate=?,rtime=?,rname=?,rphone=?,radult_cnt=?,rchild_cnt=?,reat=?,rbigo=?,rchk=2 where rno= "+rno;

ReservationDAO dao = new ReservationDAO();
dao.update(sql,rdate,rtime,rname,rphone,radult_cnt,rchild_cnt,reat,rbigo);
/* out.print(rname);
out.print(rphone);
out.print(rdate);
out.print(rtime);
out.print(radult_cnt);
out.print(rchild_cnt);
out.print(reat);
out.print(rbigo); */
response.sendRedirect("reservation_thanks.jsp?rno="+rno+"&rchk="+2);

%>