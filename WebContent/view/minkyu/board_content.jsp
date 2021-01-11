<%@page import="www.db.dto.StockBoarddatDTO"%>
<%@page import="www.db.dao.StockBoarddatDAO"%>
<%@page import="www.db.dao.StockBoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%-- <%@ include file="/include/top.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<% 
String sbno = request.getParameter("sbno");
StockBoardDAO dao = new StockBoardDAO();
String sql = "select * from stockboard where sbno="+sbno;
dao.select(sql);
out.print(sql);
out.print(dao.getDto().getName());

Header header = new Header();
String css = header.getCss();
String js = header.getJs();
String title = header.getTitle();
String headerUrl = header.getHeaderUrl();

Nav nav = new Nav();
String menu = nav.getMenu();

Footer footer = new Footer();
String footerUrl = footer.getFooterUrl();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%=title%></title>
<style type="text/css">

	h2{ text-align: center;}
	#first li{
		list-style-type: none;
		display: inline-block;
		margin-left: 30px;
		padding-left:15px;
		padding-top: 10px;
		}
	.base_wrap{}
	#board{
		margin: auto;
		width: 900px;
	}
	#title{
	background: #cccccc;
	border-top:1px solid black;
	border-bottom:1px solid #E7E7E7;
	}
	#name{
	border-bottom:1px solid #E7E7E7;
	}
	#good{
		color:red;
		
	}
	#bad{
		color:blue;
	}
	#content{
	border-bottom:1px solid #E7E7E7;
	}
	#img{
	border-bottom:1px solid #E7E7E7;
	padding: 30px;
	text-align:center;
	}
	#goodbtn{
	text-align:center;
	}
	#link{
		float: right;
		margin-right: 245px;
	}
	#datboard{
		width:900px;
		margin:auto;
	}
	#container{
		margin:auto;
		width:900px;
		height:230px;
		border-bottom: 1px solid #cccccc;
		text-align:center;
		padding-bottom: 20px;
	}
	#datname{
		padding: 5px;
		float:left;
		margin-left: 268px;
		margin-right: 275px;
		margin-bottom: 10px;
	}
	#datcontent{
	text-align:center;
	}
	#datsubmit{
	 width:150px;
     height:40px;
     border:1px solid #f15657;
     background:#f15657;
     color:white;
     border-radius: 45px;
	}
	 #del{ visibility: hidden;
         position: absolute;
   }
    #datboardname{
    	text-align:left;
    }
    #datboardsub{
    	border-bottom:1px solid #E7E7E7;
    }
    #datboardcontent{
    border-bottom:1px solid #cccccc;
    text-align:left;
    }
    #datdelbtn{
    	text-align: right;
    	padding-bottom: 10px;
    }
    .btn1{
 	  width: 100px;
	  height: 35px;
	  font-family: 'Roboto', sans-serif;
	  font-size: 11px;
	  text-transform: uppercase;
	  letter-spacing: 2.5px;
	  font-weight: 500;
	  color: #000;
	  background-color: #fff;
	  border: none;
	  border-radius: 45px;
	  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	  transition: all 0.3s ease 0s;
	  cursor: pointer;
	  outline: none;
	  font-size:20px;
    	}
   	.btn1:hover {
 	background-color: #D5D5D5;
	box-shadow: 0px 15px 20px rgba(220, 220, 220, 0.4);
 	color: #fff;
 	transform: translateY(-7px);
	}
	.td1{
	padding: 10px;
	}
</style>
<script type="text/javascript">

 function goodbutton() {
 	alert("공감하셨습니다");
 	location.href="board_good.jsp?sbno=<%=sbno%>";
}
 function badbutton() {
 	alert("비공감하셨습니다");
 	location.href="board_bad.jsp?sbno=<%=sbno%>";
}
function view_del(){
	   var x=event.clientX;
	   var y=event.clientY;
	   document.getElementById("del").style.visibility="visible";
	   document.getElementById("del").style.left=(x-30)+"px";//좌표주기
	   document.getElementById("del").style.top=(y+30)+"px";//좌표주기
	}
function fail(){
	alert("비밀번호가 틀렸습니다")
}

function list1() {
	location="board.jsp";
}
function update1() {
	location="board_update.jsp?sbno=<%=sbno%>";

}

