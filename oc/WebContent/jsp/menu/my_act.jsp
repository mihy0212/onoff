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
#features {
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
			}
		});
	
$(document).ready(function(){
	$(document).ready(function() {

		//카테고리1 출력하기
		if ($('.categ1').text("01")) {
			$('.categ1').text("음식")
		}

		//카테고리2 출력하기
		if ($('.categ2').text("01")) {
			$('.categ2').text("점포 가게");
		} else if ($('.categ2').text("02")) {
			$('.categ2').text("이동 가게");
		}

		//카테고리3 출력하기
		if ($('.categ3').text("01")) {
			$('.categ3').text("한식");
		} else if ($('.categ3').text("02")) {
			$('.categ3').text("양식");
		} else if ($('.categ3').text("03")) {
			$('.categ3').text("중식");
		} else if ($('.categ3').text("04")) {
			$('.categ3').text("일식");
		} else if ($('.categ3').text("05")) {
			$('.categ3').text("분식");
		} else if ($('.categ3').text("06")) {
			$('.categ3').text("기타");
		}

	});

	//별점 표시하기
	//console.log($('#star').children().size())
	//console.log($('#star').children().eq(1))
	for(var i=0; i<Math.round("${stars}"); i++){
		$('#star').children().eq(i).attr('class','btn button is-checked');
	}
	
	//리뷰에서 별점 표시하기
	var star_num;
	$('.reviewStars').on('click', function(){
		star_num = $(this).attr('id').substring(4,5);
		if($(this).css("color")=="rgb(128, 128, 128)"){
			for(var i=1; i<=star_num; i++){
				var starNum = "star"+i;
				$('#'+starNum).css("color","yellow");
			}
		} else {
			for(var i=5; i>=star_num; i--){
				var starNum = "star"+i;
				$('#'+starNum).css("color","gray");
			}
		}
	});
	
	 
</script>


</head>

<body>
	<section id="features" class="features">
		<!-- Portfolio container-->
		<div class="container">
			<div class="row">
				<div class="main-portfolio">
					<div class="col-md-4">
						<div class="head_title text-left sm-text-center wow fadeInDown">
							<h2>즐겨찾기</h2>
						</div>
					</div>

					<div class="col-md-8">
						<div class="filters-button-group text-right sm-text-center"
							id="test">
							<button class="btn button is-checked" data-filter="*">all</button>
							<button class="btn button" data-filter=".metal">이동상점</button>
							<button class="btn button" data-filter=".transition">한식</button>
							<button class="btn button" data-filter=".alkali">중식</button>
							<button class="btn button" data-filter=".ar">일식</button>
						</div>
					</div>



					<div style="clear: both;"></div>
					<div class=" text-center">
						<!-- 즐겨찾기선택 -->
						<div>
							<table class=" table table-striped table-bordered results">
								<thead>
									<tr>
										<th width="80" class="col-md-1 col-xs-1">상호명</th>
									</tr>
								</thead>

								<!-- db 목록을 가져와서 뿌려주는 곳 -->
								<!-- db에 목록이 이없으면 empty:비어있다는 뜻임  -->
								<c:if test="${empty list}">
									<tr>
										<td colspan="4">등록된 좋아요가 존재하지 않습니다.</td>
									</tr>
								</c:if>

								<!--목록이 있으면  -->
								<!-- for문을 돌리면 list[0]을 안해도됨 -->
								<c:forEach items="${list }" var="sdto">
									<tr onclick="location.href='storeInfo.do?storeNum=${sdto.storeNum }'">
										<td align="center">${sdto.storeName }</td>

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


	<!----------------------------------------------------------------나의리뷰----------------------------------------------------------------------------------------- -->

	<!--Test section-->
	<section id="portfolio" class="portfolio ">
		<div class="container">
				<div class="main-portfolio roomy-80">

					<div class="col-md-4">
						<div class="head_title text-left sm-text-center wow fadeInDown">
							<h2>나의리뷰</h2>
						</div>
					</div>
					
					<!-- DB 리뷰 목록 : 등록된 리뷰가 없을 때-->
					<c:if test="${empty riviewlist}">
						<div class="choose_item_text fix">
							<p> 등록된 리뷰가 없습니다. </p>
						</div>
					</c:if>
					
					<div style="clear: both;"></div>
					<%-- DB 리뷰 목록 --%>
					<div class="review_list"  >
						<c:forEach items="${riviewlist }" var="alist">
							<c:choose>
							
							<%-- 1. 리뷰글(글번호와 댓글 번호가 일치) --%>
							<c:when test="${ alist.reviewRe == alist.reviewNum }">
								<div id="list${status.count}" class="choose_item_text fix div_content_user">
									<input type="hidden" value="${ alist.reviewNum }">
									<input type="hidden" value="${ alist.reviewRe }">
							<%-- 리뷰 왼쪽 영역 : 아이콘/회원 닉네임 --%>
							<div class="col-md-2 text-center" onclick="location.href='storeInfo.do?storeNum=${alist.storeNum }'">
								<font size="6"><i class="icon icon icon-smile text-black"></i></font>
								<h6 class="content_user" onclick="location.href='storeInfo.do?storeNum=${alist.storeNum }'">${ alist.userNick }</h6>
							</div>
							<%-- 리뷰 중간 영역 : 별점/리뷰글 --%>
							<div class="col-md-9 text-left content_star" onclick="location.href='storeInfo.do?storeNum=${alist.storeNum }'">
								<blockquote>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<c:forEach var="i" begin="1" end="${alist.reviewStar }" step="1">
										<font class="reviewStarsYellow star_up${ alist.reviewNum }">★</font>
									</c:forEach>
									<p class="pre_css" >${ alist.reviewContent }
										&nbsp;&nbsp;&nbsp;(${ alist.reviewDate })</p>
								</blockquote>
							</div>
							<input type="submit" class="btn button is-checked btn_update" value="수정" data-target="#myModal" data-toggle="modal">
							<input type="submit" class="btn button is-checked btn_update"value="삭제" onclick="location.href='delectMyReiview.do?key=${alist.reviewNum}'">
						</div>
						</c:when>
						
						<%-- 2. 리뷰 댓글(글번호와 댓글 번호 불일치) 사장님만 댓글 달 수 있으므로- 수정/삭제 할 수 있음 --%>
								<c:otherwise>
									<div id="list${status.count}" class="choose_item_text fix col-md-offset-1 div_content_ceo">
										<input type="hidden" value="${ alist.reviewNum }">
										<input type="hidden" value="${ alist.reviewRe }">
										<%-- 리뷰 왼쪽 영역 : 아이콘/회원 닉네임 --%>
										<div class="col-md-2 text-center">
											<font size="6"><i class="icon icon icon-restaurant2 text-black"></i></font>
											<h6 class="content_user">${ alist.storeName }</h6>
										</div>
										<%-- 리뷰 중간 영역 : 별점/리뷰글 --%>
										<div class="col-md-9 text-left content_reply">
											<blockquote>
												<p class="pre_css">${ alist.reviewContent } &nbsp;&nbsp;&nbsp;(${ alist.reviewDate })</p>
											</blockquote>
										</div>

									</div>
								</c:otherwise>
						
						
						</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>
			
			<!-- 페이징 -->
			<div class="col-sm-6" align="center">
				<div align="center">
					<ul class="pagination" id="page_num">
						<li><c:forEach var="i" begin="1" end="${tot}">
								<a href="myReview.do?Page_num=${i}">${i}</a>
							</c:forEach></li>
					</ul>
				</div>
			</div>
			
	</section>
	<!-- End off test section -->
	<!--이후 <br>삭제  -->

	<!-------------------------------------------- Modal 리뷰작성 -------------------------------------------------->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">

					<div class="panel-group">
						<div class="panel panel-success" style="margin-top: 10px;">
							<div class="panel-heading">리뷰 수정</div>
							<div class="panel-body">
								<%-- form --%>
								<form class="form-horizontal" role="form"
									onclick="location.href='askwrite.do'" method="post">
									<div class="form-group">
										<label class="control-label col-sm-2">작성자(ID):</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="user_id"
												name="user_id" placeholder="ID" readonly="readonly">${userEmail}
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-sm-2" for="pwd">내용:</label>
										<div class="col-sm-10">
											<textarea class="form-control" rows="5"
												placeholder="ask_content" name="review_content"
												id="review_content"></textarea>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-success" onclick="">작
												성</button>
											<button type="reset" class="btn btn-danger">초기화</button>
										</div>
									</div>
								</form>


							</div>

						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<!-- JS includes -->

	<script
		src="${pageContext.request.contextPath }/assets/js/vendor/jquery-1.11.2.min.js"></script>
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

