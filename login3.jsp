<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<style>
		.content{
			position: absolute;
			top : 27%;
			left : 40%;
		}
		
			</style>
<body background= "image/big.PNG" repeat= no-repeat>


	<%
		request.setCharacterEncoding("utf-8");
	%>
	  <%
        // 현재 로그인된 아이디가 없다면 (= session에 저장된 id가 없다면)
        if(session.getAttribute("id") == null) {
            %>
            <div class="content">
            <h1> 로그인 페이지 </h1> 
            <br /> <form action="login_check.jsp" method="post">
            <br />
            <br /> <input name="id" type="text">
            <br />
            <br /> <input name="passwd" type="password"> <button> 로그인 </button>
            <br /> </form>
            <br /> <button onClick="location.href='SignUp.jsp'"> 회원가입 </button>
            </div>
            <%
        } 
        // 현재 로그인된 아이디가 있다면 (= session에 저장된 id가 있다면)
        else {
            out.print(session.getAttribute("id") + " 님 환영합니다");
            %>
            <!--
            <h1> 로그인 페이지 </h1> 
            <br /> <form action="board.jsp" method="post">
            <br />
            <br /> <button> 로그아웃 </button>
            <br />
            <br /> </form>
            <!--<br /> <button onClick="location.href='CHANGEPROFILE.jsp'"> 개인정보 변경</button> -->
            -->
            <%response.sendRedirect("board.jsp");
            
        }
    %>
</body>
</html>