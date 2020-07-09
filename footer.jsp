<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
	.copyright{
		position: absolute;
		top : 96%;
		left : 30%;
	}
		.sun{
		position: absolute;
		top : 93%;
		left : 10%;
	}
</style>
<script language="JavaScript">
function next()
{location = "footer_1.jsp";}
function next2()
{location = "footer_2.jsp";}
function next3()
{location = "footer_3.jsp";}

</script>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="sun">
</div>
<div class="copyright">


<button onclick="next()" >이용약관</button>	
<button onclick="next2()" >개인정보처리방침</button>
<button onclick="next3()" >사이트소개</button><BR>

		Copyright ⓒ sanki. All rights reserved.
</div>
</body>
</html>