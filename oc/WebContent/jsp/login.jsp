<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
<div class="jumbotron" style="padding-top: 20px;">
<form method="post" action="loginAction.jsp">
	<h3 style="text-align: center;">로그인 화면</h3><p>
	<div class="form-group">
	<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
	</div>
	<div class="form-group">
	<input type="password" class="form-control" placeholder="비밀번호" name="userPassword">
	</div>
	<div>
	<input type="submit" class="btn btn-primary form-control" value="로그인">
	</div><br />
	<input type="submit" class="btn btn-primary form-control" value="회원가입">
</form>
</div>
</div>
<div class="col-lg-4"></div>
</div>
</body>
</html>