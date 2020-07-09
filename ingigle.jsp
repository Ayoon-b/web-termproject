<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%> 
<!-- 세션 체크 -->
<%
	String id = (String)session.getAttribute("id");            
	if(id==null||id.equals("")){                       
	response.sendRedirect("login3.jsp");    
}	
%>
    
<!DOCTYPE html>
<html>
<head>
	<style>
		.content{
			position: absolute;
			top : 42%;
			left : 28%;
		}
			.write{
			position: absolute;
			top : 83%;
			left : 75%;
		}
	</style>
<meta charset="UTF-8">
<title>Board</title>
</head>
 
<body>
	<jsp:include page="header.jsp"></jsp:include>
		
	<div class="content">
		<jsp:include page="ingigle_list.jsp"></jsp:include>
	</div>
		<div class="write">
		<form action ="search2.jsp">
		<input type = "text" name ="search" >
		<input type="submit" value="검색">
		</form>
		<input type=button value="글쓰기" OnClick="window.location='write_board.jsp'">
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
		<br /> 
</body>
</html>