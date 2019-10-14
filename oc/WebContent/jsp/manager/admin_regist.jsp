<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="UTF-8">
<title>가게 등록 요청서 조회</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css"><!--Theme custom css -->
<script>

$(document).ready(function(){
	
	//카테고리1 출력하기
	if($('.categ1').text("01")){
		$('.categ1').text("01. 음식")
	}
	
	//카테고리2 출력하기
	if($('.categ2').text("01")){
		$('.categ2').text("01. 점포");
	} else if($('.categ2').text("02")){
		$('.categ2').text("02. 이동");
	}
	
	//카테고리3 출력하기
	if($('.categ3').text("01")){
		$('.categ3').text("01. 한식");
	} else if($('.categ3').text("02")){
		$('.categ3').text("02. 양식");
	} else if($('.categ3').text("03")){
		$('.categ3').text("03. 중식");
	} else if($('.categ3').text("04")){
		$('.categ3').text("04. 일식");
	} else if($('.categ3').text("05")){
		$('.categ3').text("05. 분식");
	} else if($('.categ3').text("06")){
		$('.categ3').text("06. 기타");
	}
	
	$('.regiBtn').on('click', function(){
		var id = $(this).attr('id');
		var con;
		if(id == "regi_submit"){
			$('#regifrm').children().eq(1).val('2');
			con = confirm("${ adto.storeName }의 가게 등록을 허가하시겠습니까?")
		} else if(id == "regi_reject"){
			$('#addRe_hidden').attr('class','non-hidden');
			$('#regifrm').children().eq(1).val('3');
			var addRe = $('#addRe_textarea').val();
			$('#regifrm').children().eq(2).val(addRe);
			con = confirm("${ adto.storeName }의 가게 등록을 거절하시겠습니까?")
		} else if(id == "regi_post"){
			$('#regifrm').children().eq(1).val('4');
			con = confirm("${ adto.storeName }의 가게 등록을 보류하시겠습니까?")
		}
		if(con){
			$('#regifrm').submit();			
		} else {
			return false;
		}
		
	});
});

</script>
<style>
th{
	text-align: center;
	vertical-align: middle;
}

td{
	text-align: left;
	vertical-align: middle;
}

.td_left{
	text-align: left;
}
</style>
</head>
<body>

<!-- 페이지 전환 효과 -->
<div id="loading">
	<div id="loading-center">
		<div id="loading-center-absolute">
			<div class="object" id="object_one"></div>
			<div class="object" id="object_two"></div>
			<div class="object" id="object_three"></div>
			<div class="object" id="object_four"></div>
		</div>
	</div>
</div>
<!--페이지 전환 효과 끝 -->

<section id="portfolio" class="portfolio margin-top-120">
<div class="container">
<div class="row">
<div class="main-portfolio roomy-80">

			
<!-- 헤드 부분 -->
<!-- 제목 -->
<div class="head_title text-left sm-text wow fadeInDown">
	<h2><strong> ${ adto.addNum }) ${ adto.storeName } </strong><font size="5" color="gray">의 등록 요청서</font></h2>
</div>

<!-- 신청서 내용 -->
<div class="col-md-12 ">
		<table class=" table table-striped table-hover table-bordered">
			<tr>
				<th width="10">요청 No.</th><td width="30">${ adto.addNum }</td>
				<th width="10">신청일</th><td width="30">${ adto.addDay }</td>
				<th width="10">신청 상태</th><td width="30">
					<c:choose>
						<c:when test='${ adto.addStatus == "1" }'><font color="red">처리 중</font></c:when>
						<c:when test='${ adto.addStatus == "2" }'><font color="#5882FA">등록 허가</font></c:when>
						<c:when test='${ adto.addStatus == "3" }'><font color="#DF7401">등록 거절</font></c:when>
						<c:when test='${ adto.addStatus == "4" }'><font color="#298A08">등록 보류</font></c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>회원 번호</th><td>${ adto.userNum }</td>
				<th>회원명</th><td colspan="3">${ adto.userName }</td>
			</tr> 
			<tr>
				<th>가게명</th><td colspan="5"><font color="blue" size="5"><strong>${ adto.storeName }</strong></font></td>
			</tr>
			<tr>	
				<th>분류1</th><td class="categ1">${ adto.storeCateg1 }</td>
				<th>분류2</th><td class="categ2">${ adto.storeCateg2 }</td>
				<th>분류3</th><td class="categ3">${ adto.storeCateg3 }</td>
			</tr>
			<tr>
				<th>주소</th><td colspan="3">${ adto.storeAddr }</td>
				<th>Xy좌표값</th><td>${ adto.storeXy }</td>
			</tr>
			<tr>
				<th></th><td></td>
				<th>사업자 등록 번호</th><td>${ adto.storeLicense }</td>
				<th>주민 등록 번호</th><td>${ adto.userLicense }</td>
			</tr>
			<tr>
				<th>인증 캡처</th><td colspan="5"><img src="${pageContext.request.contextPath }/jsp/join/image/${ adto.addCapture }"></td>
			</tr>
		</table>

		<button type="button" class="regiBtn" id="regi_submit">등록 허가</button>
		<button type="button" class="regiBtn" id="regi_reject">등록 거절</button>
		<button type="button" class="regiBtn" id="regi_post">등록 보류</button>
		
		<div class="hidden" id="addRe_hidden">
			<table class="table table-striped table-hover table-bordered">
				<tr>
					<th>등록 거절 사유</th>
				</tr>
				<tr>
					<td><textarea id="addRe_textarea" cols="100" rows="40"></textarea></td>
				</tr>
			</table>
		</div> 
		
	<form name="regifrm" id="regifrm" method="post" action="adminStoreChange.do">
		<input type="hidden" name="choice" value="regiChange">
		<input type="hidden" name="addStatus" value="1">
		<input type="hidden" name="addRe">
	</form>
</div>

<hr />
<!-- END 리뷰 목록 뿌려주기 -->
<div style="clear: both;"></div>


</div><!-- END main-portfolio roomy-80 -->
</div><!-- END row -->
</div><!-- END container-->
</section>


</body>
</html>