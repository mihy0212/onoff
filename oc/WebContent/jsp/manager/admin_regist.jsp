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
	
	//버튼 노출하기
	/*
	if( "${ adto.addStatus}" == "1" ){
		$('#btn').append( $('<button>').attr({'type':'button', 'class':'regiBtn', 'id':'regi_submit'}).text("등록 허가").click(regi_submit),
				$('<button>').attr({'type':'button', 'class':'regiBtn', 'id':'regi_reject'}).text("등록 거절").click(regi_reject),
				$('<button>').attr({'type':'button', 'class':'regiBtn', 'id':'regi_post'}).text("등록 보류").click(regi_post)
		);
	} else if( "${ adto.addStatus}" == "2" ){
		$('#btn').append( $('<button>').attr({'type':'button', 'class':'regiBtn', 'id':'regi_cancle'}).text("허가 취소").click(regi_cancle)	);
	} else if( "${ adto.addStatus}" == "3" ){
		$('#btn').append( $('<button>').attr({'type':'button', 'class':'regiBtn', 'id':'regi_cancle'}).text("거절 취소").click(regi_cancle)	);
	} else if( "${ adto.addStatus}" == "4" ){
		$('#btn').append( $('<button>').attr({'type':'button', 'class':'regiBtn', 'id':'regi_cancle'}).text("보류 취소").click(regi_cancle)	);
	}*/
	if( "${ adto.addStatus}" == "1" ){
		$('.regiBtn').attr('type','button');
		$('.canBtn').attr('type','hidden');
	} else if( "${ adto.addStatus}" == "2" ){
		$('#sub_cancle').attr('type','button');
	} else if( "${ adto.addStatus}" == "3" ){
		$('#rej_cancle').attr('type','button');
		$('.regiBtn').attr('type','hidden');
		$('#addRe_hidden').attr('class','non-hidden');
	} else if( "${ adto.addStatus}" == "4" ){
		$('#pos_cancle').attr('type','button');
		$('.regiBtn').attr('type','hidden');
		$('#addRe_hidden').attr('class','non-hidden');
	}
	
	//다시 버튼 온클릭..
	$('.regiBtn').on('click', function(){
		var id = $(this).attr('id');
		if( id == "regi_submit" ){
			regi_submit();
		} else if(id == "regi_reject" || id == "regi_post" ){
			regi_non(id);
		}
	});
	
	$('.canBtn').on('click', function(){
		var id = $(this).attr('id');
		regi_cancle(id);
	});
	
	//목록으로 되돌아가기
	$('.listback').on('click', function(){
		location.href = "adminStoreInfo.do";
	});
});

function regi_submit(){
	$('#regifrm').children().eq(1).val('2');
	var con = confirm("${ adto.storeName }의 가게 등록을 허가하시겠습니까?")
	if(con){
		$('#regifrm').submit();
	} else {
		return false;
	}
}

function regi_non(id){
	$('.regiBtn').attr('type','hidden');
	$('#reject_text').text("");
	$('#reject_text').after( $('<textarea>').attr({'cols':'100', 'rows':'10', 'id':'addRe_textarea'}) );
	$('#addRe_hidden').attr('class',id);
	$('#re_submit').attr('type','button').click(re_submit);
	$('#re_cancle').attr('type','button').click(re_cancle);
}

function regi_cancle(id){
	if(id == "sub_cancle"){
		sub_cancle(id);
		console.log(id)
	} else {
		var con = confirm("${ adto.storeName }를 신청 중 상태로 되돌리시겠습니까?");
		if(con){
			$.ajax({
				url: "adminStoreChange.do",
				dataType: "json",
				type: "post",
				data: {
					choice: "regiChange",
					addStatus: "1",
					addNum: "${adto.addNum}",
					id: id
				},
				success: function(result){
					if(result != 0){
						$('.regiBtn').attr('type','button');
						$('.canBtn').attr('type','hidden');
						alert("${ adto.storeName }의 신청 상태가 변경되었습니다.");
						$('#addRe_hidden').attr('class','hidden');
						$('#addRe_textarea').val("");
						$('#add_status').children().eq(0).attr('color','red').text("처리 중");
						/*
						$('#btn').append( $('<button>').attr({'type':'button', 'class':'regiBtn', 'id':'regi_submit'}).text("등록 허가").click(regi_submit),
								$('<button>').attr({'type':'button', 'class':'regiBtn', 'id':'regi_reject'}).text("등록 거절").click(regi_non),
								$('<button>').attr({'type':'button', 'class':'regiBtn', 'id':'regi_post'}).text("등록 보류").click(regi_non)
						);*/
					} else {
						alert("${ adto.storeName }의 신청 상태 변경에 실패했습니다.");
					}
				}
			});
		} else {
			return false;
		}
	}
}

function sub_cancle(id){
	var con = confirm("가게 등록된 ${ adto.storeName }를 등록 취소하고 신청 중 상태로 되돌리시겠습니까?");
	//console.log("${adto.storeNum}");
	if(con){
		$.ajax({
			url: "adminStoreChange.do",
			dataType: "json",
			type: "post",
			data: {
				choice: "regiChange",
				addStatus: "1",
				addNum: "${adto.addNum}",
				storeNum: "${adto.storeNum}",
				id: id
			},
			success: function(result){
				if(result != 0){
					$('.regiBtn').attr('type','button');
					$('.canBtn').attr('type','hidden');
					$('#snum').text("");
					alert("${ adto.storeName }의 가게 등록이 취소되었습니다.");
					$('#addRe_hidden').attr('class','hidden');
					$('#addRe_textarea').val("");
					$('#add_status').children().eq(0).attr('color','red').text("처리 중");
				} else {
					alert("${ adto.storeName }의 신청 상태 변경에 실패했습니다.");
				}
			}
		});
	} else {
		return false;
	}
}

