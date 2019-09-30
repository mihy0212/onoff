<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<div align="center">
	<div><h1>회 원 가 입</h1></div>
	<div>
		<form id="frm" name="frm" action="loginOk.jsp" method="post">
			<button type="button" onclick="location.href='insertuser.jsp'">일반사용자</button>&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="location.href='insertstore.jsp'">사장님</button>
		</form>
	</div>
</div>
</body>
</html>