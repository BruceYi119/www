<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>

<%@page import="www.db.Db" %>
<%@page import="www.db.Idao" %>
<%@page import="www.db.dao.Main_customDAO" %>
<%@page import="www.db.dto.Main_customDTO" %>
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
<script defer src="/view/js/pcEstimateFunc.js"></script>
<style>
#amd_gen, #intel_gen, #radeon_series, #nvidia_series { display: none; }
</style>

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
				<h2>자신의 견적 수정하기</h2>
				<table class="table">
					<form method="post" action="pcEstimate_edit_ok.jsp">
				    	<input type="hidden" name="mcno" value="<%=mcno%>"/>   
						<tr>
						   <td>CPU</td>
						   <td><select id="cpu_com">
					            <option value="0">기업선택</option>
					            <option value="1">AMD</option>
					            <option value="2">INTEL</option>
					           </select>
					       </td>
					       
					       <!-- cpu 세대 -->
					        <td>
					        <select id="amd_gen">
					            <option value="0">세대선택</option>
					            <option value="2">2세대</option>
					            <option value="3">3세대</option>
					            <option value="4">4세대</option>
					        </select>
					        
					       
					        <select id="intel_gen">
					            <option value="0">세대선택(8+)</option>
					            <option value="8">8세대</option>
					            <option value="9">9세대</option>
					            <option value="10">10세대</option>
					        </select>
					       </td>
					       
					       <!-- cpu 세대 선택후 제품군 -->
					        <td>
					        <select name="cpu">
					            <option value="${mdto.cpu}">${mdto.cpu}</option>
					        </select>
					       </td>
					       <td></td> 
						</tr>
												
						<tr>
						  <td>VGA</td>
						   <td><select id="vga_com">
					            <option value="0">기업선택</option>
					            <option value="1">RADEON</option>
					            <option value="2">NVIDIA</option>
					           </select>
					       </td>
					       
					        <td>
					        <select id="radeon_series">
					            <option value="0">시리즈선택</option>
					            <option value="5000">5000</option>
					            <option value="6000">6000</option>
					        </select>
					       				      
					        <select id="nvidia_series">
					            <option value="0">시리즈선택</option>
					            <option value="1600">1600</option>
					            <option value="2000">2000</option>
					            <option value="3000">3000</option>
					        </select>
					        </td>
					     
					       <!-- vga 브랜드 및 시리즈 선택후 제품군 -->
					        <td>
					        <select name="vga">
					            <option value="${mdto.vga}">${mdto.vga}</option>
					        </select>
					       </td> 
						</tr>
						
						<tr>
						<td>POWER</td>
			   			<td><select id="power_com">
					            <option value="0">기업선택</option>
					            <option value="1">SSESONIC</option>
					            <option value="2">DELTA</option>
					            <option value="3">ANTEC</option>
				           	</select>
				        </td>
			            <td></td>
		             	<td>
					        <select name="power">
					            <option value="${mdto.power}">${mdto.power}</option>
					        </select>
				       	</td> 		      
				   		</tr>
						
						<tr>
						<td>MB</td>
						<td><select id="mb_com">
					            <option value="0">기업선택</option>
					            <option value="1">GIGABYTE</option>
					            <option value="2">ASUS</option>
					            <option value="3">MSI</option>
					            <option value="4">ASROCK</option>
					           </select>
				        </td>			        
				        <td></td>
				        <td>
					        <select name="mb">
					            <option value="${mdto.mb}">${mdto.mb}</option>
					        </select>
			       		</td> 
						</tr>
							
						<tr>
						<td>RAM1</td>
						<td><select id="ram1_com">
					            <option value="0">기업선택</option>
					            <option value="1">SAMSUNG</option>
					            <option value="2">G.SKILL</option>
					            <option value="3">CORSAIR</option>
				           	</select>
						<td></td>
						<td>
					        <select name="ram1">
					            <option value="${mdto.ram1}">${mdto.ram1}</option>
					        </select>
				       	</td> 	
						</tr>
						
						<tr>
						<td>RAM2</td>
						<td><select id="ram2_com">
					            <option value="0">기업선택</option>
					            <option value="1">SAMSUNG</option>
					            <option value="2">G.SKILL</option>
					            <option value="3">CORSAIR</option>
				           	</select>
						<td></td>
						<td>
					        <select name="ram2">
					            <option value="${mdto.ram2}">${mdto.ram2}</option>
					        </select>
				       	</td> 	
						</tr>
									
						<tr>
						<td>HDD</td>
						<td><select id="hdd_com">
					            <option value="0">기업선택</option>
					            <option value="1">SAMSUNG</option>
					            <option value="2">TOSHIBA</option>
					            <option value="3">MGTEC</option>
					            <option value="4">SEAGATE</option>
					            <option value="5">WD</option>
				           	</select>
				        <td></td>
						<td>
					        <select name="hdd">
					            <option value="${mdto.hdd}">${mdto.hdd}</option>
					        </select>
				       	</td>    	
						</tr>
						
						
						<tr>
						<td>SSD</td>
						<td><select id="ssd_com">
				            <option value="0">기업선택</option>
				            <option value="1">SAMSUNG</option>
				            <option value="2">BIOSTAR</option>
				            <option value="3">MICRON</option>
			           		</select>
						<td></td>
						<td>
					        <select name="ssd">
					            <option value="${mdto.ssd}">${mdto.ssd}</option>
					        </select>
				       	</td>  	
						</tr>
						
						<tr>
						    <td>수정 확인 비밀번호</td>
							<td><input type="password" name="edit_pw"></td>
						</tr>
						
						
					<!-- 	<tr><td>PRICE</td><td><input type = "text" name="price"></td></tr> -->
						<tr>
							<td><input type="submit" value="견적 수정완료" id="submit"></td>
						</tr>
						
						<tr>
							<!--  <td><a href="pcEstimate_list.jsp">견적게시판으로 가기</a></td>-->
					    </tr>
					</form>
				</table>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>