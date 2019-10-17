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
	 

	
	$(document).ready(function() {
		
		//리뷰 삭제
		$('.review_list').on('click', '.btn_delete', function(){
			var parentDiv = $(this).parent().parent();
			var reviewNum = parentDiv.children().eq(0).val();

			var con = confirm("정말 삭제하시겠습니까?");
			if(con){
				$.ajax({
					url: "delectMyReiview.do",
					data: { reviewNum: reviewNum
					},
					dataType: "json",
					success: function(result){
						if(result != 0){
							parentDiv.remove();
						} else {
							alert("리뷰를 삭제하지 못했습니다.")
						}
					}
				});
			}
			
		});
		
		
		//리뷰 수정1
		$('.btn_update').on('click', function(){
			var parentDiv = $(this).parent().parent();
			var reviewNum = parentDiv.children().eq(0).val();
			
			//리뷰 내용
			var blockquote1 = parentDiv.children().eq(3).children().eq(0);
			var con1 = blockquote1.children().last().text();
			var con2 = con1.substring(0,con1.length-15);
			
			//별 갯수
			var starNum = 0;
			for(var i=0; i<5; i++){
				if(blockquote1.children().eq(i).text() == "★"){
					starNum += 1;
				}
			}

			blockquote1.hide();//blockquote 숨김처리
			var span_star = $('<blockquote>');
			if( parentDiv.attr('class') == 'choose_item_text fix div_content_user'){
				var i=1;
				for(; i<=starNum; i++){
					span_star.append( $('<span>').attr({'class':'reviewStars update_star'+reviewNum, 'id':'star'+i, 'style':'color:yellow;'}).text("★") );
				}
				for(; i<=5; i++){
					span_star.append( $('<span>').attr({'class':'reviewStars update_star'+reviewNum, 'id':'star'+i, 'style':'color:gray;'}).text("★") );
				}
			}
			span_star.append( $('<textarea>').attr({'cols':'73', 'rows':'3'}).val(con2) );
			parentDiv.children().eq(3).append(span_star);
			
			//버튼 변경
			parentDiv.children().eq(4).children().eq(0).hide();
			parentDiv.children().eq(4).children().eq(1).hide();
			parentDiv.children().eq(4).append(
					$('<button>').attr({'type':'button', 'class':'btn button is-checked'}).text('변경').click(review_update),
					$('<button>').attr({'type':'button', 'class':'btn button is-checked'}).text('취소').click(review_up_cancle)
			);
			
		});

		
		//리뷰 수정2
		function review_update(){
			var thisbtn = $(this);
			var divParent = $(this).parent().parent();
			var reviewNum = divParent.children().eq(0).val();
			var blockquote1 = divParent.children().eq(3).children().eq(0);
			var blockquote2 = divParent.children().eq(3).children().eq(1);
			var starNum = 0;
			for(var i=0; i<$('.update_star'+reviewNum).length; i++){
				if($('.update_star'+reviewNum).eq(i).css("color") == "rgb(255, 255, 0)"){
					starNum = i+1;
				}
			}
			var reviewContent = blockquote2.children().eq(5).val();
			if(starNum == 0 && divParent.attr('class') == 'choose_item_text fix div_content_user'){
				alert("별점을 입력해 주세요.");
				return false;
			}
			if(reviewContent == ""){
				alert("리뷰 내용을 입력해 주세요.");
				return false;
			}
			var con = confirm("입력한 내용으로 리뷰를 변경하시겠습니까?");
			if(con){
				$.ajax({
					url: "updateMyReiview.do",
					type: "post",
					data: {
						storeNum: "${ alist.storeNum }",
						reviewNum: reviewNum,
						reviewStar: starNum,
						reviewContent: reviewContent
					},
					dataType: "json",
					success: function(result){
						if(result.n != 0){
							alert("리뷰 변경에 성공했습니다.");

							var blockquote3 = $('<blockquote>');
							for(var i=1; i<=starNum; i++){
								blockquote3.append( $('<font>').attr({'class':'reviewStarsYellow star_up'+reviewNum}).text("★") );
							}
							var today_date = new Date().toISOString().substring(0,10);
							blockquote3.append( $('<p>').attr({'class':'pre_css'}).html(reviewContent + " &nbsp;&nbsp;&nbsp;(" + today_date + ")") );
							divParent.children().eq(3).append(blockquote3);
							blockquote1.remove();
							blockquote2.remove();
							
							//버튼 변경
							divParent.children().eq(4).children().eq(0).show();
							divParent.children().eq(4).children().eq(1).show();
							divParent.children().eq(4).children().eq(3).remove();
							divParent.children().eq(4).children().eq(2).remove();
							
							//가게 총 별점 변경
							var stars_c = $('#star').children().eq(5).children().eq(0).text(result.stars.toFixed(1));
							for(var i=0; i<Math.round(stars_c); i++){
								$('#star').children().eq(i).attr('class','btn button is-checked');
							}

						} else {
							alert("리뷰 변경에 실패했습니다.");
						}
					}
				});
			}
		}

		//리뷰 수정 취소
		function review_up_cancle(){
			var divParent = $(this).parent().parent();
			console.log(divParent);
			var blockquote1 = divParent.children().eq(3).children().eq(0);
			var blockquote2 = divParent.children().eq(3).children().eq(1);
			blockquote1.show();
			blockquote2.remove();
			divParent.children().eq(4).children().eq(0).show();
			divParent.children().eq(4).children().eq(1).show();
			divParent.children().eq(4).children().eq(2).remove();
			divParent.children().eq(4).children().eq(3).remove();
			divParent.children().eq(4).children().eq(2).remove();
		}

		
		
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
		
	
		//카테고리에 따른 검색
		$('.categ').on('click', function(){
			var storeCateg3= $(this);
			var categNum;

			if( $(this).attr('id') == 'categ_all'){
				categNum = "all";
				location.href = "myfavorite.do";	
			 }else if( $(this).attr('id') == 'categ2_02'){
				categNum = "02";
				location.href = "myfavorite.do?storeCateg2=" + categNum;	
				
			}else if( $(this).attr('id') == 'categ3_01'){
				categNum = "01";
				location.href = "myfavorite.do?storeCateg3=" + categNum;
			} else if( $(this).attr('id') == 'categ3_02'){
				categNum = "02";
				location.href = "myfavorite.do?storeCateg3=" + categNum;
			} else if( $(this).attr('id') == 'categ3_03'){
				categNum = "03";
				location.href = "myfavorite.do?storeCateg3=" + categNum;
			} else if( $(this).attr('id') == 'categ3_04'){
				categNum = "04";
				location.href = "myfavorite.do?storeCateg3=" + categNum;
			}else if( $(this).attr('id') == 'categ3_05'){
				categNum = "05";
				location.href = "myfavorite.do?storeCateg3=" + categNum;
			}else if( $(this).attr('id') == 'categ3_06'){
				categNum = "06";
				location.href = "myfavorite.do?storeCateg2=01 storeCateg3=" + categNum;
			}
		});
		
});	

	
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

