<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.menu{
		position: absolute;
		top : 10%;
		left : 15%;
	}
	.photo{
		position: absolute;
		top : 20%;
		left : 15%;
	}
</style>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>

	<div class="menu" style='display:inline;min-width:1500px;'>
				<div style='display:inline;float:left;width:200px'>
				<a href="board.jsp"><img src="image/kpu.PNG" width ="100px" height="50px" /></a>					
				
				</div>
				<div style='display:inline;float:left;width:200px'>
					<a href="board.jsp"><img src="image/gesigesi1.PNG"  width ="150px" height="50px" /></a>
				</div>
				<div style='display:inline;float:left;width:200px'>
					<a href="ingigle.jsp"><img src="image/ingigle.PNG"  width ="150px" height="50px" /></a>
				</div>
				<div style='display:inline;float:left;width:200px'>
					<a href="myPage.jsp"><img src="image/mymy.PNG"  width ="150px" height="50px" /></a>
					
				</div>
				<%
				// 로그인 한 뒤에, 세션 정보의 id를 받아와서 출력해줌.
				out.print(session.getAttribute("id") + " 님 환영합니다");
				%>
		
			<form action="thankyou.jsp" method="post">
          		<button> 로그아웃 </button>
            </form>
	</div>
	<div class="photo">
		<a href="http://www.kpu.ac.kr"><img src="image/header_photo.PNG"  width ="1000px" height="130px" /></a>
			
	</div>
</body>
</html>