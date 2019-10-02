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
<script type="text/javascript">
<sc

	function idCheck() {
		var chkId = document.frm.userID;
		if(chkId.value == "") {
			alert("아이디를 입력하세요.")
			chkId.focus();
			return false;
		}
		
		window.open("idCheck.do?userID="+chkId.value,"","width=400,height=200");
	}
</script>
</head>
<body>
<div class="container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
<div class="jumbotron" style="padding-top: 20px;">
<form id="frm" name="frm" method="post" action="join_user.do">
	<h3 style="text-align: center;">회원가입 화면</h3>
	<div class="form-group">
	<input type="text" class="form-control" placeholder="아이디/이메일" id="userEmail" name="userEmail" maxlength="20"><p>
	<p><input type="button" class="btn btn-primary form-control" onclick="idCheck()" value="중복체크"> 
	</div>
	<div class="form-group">
	<input type="password" class="form-control" placeholder="비밀번호" id="userPassword" name="userPassword">
	</div>
		<div class="form-group">
	<input type="password" class="form-control" placeholder="비밀번호 확인" id="userPassword" name="userPassword">
	</div>
		<div class="form-group" style="text-align: center;">
	<input type="text" class="form-control" placeholder="이름" id="userName" name="userName">
	</div>
			<div class="form-group">
	<input type="text" class="form-control" placeholder="전화번호" id="userTell" name="userTell">
	</div>
		<div class="form-group">
	<input type="text" class="form-control" placeholder="닉네임" id="userNickname" name="userNickname">
	</div>
		<div class="form-group">
	<input type="text" class="form-control" placeholder="주소" id="userAddr" name="userAddr">
	<div class="btn-group" data-toggle="buttons"></div>
	</div>
	<div>
	<input type="button" class="btn btn-primary form-control" onclick="checkForm()" value="회원가입"></div><br />
	<input type="reset" class="btn btn-primary form-control"  onclick="location.href='index.do'" value="취소">
</form>
</div>
</div>
<div class="col-lg-4"></div>
</div>
<script src="https://code.jquery.com/../../js/jquery-3.3.2.min.js"></script>
<script src="../../js/bootstrap.js"></script>
</body>
</html>