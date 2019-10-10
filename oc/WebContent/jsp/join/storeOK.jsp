<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function isclose(){
		opener.document.frm.userEmail.focus();
		window.close();
	}
	
</script>
</head>
<body>
<div align ="center">
<h1>${param.storeName } 사용 가능한 아이디입니다.</h1>
<button type="button" onclick="isclose()">확인</button>
</div>
</body>
</html>