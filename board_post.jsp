<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 세션 체크 -->
<%
   String id = (String)session.getAttribute("id");            
   if(id==null||id.equals("")){                       
   response.sendRedirect("login3.jsp");    
}   
   request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<!-- 웹페이지 구성요소 위치 설정 -->
   <style>
      .content{
         position: absolute;
         top : 42%;
         left : 15%;
         bottom: 1%
      }
         .write{
         position: absolute;
         top : 83%;
         left : 75%;
      }
   </style>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<!-- db 사용하기 위해 db 설정 jsp 파일 include -->
<%@include file = "dbconn.jsp" %>
   <div class="content">
      <%
      int num = Integer.parseInt(request.getParameter("num")); // list.jsp 에서 게시글의 num 필드를 받아옴.
      														   // 특정 게시글을 클릭했을 때, 그 게시글의 정보를 띄워주기 위함.

      request.setCharacterEncoding("utf-8");
   
      ResultSet rs = null;
      PreparedStatement pstmt = null;
      
	  try{
         //게시글 출력
         String sql = "select * from gesipan where num = ?"; // 받아온 num 값을 가진 게시글 테이블의 모든 정보를 가져옴.
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1,num);
         rs = pstmt.executeQuery(); %>
         <%
         if(rs.next()){
            String writer=rs.getString("writer");
            String sub=rs.getString("subject");
            String con=rs.getString("content");
            String reg_date=rs.getString("reg_date");
            int hits=rs.getInt("hits"); // 게시글 페이지에 들어갔을 경우, 게시글을 본 것이므로 조회수 필드를 하나 증가시킴.
            hits++;
            
         String sql2 = "update gesipan set hits=? where num=?;"; // 받아온 num 값을 가진 게시글 테이블의 조회수 필드를 업데이트.
         pstmt = conn.prepareStatement(sql2);
         pstmt.setInt(1,hits);
         pstmt.setInt(2,num);
         pstmt.executeUpdate();
       
      %>
         <table border="1" width="1000">
         <tr>
            <td style="background:skyblue">글 번호</td>
            <td style="background:skyblue">제목</td>
            <td style="background:skyblue">조회수</td>
         </tr>
         <tr>
            <td><%=num %></td>
            <td><%=sub %></td>
            <td><%=hits %></td>
         </tr>
         </table>
         <table border="1" width="1000">
         <tr>
            <td style="background:skyblue">글쓴이</td>
            <td style="background:skyblue">날짜</td>
         </tr>
         <tr>
            <td><%=writer %></td>
            <td><%=reg_date %></td>
         </tr>
         </table>
         <table border="1" width="1000">
         <tr><td style="background:skyblue">글 내용</td></tr>
            <tr><td><%=con%></td></tr>
         </table>
         <%
         }
	  } catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{rs.close();}catch(SQLException s){}		
			try{pstmt.close();}catch(SQLException s){}		
			try{conn.close();}catch(SQLException s){}		
		}
         %>
         </div>
      <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>