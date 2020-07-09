<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
</head>
	<style>
		.content{
			position: absolute;
			top : 27%;
			left : 40%;
		}
		</style>
	<script type="text/javascript">
		function checkMember(){
			
			var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			var regExpName = /^[가-힣]*$/;
			<!--비밀번호는 영문, 숫자 혼합 6~20자리 이내-->
			var regExpPasswd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
			var regExpEmail = /^[0-9a-zA-z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			var form = document.Member;
			
			var id = form.id.value;
			var name = form.username.value;
			var passwd = form.passwd.value;
			var repass = form.repass.value;
			var email = form.email.value;
			
			if(!regExpId.test(id)){
				alert("아이디는 문자로 시작해주세요!");
				event.preventDefault();
				return;
			}
			if(!regExpName.test(name)){
				alert("이름은 한글만 입력해주세요!");
				event.preventDefault()
				return;
			}
			if(!regExpPasswd.test(passwd)){ 
				alert("비밀번호는 영문, 숫자 혼합 6~20자리 이내로 입력해주세요.");
				event.preventDefault()
				return;
			}
			if(passwd!=repass){
				alert("비밀번호와 재확인 비밀번호가 다릅니다.");
				event.preventDefault()
				return;
			}
			if(!regExpEmail.test(email)){
				alert("이메일 입력을 확인해주세요!");
				event.preventDefault()
				return;
			}
			form.submit();
		}
		
	</script>
<body background= "image/big.PNG">
	
		<form name="Member" action="member_insert.jsp" method="post">
		  <div class="content">
		  <h3>회원 가입</h3>
			<table border="1">
				<tr><td>아이디 </td><td><input type="text" name="id"></td></tr>
				<tr><td>비밀번호 </td><td><input type="password" name="passwd"></td></tr>
				<tr><td>비밀번호 재확인 </td><td><input type="password" name="repass"></td></tr>
				<tr><td>이름 </td><td><input type="text" name="username"></td></tr>
				<tr><td>이메일 </td><td><input type="text" name="email"></td></tr>
				<tr><td colspan="2"><input type="submit" value="가입하기" onclick="checkMember()">
				<input type="reset" value="삭제">
				</td></tr>
			</table>
			</div>
		</form>
</body>
</html>