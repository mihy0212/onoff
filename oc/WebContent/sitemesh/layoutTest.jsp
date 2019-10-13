<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<title>title:::::</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="icon" type="image/png" href="favicon.ico">
 -->

<!--Google Font link-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">



<!-- 메뉴바 css  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/slick-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/iconfont.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/bootstrap.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/bootsnav.css">



<!--화면 작아 질경우 네모박스로 메뉴 css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/plugins.css" />

<!--찾기 버튼을 눌렀을때 반응 css -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css"> --%>

<!--Theme Responsive css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/responsive.css" />

<script
	src="${pageContext.request.contextPath }/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">

body {
	margin: 0;
}
nav {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	padding: 300px 0;
	box-sizing: border-box;
}
.nav02 { background-color: rgb(253,220,87)  ; }

nav::before {
	position: absolute;
	top: 5%;
	left: 0;
	width: 100%;
	color: #fff;
	font: 400 24px/1 'Lato', sans-serif;
	text-align: center;
}
.nav02::before { content: 'DEMO #2'; }



/* common */
nav ul {
	position: relative;
	margin: 0;
	padding: 0;
	list-style: none;
}
nav ul::after {
	display: block;
	clear: both;
	content: '';
}
nav ul li {
	position: relative;
	float: left;
	border: 2px solid #fff;
}
nav ul li:not(:first-child) {
	border-left: none;
}
nav ul li:hover {
	background-color: rgba(255,255,255,.3);
}
nav ul li a {
	display: inline-block;
	padding: 1em 4em;
	color: #fff;
	font: 400 18px/1 'Lato', sans-serif;
	text-align: center;
	text-decoration: none;
	white-space: nowrap;
}
nav ul ul {
	position: absolute;
	top: 100%;
	left: -2px;
}
nav ul ul li {
	float: none;
	margin: 0;
}
nav ul ul li:not(:first-child) {
	border: 2px solid #fff;
	border-top: none;
}
nav ul ul ul {
	position: absolute;
	top: -2px;
	left: 100%;
}



/* DEMO #2 */
.nav02 ul ul {
	visibility: hidden;
	opacity: 0;
	transition: .2s ease-in-out;
}
.nav02 ul li:hover > ul {
	visibility: visible;
	opacity: 1;
}

</style>
</head>
<body>

<nav class="nav02 navbar navbar-default bootsnav navbar-fixed">
	<ul>
		<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
		<li class="nav-item"><a class="nav-link" href="#">menu</a>
			  <ul class="nav navbar-nav navbar-right">
			<c:choose>
				<c:when test="${!empty userEmail }">
				<li><a class="dropdown-item" href="myfavorite.do">즐겨찾기 보기</a></li>
				<li>
					<a class="dropdown-item" href="myReview.do">리뷰 목록</a>
				</li>
				<c:if test="${!empty userEmail && userGrant=='C'}">
				<li>
					<a class="dropdown-item"href="storeInfo.do?storeNum=${ storeNum }">내 가게 정보</a>
				</li>
				<li>
					<a class="dropdown-item" href="storeInfo.do?storeNum=${ storeNum }">내 가게 리뷰</a>
				</li>
				</c:if>
			<c:if test="${!empty userEmail && userGrant=='S'}">
				<li>
					<a class="dropdown-item" href="list.do">전체 문의 관리</a>
				</li>
				<li>
					<a class="dropdown-item" href="userlist.do">전체 회원 관리</a>
				</li>
				<li>
					<a class="dropdown-item" href="adminStoreInfo.do">전체 가게 관리</a>
				</li>
			</c:if>
			</c:when>
		</c:choose>
		<li>
		<a class="dropdown-item" href="myAsklist.do">관리자에게 1:1문의</a>
		</li>
			</ul>
		</li>
		<li class="nav-item">
		  <a class="nav-link" href="#" id="navbardrop" data-toggle="dropdown"> MyPage </a>
	</ul>
</nav>

	<!-- JS includes -->


	<script
		src="${pageContext.request.contextPath }/assets/js/vendor/bootstrap.min.js"></script>

	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.magnific-popup.js"></script>
	<!--<script src="assets/js/jquery.easypiechart.min.js"></script>-->
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.easing.1.3.js"></script>
	<!--<script src="assets/js/slick.js"></script>-->
	<script
		src="${pageContext.request.contextPath }/assets/js/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/js.isotope.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.collapse.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/bootsnav.js"></script>

	<script
		src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

	<script src="${pageContext.request.contextPath }/assets/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/main.js"></script>



</body>
</html>