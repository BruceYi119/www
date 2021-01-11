<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="www.db.dao.MemberDAO"%>
<%@page import="www.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member m = new Member();
boolean login = m.isLogin(session);

if (!login)
	response.sendRedirect("/view/member/login.jsp");

MemberDAO dao = new MemberDAO();
StringBuilder sb = new StringBuilder();

String path = request.getRealPath("/upload/img/");
int size = 1024 * 1024 * 10;
MultipartRequest mt = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());

request.setCharacterEncoding("utf-8");
String mno = mt.getParameter("mno") != null ? mt.getParameter("mno") : null;
String id = mt.getParameter("id") != null ? mt.getParameter("id") : null;
String name = mt.getParameter("name") != null ? mt.getParameter("name") : null;
String phone = mt.getParameter("phone") != null ? mt.getParameter("phone") : null;
String birth = mt.getParameter("birth") != null ? mt.getParameter("birth") : null;
String zipcode = mt.getParameter("zipcode") != null ? mt.getParameter("zipcode") : null;
String addr = mt.getParameter("addr") != null ? mt.getParameter("addr") : null;
String addr_detail = mt.getParameter("addr_detail") != null ? mt.getParameter("addr_detail") : null;
String email = mt.getParameter("email") != null ? mt.getParameter("email") : null;

String sql = "update member set name = ?, phone = ?, birth = ?, zipcode = ?, addr = ?, addr_detail = ?, email = ? where mno = ?";
int r = dao.update(sql, name, phone, birth, zipcode, addr, addr_detail, email, mno);

sql = "select rownum, t.* from member t where id = ?";
dao.select(sql, id);

if (r == 1)
	sb.append("{ \"update\": true, \"info\": { ");
else
	sb.append("{ \"update\": false, \"info\": { ");	

sb.append("\"name\": \"");
sb.append(dao.getDto().getName());
sb.append("\", \"phone\": \"");
sb.append(dao.getDto().getPhone());
sb.append("\", \"birth\": \"");
sb.append(dao.getDto().getBirth());
sb.append("\", \"zipcode\": \"");
sb.append(dao.getDto().getZipcode());
sb.append("\", \"addr\": \"");
sb.append(dao.getDto().getAddr());
sb.append("\", \"addr_detail\": \"");
sb.append(dao.getDto().getAddr_detail());
sb.append("\", \"email\": \"");
sb.append(dao.getDto().getEmail());
sb.append("\"");
sb.append(" } }");

out.print(sb.toString());
%>