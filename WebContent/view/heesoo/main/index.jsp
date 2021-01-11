<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../top.jsp" %>
    <style>
    .index_background{
    	background-repeat: no-repeat;
    	background-size: cover; 
    	background-color: transparent; 
    	background-position: 30% 40%; 
    	background-image: url(https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200418_132%2F1587166437724vSXKx_JPEG%2FkyTcvrSuCOX0pgJRFM2AoYV2.jpg);
    }
    .wrap{
    	width:1200px;
        height:600px;
        margin:auto;
        /*background: yellow;*/
    }
    h1{
    	width:300px;
        height:50px;
        /*background-color:red;*/
        margin:auto;
       	display:block;
       	padding-top:150px;
       	color:white;
    }
    main{
        width:1900px;
        height:500px;
        margin: 10px auto;
        border:1px solid blue;
    }
    .big_content{
    	width: 700px;
    	height:100px;
    	border:5px solid black;
    	text-align:right;
    	margin-top:7%;
    	margin-left:40%;
    	padding-right: 10px;
    }
    #big{
    	font-size:40px;
   	}
    </style>
<div class="index_background">
	<div class="wrap">
   		<div class="index_background_content">
   			<h1>갈비들의 전쟁터</h1>
  		</div>
	</div>	
</div>
<main>
	<div class="big_content">
		<span id="small">석수 숯불 돼지갈비, 황산벌,그리고...  <b>갈비대첩</b></span><br/>
		<span id="big">최고의 갈비 맛을 드리겠습니다</span>
	</div>
</main>	


<%@include file="../bottom.jsp" %>