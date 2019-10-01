<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../../css/bootstrap.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
<div class="jumbotron" style="padding-top: 20px;">
<form method="post" action="loginAction.jsp">
<div>
	<input type="submit" class="btn btn-primary form-control" onclick="location.href='join_user.jsp'" value="유저 회원가입">
	</div><br />
	<input type="submit" class="btn btn-primary form-control" value="CEO 회원가입">
</form>
</div>
</div>
<div class="col-lg-4"></div>
</div>
</body>
<script src="https://code.jquery.com/../../js/jquery-3.3.2.min.js"></script>
<script src="../../js/bootstrap.js"></script>
</html>