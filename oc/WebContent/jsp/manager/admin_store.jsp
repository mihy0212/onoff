<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="UTF-8">
<title>가게 관리</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--Google Font link-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- 화면 전환 및 폰트와 제목 디자인 -->
<!--For Plugins external css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/plugins.css" />
<!--Theme custom css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css">
<!--Theme Responsive css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/responsive.css" />

<script src="${pageContext.request.contextPath }/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
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
	
	//상태 표시
	/*
	$('.ask_status').on('click', function(){
		var askStatus = $(this);
		var askStatNum;
		if( $(this).attr('id') == 'ask_status_all'){
			askStatNum = "All";
		} else if( $(this).attr('id') == 'ask_status_1'){
			askStatNum = "1";
		} else if( $(this).attr('id') == 'ask_status_2'){
			askStatNum = "2";
		} else if( $(this).attr('id') == 'ask_status_3'){
			askStatNum = "3";
		} else if( $(this).attr('id') == 'ask_status_4'){
			askStatNum = "4";
		}
		$.ajax({
			url: "storeInfoChange.do",
			data: {
				askStatus: askStatNum
			},
			dataType: "json",
			success: function(result){
				if(result != null){
					
				}
			}
		});
	});*/
	
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
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="100">

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
			<button class="btn button ask_status" id="ask_status_1">신청 중</button>
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
		<c:forEach items="${ addlist }" var="addlist" varStatus="status">
			<tr>
				<td>${ status.count }</td>
				<td>${ addlist.storeName }</td>
				<td class="td_left">${ addlist.storeAddr }</td>
				<td class="categ1">${ addlist.storeCateg1 }</td>
				<td class="categ2">${ addlist.storeCateg2 }</td>
				<td class="categ3">${ addlist.storeCateg3 }</td>
				<td align="center">
					<c:choose>
						<c:when test="${ !empty addlist.userLicense}">주민번호</c:when>
						<c:when test="${ !empty addlist.storeLicense}">사업자번호</c:when>
						<c:otherwise><font color="red">없음</font></c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${ !empty addlist.addCapture }"><font color="red">●</font></c:when>
						<c:otherwise><font color="red">X</font></c:otherwise>
					</c:choose>
				</td>
				<td>${ addlist.userNum }</td>
				<td>${ addlist.addDay }</td>
				<td class="addStatus">
					<c:choose>
						<c:when test='${ addlist.addStatus == "1" }'><font color="red">처리 중</font></c:when>
						<c:when test='${ addlist.addStatus == "2" }'><font color="#5882FA">등록 허가</font></c:when>
						<c:when test='${ addlist.addStatus == "3" }'><font color="#DF7401">등록 거절</font></c:when>
						<c:when test='${ addlist.addStatus == "4" }'><font color="#298A08">등록 보류</font></c:when>
					</c:choose>
				</td>
				<td>
					<c:if test='${ addlist.addStatus == "2" }'>
						<span class="store_move" onclick="location.href='storeInfo.do?storeNum=${ addlist.storeNum }'">가게이동</span>
					</c:if>
				</td>
				<td>
					<div class="main-portfolio">
						<button class="btn button is-checked" onclick="location.href='addRead.do?addNum=${ addlist.addNum }'">이동</button>
					</div>
				</td>
			</tr>
		</c:forEach>
		<!-- db 목록을 가져와서 뿌려주는 곳끝 -->

	</table>
</div>
	
<!-- 페이징 -->
<div align="center">
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination">
			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item "><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li> 
		</ul>
	</nav>
</div>

<hr />
<!-- END 리뷰 목록 뿌려주기 -->
<div style="clear: both;"></div>

				
<%------------------------------------------------------------------------------------ --%>
				
<!-- 헤드 부분 -->
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
		<c:forEach items="${ slist }" var="slist" varStatus="status">
			<tr onclick="location.href='storeInfo.do?storeNum=${ slist.storeNum }'">
				<td>${ status.count }</td>
				<td>${ slist.storeNum }</td>
				<td>${ slist.storeName }</td>
				<td class="td_left">${ slist.storeAddr }</td>
				<td>${ slist.storeXy }</td>
				<td class="categ1">${ slist.storeCateg1 }</td>
				<td class="categ2">${ slist.storeCateg2 }</td>
				<td class="categ3">${ slist.storeCateg3 }</td>
				<td>${ slist.storeLike }</td>
				<td>${ slist.userNum }</td>
				<td>${ slist.storeRegiday }</td>
				<td>
					<c:choose>
						<c:when test='${ slist.storeOc == "1" }'><font color="red">OPEN</font></c:when>
						<c:when test='${ slist.storeOc == "0" }'>CLOSE</c:when>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		<!-- db 목록을 가져와서 뿌려주는 곳끝 -->

	</table>
</div>
	
<!-- 페이징 -->
<div align="center">
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination">
			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item "><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li> 
		</ul>
	</nav>
</div>

<hr />
<!-- END 리뷰 목록 뿌려주기 -->
<div style="clear: both;"></div>



<!-- JS includes -->
<script src="${pageContext.request.contextPath }/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/vendor/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.magnific-popup.js"></script>
<!--<script src="assets/js/jquery.easypiechart.min.js"></script>-->
<script src="${pageContext.request.contextPath }/assets/js/jquery.easing.1.3.js"></script>
<!--<script src="assets/js/slick.js"></script>-->
<script src="${pageContext.request.contextPath }/assets/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/js.isotope.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.collapse.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootsnav.js"></script> 
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/plugins.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/main.js"></script>
</body>
</html>