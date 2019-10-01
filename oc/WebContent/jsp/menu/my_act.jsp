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
<link rel="stylesheet" href="../assets/css/slick.css">
<link rel="stylesheet" href="../assets/css/slick-theme.css">
<link rel="stylesheet" href="../assets/css/animate.css">
<link rel="stylesheet" href="../assets/css/iconfont.css">
<link rel="stylesheet" href="../assets/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.css">
<link rel="stylesheet" href="../assets/css/magnific-popup.css">
<link rel="stylesheet" href="../assets/css/bootsnav.css">



<!--화면 작아 질경우 네모박스로 메뉴 css-->
<link rel="stylesheet" href="../assets/css/plugins.css" />

<!--찾기 버튼을 눌렀을때 반응 css -->
<link rel="stylesheet" href="../assets/css/style.css">

<!--Theme Responsive css-->
<link rel="stylesheet" href="../assets/css/responsive.css" />

<script src="../assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>

<body data-spy="scroll" data-target=".navbar-collapse" data-offset="100">


	<!-- Preloader -->
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
	<!--End off Preloader -->


	<div class="culmn">
		<!--Home page style-->


		<nav class="navbar navbar-default bootsnav navbar-fixed ">

			<!-- Start Top Search -->
			<div class="top-search">
				<div class="container">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-search"></i></span>
						<input type="text" class="form-control" placeholder="Search">
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
						<li><a href="map.jsp">Home</a></li>
						<!-- 지도로 이동 -->


						<!-- 드롭다운 -->
						<li class="nav-item  dropdown"><a
							class="nav-link  dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown"> Menu </a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="index.html#portfolio">즐겨찾기 보기</a>
								<br> <a class="dropdown-item" href="index.html#test">리뷰
									목록</a> <a class="dropdown-item" href="contact.jsp">Contact</a>
							</div></li>

						<!-- MyPage -->
						<li class="nav-item  dropdown"><a
							class="nav-link  dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown"> MyPage </a>
							<div class="dropdown-menu">
								<%
									// 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
									if (session.getAttribute("sessionID") == null) {
								%>member/view/LoginForm.jsp <a class="dropdown-item"
									href="../member/view/LoginForm.jsp">로그인</a> <a
									class="dropdown-item" href="../member/view/LoginForm.jsp">회원가입</a>

								<%
									// 로그인 되었을 경우 - 로그아웃, 내정보 버튼을 보여준다.
									} else {
								%>
								<a class="dropdown-item" href="assets/jsp/loginform.jsp">로그아웃</a>
								<a class="dropdown-item" href="insertchoice.jsp">내정보</a> <a
									class="dropdown-item" href="#contact">Contact</a>
								<%
									}
								%>
							</div></li>
						<!--end MyPage -->
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
		</nav>

		<!-- Dropdown -->


<!----------------------------------------------------즐겨찾기----------------------------------------------------------------  -->


		<section id="myfavorite" >

			<!-- Portfolio container-->
		<div class="container">
				<div class="row">
					<div class="main-portfolio roomy-80">

						<div class="col-md-4">
							<div class="head_title text-left sm-text-center wow fadeInDown">
								<h2>나의 리뷰</h2>
							</div>
						</div>

						<div class="col-md-8">
							<div class="filters-button-group text-right sm-text-center">
								<button class="btn button is-checked" data-filter="*">all</button>
								<button class="btn button" data-filter=".metal">이동상점</button>
								<button class="btn button" data-filter=".transition">한식</button>
								<button class="btn button" data-filter=".alkali">중식</button>
								<button class="btn button" data-filter=".ar">일식</button>
							</div>
						</div>
						<div style="clear: both;"></div>

						<div class="grid text-center">
							
							<div class="* ">
								<div class="container" align="center">
	
								<div>
									<table class=" table table-striped table-bordered results" >
									 <thead>
										<tr>
											<th width="80" class="col-md-1 col-xs-1">상호명</th>
										</tr>
										<!-- 검색시 없을경우 -->
										
						                  </thead>
						
										<!-- db 목록을 가져와서 뿌려주는 곳 -->
										<!-- db에 목록이 이없으면 empty:비어있다는 뜻임  -->
										<c:if test="${empty list}"> 
											<tr>
												<td colspan="4">등록된 글이 존재하지 않습니다.</td>
											</tr>
										</c:if>
						
										<!--목록이 있으면  -->
										<c:forEach items="${list }" var="dto">
											  <tr onclick="location.href='상점자세히보기.dao'=${dto.bookNum }'">
											    <th scope="row" align="center">${dto.review_date }</th>
											    <td align="center">${dto.store_name }</td>
												<td align="center">${dto.review_content }</td>
												<td align="center">${dto.review_star }</td>
											  </tr>
										</c:forEach>
										<!-- db 목록을 가져와서 뿌려주는 곳끝 -->
						
									</table>
									<hr />
								</div>
							</div>
							<!-- End off grid item -->

						</div>
					</div>
				</div>
			</div>
			</div>
			<!-- Portfolio container end -->
		</section>
		<!-- End off portfolio section -->