function check(my) {
	
	if(my.name.value.length == 0){
		alert("이름이 비였네요");
		return false;
	}
	if(my.content.value.length == 0){
		alert("내용이 비였네요");
		return false;
	}
}

</script>
<%=css%>
<%=js%>
</head>
<body>
	<input type="hidden" id="color_class" value="minkyu" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="true"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="base_wrap">
				<table  id="board">
				<tr>	
					<td id="title" colspan="12">[<%=dao.getDto().getKind() %>]
									<%=dao.getDto().getTitle()%></td>
				</tr>
				<tr>
					<td id="name" colspan="12">작성자
					<%=dao.getDto().getName() %>&nbsp;&nbsp;&nbsp;
					날짜&nbsp;<%=dao.getDto().getWriteday()%>&nbsp;
					조회&nbsp;<%=dao.getDto().getReadnum()%>&nbsp;
					<span id="good">공감&nbsp;<%=dao.getDto().getGood()%>&nbsp;</span>
					<span id="bad">비공감&nbsp;<%=dao.getDto().getBad() %>&nbsp;</span>
					성별&nbsp;<%=dao.getDto().getSung()%>&nbsp;
				</tr>
				<tr>
					<td id="content" colspan="12"><%=dao.getDto().getContent()%>
					<img src="../../upload/img/<%=dao.getDto().getFname()%>" width="300" height="400"></td>
				</tr>
				<tr>
					<td id="goodbtn" colspan="12">
					<button onclick="goodbutton();">공감</button>
					<button onclick="badbutton();">비공감</button>
					</td>
				</tr>
				</table>
				<div id="container">
				<form name="dat" method="post" action="dat_write_ok.jsp" onsubmit="return check(this)" name="frm">
				<input type="hidden" name="sbno" value="<%=sbno%>">
				<br>
				<input id="datname" type="text" name="name" style="height:30px" placeholder="작성자"></br>
				<textarea id="datcontent" rows="4" cols="50" name="content" placeholder="내용과 무관한 내용은 삭제 될 수 있습니다."></textarea></br>
				<input id="datsubmit" type="submit" value="등록">
    			</form>
				</div>
				<div id="boarddat">
				<table id="datboard">
					<%	
						StockBoarddatDAO ddao = new StockBoarddatDAO();
						String sql1 = "select * from stockboarddat where sbno="+sbno+" order by sbdno desc";
						ddao.selectAll(sql1);
						for(StockBoarddatDTO ddto : ddao.getList() ){
// 						sql="select * from stockboarddat where sbno="+sbno;
// 						rs=stmt.executeQuery(sql);
// 						while(rs.next()){
			 			%> 
						<tr>
							<td id="datboardname" colspan="12">작성자&nbsp;&nbsp;<%=ddto.getName() %>&nbsp;&nbsp;
							작성일&nbsp;&nbsp;<%=ddto.getWriteday() %>
							
						</tr>
						<tr>
							<td id="datboardcontent"><%=ddto.getCotent() %>
							<form method="post" action="dat_delete.jsp">
							<td id="datdelbtn"><input type="submit" value="댓글삭제">	</td>
							<input type="hidden" name="sbno" value="<%=sbno%>">
							<input type="hidden" name="sbdno" value="<%=ddto.getSbdno()%>">
							</td>
							</tr>
							</form>
				<% 
						}
				%>
				  <tr>
				  <td colspan="3" align="center" class="td1">
				  <input type="button" value="목록" onclick="list1();" class="btn1">
				  <input type="button" value="수정" onclick="update1()" class="btn1">
				  <input type="button" value="삭제" onclick="view_del();" class="btn1">
					<%
					if(request.getParameter("chk") != null){
					%>
		          	<script type="text/javascript">
		          	alert("비밀번호가 틀렸습니다");
		          	</script>
					<%
					}
// 					crud.conn_close();
					%>
				  </td>
				</tr>
					</table>
					 <form action="board_delete.jsp" method="post" id="del">
    				  <input type="hidden" name="sbno" value="<%=sbno %>">
		     		 비밀번호<input type="password" name="pwd" size="4">
		     		 <input type="submit" value="삭제">
  				 	</form>
				</div>
				</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>