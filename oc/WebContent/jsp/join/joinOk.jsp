<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="col-lg-2"></div>
<div class="col-lg-8">
<div class="jumbotron" style="padding-top: 20px;">
<form name=frm method="post">
<div align="center">
		<h1 style="text-align: center;">${param.userEmail } 님 회원가입 성공! </h1> <!--  request 정보 출력 -->
		<input type="button" class="btn btn-primary form-control" onclick="location.href='loginform.do'" value="로그인"><br />
	</div><p>
	</form>
	</div>
</div>
<div class="col-lg-2"></div>
</div>
</body>
</html>


