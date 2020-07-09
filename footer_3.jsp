<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%> 
<%@taglib prefix="util" tagdir="/WEB-INF/tags/util"%>

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
			top : 45%;
			left : 23%;
		}
	</style>
<meta charset="utf-8">
<title>Board</title>
</head>
 
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="content">
	
	<H3>사이트 소개 </H3><BR><BR>
같은 학교 학우들 간의 정보공유와 친목 도모를 위한 커뮤니티 사이트, 회원만 이용할 수 있으<BR>
며, 게시판에 글을 올려 같은 학교 학우들끼리 자유롭게 소통할 수 있다. <BR><BR>
 
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>