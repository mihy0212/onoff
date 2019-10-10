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
</script>
<style>
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

<section id="portfolio" class="portfolio margin-top-120">
	<div class="container">
		<div class="row">
			<div class="main-portfolio roomy-80">
				
				<!-- 헤드 부분 -->
				<!-- 제목 -->
				<div class="col-md-4">
					<div class="head_title text-left sm-text wow fadeInDown">
						<h2><strong>가게 요청서 관리</strong></h2>
					</div>
				</div>
				
				<!-- 처리 상태 선택 -->
				<div id="root" class="col-md-8 text-right">
					<button class="btn button is-checked" data-filter="*">전체</button>
					<button class="btn button" data-filter=".metal">신청 중</button>
					<button class="btn button" data-filter=".transition">등록 허가</button>
					<button class="btn button" data-filter=".alkali">등록 거절</button>
					<button class="btn button" data-filter=".ar">등록 보류</button>&nbsp;&nbsp;
				</div>
				<!-- END 리뷰 헤드 부분 -->
				<div style="clear: both;"></div>
				
				
				<!-- 리뷰 목록 뿌려주기 -->
				<div class="col-md-12 ">
				
					<table class=" table table-striped table-hover table-bordered">
						<thead>
							<tr>
								<th width="1">No.</th>
								<th>가게명</th>
								<th>주소</th>
								<th>첨부파일</th>
								<th >회원번호</th>
								<th>신청일</th>
								<th>처리상태</th>
								<th>가게번호</th>
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
							<tr onclick="location.href='storeInfo.do?key=${addlist.addNum }'">
								<td>${ status.count }</td>
								<td>${ addlist.storeName }</td>
								<td>${ addlist.storeAddr }</td>
								<td>
									<c:choose>
										<c:when test="${ !empty addlist.addCapture }"><font color="red">○</font></c:when>
										<c:otherwise><font color="red">X</font></c:otherwise>
									</c:choose>
								</td>
								<td>${ addlist.userNum }</td>
								<td>${ addlist.addDay }</td>
								<td>${ addlist.addStatus }</td>
								<td>${ addlist.storeNum }</td>
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
				<div id="root" class="col-md-8 text-right">
					<button class="btn button is-checked" data-filter="*">전체</button>
					<button class="btn button" data-filter=".metal">오픈 가게</button>
					<button class="btn button" data-filter=".transition">닫은 가게</button>
					<button class="btn button" data-filter=".alkali">등록 거절</button>
					<button class="btn button" data-filter=".ar">등록 보류</button>&nbsp;&nbsp;
				</div>
				<!-- END 리뷰 헤드 부분 -->
				<div style="clear: both;"></div>
				
				
				<!-- 리뷰 목록 뿌려주기 -->
				<div class="col-md-12 ">
				
					<table class=" table table-striped table-hover table-bordered">
						<thead>
							<tr>
								<th width="1">No.</th>
								<th>가게명</th>
								<th>주소</th>
								<th>첨부파일</th>
								<th >회원번호</th>
								<th>신청일</th>
								<th>처리상태</th>
								<th>가게번호</th>
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
							<tr onclick="location.href='storeInfo.do?key=${addlist.addNum }'">
								<td>${ status.count }</td>
								<td>${ addlist.storeName }</td>
								<td>${ addlist.storeAddr }</td>
								<td>
									<c:choose>
										<c:when test="${ !empty addlist.addCapture }"><font color="red">○</font></c:when>
										<c:otherwise><font color="red">X</font></c:otherwise>
									</c:choose>
								</td>
								<td>${ addlist.userNum }</td>
								<td>${ addlist.addDay }</td>
								<td>${ addlist.addStatus }</td>
								<td>${ addlist.storeNum }</td>
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
				
				
				
			</div><!-- END main-portfolio roomy-80 -->
		</div><!-- END row -->
	</div><!-- END container-->
</section>





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