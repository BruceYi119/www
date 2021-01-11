<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>갈비대첩</title>
<style>
    body{
        margin:0px;
    }
    a{
        text-decoration: none;
        color:black;
    }
    .top_background{
    	background-color:brown;
    }
    header{
        margin:auto;
        border:1px solid red;
        width:1200px;
        height:100px;;
        text-align:center;
    }
    #logo{
        padding-top:10px;
        width:1200px;
        height:30px;
        margin:auto;
        text-align:center;
        border:1px solid yellow;
    }
    nav{
        width:1200px;
        height:57px;
        border:1px solid gray;
    }
    nav ul{
        list-style-type: none;
        margin:auto;
        margin-top: 10px;
    }
    nav ul li{
        padding:auto;
        border:1px solid purple;
        display:inline-block;
        text-align:center;
        margin:10px;
    }
    
</style>
</head>
<body>
<div class="top_background">
	<header>
	    <div id="logo"><a href="http://localhost/galbidaecheob/main/index.jsp">logo</a></div>
	    <nav>  
	        <ul>
	        	<li><a href="#">매장소개</a> </li>
	            <li><a href="#">메뉴소개</a> </li>
	            <li><a href="../location/location.jsp">오시는길</a> </li>
	            <li><a href="../reservation/reservation_write_cal.jsp">예약하기</a></li>
	            <li><a href="#">커뮤니티</a></li>
	        </ul>
	    </nav>
	</header>
</div>