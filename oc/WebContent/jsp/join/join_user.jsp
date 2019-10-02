<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../../css/bootstrap.css">
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script type="text/javascript">


	function idCheck() {
		var chkId = document.frm.userEmail;
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
<div class="col-lg-3"></div>
<div class="col-lg-6">
<div class="jumbotron" style="padding-top: 20px;">
<h3 style="text-align: center;">회원가입 화면</h3><br />
			<form id="frm" name="frm" method="post" action="join_user.do"
					class="form-horizontal">
					<div class="form-group">
						<div class="col-sm-8" style="padding: 0px">
							<input type="text" class="form-control" placeholder="아이디/이메일"
								id="userEmail" name="userEmail" maxlength="20">
						</div>
						<div class="col-sm-4">
							<input type="button" class="btn btn-primary form-control"
								onclick="idCheck()" value="중복체크">
						</div>
						</div>
	<div class="form-group">
	<input type="password" class="form-control" placeholder="비밀번호" id="userPw" name="userPw">
	</div>
		<!--<div class="form-group">
	<input type="password" class="form-control" placeholder="비밀번호 확인" id="userPw" name="userPw">
	</div>-->
		<div class="form-group" style="text-align: center;">
	<input type="text" class="form-control" placeholder="이름" id="userName" name="userName">
	</div>
	<div class="form-group">
	<div class="col-sm-8" style="padding: 0px">
	<input type="text" class="form-control" placeholder="닉네임" id="userNickname" name="userNickname">
	</div>
		<div class="col-sm-4">
	<input type="button" class="btn btn-primary form-control"
		onclick="idCheck()" value="중복체크">
	</div>
	</div>
			<div class="form-group">
	<input type="text" class="form-control" placeholder="주소" id="userAddr" name="userAddr">
	</div>


	<div>
	<input type="button" class="btn btn-primary form-control" onclick="checkForm()" value="회원가입"></div><br />
	<input type="reset" class="btn btn-primary form-control"  onclick="location.href='index.do'" value="취소">
</form>
</div>
</div>
<div class="col-lg-3"></div>
</div>
<script src="https://code.jquery.com/../../js/jquery-3.3.2.min.js"></script>
<script src="../../js/bootstrap.js"></script>
</body>
</html>