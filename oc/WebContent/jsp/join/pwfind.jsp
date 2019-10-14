<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>패스워드 찾기</title>
</head>
<body>
<br /><br /><br /><br />
<div class="container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
<div class="jumbotron" style="padding-top: 20px;">
<form method="post" action="pwfind.do">
	<h3 style="text-align: center;">패스워드 찾기</h3><p>
	<div class="form-group">
	<input type="text" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
	</div>
		<div class="form-group">
	<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
	</div>
	<div>
	<input type="submit" class="btn btn-primary form-control" value="패스워드 찾기">
	</div><br />
	<input type="button" class="btn btn-primary form-control" onclick="location.href='join_form.do'" value="회원가입">
</form>
</div>
</div>
<div class="col-lg-4"></div>
</div>

</body>
</html>