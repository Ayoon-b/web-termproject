<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<!-- 세션 체크 -->
<%
	String id = (String)session.getAttribute("id");            
	if(id==null||id.equals("")){                       
	response.sendRedirect("login3.jsp");    
}	

%>
	<style>
		.content{
			position: absolute;
			top : 42%;
			left : 21%;
		}
		</style>
<body>
<%@include file = "dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	int limit=50;
	
	try{
		String sql = "select * from gesipan order by num desc"; // num 값 내림차순(최신순)으로 게시판 테이블 정렬. 그리고 모든 필드값 받아오기
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>
	<table border="1">
		<tr>
			<td style = "background: skyblue">글 번호</td>
			<td style = "background: skyblue">제목</td>
			<td style = "background: skyblue">글쓴이</td>
			<td style = "background: skyblue">날짜</td>
			<td style = "background: skyblue">조회수</td>
		</tr>
<%
	while(rs.next()){
		if(rs.getInt("hits")>=limit){
%>
		<tr>
			<td><%=Integer.parseInt(rs.getString("num")) %></td>
			<!-- 게시글을 제목 눌렀을때, 넘겨주는 값으로 게시글의 번호를 줌. -->
			<!-- 페이지 주소에 값이 붙어서 가는 형태로 값을 다음 페이지에 넘겨줌. -->
			<td width="500"><a href="<%=request.getContextPath()%>/board_post.jsp?num=<%=Integer.parseInt(rs.getString("num")) %>">
			<%=rs.getString("subject") %></td>
			<td><%=rs.getString("writer") %></td>
			<td><%=rs.getString("reg_date") %></td>
			<td><%=rs.getString("hits") %></td>
		</tr>
<%
		}
%>
<%
	} 
%>
		</table>
<% 
	}catch(SQLException ex){
		out.println("페이지 오류로 인하여 회원가입에 실패했습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	}finally{
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>
 	</div>
</body>
</html>