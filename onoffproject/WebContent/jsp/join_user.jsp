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
<script type="text/javascript">
function checkForm(){
	var form = document.frm;
	if(form.userID.value==""){
		alert("아이디를 입력하세요.")
		form.userID.focus();
		return false;
	}
	if(form.userPassword.value==""){
		alert("패스워드를 입력하세요.")
		form.userPassword.focus();
		return false;
	}
	if(form.userName.value==""){
		alert("이름을 입력하세요.")
		form.userName.focus();
		return false;
	}
	if(form.userEmail.value==""){
		alert("이메일을 입력하세요.")
		form.userEmail.focus();
		return false;
	}
	if(form.userTell.value==""){
		alert("전화번호를 입력하세요.")
		form.userTell.focus();
		return false;
	}
	if(form.userNickname.value==""){
		alert("닉네임을 입력하세요.")
		form.userNickname.focus();
		return false;
	}
	form.submit();
	
}

	function idCheck() {
		var chkId = document.frm.id;
		if(chkId.value == "") {
			alert("아이디를 입력하세요.")
			chkId.focus();
			return false;
		}
		
		window.open("idCheck.do?id="+chkId.value,"","width=400,height=200");
	}
</script>
</head>
<body>
<div class="container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
<div class="jumbotron" style="padding-top: 20px;">
<form method="post" action="loginAction.jsp">
	<h3 style="text-align: center;">회원가입 화면</h3>
	<div class="form-group">
	<input type="text" class="form-control" placeholder="아이디" id="userID" name="userID" maxlength="20">
	<input type="button" onclick="idCheck()" value="중복체크"> 
	</div>
	<div class="form-group">
	<input type="password" class="form-control" placeholder="비밀번호" id="userPassword" name="userPassword">
	</div>
		<div class="form-group" style="text-align: center;">
	<input type="text" class="form-control" placeholder="이름" id="userName" name="userName">
	<div class="form-group" style="text-align: center;">
		<div class="btn-group" data-toggle="buttons"><br />
			<label class="btn btn-primary active">
				<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
			</label>
			<label class="btn btn-primary">
				<input type="radio" name="userGender" autocomplete="off" value="여자" >여자
			</label>
		</div>
	</div>
	
	</div>
		<div class="form-group">
	<input type="text" class="form-control" placeholder="이메일"  id="userEmail" name="userEmail">
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

	<input type="submit" class="btn btn-primary form-control" value="회원가입">

</form>
</div>
</div>
<div class="col-lg-4"></div>
</div>
<script src="https://code.jquery.com/js/jquery-3.3.2.min.js"></script>
<script src="../js/bootstrap.js"></script>
</body>
</html>