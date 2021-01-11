<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../top.jsp"%>
<%@page import="java.time.LocalDate" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	LocalDate today=LocalDate.now(); //현재 시간
	double end=today.lengthOfMonth(); // 현재 월의 총 일수
	int y=today.getYear(); // 현재 년도
	int m=today.getMonthValue(); // 현재 월
	int day=today.getDayOfMonth(); // 현재 일
	
	LocalDate dday=LocalDate.of(y,m,1); // 현재 달의 1일 생성 
	int yoil=dday.getDayOfWeek().getValue(); //1~7까지의 숫자. 월~일
	if(yoil==7) yoil=0; //매주 돌아야 하므로 끝이 오면 다시 처음으로 돌림
	
	int ju=(int)Math.ceil((end+yoil)/7); // 해당 달의 1일이 언제 시작하는지 모른다.
	pageContext.setAttribute("end",end); //말일
	pageContext.setAttribute("y",y);	//년도
	pageContext.setAttribute("m",m);	//월
	pageContext.setAttribute("day",day);	//일
	pageContext.setAttribute("yoil",yoil);	//1일의 요일
	pageContext.setAttribute("ju",ju);	//한달 몇주
%>
<style>
main{	
	position:relative;
    width:1200px;
    height:800px;
    margin:auto;
    border:4px solid black;
}
#title{
	margin-left:20px;
}
section{
	position:relative;
	width:43%;
	display:inline-block;
	margin-left:30px;
	border:4px solid black;
	
}
#cal{
	width:400px;
	border:4px solid red;
	height:700px;
	text-align:center;
	margin-left: 60px;
	position:relative;
}

#cal td{
	padding:0px;
	magin:0px;
}

.rdate{
	height:100%;
	display:block;
	
	
}
aside{
	display:inline-block;
	width:45%;
	border:4px solid black;
}
#detail{
	border:4px solid red;
	width:500px;
	height:700px;
	margin-left: 60px;
}
#detail td{
	width:37px;
	padding-right:5px;
}
.rtime{	
	display:inline-block;
	background:#edfbdc;
	border:1px solid black;
	margin:5px;
	padding:7px;
}
</style>
<script>
	function d_chk(d){
		// 모든 배경 색깔 초기화
		for(var i=0;i<${end};i++){
			document.querySelectorAll('.rdate')[i].style.background="white"
		}
		//선택날짜 초록색 배경으로 전환
		document.querySelectorAll('.rdate')[d-1].style.background="green"
	}
	/* function t_chk(t){
		// 모든 배경 색깔 초기화
		for(var i=0;i<;i++){
			document.querySelectorAll('.rtime')[i].style.background="white"
		}
		//선택날짜 초록색 배경으로 전환
		document.querySelectorAll('.rdate')[d-1].style.background="green"
	} */

</script>
    <main>
    	<div id="title"><h2>예약하기</h2></div>
    	<hr>
        <form method="post" action="reservation_ok_maria.jsp">
        	<section>
	        	<table id="cal">
	        		<tr>
	        			<td colspan="7"><h3>${y }년 ${m }월</h3></td>
	        		</tr>
	        		<tr>
	        			<td>일</td>
	        			<td>월</td>
	        			<td>화</td>
	        			<td>수</td>
	        			<td>목</td>
	        			<td>금</td>
	        			<td>토</td>
	        		</tr>
       			<c:set var="d" value="1"/>
        			<c:forEach var="i" begin="1" end="${ju }">
        			<tr>
						<c:forEach var="j" begin="0" end="6">
						<c:if test="${(i==1 and j<yoil) || d>end}">
	 						<td> &nbsp;</td>
 						</c:if>
						<c:if test="${((i==1 and j>=yoil) || i>1) and d<=end}">
	 						<td ><a href="#" name="rdate" class="rdate" onclick="d_chk(${d})">${d }</a> </td>
	 						<c:set var="d" value="${d+1 }"/>
 						</c:if>
						</c:forEach>
					</tr>
				</c:forEach>
				</table>
        	</section>
            <aside>
	            <table id="detail"> 
	                <tr>
	                    <td>성함</td>
	                    <td><input type="text" name="rname"></td>
	                </tr>
	                <tr>
	                    <td>핸드폰 <br/>번호</td>
	                    <td><input type="text" name="rphone"></td>
	                </tr>
	                <tr>
	                    <td>시간</td>
	                    <td>
	                    		<a href="#" onclick="t_chk()"><div class="rtime" value="11:00">11:30</div></a>
	                    	<c:forEach var="t" begin="12" end="19">
		                    	<a href="#" onclick="t_chk()"><div class="rtime" value="${t }:00">${t }:00</div></a>
		                    	<a href="#" onclick="t_chk()"><div class="rtime" value="${t }:30">${t }:30</div></a>
	                    	</c:forEach>
	                    		<a href="#" onclick="t_chk()"><div class="rtime" value="20:00">20:00</div></a>
	                    </td>
	                </tr>
	                <tr>
	                    <td>인원</td>
	                    <td>성인
	                        <select name="radult_cnt" id="">
	                        <%for(int i=0;i<11;i++){ %>
	                            <option value="<%=i%>"><%=i %></option>
	                        <%} %>
	                        </select>
	                     	   &nbsp;&nbsp;아이(10세 이하)
	                        <select name="rchild_cnt" id="">
							<%for(int i=0;i<11;i++){ %>
	                            <option value="<%=i%>"><%=i %></option>
	                        <%} %>                            
	                        </select>
	                    </td>
	                </tr>
	                <tr>
	                    <td>매장식사/포장</td>
	                    <td>
							<select name="reat">
								<option value="s">매장식사</option>
								<option value="p">포장</option>
							</select>
	                    </td>
	                </tr>
	                <tr>
	                    <td>비고</td>
	                    <td>
	                        <textarea name="rbigo">
	                        </textarea>
	                    </td>
	                </tr>
	                <tr align="center">
	                    <td colspan="2"><input type="submit" value="예약하기"></td>
	                </tr>
	            </table>
            </aside>
        </form>
    </main>
<%@include file="../bottom.jsp" %>