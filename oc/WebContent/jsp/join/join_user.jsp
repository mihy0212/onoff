<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 페이지</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e415eb9e7187154cd9c6308c036f0a6&libraries=services,clusterer"></script>
<script type="text/javascript">


	function submitfrm(){
		if($('#userEmail').val() == ""){
			alert("아이디를 입력하세요.");
			return false;
		}
		if( $('#chk_id').val() != "chk"){
			alert("아이디 중복 체크를 해 주세요.");
			return false;
		}
		
		if( $('#chk_email').val() != "chk"){
			alert("이메일 인증을 해 주세요.");
			return false;
		}
		if( $('#userPw').val() == "" ){
			alert("비밀번호를 입력해 주세요.");
			return false;
		}
		if( $('#userPwck').val() == "" ){
			alert("비밀번호 확인해 주세요.");
			return false;
		}
		if( $('#userName').val() == "" ){
			alert("이름을 입력해 주세요.");
			return false;
		}
		if( $('#userNickname').val() == "" ){
			alert("닉네임를 입력해 주세요.");
			return false;
		}
		if( $('#chk_nick').val() != "chk" ){
			alert("닉네임 중복 체크를 해 주세요.");
			return false;
		}
		document.frm.submit();
	}

	function idCheck() {
		var chkId = document.frm.userEmail;
		if(chkId.value == "") {
			alert("아이디를 입력하세요.")
			chkId.focus();
			return false;
		}
		
		window.open("idCheck.do?userEmail="+chkId.value,"","width=500,height=400");
		$('#chk_id').val("chk");
	}
	
	function NickCheck() {
		var chkNick = document.frm.userNickname;
		if(chkNick.value == "") {
			alert("닉네임을 입력하세요.")
			chkNick.focus();
			return false;
		}
		window.open("NickCheck.do?userNickname="+chkNick.value,"","width=500,height=400");
		 $('#chk_nick').val("chk");
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
    
    function FindAddr(){
    	var geocoder = new daum.maps.services.Geocoder();
    	new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("userAddr").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        console.log(coords);
                        $('#xy').val(coords.Ha+", "+coords.Ga);
                        console.log($('#xy').val());
                    }
                });
            }
        }).open();
    }
    /*---------------------------
	이메일 발송
	------------------------------*/
	
	
	function EmailCheck(){
    	
    	var userEmail = document.frm.userEmail.value;
    	if(userEmail == ""){
    		alert("이메일을 입력해 주세요.");
    	}
		var url = "emailCheck.do";
		$.ajax({
			url : "emailCheck.do",
			dataType : 'json',
			type : "POST",
			data : {
				userEmail : userEmail,
			},
			success: function(result){
				if(result == 1){
					$('#email_hidden').attr('class','non-hidden');
				} else if(result ==2 ){
					alert("이메일을 잘못 입력하셨습니다. 다시 입력해 주세요.");
				}
			}
		});
    }
    
    // 인증번호 확인
    function emailchk(){
    	
    	var userEmail = document.frm.userEmail.value;
    	var emailCode = $('#emailCode').val();
    	
    	if( emailCode == ""){
    		alert("인증번호를 입력하고 확인을 눌러주세요.");
    		
    	} else if( emailCode != ""){
    		$.ajax({
    			url: "ranNumCheck.do",
    			dataType : 'json',
    			type : "POST",
    			data : {
    				userEmail : userEmail,
    				emailCode : emailCode
    			},
    			success: function(result){
    				if(result != 0){
    					$('#email_hidden').attr('class','hidden');
    					alert("이메일 인증이 확인되었습니다.");
    					$('#chk_email').val("chk");
    				} else {
    					alert("인증 번호를 잘못 입력하셨습니다.");
    				}
    			}
    		});
    	}
    }
    
	
	/* $(function() {
		$("#btnRanNumCheck").click(function() {

			var param = {
				myVal : document.frm.checkRanNum.value };

			var url = "ranNumCheck.do";
			

			$.ajax(url, {
				data : param,
				dataType : 'json',
				type : "POST"
			}).done(function(result) {
				if(result.result == true){
					document.frm.userEmail.readOnly=true;
					
					//document.getElementById("EmailCheckResult").style.color="blue";
					//$("#ranNumInputTitle").css("visibility","visible");
					//$("#checkRanNum").css("visibility","visible");
				}
				$("#EmailCheckResult").css("color",result.color);
				$("#EmailCheckResult").html(result.message);
				
				//세션의 ranNum 삭제.->커맨드에서 해줌.
			}).fail(function(xhr, status) {
				document.getElementById("EmailCheckResult").style.color="red";
				$("#EmailCheckResult").html("인증번호를 공백없이 입력해 주세요!");
			});

		})

	}) */
