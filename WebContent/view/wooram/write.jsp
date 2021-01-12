<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
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
<script type="text/javascript">
function formCheck(my) {

    if (my.title.value.length==0){      // null인지 비교한 뒤
        alert('제목을 입력하세요');           // 경고창을 띄우고
        //title.focus();    // 해당태그에 포커스를 준뒤
        return false;                       // false를 리턴합니다.
    }
    if (my.name.value.length == 0){   
        alert('닉네임을 입력하세요'); 
        //writer.focus();            
        return false;
    }
     
    // 글작성폼에 내용을 추가하였습니다. 게시판에 글내용은 당연히 있어야겠죠?
    // 추가할 html코드 : content : <textarea rows="10" cols="20" name="content"></textarea><br>
     
    if (my.content.value.length == 0){
        alert('내용을 입력하세요'); 
        //content.focus();
        return false;
    }
     
    if (my.pwd.value.length == 0){
        alert('비밀번호를 입력하세요');   
        //pwd.focus();
        return false;            
    }
    if (my.writype.value.length == 0){
        alert('글종류를 선택하세요');   
        //writype.focus();
        return false;            
    }
    if (my.animal.value.length == 0){
        alert('동물종류를 선택하세요');   
        //animal.focus();
        return false;            
    }
}
</script>
</head>
<body>
	<input type="hidden" id="color_class" value="wooram" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="true"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
		<div class="base_wrap" align="center">
	<form method="post" action="write_ok.jsp" onsubmit="return formCheck(this);" name="forms" enctype="multipart/form-data">
		<table width="600" align="center">
			<tr>
				<td>글종류</td>
				<td><select id="writype" name="writype">
						<option value="" selected="selected">--선택하기--</option>
						<option value="애완동물 소개">애완동물 소개</option>
						<option value="정보와지식 공유">정보와지식 공유</option>
				</select></td>
			</tr>
			<tr>
				<td>애완동물 종류</td>
				<td><select id="animal" name="animal">
						<option value="" selected="selected">--선택하기--</option>
						<option value="강아지">강아지</option>
						<option value="고양이">고양이</option>
						<option value="기타">기타</option>
				</select>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" name="fname"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="5" name="content"></textarea></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit"  value="저장하기"> <input
					type="reset" value="다시쓰기"></td>
		</table>
	</form>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>