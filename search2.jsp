<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>

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
					.write{
			position: absolute;
			top : 83%;
			left : 75%;
		}
		</style>
<body>
<%@include file = "dbconn.jsp" %>
<jsp:include page="header.jsp"></jsp:include>
<%
request.setCharacterEncoding("UTF-8");
String search = request.getParameter("search");
 %>
 	<div class="content">
 		<table border="1">
				<tr>
					<td style = "background:skyblue">글 번호</td>
					<td style = "background:skyblue">제목</td>
					<td style = "background:skyblue">글쓴이</td>
					<td style = "background:skyblue">날짜</td>
					<td style = "background:skyblue">조회수</td>
				</tr>
<%
	request.setCharacterEncoding("utf-8");
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	try{
		String sql = "select * from gesipan where writer=? or subject like ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, search);
		pstmt.setString(2, "%"+search+"%");
		rs = pstmt.executeQuery();
		
		while(rs.next()){
%>		
		<tr>
			<td><%=Integer.parseInt(rs.getString("num")) %></td>
			<!-- 게시글을 제목 눌렀을때, 넘겨주는 값으로 게시글의 번호를 줌. -->
			<td width="500"><a href="<%=request.getContextPath()%>/board_post.jsp?num=<%=Integer.parseInt(rs.getString("num")) %>">
			<%=rs.getString("subject") %></td>
			<td><%=rs.getString("writer") %></td>
			<td><%=rs.getString("reg_date") %></td>
			<td><%=rs.getString("hits") %></td>
		</tr>
		
<%
		}
%>
	</table>
<% 
	}catch(SQLException ex){
		out.println("SQLException: " + ex.getMessage());
	}finally{
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>
 	</div>
 		<div class="write">
			<form action ="search2.jsp">
		<input type = "text" name ="search" >
		<input type="submit" value="검색">
		</form>
		<input type=button value="글쓰기" OnClick="window.location='write_board.jsp'">
		</div>
 	
 	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>