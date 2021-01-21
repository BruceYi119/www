<%@page import="www.db.dao.Sub_customDAO"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>

<%@page import="www.db.Db" %>
<%@page import="www.db.Idao" %>
<%@page import="www.db.dao.Main_customDAO" %>
<%@page import="www.db.dto.Main_customDTO" %>
<%@ page import = "java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%-- <%@ include file="/include/top.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Header header = new Header();
	String css = header.getCss();
	String js = header.getJs();
	String title = header.getTitle();
	String headerUrl = header.getHeaderUrl();
	
	Nav nav = new Nav();
	String menu = nav.getMenu();
	
	Footer footer = new Footer();
	String footerUrl = footer.getFooterUrl();

	Main_customDAO mdao = new Main_customDAO();
	String mcno = request.getParameter("mcno");
	Main_customDTO mdto = mdao.content(mcno);
	pageContext.setAttribute("mdto", mdto);
	
	Sub_customDAO sdao = new Sub_customDAO();
	String scno = request.getParameter("scno");
	
	String sql = "select * from sub_custom where mcno = ?";
	sdao.selectAll(sql, mcno);
	
	pageContext.setAttribute("slist", sdao.getList());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/view/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title><%=title%></title>
<%=css%>
<%=js%>
</head>
<body>
	<input type="hidden" id="color_class" value="yongsoon" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="true"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="base_wrap">
			<h2>견적 상세보기</h2>
			<table class="table">
		    <tr>
		        <td>멤버ID</td>
		        <td>${mdto.mcno}</td>
		    </tr>
		    
		    <tr>    
		        <td>CPU</td>
		        <td>${mdto.cpu}</td>
		        <td>${mdto.cpu_price}원</td>
		    </tr>
		    
		    <tr>
		        <td>VGA</td>
		        <td>${mdto.vga}</td>
		        <td>${mdto.vga_price}원</td>
	        </tr>
	        
	        <tr>
		        <td>POWER</td>
		        <td>${mdto.power} </td>
		        <td>${mdto.power_price}원</td>
	        </tr>
		    
		    <tr>    
		        <td>MB</td>
		        <td>${mdto.mb} </td>
		        <td>${mdto.mb_price}원</td>
	        </tr>
	        
	        <tr>
		        <td>RAM1</td>
		        <td>${mdto.ram1} </td>
		        <td>${mdto.ram1_price}원</td>
	        </tr>
	        
	        <tr>
		        <td>RAM2</td>
		        <td>${mdto.ram2}</td>
		        <td>${mdto.ram2_price}원</td>
	        </tr>
		        
	        <tr>
		        <td>HDD</td>
		        <td>${mdto.hdd}</td>
		        <td>${mdto.hdd_price}원</td>
	        </tr>
		        
	        <tr>
		        <td>SSD</td>
		        <td>${mdto.ssd} </td>
		        <td>${mdto.ssd_price}원</td>
	        </tr>
	        
	        <tr>
		        <td>TOTAL_PRICE</td>
		        <td>총합</td>
		        <td>${mdto.price}원</td>
	        </tr>
	           
		   	<tr>
		   	<td><a href="pcEstimate_list.jsp">목록으로</a></td>
		 <!--   	<td><a href="pcEstimate_list.jsp">수정</a></td> -->
		   	<!--<td><a href="pcEstimate_delete.jsp?mcno=${mdto.mcno}">삭제</a></td>
		   	-->
		   	</tr>
	   		<tr>
			<td>
		        <a href="/view/yongsoon/pcEstimate_edit.jsp?mcno=${mdto.mcno}">수정</a>
		    </td>
			</tr>
			
			<tr>
			<td>
				<form method="post" action="pcEstimate_delete.jsp">
			    <input type="hidden" name="mcno" value="<%=mcno%>">    
			        견적 삭제 비밀번호 : <input type="password" name="del_pw"> 
			    <input type="submit" value="삭제 확인">
			    </form>
		    </td>
			</tr>
			</table>
			
			<h4>* 다른 유저들의 의견 *</h4>
			<hr/>
			<ul>
				<c:forEach items="${slist}" var="sdto">
				    <li>${sdto.sname} 님의 댓글</li>
					<li>${sdto.scontent}</li>
					<li>
				  		<form method="post" action="sub_custom_delete.jsp">
				  		<input type="hidden" name="mcno" value="<%=mcno%>"> 
					    <input type="hidden" name="scno" value="<%=scno%>">    
					        삭제하기 : <input type="password" name="sub_del_pw"> 
					    <input type="submit" value="삭제 ">
			    </form>
					</li>
					<hr/>
				</c:forEach>
			</ul>

			<form action="/view/yongsoon/sub_custom_write.jsp">
			<table>
			<tr>
			
			<td>
			    <input type="hidden" name="mcno" value="<%=mcno%>"/>   
	                        이름 : <input type="text" name="sname">
            </td>
           
            <td>
	                        비밀번호 : <input type="password" name="spw">
            </td>
            
            <td>
                <textarea style="width: 300px; height: 100px;" name="scontent"></textarea>
            </td>
            
            <td>
				<input type="submit" value="댓글입력">
			</td>
			
			</tr>
			</table>
			</form>
			
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>