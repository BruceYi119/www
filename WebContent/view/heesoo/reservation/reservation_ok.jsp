<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
   <%@page import="www.db.dao.ReservationDAO" %>
<%
request.setCharacterEncoding("utf-8");
String rname = request.getParameter("rname");
String rphone = request.getParameter("rphone");
String rdate = request.getParameter("rdate");
String rtime = request.getParameter("rtime");
String radult_cnt = request.getParameter("radult_cnt");
String rchild_cnt = request.getParameter("rchild_cnt");
String reat = request.getParameter("reat");
String rbigo = request.getParameter("rbigo");

String sql = "insert into reservation(rno,rdate,rtime,rname,rphone,radult_cnt,rchild_cnt,reat,rbigo,rwritedate) values(s_reservation.nextval,?,?,?,?,?,?,?,?,sysdate)";

ReservationDAO dao = new ReservationDAO();
dao.insert(sql,rdate,rtime,rname,rphone,radult_cnt,rchild_cnt,reat,rbigo);
/* out.print(rname);
out.print(rphone);
out.print(rdate);
out.print(rtime);
out.print(radult_cnt);
out.print(rchild_cnt);
out.print(reat);
out.print(rbigo); */
response.sendRedirect("reservation_thanks.jsp?rchk="+1);

%>