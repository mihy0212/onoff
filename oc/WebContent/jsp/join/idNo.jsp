<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function isDateSend(){
		opener.document.frmm.userEmail.value="";
		opener.document.frmm.userEmail.focus();
		window.close();
	}
</script>
</head>
<body>
<div align="center">
<h1> ${param.userEmail } 이미 사용중인 아이디입니다. </h1>
<button type="button" onclick="isDateSend()">확인</button>
</div>
</body>
</html>