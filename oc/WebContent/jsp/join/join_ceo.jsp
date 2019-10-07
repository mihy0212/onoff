<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="selectvar.css" />
<title>CEO회원가입 페이지</title>
<script type="text/javascript">
	function idCheck() {
		var chkId = document.frm.userEmail;
		if (chkId.value == "") {
			alert("아이디를 입력하세요.")
			chkId.focus();
			return false;
		}

		window.open("idCheck.do?userEmail=" + chkId.value, "",
				"width=500,height=400");
	}
	function NickCheck() {
		var chkNick = document.frm.userNickname;
		if (chkNick.value == "") {
			alert("닉네임을 입력하세요.")
			chkNick.focus();
			return false;
		}

		window.open("NickCheck.do?userNickname=" + chkNick.value, "",
				"width=500,height=400");
	}
    $(function(){
        $("#alert-success").hide();
        $("#alert-danger").hide();
        $("input").keyup(function(){
            var pwd1=$("#userPw").val();
            var pwd2=$("#userPwck").val();
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                    $("#alert-success").show();
                    $("#alert-danger").hide();
                    $("#submit").removeAttr("disabled");
                }else{
                    $("#alert-success").hide();
                    $("#alert-danger").show();
                    $("#submit").attr("disabled", "disabled");
                }    
            }
        });
    });
</script>
</head>
<body>
<br /><br /><br /><br />
	<div class="container">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div class="jumbotron" style="padding-top: 20px;">
				<h3 style="text-align: center;">회원가입 화면</h3>
				<br />
				<form id="frm" name="frm" method="post" action="join_ceo.do"
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
						<input type="password" class="form-control" placeholder="비밀번호"
							id="userPw" name="userPw">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호 확인"
							id="userPwck" name="userPwck">
						<div class="alert alert-success" id="alert-success">비밀번호가
							일치합니다.</div>
						<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
							않습니다.</div>

					</div>
					<div class="form-group" style="text-align: center;">
						<input type="text" class="form-control" placeholder="이름"
							id="userName" name="userName">
					</div>
					<div class="form-group">
						<div class="col-sm-8" style="padding: 0px">
							<input type="text" class="form-control" placeholder="닉네임"
								id="userNickname" name="userNickname">
						</div>
						<div class="col-sm-4">
							<input type="button" class="btn btn-primary form-control"
								onclick="NickCheck()" value="중복체크">
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="주소"
							id="userAddr" name="userAddr">
					</div>
					<!-- <div class="form-group">
						<input type="text" class="form-control" placeholder="주소좌표"
							id="userXY" name="userXY">

					</div> -->
					<h3 style="text-align: center;">가게등록</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="가게이름"
							id="storeName" name="storeName" maxlength="20">

					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="주소"
							id="storeAddr" name="storeAddr">
					</div>
					<!-- <div class="form-group">
						<input type="text" class="form-control" placeholder="주소좌표"
							id="storeXY" name="storeXY">
					</div> -->
					<br /> <select name="storeCa1" style="width: 100px;">
						<option value="01" selected="selected">음식점</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select name="storeCa2"
						style="width: 100px;">
						<option value="01">점포가게</option>
						<option value="02" selected="selected">이동가게</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select name="storeCa3"
						style="width: 100px;">
						<option value="01" selected="selected">한식</option>
						<option value="02">양식</option>
						<option value="03">중식</option>
						<option value="04">일식</option>
						<option value="05">분식</option>
						<option value="06">기타</option>
					</select>
					<div class="form-group">
						<br /> <input type="text" class="form-control"
							placeholder="가게라이센스" id="storeLicense" name="storeLicense">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="유저라이센스"
							id="user_license" name="userLicense">
					</div>
					<div class="form-group">
						사업자등록증 첨부 :<input type="file" name="addCapture" id="addCapture" /><br />

					</div>


					<div>
						<input type="submit" class="btn btn-primary form-control"
							onclick="location.href='join_ceo.do'" value="회원가입">

					</div>
					<br /> <input type="reset" class="btn btn-primary form-control"
						onclick="location.href='index.do'" value="취소">
				</form>
			</div>
		</div>
		<div class="col-lg-3"></div>
	</div>


</body>
</html>