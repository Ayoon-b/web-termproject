<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%> 
<%@taglib prefix="util" tagdir="/WEB-INF/tags/util"%>

<%@ page import="java.sql.*"%> 

<!DOCTYPE html>
<html>
<head>
<!-- 세션 체크 -->
<%
	String id = (String)session.getAttribute("id");            
	if(id==null||id.equals("")){                       
	response.sendRedirect("login3.jsp");    
}	

%>
<script language="JavaScript">
function next()
{location = "logout.jsp";}
</script>

	<style>		
		.menu{
		position: absolute;
		top : 10%;
		left : 15%;
		}
		.content{
			position: absolute;
			top : 45%;
			left : 40%;
		}
	
	</style>
<meta charset="utf-8">
<title>Board</title>
</head>
<body onLoad="setTimeout('next()', 1500)" background= "image/big.PNG">
	<div class="menu" style='display:inline;min-width:1500px;'>
		<img src="image/kpu.PNG" width ="100px" height="50px" />	
	</div>
	<div class="content">
		<H1>Thank you for visiting our web site.</H1><BR>
		<H3>잠시 후에 로그인 페이지로 이동합니다.</H3>
	</div>

</body>
</html>