</script>
</head>
<body>
	<br />
	<br />
	<br />
	<br />
	<div class="container">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div class="jumbotron" style="padding-top: 20px;">
				<h3 style="text-align: center;">일반 회원 가입</h3>
				<br />
				<form id="frm" name="frm" method="post" action="join_user.do" class="form-horizontal">
					<div class="form-group">
						<div class="col-sm-12" style="padding: 0px">
							<input type="text" class="form-control" placeholder="아이디/이메일" id="userEmail" name="userEmail" maxlength="20">
						</div>
						<!-- <div class="col-sm-1" style="padding: 0px">
							<h5>&nbsp;&nbsp;&nbsp;@</h5>
						</div>
						<div class="col-sm-7" style="padding: 0px">
							<input type="hidden" id="selboxDirect" name="selboxDirect"/>
							<select name="email_choice">
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="1">직접 입력</option>
							</select>
							
						</div> -->
					</div>
					<div>
						<div class="col-sm-6">
							<input type="button" class="btn btn-primary form-control" onclick="idCheck()" value="중복체크">
							<input type="hidden" id="chk_id" class="chk_id" value="unchk">
						</div>
						<div class="col-sm-6">
							<input type="button" class="btn btn-primary form-control" onclick="EmailCheck()" value="이메일인증">
						</div>
					</div>
					<div class="hidden" id="email_hidden">
						<div class="col-sm-8">
							<input type="text" class="form-control" placeholder="이메일 인증번호를 입력해 주세요." id="emailCode" name="emailCode">
							<input type="hidden" id="chk_email" value="unchk">
						</div>
						<div class="col-sm-4">
							<input type="button" class="btn btn-primary form-control" onclick="emailchk()" value="인증 확인">
						</div>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" id="userPw" name="userPw">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호 확인" id="userPwck" name="userPwck">
						<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
						<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
					</div>
					<div class="form-group" style="text-align: center;">
						<input type="text" class="form-control" placeholder="이름" id="userName" name="userName">
					</div>
					<div class="form-group">
						<div class="col-sm-8" style="padding: 0px">
							<input type="text" class="form-control" placeholder="닉네임" id="userNickname" name="userNickname">
						</div>
						<div class="col-sm-4">
							<input type="button" class="btn btn-primary form-control" onclick="NickCheck()" value="중복체크">
							<input type="hidden" id="chk_nick" class="chk_nick" value="unchk">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-8" style="padding: 0px">
							<input type="text" class="form-control" placeholder="주소" id="userAddr" name="userAddr" readonly>
						</div>
						<div class="col-sm-4">
							<input type="button" class="btn btn-primary form-control" onclick="FindAddr()" value="주소찾기">
						</div>
					</div>
					<!-- 					<div class="form-group"> -->
					<!-- 						<input type="text" class="form-control" placeholder="주소" -->
					<!-- 							id="userAddr" name="userAddr"> -->
					<!-- 					</div> -->
					<!-- 					<div class="form-group"> -->
					<!-- 						<input type="text" class="form-control" placeholder="주소좌표" -->
					<!-- 							id="userXY" name="userXY"> -->
					<!-- 					</div> -->

					<input type="hidden" name="xy" id="xy">

					<div>
						<input type="button" class="btn btn-primary form-control" onclick="submitfrm()" value="회원가입">
					</div>
					<br /> <input type="reset" class="btn btn-primary form-control" onclick="location.href='index.do'" value="취소">
				</form>
			</div>
		</div>
		<div class="col-lg-3"></div>
	</div>
</body>
</html>