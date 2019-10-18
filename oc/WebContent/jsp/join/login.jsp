<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인 페이지</title>
<script type="text/javascript">

function login() {
	var form = document.frm;
	if (!form.userEmail.value) {
		alert("정보를 입력 해주세요");
		form.userEmail.focus();
		return;
	}

	form.submit();
}

</script>
</head>

<body>
<br /><br /><br /><br />
<div class="container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
<div class="jumbotron" style="padding-top: 20px;">
<form name=frm method="post" action="login.do">
	<h3 style="text-align: center;">로그인 화면</h3><p>
	<div class="form-group">
	<input type="text" class="form-control" placeholder="아이디" name="userEmail" maxlength="20">
	</div>
	<div class="form-group">
	<input type="password" class="form-control" placeholder="비밀번호" name="userPw">
	</div>
	<div>
	<input type="button" class="btn btn-primary form-control" onclick="login()" value="로그인">
	</div><br />
	<input type="button" class="btn btn-primary form-control" onclick="location.href='join_form.do'" value="회원가입"><br />
	<br><input type="button" class="btn btn-primary form-control" onclick="location.href='findform.do'" value="ID/PW찾기">
</form>
</div>
</div>
<div class="col-lg-4"></div>
</div>

</body>
</html>