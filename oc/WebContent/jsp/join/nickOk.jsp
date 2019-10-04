<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function isclose(){
		opener.document.frm.userNickname.focus();
		window.close();
	}
	
</script>
</head>
<body>
<div align ="center">
<h1>${param.userNickname } 사용 가능한 닉네임입니다.</h1>
<button type="button" onclick="isclose()">확인</button>
</div>
</body>
</html>