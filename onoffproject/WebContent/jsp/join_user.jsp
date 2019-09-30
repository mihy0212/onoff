<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
<div class="jumbotron" style="padding-top: 20px;">
<form method="post" action="loginAction.jsp">
	<h3 style="text-align: center;">회원가입 화면</h3>
	<div class="form-group">
	<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
	</div>
	<div class="form-group">
	<input type="password" class="form-control" placeholder="비밀번호" name="userPassword">
	</div>
		<div class="form-group" style="text-align: center;">
	<input type="text" class="form-control" placeholder="이름" name="userName">
	<div class="form-group" style="text-align: center;">
		<div class="btn-group" data-toggle="buttons">
			<label class="btn btn-primary active">
				<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
			</label>
			<label class="btn btn-primary">
				<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
			</label>
		</div>
	</div>
	
	</div>
		<div class="form-group">
	<input type="text" class="form-control" placeholder="이메일" name="userEmail">
	</div>
		<div class="form-group">
	<input type="text" class="form-control" placeholder="닉네임" name="userNickname">
	</div>
		<div class="form-group">
	<input type="text" class="form-control" placeholder="주소" name="userAddr">
	<div class="btn-group" data-toggle="buttons"></div>
	</div>

	<input type="submit" class="btn btn-primary form-control" value="회원가입">

</form>
</div>
</div>
<div class="col-lg-4"></div>
</div>
<script src="https://code.jquery.com/../js/jquery-3.3.2.min.js"></script>
<script src="../js/bootstrap.js"></script>
</body>
</html>