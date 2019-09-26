<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkForm(){
		var form = document.frm;
		if(form.id.value == "") {
			alert("아이디를 입력 하세요.");
			form.id.focus();
			return false;
		}
		if(form.pw.value == "") {
			alert("패스워드를 입력 하세요.");
			form.pw.focus();
			return false;
		}
		
	}

</script>
</head>
<body>
<div align="center">
	<div><h1>로 그 인</h1></div>
	<div>
		<form id="frm" name="frm" action="loginOk.jsp" method="post">
			<table border="1">
				<tr>
					<th width="100">아이디</th>
					<td><input type="text" id="id" name="id" size="20"></td>
				</tr>
				<tr>
					<th width="100">패스워드</th>
					<td><input type="password" id="pw" name="pw" size="20"></td>
				</tr>
			</table><p>
			<input type="button" onclick="checkForm()" value="로그인">&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="location.href='index.jsp'">취소</button>
		&nbsp;&nbsp;&nbsp;	<button type="button" onclick="location.href='index.jsp'">회원가입</button>
		</form>
	</div>
</div>

</body>
</html>