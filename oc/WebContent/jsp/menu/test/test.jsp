<!doctype html>

<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<title>ON/OFF</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="favicon.ico">

<!--Google Font link-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<link"WebContent/index.html"
	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">


<link rel="${pageContext.request.contextPath }/stylesheet" href="assets/css/slick.css">
<link rel="${pageContext.request.contextPath }/stylesheet" href="assets/css/slick-theme.css">
<link rel="${pageContext.request.contextPath }/stylesheet" href="assets/css/animate.css">
<link rel="${pageContext.request.contextPath }/stylesheet" href="assets/css/iconfont.css">
<link rel="${pageContext.request.contextPath }/stylesheet" href="assets/css/font-awesome.min.css">
<link rel="${pageContext.request.contextPath }/stylesheet" href="assets/css/bootstrap.css">
<link rel="${pageContext.request.contextPath }/stylesheet" href="assets/css/magnific-popup.css">
<link rel="${pageContext.request.contextPath }/stylesheet" href="assets/css/bootsnav.css">



<!--For Plugins external css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/plugins.css" />

<!--Theme custom css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css">

<!--Theme Responsive css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/responsive.css" />

<script src="${pageContext.request.contextPath }/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
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
		<!--Home Sections-->




		<!--Portfolio Section-->



		<section id="portfolio" class="portfolio margin-top-120">

			<!-- Portfolio container-->
			<div class="container">
				<div class="row">
					<div class="main-portfolio roomy-80">

						<div class="col-md-4">
							<div class="head_title text-left sm-text-center wow fadeInDown">
									<h2>즐겨찾기</h2>
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
						<!-- 즐겨찾기선택 -->
						<!-- 이동상점 -->					
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
						<div style="clear: both;"></div>
					</div>
				</div>
			</div>
			<!-- Portfolio container end -->
			
		</section>
		<!-- End off portfolio section -->



		<!--Test section-->
		<section id="test" class="test bg-grey roomy-60 fix">
			<div class="container">
				<div class="row">
					<div class="main-portfolio roomy-80">

						<div class="col-md-4">
							<div class="head_title text-left sm-text-center wow fadeInDown">
									<h2>즐겨찾기</h2>
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
						<!-- 즐겨찾기선택 -->
						<!-- 이동상점 -->					
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
						<div style="clear: both;"></div>
					</div>
				</div>
			</div>
		</section>
		<!-- End off test section -->

	</div>

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

	<script
		src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

	<script src="${pageContext.request.contextPath }/assets/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/main.js"></script>



</body>
</html>
