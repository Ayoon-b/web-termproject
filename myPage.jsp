<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="util" tagdir="/WEB-INF/tags/util"%>
<%@ page import="java.sql.*"%> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		.content{
			position: absolute;
			top : 42%;
			left : 13%;
		}
			.write{
			position: absolute;
			top : 83%;
			left : 75%;
		}
	</style>
<meta charset="EUC-KR">
<title>Board</title>
</head>
<%
	String id2 = (String)session.getAttribute("id");            
	if(id2==null||id2.equals("")){                       
	response.sendRedirect("login3.jsp");    
}	

%>
<script language="JavaScript">
function omg()
{location = "sureDelete.jsp";}

</script>
<body>
<%@include file = "dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("id");
	String passwd = (String)session.getAttribute("passwd");
	String name="";
	String email="";
	//if(id==null||id.equals("")){                       
	//response.sendRedirect("login3.jsp");    
//}	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	try{
		String sql = "select id,passwd,name,email from members where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id); // 쿼리문의 ?에 해당하는 값
		rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");
			if(id.equals(rId) && passwd.equals(rPasswd)){
				name=rs.getString("name");
				email=rs.getString("email");
			}
		}
	}catch(SQLException ex){
		out.println("SQLException : " + ex.getMessage());
	}finally{
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>


	<jsp:include page="header.jsp"></jsp:include>
	<div class="content">
	<util:doubleLine color = "blue" size=  "100"/>
		<table width="100%" >
			아이디 :${id}<BR><BR>
			이름 : <%=name %><BR><BR>
			이메일 : <%=email %><BR><BR>
		</table>
	<util:doubleLine color = "blue" size=  "100"/>
</div>
	<div class="write">
		<button onclick="omg()" >회원탈퇴</button>	
	</div>
		<jsp:include page="footer.jsp"></jsp:include>
		<br/> 
</body>
</html>