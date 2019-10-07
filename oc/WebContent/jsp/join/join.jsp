<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입 선택 페이지</title>
</head>
<body>
<br /><br /><br /><br />
<div class="container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
<div class="jumbotron" style="padding-top: 20px;">
<form method="post">
<div> <br />
	<input type="button" class="btn btn-primary form-control" onclick="location.href='join_userform.do'" value="유저 회원가입">
	</div><br />
	<input type="button" class="btn btn-primary form-control" onclick="location.href='join_ceoform.do'" value="CEO 회원가입">
</form>
</div>
</div>
<div class="col-lg-4"></div>
</div>
</body>
</html>