<!-----------------------------------------------------------나의 리뷰-------------------------------------------------------------------------->
		<section id="myreview">

			<!-- Portfolio container-->
			<div class="container">
				<div class="row">
					<div class="main-portfolio roomy-80">

						<div class="col-md-4">
							<div class="head_title text-left sm-text-center wow fadeInDown">
								<h2>나의 리뷰</h2>
							</div>
						</div>

						<div class="col-md-8">
							<div class="filters-button-group text-right sm-text-center">
								<button class="btn button is-checked" data-filter="*">all</button>
								<button class="btn button" data-filter=".metal">이동상점</button>
								<button class="btn button" data-filter=".transition">한식</button>
								<button class="btn button" data-filter=".alkali">중식</button>
								<button class="btn button" data-filter=".ar">일식</button>
							</div>
						</div>
						<div style="clear: both;"></div>

						<div class="grid text-center">
							
							<div class="* ">
								<div class="container" align="center">
	
								<div>
									<table class=" table table-striped table-bordered results" >
									 <thead>
										<tr>
											<th  width="80" class="col-md-1 col-xs-1">일자</th>
											<th width="80" class="col-md-1 col-xs-1">상호명</th>
											<th width="80" class="col-md-1 col-xs-1">리뷰내용</th>
											<th width="80" class="col-md-1 col-xs-1">별점</th>
										</tr>
										<!-- 검색시 없을경우 -->
										
						                  </thead>
						
										<!-- db 목록을 가져와서 뿌려주는 곳 -->
										<!-- db에 목록이 이없으면 empty:비어있다는 뜻임  -->
										<c:if test="${empty list}"> 
											<tr>
												<td colspan="4">등록된 글이 존재하지 않습니다.</td>
											</tr>
										</c:if>
						
										<!--목록이 있으면  -->
										<c:forEach items="${list }" var="dto">
											  <tr onclick="location.href='상점자세히보기.dao'=${dto.bookNum }'">
											    <th scope="row" align="center">${dto.review_date }</th>
											    <td align="center">${dto.store_name }</td>
												<td align="center">${dto.review_content }</td>
												<td align="center">${dto.review_star }</td>
											  </tr>
										</c:forEach>
										<!-- db 목록을 가져와서 뿌려주는 곳끝 -->
						
									</table>
									<hr />
								</div>
							</div>
							<!-- End off grid item -->

						</div>
					</div>
				</div>
			</div>
			</div>
			<!-- Portfolio container end -->
		</section>
		<!-- End off portfolio section -->

<!----------------------------------------------------------------------------------------------------------------------------------------  -->
		

						<!-- <div class="col-md-3">
							<div class="widget_item widget_latest sm-m-top-50">
								<h5 class="text-white">베스트상점</h5>
								<div class="widget_latst_item m-top-30">
									<div class="item_icon">
										<img src="assets/images/ltst-img-1.jpg" alt="" />
									</div>
									<div class="widget_latst_item_text">
										<p>상점1</p>
										<a href="">21<sup>th</sup> July 2016 상점 이랑 연결 
										</a>
									</div>
								</div>
								<div class="widget_latst_item m-top-30">
									<div class="item_icon">
										<img src="assets/images/ltst-img-2.jpg" alt="" />
									</div>
									<div class="widget_latst_item_text">
										<p>상점2</p>
										<a href="">21<sup>th</sup> July 2016
										</a>
									</div>
								</div>
								<div class="widget_latst_item m-top-30">
									<div class="item_icon">
										<img src="assets/images/ltst-img-3.jpg" alt="" />
									</div>
									<div class="widget_latst_item_text">
										<p>상점3</p>
										<a href="">21<sup>th</sup> July 2016
										</a>
									</div>
								</div>
							</div>
							End off widget item
						</div> -->
<!----------------------------------------------------------------------------------------------------------------------------------------  -->
			
			
			
			<footer>
			<div
				class="main_footer fix bg-mega text-center p-top-40 p-bottom-30 m-top-80">
				<div class="col-md-12">
					<p class="wow fadeInRight" data-wow-duration="1s">
						ON/OFF with <i class="fa fa-heart"></i> by <a target="_blank"
							href="http://bootstrapthemes.co">ON/OFF</a> 2016. All Rights
						Reserved
					</p>
				</div>
			</div>
		</footer>




	</div>

	<!-- JS includes -->

	<script src="../assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="../assets/js/vendor/bootstrap.min.js"></script>

	<script src="../assets/js/jquery.magnific-popup.js"></script>
	<!--<script src="assets/js/jquery.easypiechart.min.js"></script>-->
	<script src="../assets/js/jquery.easing.1.3.js"></script>
	<!--<script src="assets/js/slick.js"></script>-->
	<script src="../assets/js/slick.min.js"></script>
	<script src="../assets/js/js.isotope.js"></script>
	<script src="../assets/js/jquery.collapse.js"></script>
	<script src="../assets/js/bootsnav.js"></script>

	<script
		src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

	<script src="../assets/js/plugins.js"></script>
	<script src="../assets/js/main.js"></script>



</body>
</html>

