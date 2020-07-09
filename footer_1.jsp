<%@ page language="java" contentType="text/html; charset=utf-8"
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
		<H3>이용 약관</H3><BR>
<BR>제 1 장 총 칙

<BR>제 1 조 (목적) <BR>
 이 이용약관(이하 '약관')은 산기닷컴(이하 “회사”라 합니다)과 이용 고객(이하 “회원”)간에 회사<BR>
가 제공하는 서비스의 가입조건 및 이용에 관한 다음의 제반 사항과 기타 기본적인 사항을 구체<BR>
적으로 규정함을 목적으로 합니다.<BR>
<BR>
제 2 조 (이용약관의 효력 및 변경) <BR>
(1) 이 약관은  “회사”  웹사이트에서 온라인으로 공시함으로써 효력을 발생하며, 합리적인 사유<BR>
가 발생할 경우 관련법령에 위배되지 않는 범위 안에서 개정될 수 있습니다. 개정된 약관은 온<BR>
라인에서 공지함으로써 효력을 발휘하며, 이용자의 권리 또는 의무 등 중요한 규정의 개정은 <BR>
사전에 공지합니다.<BR>
		<BR>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>