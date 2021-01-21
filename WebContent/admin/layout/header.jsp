<%@page import="www.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member m = new Member();

if (!m.isAdminLogin(session))
	response.sendRedirect("/view/member/login.jsp");

pageContext.setAttribute("name", session.getAttribute("name"));
%>
<header>
	<nav class="navbar bg-dark navbar-dark navbar-expand-sm">
		<ul class="navbar-nav" id="menu">
			<li class="nav-item"><a class="nav-link" href="/">사이트 메인</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/admin.jsp">관리자 메인</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/member.jsp">회원정보</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/reservation.jsp">갈비대첩 예약정보</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/cafe.jsp">애완동물카페정보</a></li>
		</ul>
		<ul class="nav nav-pills" id="adminLoginInfo">
			<li class="nav-item"><a class="nav-link text-white" href="#">${name}님 환엽합니다!</a></li>
			<li class="nav-item"><a class="nav-link text-white" href="/view/member/logout.jsp">로그아웃</a></li>
<!-- 			<li class="nav-item"><a class="nav-link active disabled" href="#">Disabled</a></li> -->
		</ul>
	</nav>
</header>