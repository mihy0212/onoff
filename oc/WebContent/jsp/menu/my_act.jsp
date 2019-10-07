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

<script
	src="${pageContext.request.contextPath }/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script> 

function delect(){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		location.href='delectMyReiview.do';
	}else{   //취소
	    return;
	}
	}


$('#myModal').modal("toggle");
//반대로 모달상태를 전환함

$('#myModal').modal("hide");
//모달창 열기

$('#myModal').modal("show");
//모달창 닫음
</script>
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


	<div class="culmn">

            <section id="features" class="features bg-white">

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

						<div class="grid text-center">
							<!-- 즐겨찾기선택 -->
							<!-- 이동상점 -->
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
											<td colspan="4">등록된 글이 존재하지 않습니다.</td>
										</tr>
									</c:if>

									<!--목록이 있으면  -->
									<c:forEach items="${list }" var="list">
									<tr class="info" onclick="location.href='storeInfo.do?key=${list.storeNum }'">
											<td align="center">${list.storeName }</td>
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
<br><br>
		<!--Test section-->
            <section id="portfolio" class="portfolio margin-top-120">
            <br><br><br><br><br><br>
				<div class="container">
				<div class="row">
					<div class="main-portfolio roomy-80">

						<div class="col-md-4">
							<div class="head_title text-left sm-text-center wow fadeInDown">
								<h2>나의리뷰</h2>
							</div>
						</div>
						<div style="clear: both;"></div>

						<div class="grid text-center">
							<!-- 별점선택 -->
							<div>
								<table id="users" class=" table table-striped table-bordered results">
									<thead>
										<tr>
											<th >상호명</th>
											<th>리뷰작성일</th>
											<th>리뷰내용</th>
											<th>별점</th>
											<th>수정/삭제</th>
										</tr>
									</thead>

									<!-- db 목록을 가져와서 뿌려주는 곳 -->
									<!-- db에 목록이 이없으면 empty:비어있다는 뜻임  -->
									<c:if test="${empty list}">
										<tr>
											<td colspan="5">등록된 글이 존재하지 않습니다.</td>
										</tr>
									</c:if>

									<!--목록이 있으면  -->
									<c:forEach items="${list }" var="list" >
									<tr class="info" >
										<td scope="row" align="center"  onclick="location.href='storeInfo.do'">${list.storeName } </td>
										<td scope="row" align="center">${list.reviewDate }</td>
										<td align="center">${list.reviewContent}</td>
										<td align="center">${list.reviewStar }</td>
										<td align="center">
										<input type="button" value="수정" data-target="#myModal" data-toggle="modal">
										<input type="button" value="삭제" onclick="delect()">
										</td>
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
					<form class="form-horizontal" role="form" onclick="location.href='askwrite.do'"  method="post">
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
								<textarea class="form-control" rows="5"	placeholder="ask_content" name="review_content" id="review_content"></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-success" onclick="">작 성</button>
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

