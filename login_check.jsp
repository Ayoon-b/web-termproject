<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script language="JavaScript">
function next()
{location = "login3.jsp";}
</script>

<body onLoad="setTimeout('next()', 1500)">


	<%@include file = "dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
			String sql = "select id, passwd from members where id = ?"; // db에서 입력한 id 필드가 있는지 확인 후 가져옴.
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String rId = rs.getString("id");
				String rPasswd = rs.getString("passwd");
				
				if(id.equals(rId) && passwd.equals(rPasswd)){ // 입력한 아이디와 비밀번호가 db에 존재하면 세션 저장후, login페이지로 넘김.
					session.setAttribute("id",id);
					session.setAttribute("passwd", passwd);
					response.sendRedirect("login3.jsp");
				}else
					out.println("비밀번호가 다릅니다.");
			}
			else{
				%>
				<script>
				alert('등록되지 않은 회원입니다.');
				history.back();
				</script><%
			}
		}catch(SQLException ex){
			out.println("SQLException: " + ex.getMessage());
		}finally{
			if(rs != null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}
	%>
</body>
</html>