<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../top.jsp"%>
<style>
main{
        width:1200px;
        height:800px;
        margin:auto;
    }
</style>
    <main>
        <form method="post" action="reservation_ok_maria.jsp">
            <table align="center"> 
                <tr>
                    <td>성함</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>핸드폰 번호</td>
                    <td><input type="text" name="phone"></td>
                </tr>
                <tr>
                    <td>날짜</td>
                    <td><input type="date" name="rdate"></td>
                </tr>
                <tr>
                    <td>시간</td>
                    <td>
                    	<div>11:30</div>
                    	<div>12:00</div>
                    	<div>12:30</div>
                    	<div>13:00</div>
                    	<div>13:30</div>
                    	<div>14:00</div>
                    	<div>14:30</div>
                    	<div>15:00</div>
                    	<div>15:30</div>
                    	<div>16:00</div>
                    	<div>16:30</div>
                    	<div>17:00</div>
                    	<div>17:30</div>
                    	<div>18:00</div>
                    	<div>18:30</div>
                    
                    
                    </td>
                </tr>
                <tr>
                    <td>인원</td>
                    <td>성인
                        <select name="adult_cnt" id="">
                        <%for(int i=0;i<11;i++){ %>
                            <option value="<%=i%>"><%=i %></option>
                        <%} %>
                        </select>
                     	   &nbsp;&nbsp;아이(10세 이하)
                        <select name="child_cnt" id="">
						<%for(int i=0;i<11;i++){ %>
                            <option value="<%=i%>"><%=i %></option>
                        <%} %>                            
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>매장식사/포장</td>
                    <td>
						<select name="eat">
							<option value="식사">매장식사</option>
							<option value="포장">포장</option>
						</select>
                    </td>
                </tr>
                <tr>
                    <td>비고</td>
                    <td>
                        <textarea name="bigo">
                        </textarea>
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2"><input type="submit" value="예약하기"></td>
                </tr>
            </table>
        </form>
    </main>
<%@include file="../bottom.jsp" %>