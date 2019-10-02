<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
<script type="text/javascript">
//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
//비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;
//이름 정규식
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
//이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
var birthJ = false;
var address = $('#mem_detailaddress');




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
            console.log(data.zonecode);
            console.log(fullRoadAddr);
         /*      var a = console.log(data.zonecode);
            var b = console.log(fullRoadAddr);
            
            if(a == null || b = null){
               alert("주소를 확인하세요.");
               return false;
            }   */
            
            
            $("[name=mem_oaddress]").val(data.zonecode);
            $("[name=mem_address]").val(fullRoadAddr);
            
            document.getElementById('mem_oaddress').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('mem_address').value = fullRoadAddr;
            //document.getElementById('mem_detailaddress').value = data.jibunAddress; 
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
<body onload="init()">
  <div align="center">
        <br><br>
        <b><font size="6" color="gray">회원정보 수정</font></b>
        <br><br><br>
       
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식 -->
        <form method="post" action="" 
                name="userInfo" onsubmit="return checkValue()">
                
            <table align="center">
            <tr>
                <td id="title"><b>id</b></td>
                <td><input type=text name=id disabled="disabled"
                     value="${Mail }" readonly="readonly"></td>
            </tr>
            <tr>
                <td id="title"><b>current password</b></td>
                <td><input type=password name=curr_password></td>
            </tr>
            <tr>
                <td id="title"><b>password</b></td>
                <td><input type=password name=password></td>
            </tr>
            <tr>
                <td id="title"><b>confirm password</b></td>
                <td><input type=password name=confirm_password></td>
            </tr>
            <tr>
                <td id="title"><b>이름</b></td>
                <td><input type=text name=name 
                    value="${name }">
            </tr>
            
            <tr>
                <td id="title"><b>이름</b></td>
                <td><input type=text name=name 
                    value="${userNick }">
            </tr>
            
            <tr>
                    <td id="title"><b>휴대전화</b></td>
                    <td>
                        <input type="text" name="phone" value="${Phone }"/>
                    </td>
                </tr>
                
           <tr class="form-group">                   
			 <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="mem_oaddress" id="mem_oaddress" type="text" readonly="readonly" >
             <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
         </tr>
         <tr class="form-group">
    		<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="mem_address" id="mem_address" type="text" readonly="readonly" />
		</tr>
		<tr class="form-group">
    		<input class="form-control" placeholder="상세주소" name="mem_detailaddress" id="mem_detailaddress" type="text"  />
		</tr>
           
        </table>
        </form>
         
               <input type=submit value=정보수정  onclick="checkForm()">
               <input type=button onclick="location.href='./res/member_detail.jsp'" value=취소>
        		<input type="submit" value="탈퇴" onclick="location.href='DeleteForm.jsp" />
           
        </div>
</body>
</html>


