<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<title>title:::::</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--Google Font link-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">



<link rel="${pageContext.request.contextPath }/stylesheet"
	href="assets/css/slick.css">
<link rel="${pageContext.request.contextPath }/stylesheet"
	href="assets/css/slick-theme.css">
<link rel="${pageContext.request.contextPath }/stylesheet"
	href="assets/css/animate.css">
<link rel="${pageContext.request.contextPath }/stylesheet"
	href="assets/css/iconfont.css">
<link rel="${pageContext.request.contextPath }/stylesheet"
	href="assets/css/font-awesome.min.css">
<link rel="${pageContext.request.contextPath }/stylesheet"
	href="assets/css/bootstrap.css">
<link rel="${pageContext.request.contextPath }/stylesheet"
	href="assets/css/magnific-popup.css">
<link rel="${pageContext.request.contextPath }/stylesheet"
	href="assets/css/bootsnav.css">



<!--For Plugins external css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/plugins.css" />

<!--Theme custom css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/style.css">

<!--Theme Responsive css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/responsive.css" />
<style type="text/css">
#features{
	min-height: 600px;
}

</style>

<%-- <script
	src="${pageContext.request.contextPath }/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script> --%>
<script>
	/* function delect(){
	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	 onclick="location.href='delectMyReiview.do?key=${alist.reviewNum}'"
	 }else{   //취소
	 return;
	 }
	 } */

	$(function() {
		console.log(location);
		if (location.pathname == "/oc/myReview.do") {
			location.href = "#portfolio";
		}else if (location.pathname == "/oc/myfavorite.do") {
			location.href = "#features";
		}
	})
	
	
	$(document).ready(function(){
	
	//카테고리1 출력하기
	if($('.categ1').text("01")){
		$('.categ1').text("음식")
	}
	
	//카테고리2 출력하기
	if($('.categ2').text("01")){
		$('.categ2').text("점포 가게");
	} else if($('.categ2').text("02")){
		$('.categ2').text("이동 가게");
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
	
	
});
	
</script>


</head>

<body>

<!-- DB 리뷰 목록 : 등록된 리뷰가 없을 때-->
<c:if test="${empty list}">
	<div class="choose_item_text fix">
		<p>등록된 리뷰가 없습니다.</p>
	</div>
</c:if>

<%-- DB 리뷰 목록 --%>
<div class="review_list">
	<c:forEach items="${list }" var="alist">
					<%-- 리뷰 왼쪽 영역 : 아이콘/회원 닉네임 --%>
					<div class="col-md-2 text-center">
						<font size="6"><i class="icon icon icon-smile text-black"></i></font>
						<h6 class="content_user">${ alist.storeName }</h6>
					</div>
					<%-- 리뷰 중간 영역 : 별점/리뷰글 --%>
					<div class="col-md-9 text-left content_star">
						<blockquote>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<c:forEach var="i" begin="1" end="${alist.reviewStar }" step="1">
								<font class="reviewStarsYellow star_up${ alist.reviewNum }">★</font>
							</c:forEach>
							<p class="pre_css">${ alist.reviewContent }
								&nbsp;&nbsp;&nbsp;(${ alist.reviewDate })</p>
						</blockquote>
					</div>
					<input type="submit" class="btn button is-checked btn_update" value="수정" data-target="#myModal" data-toggle="modal"> 
												<input type="submit" class="btn button is-checked btn_update" value="삭제" onclick="location.href='delectMyReiview.do?key=${alist.reviewNum}'">
			</c:forEach>
				</div>
