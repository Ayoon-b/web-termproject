<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
</head>

<script language="JavaScript">
function np()
{location = "logout.jsp";}
</script>

<body onLoad="setTimeout('np()', 1500)" background= "image/big.PNG">
  <%@include file = "dbconn.jsp" %>
  <center>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	try{
		String sql = "select id FROM members WHERE ID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id); // 쿼리문의 ?에 해당하는 값
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String rId = rs.getString("id");
			if(id.equals(rId)){
				String delsql ="delete from members where id =?";
				pstmt = conn.prepareStatement(delsql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				out.println("회원탈퇴 되었습니다.");
				
			}
		}
	} catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{rs.close();}catch(SQLException s){}		
			try{pstmt.close();}catch(SQLException s){}		
			try{conn.close();}catch(SQLException s){}		
		}
	%>
	</center>
</body>
