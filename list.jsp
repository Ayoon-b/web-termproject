<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head><%
	String id = (String)session.getAttribute("id");            
	if(id==null||id.equals("")){                       
	response.sendRedirect("login3.jsp");    
}	

%>
<body>
	<%@include file = "dbconn.jsp" %>
		<%
		int currentPage=1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		request.setCharacterEncoding("utf-8");
		
		int totalCount=0;
		int limit=5;
		
		ResultSet total_rs = null;
		ResultSet rs = null;
		PreparedStatement total_pstmt = null;
		PreparedStatement pstmt = null;
		
		try{
			//전체 게시글 갯수 구하기
			String sqlForCount = "select num from gesipan order by num desc";
			total_pstmt = conn.prepareStatement(sqlForCount);
			total_rs = total_pstmt.executeQuery();
			if(total_rs.next()){
				totalCount = total_rs.getInt("num");
			}
			//게시글 출력
			String sql = "select * from gesipan order by num desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,(currentPage-1)*limit);
			pstmt.setInt(2,limit);
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
			</table>
		<%
			int totalPage = totalCount/limit;
			if(totalCount % limit != 0){ // 총 테이블 정보가 22개이고, 페이지 limit이 10일 경우, 총 페이지수는 2개가 아닌 3개가 되어야함.
				totalPage+=1;
			}
		%>
		<div>
		<%
			if(currentPage>1){
		%>
				<form>
					<input type="hidden" name = "currentPage" value="<%=currentPage-1%>">
					<input type="submit" value="이전">
				</form>
		<%
			}
		%>
		<%
			if(currentPage < totalPage){
		%>
				<form>
					<input type="hidden" name = "currentPage" value="<%=currentPage+1%>">
					<input type="submit" value="다음">
				</form>
		<%
			}
		%>
		</div>
		<%
		}catch(SQLException ex){
			out.println("페이지 오류로 인하여 회원가입에 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		}finally{
			if(pstmt!=null)
				pstmt.close();
			if(total_pstmt!=null)
				total_pstmt.close();
			if(conn!=null)
				conn.close();
		}
		%>
</body>
</html>