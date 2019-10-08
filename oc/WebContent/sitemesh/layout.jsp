<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>

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



<decorator:head></decorator:head>
</head>

<body data-spy="scroll" data-target=".navbar-collapse" data-offset="100">




	<div class="culmn">
		<!--Home page style-->


		<nav class="navbar navbar-default bootsnav navbar-fixed ">

			<!-- Start Top Search -->
			<div class="top-search">
				<div class="container">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-search"></i></span>
						<form id="search" name="search" action="search.do" method="post">
							<input type="text" class="form-control" placeholder="Search"
								id="keyword" name="keyword">
						</form>
						<span class="input-group-addon close-search"><i
							class="fa fa-times"></i></span>
					</div>
				</div>
			</div>
			<!-- End Top Search -->


			<div class="container">
				<div class="attr-nav">
					<ul>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
					</ul>
				</div>

				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navbar-menu">
						<i class="fa fa-bars"></i>
					</button>

				</div>
				<!-- End Header Navigation -->
				<!-- navbar menu -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav navbar-right ">
						<li><a href="index.jsp">Home</a></li>
						<!-- 지도로 이동 -->


						<!-- 드롭다운 -->
						<li class="nav-item  dropdown"><a
							class="nav-link  dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown"> Menu </a>
							<div class="dropdown-menu">
								<c:choose>
									<c:when test="${!empty userEmail }">
										<a class="dropdown-item" href="myfavorite.do">즐겨찾기 보기</a>
										<br>
										<a class="dropdown-item" href="myReview.do">리뷰 목록</a>
										<br>
										<c:if test="${!empty userEmail && userGrant=='C'}">
											<a class="dropdown-item" href="storeInfo.do">내 가게 정보</a>
											<br>
											<a class="dropdown-item" href="storeInfo.do">내 가게 리뷰</a>
											<br>
										</c:if>
									</c:when>

								</c:choose>
								<a class="dropdown-item" href="myAsklist.do">관리자에게 1:1문의</a>
							</div></li>

						<!-- MyPage -->
						<li class="nav-item  dropdown"><a
							class="nav-link  dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown"> MyPage </a>
							<div class="dropdown-menu">


								<c:choose>
									<c:when test="${empty userEmail}">
										<a class="dropdown-item" href="loginform.do">로그인</a>
										<br>
										<a class="dropdown-item" href="join_form.do">회원가입</a>
										<br>
									</c:when>
									<c:otherwise>
										<a class="dropdown-item" href="myinfo.do">내 정보 보기</a>
										<br>
										<a class="dropdown-item" href="logout.do">로그아웃</a>
										<br>
									</c:otherwise>
								</c:choose>

							</div></li>
						<!--end MyPage -->
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
		</nav>
	</div>
	<div style="padding-top: 50px">

		<decorator:body></decorator:body>

	</div>

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
