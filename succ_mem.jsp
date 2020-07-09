<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%> 
<%@taglib prefix="util" tagdir="/WEB-INF/tags/util"%>

<%@ page import="java.sql.*"%> 
<!-- 세션 체크. -->
<%
	String id = (String)session.getAttribute("id");            
	if(id==null||id.equals("")){                       
	response.sendRedirect("login3.jsp");    
}	

%>
<!DOCTYPE html>
<html>
<head>
<script language="JavaScript">
function next()
{location = "login3.jsp";}
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
<body onLoad="setTimeout('next()', 1500)" background= "image/big.PNG" >

	<div class="content">
		
		<H3>회원가입 성공!</H3>
	</div>

</body>
</html>