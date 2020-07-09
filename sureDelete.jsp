<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script language="JavaScript">
function tal()
{location = "deleteMember.jsp";}

function no()
{location = "myPage.jsp";}

</script>
<%
	String id = (String)session.getAttribute("id");            
	if(id==null||id.equals("")){                       
	response.sendRedirect("login3.jsp");    
}	

%>
 <title>Å»Åð È­¸é</title>
<body background= "image/big.PNG" >
<center>
	<BR><BR><BR>
	<h2>Á¤¸»·Î Å»ÅðÇÏ½Ã°Ú½À´Ï±î? </h2><BR>
	<button onclick="tal()" >³×</button>	
	<button onclick="no()" >¾Æ´Ï¿ä</button>
</center>
</body>


