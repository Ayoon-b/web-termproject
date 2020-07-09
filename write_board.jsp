<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
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
			top : 41%;
			left : 20%;
		}
	</style>
<meta charset="UTF-8">
<title>Board</title>
</head>
<script language ="javascript">

function writeCheck()
{
	var form = document.writeform;
	var str = form.content.value.length;
	if( !form.subject.value )
	{
		alert( "제목을 적어주세요" );
		form.title.focus();
		return;
	}

	if( !str )
 	{
  		alert( "내용을 적어주세요" );
  		form.memo.focus();
  		return;
	}

	if( str > 1000)
	{
 		alert( "1000자 이내로 적어주세요" );
 		return;
	}
	form.submit();
}
 </script>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<%
		request.setCharacterEncoding("utf-8");
		String writer = (String)session.getAttribute("id"); // 세션 id 정보 = 작성자 이므로 이를 writer 변수에 저장.
	%>
	<form name=writeform method=post action="/TermProject/GesiCheck">
	<div class="content">
		<table>
  			<tr>
 				<td>
    				<table width="100%" >
     					<tr style="background:url('image/background.png') repeat-x; text-align:center;">
      						<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      						<td>글쓰기</td>
      						<td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     					</tr>
    				</table>
   					<table>
     					<tr>
     						<td align="center">제목</td>
      						<td><input name="subject" size="100" maxlength="100"></td>
     					</tr>
     					<tr style="background:url('image/background.png') repeat-x; text-align:center;">
      						
      						<td align="center">내용</td>
      						<td> 
      							<textarea name="content" cols="100" rows="13"></textarea>
      						</td>
     					</tr>
     					<!-- 게시글 테이블에 writer 테이블에 들어갈 값을 넘겨줘야 하므로 이를 hidden 값으로 넘겨줌. -->
     					<input type="hidden" name="writer" value="<%=writer%>">
     					<tr align="center">
      					<td colspan="2">
      						<input type=button value="등록" OnClick="javascript:writeCheck();">					
     					</tr>
  			  		</table>
				</td>
 			</tr>
		</table>
	</div> 
</form>	
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>