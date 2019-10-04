<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
 

// 비밀번호 입력여부 체크
function checkValue() 
{
	if(!document.userInfo.password.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}
    if(!document.userInfo.password.value){
        alert("비밀번호를 입력하세요.");
        return false;
    }
}

//우편번호 찾기 버튼 클릭시 발생 이벤트
function execPostCode() {
     new daum.Postcode({
         oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            /* console.log(data.zonecode); */
            console.log(fullRoadAddr);
         /*      var a = console.log(data.zonecode);
            var b = console.log(fullRoadAddr);
            
            if(a == null || b = null){
               alert("주소를 확인하세요.");
               return false;
            }   */
            
            
            /* $("[name=user_oaddress]").val(data.zonecode); */
            $("[name=user_address]").val(fullRoadAddr);
            
            /* document.getElementById('user_oaddress').value = data.zonecode; //5자리 새우편번호 사용 */
            document.getElementById('user_address').value = fullRoadAddr;
        }
     }).open();
 }

</script>
 
 
    <title>회원정보 수정화면</title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
    
    
    
    
    
</head>
<body>
	<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>나의 정보수정</h3>
			</div>

		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form action="myinfoup.do" method="post" role="form"
				id="usercheck" name="userber" onsubmit="return checkValue()">

				<div class="form-group">
					<label for="user_email">아이디</label> 
					<input type="email"  class="form-control" id="user_email" name="user_email"  value="${userEmail}" readonly="readonly">
					<div class="eheck_font" id="email_check"></div>
				</div>

				<div class="form-group">
					<label for="pw">비밀번호</label> 
					<input type="password" class="form-control" id="user_pw" name="user_pw"
						placeholder="PASSWORD"  >
					<div class="eheck_font" id="pw_check"></div>
				</div>
				<div class="form-group">
					<label for="pw2">비밀번호 확인</label> <input type="password"
						class="form-control" id="user_pw2" name="user_pw2"
						placeholder="Confirm Password">
					<div class="eheck_font" id="pw2_check"></div>
				</div>

				<div class="form-group">
					<label for="userNum">이름</label> 
					<input type="text"
						class="form-control" id="userNum" name="userNum" value="${UserDTO.userNum}">
					<div class="eheck_font" id="name_check"></div>
				</div>

				<div class="form-group">
					<label for="user_birth">닉네임</label> 
					<input type="text" class="form-control" id="ninckname" name="ninckname" value="${UserDTO.userNick}" readonly="readonly">
					<div class="eheck_font" id="birth_check"></div>
				</div>



				<div class="form-group">
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="user_address" id="user_address" type="text" readonly="readonly" />
						<button type="button" class="btn btn-default" onclick="execPostCode();">
						<i class="fa fa-search"></i> 주소 찾기
					</button>
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="상세주소" name="user_detailaddress" id="user_detailaddress" type="text" value="${UserDTO.userAddr}" />
				</div>
				<div class="form-group text-center">
					<input type="submit" value=정보수정 class="btn btn-primary" onclick="location.href='myinfoup.do'"> 
					<input type=button value=취소 class="btn btn-primary"> 
						<input type="button"  class="btn btn-primary" value="탈퇴"onclick="location.href='DeleteForm.jsp" />

				</div>
			</form>
		</div>
	</article>
</body>
</html>