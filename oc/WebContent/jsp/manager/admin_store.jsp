<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="UTF-8">
<title>가게 관리</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css"><!--Theme custom css -->
<script>

$(document).ready(function(){
	
	//카테고리1 출력하기
	if($('.categ1').text("01")){
		$('.categ1').text("음식")
	}
	
	//카테고리2 출력하기
	if($('.categ2').text("01")){
		$('.categ2').text("점포");
	} else if($('.categ2').text("02")){
		$('.categ2').text("이동");
	}
	
	//카테고리3 출력하기
	if($('.categ3').text("01")){
		$('.categ3').text("한식");
	} else if($('.categ3').text("02")){
		$('.categ3').text("양식");
	} else if($('.categ3').text("03")){
		$('.categ3').text("중식");
	} else if($('.categ3').text("04")){
		$('.categ3').text("일식");
	} else if($('.categ3').text("05")){
		$('.categ3').text("분식");
	} else if($('.categ3').text("06")){
		$('.categ3').text("기타");
	}
	
	//상태에 따른 검색
	$('.ask_status').on('click', function(){
		var addStatus = $(this);
		var addStatNum;

		if( $(this).attr('id') == 'ask_status_all'){
			askStatNum = "%";
		} else if( $(this).attr('id') == 'ask_status_1'){
			askStatNum = "1";
		} else if( $(this).attr('id') == 'ask_status_2'){
			askStatNum = "2";
		} else if( $(this).attr('id') == 'ask_status_3'){
			askStatNum = "3";
		} else if( $(this).attr('id') == 'ask_status_4'){
			askStatNum = "4";
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
	text-align: center;
	vertical-align: middle;
}

.td_left{
	text-align: left;
}

.store_move{
	padding: 3px;
	background-color: #D6E5FB;
	border-radius: 8px;
	color: #4388E8;
}

.store_move:hover{
	padding: 3px;
	background-color: #B6CBEA;
	border-radius: 8px;
	color: white;
}

</style>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<div style="padding-top: 50px"></div>

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


				
<!-- 헤드 부분 -->
<!-- 제목 -->
<div class="col-md-4">
	<div class="head_title text-left sm-text wow fadeInDown">
		<h2><strong>가게 요청서 관리</strong></h2>
	</div>
</div>

<!-- 처리 상태 선택 -->
<div class="main-portfolio">
	<div id="root" class="col-md-8 text-right">
		<form class="form-inline">
			<button class="btn button ask_status" id="ask_status_all">전체</button>
			<button class="btn button ask_status" id="ask_status_1">처리 전</button>
			<button class="btn button ask_status" id="ask_status_2">등록 허가</button>
			<button class="btn button ask_status" id="ask_status_3">등록 거절</button>
			<button class="btn button ask_status" id="ask_status_4">등록 보류</button>&nbsp;&nbsp;
<!-- 			<div class="form-group m-top-30">
				<input type="text" class="form-control" placeholder="검색어 입력">
				<button class="btn button is-checked">▶</button>
			</div> -->
		</form>
	</div>
</div>
<!-- END 헤드 부분 -->
<div style="clear: both;"></div>


<!-- 목록 뿌려주기 -->
<div class="col-md-12 ">

	<table class=" table table-striped table-hover table-bordered">
		<thead>
			<tr>
				<th width="1" align="center" >No.</th>
				<th>가게명</th>
				<th>주소</th>
				<th>분류1</th>
				<th>분류2</th>
				<th>분류3</th>
				<th>인증분류</th>
				<th>첨부파일</th>
				<th>신청자</th>
				<th>신청일</th>
				<th colspan="2">처리상태</th>
				<th>이동</th>
			</tr>
		</thead>

		<!-- db 목록을 가져와서 뿌려주는 곳 -->
		<!-- db에 목록이 이없으면 empty:비어있다는 뜻임  -->
		<c:if test="${empty addlist}">
			<tr>
				<td colspan="9">등록된 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>

		<!--목록이 있으면  -->
		<!-- for문을 돌리면 list[0]을 안해도됨 -->
		<c:forEach items="${ addlist }" var="alist" varStatus="status">
			<tr>
				<td>${ status.count }</td>
				<td>${ alist.storeName }</td>
				<td class="td_left">${ alist.storeAddr }</td>
				<td class="categ1">${ alist.storeCateg1 }</td>
				<td class="categ2">${ alist.storeCateg2 }</td>
				<td class="categ3">${ alist.storeCateg3 }</td>
				<td align="center">
					<c:choose>
						<c:when test="${ !empty alist.userLicense}">주민번호</c:when>
						<c:when test="${ !empty alist.storeLicense}">사업자번호</c:when>
						<c:otherwise><font color="red">없음</font></c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${ !empty alist.addCapture }"><font color="red">●</font></c:when>
						<c:otherwise><font color="red">X</font></c:otherwise>
					</c:choose>
				</td>
				<td>${ alist.userName }</td>
				<td>${ alist.addDay }</td>
				<td class="addStatus">
					<c:choose>
						<c:when test='${ alist.addStatus == "1" }'><font color="red">처리 중</font></c:when>
						<c:when test='${ alist.addStatus == "2" }'><font color="#5882FA">등록 허가</font></c:when>
						<c:when test='${ alist.addStatus == "3" }'><font color="#DF7401">등록 거절</font></c:when>
						<c:when test='${ alist.addStatus == "4" }'><font color="#298A08">등록 보류</font></c:when>
					</c:choose>
				</td>
				<td>
					<c:if test='${ alist.addStatus == "2" }'>
						<span class="store_move" onclick="location.href='storeInfo.do?storeNum=${ alist.storeNum }'">가게이동</span>
					</c:if>
				</td>
				<td>
					<div class="main-portfolio">
						<button class="btn button is-checked" onclick="location.href='addRead.do?addNum=${ alist.addNum }'">이동</button>
					</div>
				</td>
			</tr>
		</c:forEach>
		<!-- db 목록을 가져와서 뿌려주는 곳끝 -->

	</table>
</div>
	
<!-- 페이징 -->
<!-- 페이징 -->
<form id="apagefrm" name="apagefrm" action="adminStoreInfo.do">
	<input type="hidden" name="p">
	<input type="hidden" name="aculumn">
	<input type="hidden" name="acontent">
</form>

<u:paging pgfunc="doList" paging="${ apaging }"></u:paging>
<script>
function doList(p) {
	document.pagefrm.p.value = p;
	document.pagefrm.submit();
}
</script>

<hr />
<!-- END 리뷰 목록 뿌려주기 -->
<div style="clear: both;"></div>

				
<%------------------------------------------------------------------------------------ --%>
				
<!-- 헤드 부분 -->
<div style="padding-top: 50px"></div>
<!-- 제목 -->
<div class="col-md-4">
	<div class="head_title text-left sm-text wow fadeInDown">
		<h2><strong>전체 가게 목록</strong></h2>
	</div>
</div>

<!-- 선택?? -->
<div class="main-portfolio">
	<div id="root" class="col-md-8 text-right">
		<button class="btn button is-checked" data-filter="*">전체</button>
		<button class="btn button" data-filter=".metal">오픈 가게</button>
		<button class="btn button" data-filter=".transition">닫은 가게</button>
	</div>
</div>
<!-- END 리뷰 헤드 부분 -->
<div style="clear: both;"></div>


<!-- 리뷰 목록 뿌려주기 -->
<div class="col-md-12 ">

	<table class="table table-striped table-hover table-bordered">
		<thead>
			<tr>
				<th width="1">No.</th>
				<th>가게번호</th>
				<th>가게명</th>
				<th>주소</th>
				<th>좌표</th>
				<th>분류1</th>
				<th>분류2</th>
				<th>분류3</th>
				<th>좋아요 수</th>
				<th>사업자명</th>
				<th>사업자별명</th>
				<th>가게등록일</th>
				<th>가게상태</th>
			</tr>
		</thead>

		<!-- db 목록을 가져와서 뿌려주는 곳 -->
		<!-- db에 목록이 이없으면 empty:비어있다는 뜻임  -->
		<c:if test="${empty slist}">
			<tr>
				<td colspan="9">등록된 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>

		<!--목록이 있으면  -->
		<!-- for문을 돌리면 list[0]을 안해도됨 -->
		<c:forEach items="${ slist }" var="stlist" varStatus="status">
			<tr onclick="location.href='storeInfo.do?storeNum=${ stlist.storeNum }'">
				<td>${ status.count }</td>
				<td>${ stlist.storeNum }</td>
				<td>${ stlist.storeName }</td>
				<td class="td_left">${ stlist.storeAddr }</td>
				<td>${ stlist.storeXy }</td>
				<td class="categ1">${ stlist.storeCateg1 }</td>
				<td class="categ2">${ stlist.storeCateg2 }</td>
				<td class="categ3">${ stlist.storeCateg3 }</td>
				<td>${ stlist.storeLike }</td>
				<td>${ stlist.userName }</td>
				<td>${ stlist.userNick }</td>
				<td>${ stlist.storeRegiday }</td>
				<td>
					<c:choose>
						<c:when test='${ stlist.storeOc == "1" }'><font color="red">OPEN</font></c:when>
						<c:when test='${ stlist.storeOc == "0" }'>CLOSE</c:when>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		<!-- db 목록을 가져와서 뿌려주는 곳끝 -->

	</table>
</div>
	
<!-- 페이징 -->
<form id="bpagefrm" name="bpagefrm" action="adminStoreInfo.do">
	<input type="hidden" name="p">
	<input type="hidden" name="bculumn" value="">
	<input type="hidden" name="bcontent" value="">
</form>

<u:paging pgfunc="doList" paging="${ bpaging }"></u:paging>
<script>
function doList(p) {
	document.pagefrm.p.value = p;
	document.pagefrm.submit();
}
</script>

<hr />
<!-- END 리뷰 목록 뿌려주기 -->
<div style="clear: both;"></div>



</body>
</html>