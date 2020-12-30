<%@page import="www.member.Member"%>
<%@page import="www.security.Security"%>
<%@page import="www.db.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member m = new Member();
MemberDAO dao = new MemberDAO();
Security s = new Security();
String sql = "insert into member(mno,id,pw,name,phone,birth,zipcode,addr,addr_detail,email) values(s_member.nextval,?,?,?,?,?,?,?,?,?)";

request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String birth = request.getParameter("birth");
String zipcode = request.getParameter("zipcode");
String addr = request.getParameter("addr");
String addr_detail = request.getParameter("addr_detail");
String email = request.getParameter("email");
String beforePw = pw;

s.getSha512(pw);
pw = s.getSha512();

dao.insert(sql, id, pw, name, phone, birth, zipcode, addr, addr_detail, email);

m.login(session, id, beforePw);

response.sendRedirect("/");
%>