<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pw = "enffl";
String returnString = null;

try{
	MessageDigest md = MessageDigest.getInstance("SHA-512");
	md.reset();
	md.update(pw.getBytes("utf-8"));
	returnString = String.format("%0128x", new BigInteger(1, md.digest()));
} catch(Exception e) {
	e.printStackTrace();
}

out.println(returnString);
out.println(returnString.getBytes());
// 한글
%>