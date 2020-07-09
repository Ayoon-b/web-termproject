<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<script language="JavaScript">
</script>

<body>
	
	<%@include file = "dbconn.jsp" %>
	
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("username");
		String email = request.getParameter("email");
		
		boolean check=false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PreparedStatement check_pstmt = null;
		
		try{
			String check_sql = "select id from members where id = ?";
			check_pstmt = conn.prepareStatement(check_sql);
			check_pstmt.setString(1,id);
			rs = check_pstmt.executeQuery();
			
			if(rs.next()){
				check=true;
			%>
				<script>
					alert('이미 존재하는 아이디 입니다.');
					 history.back();
				</script>
			<%
			}
			else{
			String sql = "insert into members(id, passwd, name, email) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,passwd);
			pstmt.setString(3,name);
			pstmt.setString(4,email);
			pstmt.executeUpdate();
			}
			
			
		}catch(SQLException ex){
			out.println("페이지 오류로 인하여 회원가입에 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		}finally{
			if(pstmt!=null)
				pstmt.close();
			if(check_pstmt!=null)
				check_pstmt.close();
			if(conn!=null)
				conn.close();
		}
	%>
	<% if(!check){
	%>
		<jsp:forward page ="succ_mem.jsp"/>
	<%
	}
	%>
</body>
</html>