<style>
.reviewStars{
	color: gray;
	text-shadow:-1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
}

.reviewStarsYellow{
	color: yellow;
	text-shadow:-1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
}

.hidden{
	visibility:hidden;
}

.div_content_user{
	padding: 15px;
	margin: 10px;
}

.div_content_user:hover{
	background-color: #F7F8E0;
}

.div_content_ceo{
	background-color: #F2F2F2;
	padding: 15px;
}

.icon-cogwheels16:hover{
	padding: 3px;
	background-color: gray;
	border-radius: 8px;
	color: yellow;
}

.icon-arrows-1:hover{
	padding: 3px;
	background-color: gray;
	border-radius: 8px;
	color: yellow;
}

.pre_css{
	white-space: pre-wrap;
}

select {
	font-size: 10pt;
	position: relative;
	bottom: 5px;
	font-weight: bold;
	width: 100px;
	padding: .0em .7em;
	margin: 0 5px 0 5px;
	font-family: inherit;
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #BDBDBD; 
	border-radius: 5px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none;
}
</style>
</head>

<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
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
						<div class="filters-button-group text-right sm-text-center" id="test">
						<br><br><br>
							<button type="button" class="btn button categ" id="categ_all">all</button>
							<button type="button" class="btn button categ"  id="categ3_01">한식</button>
										<button type="button" class="btn button categ" id="categ3_02">양식</button>
										<button type="button" class="btn button categ" id="categ3_03">중식</button>
										<button type="button" class="btn button categ"  id="categ3_04">일식</button>
										<button type="button" class="btn button categ"  id="categ3_05">분식</button>
										<button type="button" class="btn button categ"  id="categ3_06">기타</button>
								</div>
								  		
								</div>
					</div>




					<div style="clear: both;"></div>
					<div class=" text-center">
						<!-- 즐겨찾기선택 -->
						<div>
							<table class=" table table-striped table-bordered results">
								<thead>
									<tr>
										<th>분류1</th>
										<th>분류2</th>
										<th>분류3</th>
										<th  >상호명</th>
										
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
									<td class=storeCateg1>
										<c:choose>
											<c:when test='${ sdto.storeCateg1 == "01" }'>음식</c:when>
										</c:choose>
										</td>
										<td class=storeCateg21>
										<c:choose>
											<c:when test='${ sdto.storeCateg2 == "01" }'>점포</c:when>
											<c:when test='${ sdto.storeCateg2 == "02" }'>이동</c:when>
										</c:choose>
										</td>
										<td class=storeCateg3>
										<c:choose>
											<c:when test='${ sdto.storeCateg3 == "01" }'>한식</c:when>
											<c:when test='${ sdto.storeCateg3 == "02" }'>양식</c:when>
											<c:when test='${ sdto.storeCateg3 == "03" }'>중식</c:when>
											<c:when test='${ sdto.storeCateg3 == "04" }'>일식</c:when>
											<c:when test='${ sdto.storeCateg3 == "05" }'>분식</c:when>
											<c:when test='${ sdto.storeCateg3 == "06" }'>기타</c:when>
										</c:choose>
										</td>
							<td align="center">${sdto.storeName }</td>

									</tr>
								</c:forEach>
								<!-- db 목록을 가져와서 뿌려주는 곳끝 -->

							</table>
						</div>


					</div>
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
					<br><br><br><br><br><br>
					<!-- DB 리뷰 목록 : 등록된 리뷰가 없을 때-->
					<c:if test="${empty riviewlist}">
						<div class="choose_item_text fix">
							<p> 등록된 리뷰가 없습니다. </p>
						</div>
					</c:if>
					
					<%-- DB 리뷰 목록 --%>
					<div class="review_list"  >
						<c:forEach items="${riviewlist }" var="alist" varStatus="status">
						
							<c:choose>

								<%-- 1. 리뷰글(글번호와 댓글 번호가 일치) --%>
								<c:when test="${ alist.reviewRe == alist.reviewNum }">
									<div id="list${status.count}" class="choose_item_text fix div_content_user">
										<input type="hidden" value="${ alist.reviewNum }"> 
										<input type="hidden" value="${ alist.reviewRe }">
										
										<%-- 리뷰 왼쪽 영역 : 아이콘/회원 닉네임 --%>
										<div class="col-md-2 text-center" onclick="location.href='storeInfo.do?storeNum=${alist.storeNum }'">
											<font size="6">
											<i class="icon icon icon-restaurant text-black"></i></font>
											<h6 class="content_user" onclick="location.href='storeInfo.do?storeNum=${alist.storeNum }'">${ alist.storeName }</h6>
										</div>
										
										<%-- 리뷰 중간 영역 : 별점/리뷰글 --%>
										<div class="col-md-9 text-left content_star" >
											<blockquote>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<c:forEach var="i" begin="1" end="${alist.reviewStar }" step="1">
													<font class="reviewStarsYellow star_up${ alist.reviewNum }">★</font>
												</c:forEach>
												<p class="pre_css">${ alist.reviewContent }&nbsp;&nbsp;&nbsp;(${ alist.reviewDate })</p>
											</blockquote>
										</div>
										
										<%-- 리뷰 오른쪽 영역 : 댓글/수정/삭제 버튼 --%>
										<div class="col-md-1">
											<button id="btn_update" class="btn button is-checked btn_update" type="button">수정</button>
											<button id="btn_delete" class="btn button is-checked btn_delete" type="button">삭제</button>
										
										</div>
									</div>	
								</c:when>
	
								<%-- 2. 리뷰 댓글 --%>
								<c:otherwise>
									<div id="list${status.count}" class="choose_item_text fix col-md-offset-1 div_content_ceo">
										<input type="hidden" value="${ alist.reviewNum }"> 
										<input type="hidden" value="${ alist.reviewRe }">
										<%-- 댓글 왼쪽 영역 : 아이콘/회원 닉네임 --%>
										<div class="col-md-2 text-center">
											<font size="6"><i class="icon icon icon-restaurant2 text-black"></i></font>
											<h6 class="content_user">${ alist.storeName }</h6>
										</div>
										<%-- 댓글 중간 영역 : 별점/리뷰글 --%>
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
				<%-- END DB 리뷰 목록 --%>
				
				
			
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
			</div>
			</div>
			
	</section>
	<!-- End off test section -->
	<!--이후 <br>삭제  -->



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