function re_submit(){
	var addRe = $('#addRe_textarea').val();
	var con;
	var addStatus;
	var id = $(this).parent().attr('class');
	if(id == "regi_reject"){
		con = confirm("${ adto.storeName }의 가게 등록을 거절하시겠습니까?");
		addStatus = "3";
	} else if(id == "regi_post"){
		con = confirm("${ adto.storeName }의 가게 등록을 보류하시겠습니까?");
		addStatus = "4";
	}
	if(con){
		$.ajax({
			url: "adminStoreChange.do",
			dataType: "json",
			type: "post",
			data: {
				choice: "regiChange",
				addStatus: addStatus,
				addRe: addRe,
				addNum: "${adto.addNum}"
			},
			success: function(result){
				if(result != 0){
					console.log(addStatus)
					if(addStatus == "3"){
						alert("${ adto.storeName }의 가게 등록이 거절되었습니다.");
						$('#add_status').children().eq(0).attr('color','#DF7401').text("등록 거절");
						$('#rej_cancle').attr('type','button');
					} else if(addStatus == "4"){
						alert("${ adto.storeName }의 가게 등록이 보류되었습니다.");
						$('#add_status').children().eq(0).attr('color','#298A08').text("등록 보류");
						$('#pos_cancle').attr('type','button');
					}
					$('.regiBtn').attr('type','hidden');
					$('#reject_text').text(addRe);
					$('#addRe_textarea').remove();
					$('.addReBtn').attr('type','hidden');
				} else {
					alert("${ adto.storeName }의 신청 상태 변경에 실패했습니다.");
				}
			}
		});
	}
}

function re_cancle(){
	$('#addRe_hidden').attr('class','hidden');
	$('#addRe_textarea').remove();
	$('#reject_text').show();
	$('.addReBtn').attr('type','hidden');
	$('.regiBtn').attr('type','button');
}

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

.listback{
	padding: 3px;
	border: 1px solid #4388E8;
	border-radius: 8px;
	color: #4388E8;
}

.listback:hover{
	padding: 3px;
	background-color: #B6CBEA;
	border-radius: 8px;
	color: white;
}

input{
	box-shadow: none;
	border: 1px solid white;
	padding: 5px 8px 5px 8px;
	background-color: #FDDC57;
	border-radius: 8px;
	color: black;
	font-color: gray;
	margin: 0 20px 0 0;
}

input:hover{
	padding: 5px 8px 5px 8px;
	background-color: #B6CBEA;
	border-radius: 8px;
	color: white;
	box-shadow: 0 0 0 0;
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

<c:if test="${ userGrant == 'S' }">

<section id="portfolio" class="portfolio margin-top-120">
<div class="container">
<div class="row">
<div class="main-portfolio roomy-80">

			
<!-- 헤드 부분 -->
<!-- 제목 -->
<div class="head_title text-left sm-text wow fadeInDown">
	<h2><strong> [${ adto.addNum }] ${ adto.storeName } </strong><font size="5" color="gray">의 등록 요청서</font></h2>
</div>

<!-- 신청서 내용 -->
<div class="col-md-12">
		<table class=" table table-striped table-hover table-bordered">
			<tr>
				<th width="10">요청 No.</th><td width="30">${ adto.addNum }</td>
				<th width="10">신청일</th><td width="30">${ adto.addDay }</td>
				<th width="10">신청 상태</th><td width="30" id="add_status">
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
				<th>가게명</th><td colspan="3"><font color="blue" size="5"><strong>${ adto.storeName }</strong></font></td>
				<th>가게 번호</th><td id="snum">${ adto.storeNum }</td>
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
		
		<form name="regifrm" id="regifrm" method="post" action="adminStoreChange.do">
			<input type="hidden" name="choice" value="regiChange">
			<input type="hidden" name="addStatus" value="1">
		</form>
		
		<div id="btn">
			<input type="hidden" class="regiBtn submit" id="regi_submit" value="등록 허가">
			<input type="hidden" class="regiBtn reject" id="regi_reject" value="등록 거절">
			<input type="hidden" class="regiBtn post" id="regi_post" value="등록 보류">
			<input type="hidden" class="canBtn nosub" id="sub_cancle" value="허가 취소">
			<input type="hidden" class="canBtn norej" id="rej_cancle" value="거절 취소">
			<input type="hidden" class="canBtn nopos" id="pos_cancle" value="보류 취소">
		</div>
		
<hr />
		<br><br>
		<div class="hidden" id="addRe_hidden">
			<table class="table table-striped table-hover table-bordered">
				<tr>
					<th>등록 거절/보류 사유</th>
				</tr>
				<tr>
					<td><p id="reject_text">${ adto.addRe }</p></td>
				</tr>
			</table>
			<input type="hidden" class="addReBtn" id="re_submit" value="확인">
			<input type="hidden" class="addReBtn" id="re_cancle" value="취소">
		</div>
		<div align="right">
			<span class="listback">가게 관리 페이지로</span>
		</div>
</div>

<div style="clear: both;"></div>


</div><!-- END main-portfolio roomy-80 -->
</div><!-- END row -->
</div><!-- END container-->
</section>

</c:if>
<c:if test="${ userGrant != 'S' }">
<div align="center">
	<br><br><br>
	<h2> 관리자만 접근할 수 있는 페이지입니다. </h2>
</div>
</c:if>


</body>
</html>