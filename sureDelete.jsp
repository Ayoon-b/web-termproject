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
 <title>Ż�� ȭ��</title>
<body background= "image/big.PNG" >
<center>
	<BR><BR><BR>
	<h2>������ Ż���Ͻðڽ��ϱ�? </h2><BR>
	<button onclick="tal()" >��</button>	
	<button onclick="no()" >�ƴϿ�</button>
</center>
</body>


