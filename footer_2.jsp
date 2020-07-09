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
	
	<H3>개인정보처리방침 </H3>
	<BR><BR>■ 수집하는 개인정보의 항목<BR><BR>

- 필수항목 : 이름, 로그인ID, 비밀번호, 이메일<BR><BR>

- 선택항목 : 자기소개<BR><BR>

■ 개인정보의 수집 및 이용 목적<BR><BR>

이름, 계정, 비밀번호 : 서비스 이용에 따른 민원사항의 처리를 위한 본인식별, 실명확인, <BR>
중복가입확인, 연령제한 서비스의 제공, 고객센터의 운영, 부정 이용 방지를 위하여 사용됩니다.<BR>
e-mail, 전화번호, 휴대전화번호, 주소 : 고지사항 전달, 본인 의사확인, 불만처리 등 의사소통 <BR>
경로의 확보, 새로운 서비스나 신상품, 이벤트 정보 등 최신 정보 안내등을 위하여 사용됩니다.<BR>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>