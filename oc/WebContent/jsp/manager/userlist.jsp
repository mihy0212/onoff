<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
/* $(document).ready(function() {
    //라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
    $('input[type="checkbox"][name="userNum"]').click(function(){
        //클릭 이벤트 발생한 요소가 체크 상태인 경우
        if ($(this).prop('checked')) {
            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
            $('input[type="checkbox"][name="userNum"]').prop('checked', false);
            $(this).prop('checked', true);
        }
    });
}); */

$(document).ready(function(){
	/* $('.pull-right').on('click', function(){
		var con = confirm("선택한 회원을 탈퇴 시키겠습니까?");
		if(con){
			document.frm.submit();
		} else{
			return false;
		}
		
	}); */
	
	//제목 체크박스 선택 시 전체 선택
	$("#th_checkAll").on('click', function(){
		if( $("#th_checkAll").is(':checked') ){
	        $(".checkRow").prop("checked", true);
	      }else{
	        $(".checkRow").prop("checked", false);
	      }
	});
	
	//체크된 항목 삭제하기
	$('.pull-right').on('click', function(){
		var checkRow = "";
		var checkArray = new Array();
		
		if($(".checkRow").is(':checked')){
			for(var i=$(".checkRow:checked").length-1; i>-1; i--){ 
				checkArray.push($(".checkRow:checked").eq(i).attr('id'));
			}﻿ 
		}
		if(checkArray.length == 0){
			alert("탈퇴할 회원을 선택하세요.");
			return false;
		}
		
		console.log(checkArray);
		if(confirm("선택한 회원을 탈퇴하시겠습니까? 사업자 회원은 가게 및 등록 요청서를 삭제한 후 탈퇴시킬 수 있습니다.")){
			$.ajax({
				type:"post",
				url: "userdelete.do",
				dataType: "json",
				data: {
					checkArray: checkArray
				},
				success: function(result){
					if(result != 0){
						alert("선택한 회원의 탈퇴가 완료되었습니다.");
						for(var i=$(".checkRow:checked").length-1; i>-1; i--){ 
							$(".checkRow:checked").eq(i).closest("tr").remove(); 
						}
						$(".checkRow").prop('checked',false);
					} else {
						alert("회원 탈퇴에 실패했습니다. 해당 회원 번호로 등록된 가게나 요청서가 있는지 확인해 주세요.");
					}
				}
			});					
		}
	});
	
});
</script>
<meta charset="UTF-8">
<title>회원 관리</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css"><!--Theme custom css -->
</head>
<body>
<br><br><br>
<c:if test="${ userGrant == 'S' }">
<div class="container">
<div class="row">
	<div class="head_title text-left sm-text wow fadeInDown">
		<h2 class="text-uppercase"><strong>회원 관리</strong></h2>
	</div>
	<br />
	<form name="frm" id="frm" action='userdelete.do'>
		<div class="container">
			<div class="row">
				<table class="table table-striped table-bordered"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th width="10" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">회원 번호</th>
							<th width="100" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">회원 권한</th>
							<th width="100" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">회원 이메일</th>
							<th width="30" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">회원 이름</th>
							<th width="40" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">회원 닉네임</th>
							<th width="200" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">회원 주소</th>
							<th width="100" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">회원 가입일</th>
							<th width="10" style="background-color: #eeeeee; text-align: center; vertical-align: middle;">
								<input type="checkbox" name="checkAll" id="th_checkAll"/>
							</th>
						</tr>
						<!-- db 목록을 가져와서 뿌려주는 곳 -->
						<c:if test="${list.isEmpty()}">
							<tr>
								<td colspan="5">등록된 글이 존재하지 않습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${userlist }" var="dto">

							<tr>
								<td align="center" width="20" style="vertical-align: middle;">${dto.userNum }</td>
								<td align="center" width="20" style="vertical-align: middle;">
									<c:choose>
										<c:when test="${dto.userGrant == 'U' }"><font color="brown">일반 회원</font></c:when>
										<c:when test="${dto.userGrant == 'C' }"><font color="orange">사업자 회원</font></c:when>
										<c:when test="${dto.userGrant == 'S' }"><font color="green" style="font-weight:bold;">관리자</font></c:when>
									</c:choose>
								</td>
								<td width="20" style="vertical-align: middle;">&nbsp;&nbsp;${dto.userEmail}</td>
								<td align="center" width="100" style="vertical-align: middle;">${dto.userName }</td>
								<td align="center" width="100" style="vertical-align: middle;">${dto.userNick }</td>
								<td align="center" width="20" style="vertical-align: middle;">${dto.userAddr }</td>
								<td align="center" width="100" style="vertical-align: middle;">${dto.userInday }</td>
								<td align="center" width="20" style="vertical-align: middle;">
									<c:if test="${dto.userGrant != 'S' }">
										<input type="checkbox" id="${dto.userNum }" name="checkNum" class="checkRow" value="${dto.userNum }">
									</c:if>
								</td>

							</tr>

						</c:forEach>
						<!-- db 목록을 가져와서 뿌려주는 곳 -->
				</table>
				<a><button type='button' class="btn btn-warning pull-right">
						삭제하기</button></a>
			</div>
		</div>
	</form> <br> <br> <br>
</div></div>
</c:if>

<c:if test="${ userGrant != 'S' }">
	<div align="center"><h2> 이 페이지는 관리자만 접근할 수 있습니다.</h2></div>
</c:if>
</body>
</html>