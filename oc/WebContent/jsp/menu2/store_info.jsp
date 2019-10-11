<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>

<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<title>가게 정보 상세 보기</title>
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
	if( "${ storeInfo.storeCateg1 }" == "01" ){
		$('#categ1').text("음식점");
	}
	
	//카테고리2 출력하기
	if( "${ storeInfo.storeCateg2 }" == "01" ){
		$('#categ2').text("점포 가게");
	} else if( "${ storeInfo.storeCateg2 }" == "02" ){
		$('#categ2').text("이동 가게");
	}
	
	//카테고리3 출력하기
	if( "${ storeInfo.storeCateg2 }" == "01" ){
		$('#categ3').text("한식");
	} else if( "${ storeInfo.storeCateg2 }" == "02" ){
		$('#categ3').text("양식");
	} else if( "${ storeInfo.storeCateg2 }" == "03" ){
		$('#categ3').text("중식");
	} else if( "${ storeInfo.storeCateg2 }" == "04" ){
		$('#categ3').text("일식");
	} else if( "${ storeInfo.storeCateg2 }" == "05" ){
		$('#categ3').text("분식");
	} else if( "${ storeInfo.storeCateg2 }" == "06" ){
		$('#categ3').text("기타");
	}
	
	//좋아요 표시하기
	if( "${likeAct}" == "0" || "${ empty userNum }"){
		$('#btn_like').html('<font size="5">♡</font> ${ storeInfo.storeLike }');
	} else {
		$('#btn_like').html('<font size="5" color="red">♥</font> ${ storeInfo.storeLike }');
	}
	
	//즐겨찾기 표시하기
	if( "${favoAct}" == "0" || "${ empty userNum }"){
		$('#btn_favo').html('<font size="5">☆</font><br>즐겨찾기 하기');
	} else {
		$('#btn_favo').html('<font size="5" class="reviewStarsYellow">★</font><br>즐겨찾는 가게');
	}
	
	//가게 정보 수정하기
	$('.store_info_update').on('click', function(){
		var id = $(this).attr('id');
		
		//주소 변경
		if(id == 'addr'){
			//console.log($(this).parent().parent().parent().children().eq(1).children().eq(0).children().eq(1).text());//요소 찾기..
			var h4 = $(this).parent().parent().parent().children().eq(1).children().eq(0);
			var old_text_tag = h4.children().eq(1); //eq(0)제목부, eq(1)내용부
			var old_text = old_text_tag.text();
			
			old_text_tag.hide();
			h4.children().eq(1).after( $('<input>').attr({'type':'text', 'style':'width:80%;font-size:12pt;'}).val(old_text) ); //eq(2)인풋부
			//$('<input>').attr({'type':'hidden'}).val('전송받은 xy좌표값') ); //나중에 지도 검색 시 입력하는 부분
			//console.log( $(this).parent().parent().children().eq(1) )
			$(this).parent().append( $('<span>').attr({'class':'icon icon icon-arrows-1', 'id':'addr'}).click(info_update2) );
			$(this).remove();
			
		//전화번호 변경
		} else if(id == 'tel'){
			var h4 = $(this).parent().parent().parent().children().eq(1).children().eq(0);
			var old_text_tag = h4.children().eq(1); //eq(0)제목부, eq(1)내용부
			var old_text = old_text_tag.text();
			
			old_text_tag.hide();
			h4.children().eq(1).after( $('<input>').attr({'type':'text', 'style':'width:40%;font-size:12pt;', 'placeholder':'예) 010-0000-0000'}).val(old_text) ); //eq(2)인풋부
			$(this).parent().append( $('<span>').attr({'class':'icon icon icon-arrows-1', 'id':'tel'}).click(info_update2) );
			$(this).remove();
			
		//평균 운영 시간 | 메뉴 | 기타 변경
		} else {
			//console.log( $(this).parent().parent().parent().children().eq(1).children().eq(2));
			var blockquote = $(this).parent().parent().parent().children().eq(1).children().eq(2);
			var old_text_tag = blockquote.children().eq(0);
			var old_text = old_text_tag.text();
			//console.log(old_text); //운영시간
			var id = $(this).attr('id');
			
			old_text_tag.hide(); //blockquote.children().eq(0)숩겨진 에전 정보
			blockquote.append( $('<textarea>').attr({'cols':'45','rows':'10'}).val(old_text) ); //blockquote.children().eq(1)인풋부
			$(this).parent().append( $('<span>').attr({'class':'icon icon icon-arrows-1', 'id':id}).click(info_update2) );
			$(this).remove();
		}
	});
});


function review_update(){
	//console.log($(this).parent().parent());
	var divParent = $(this).parent().parent();
	
}

function review_up_cancle(){
	console.log($(this).parent().parent());
}

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


<!--가게 정보 -->
<%-- <c:if test="${ storeNum != storeInfo.storeNum }"> --%>
<section id="service" class="portpolio bg-grey roomy-70">
	<div class="container">
		<div class="row">
			<div class="main_service">
            	
				<!-- 왼쪽 블럭 -->
				<div class="col-md-4">
                
					<!-- 슬라이드 구역 -->
					<div class="service_slid">
						<div class="slid_shap bg-yellow"></div>
						<div class="service_slid_item text-center">

							<!-- 슬라이드1 : 가게 이름/아이콘 -->
							<div class="service_slid_text">
								<span class="icon icon icon-restaurant2 text-black"></span>
								<h5 class="text-black m-top-20">${ storeInfo.storeName }</h5>
                            </div>
                            
							<!-- 슬라이드2 : 가게 사진 -->
							<div class="service_slid_text">
								<span class="icon icon icon-sports-2 text-black"></span>
								<h5 class="text-black m-top-20">UI/UX Design</h5>
							</div>
						</div>
					</div>
                    
					<!-- 좋아요 구역 -->
					<br>
					<div align="center">
						<button id="btn_like" class='btn btn-default' type="button" onclick="likeUpDown()"></button>
					</div>
					
					<!-- 즐겨찾기 구역 -->
					<br>
					<div align="center">
						<button id="btn_favo" class='btn btn-default' type="button" onclick="favoUpDown()"></button>
					</div>
					
                </div>
                <!-- END 왼쪽 블럭 -->
                
                
				<!-- 오른쪽 블럭 -->
				<div class="col-md-7">
					<div class="service_item sm-m-top-50">
						
						<!-- 가게 이름 영역 -->
						<div class="head_title col-md-offset-1">
							<h2 class="text-uppercase"><strong>${ storeInfo.storeName }</strong><font size="4">&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;가게 정보</font></h2>
						</div><!-- END 가게 이름 영역 -->


						<!-- 가게 상세 정보 영역 -->
						<div class="service_content">
						
							<!-- 카테고리 -->
							<div class="store_categ">
								<div class="col-md-1">
								</div>
								<div class="col-md-11">
									<div class="main-portfolio roomy">
										<h4 class="m-top-20">카테<strong>고리</strong> &nbsp;&nbsp;&nbsp;
											<button id="categ1" name="categ1" class="btn button">카테고리1</button>
											<button id="categ2" name="categ2" class="btn button">카테고리2</button>
											<button id="categ3" name="categ3" class="btn button">카테고리3</button>
										</h4>
									</div>
									<div class="teamskillbar clearfix m-top-2 text-uppercase" data-percent="0%">
										<div class="teamskillbar-bar" style="width: 100%;"></div>
									</div>
								</div>
							</div> <!-- End 카테고리 -->
							
							<!-- 주소 -->
							<div class="store_addr">
								<div class="col-md-1">
									<c:if test="${ storeInfo.storeNum == storeNum }">
											<br><br><h2>
												<span id="addr" class="icon icon icon-cogwheels16 store_info_update">
												</span>
											</h2>
									</c:if>
								</div>
								<div class="col-md-11">
									<h4 class="m-top-50">주<strong>소 |&nbsp;&nbsp;&nbsp;</strong>
										<font size="4">${ storeInfo.storeAddr }</font>
										<input type="hidden" id="addr_xy" value="${ stroeInfo.storeXy }">
									</h4>
									<div class="teamskillbar clearfix m-top-2 text-uppercase" data-percent="20%">
										<div class="teamskillbar-bar" style="width: 80%;"></div>
									</div>
								</div>
							</div> <!-- End 주소 -->
							
							<!-- 평균 운영 시간 -->
							<div class="store_time">
								<c:if test="${ !empty storeInfo.storeTime || storeInfo.storeNum == storeNum }">
									<div class="col-md-1">
										<c:if test="${ storeInfo.storeNum == storeNum }">
											<br><br><h2>
												<span id="time" class="icon icon icon-cogwheels16 store_info_update">
												</span>
											</h2>
										</c:if>
									</div>
									<div class="col-md-11">
										<h4 class="m-top-50">평균 <strong>운영 시간 |&nbsp;&nbsp;&nbsp;</strong>
											<font size="4"></font>
										</h4>
										<div class="teamskillbar clearfix m-top-2 text-uppercase" data-percent="40%">
											<div class="teamskillbar-bar" style="width: 60%;"></div>
										</div>
										<blockquote><p class="pre_css">${ storeInfo.storeTime }</p></blockquote>
									</div>
								</c:if>
							</div> <!-- End 평균 운영 시간 -->
							
							<!-- 전화번호 -->
							<div class="store_tel">
								<c:if test="${ !empty storeInfo.storeTel || storeInfo.storeNum == storeNum  }">
									<div class="col-md-1">
										<c:if test="${ storeInfo.storeNum == storeNum }">
											<br><br><h2>
												<span id="tel" class="icon icon icon-cogwheels16 store_info_update">
												</span>
											</h2>
										</c:if>
									</div>
									<div class="col-md-11">
										<h4 class="m-top-50">전화<strong>번호 |&nbsp;&nbsp;&nbsp;</strong>
											<font size="4">${ storeInfo.storeTel }</font>
										</h4>
										<div class="teamskillbar clearfix m-top-2 text-uppercase" data-percent="60%">
											<div class="teamskillbar-bar" style="width: 40%;"></div>
										</div>
									</div>
								</c:if>
							</div> <!-- END 전화번호 -->

							<!-- End 판매 메뉴 -->
							<div class="store_menu">
								<c:if test="${ !empty storeInfo.storeMenu || storeInfo.storeNum == storeNum  }">
									<div class="col-md-1">
										<c:if test="${ storeInfo.storeNum == storeNum }">
											<br><br><h2>
												<span id="menu" class="icon icon icon-cogwheels16 store_info_update">
												</span>
											</h2>
										</c:if>
									</div>
									<div class="col-md-11">
										<h4 class="m-top-50">판매 <strong>메뉴 |&nbsp;&nbsp;&nbsp;</strong>
											<font size="4"></font>
										</h4>
										<div class="teamskillbar clearfix m-top-2 text-uppercase" data-percent="80%">
											<div class="teamskillbar-bar" style="width: 20%;"></div>
										</div>
										<blockquote><p class="pre_css">${ storeInfo.storeMenu }</p></blockquote>
									</div>
								</c:if>
							</div> <!-- End 판매 메뉴 -->
							
							<!-- 기타 -->
							<div class="store_etc">
								<c:if test="${ !empty storeInfo.storeEtc || storeInfo.storeNum == storeNum  }">
									<div class="col-md-1">
										<c:if test="${ storeInfo.storeNum == storeNum }">
											<br><br><h2>
												<span id="etc" class="icon icon icon-cogwheels16 store_info_update">
												</span>
											</h2>
										</c:if>
									</div>
									<div class="col-md-11">
										<h4 class="m-top-50">기<strong>타 |&nbsp;&nbsp;&nbsp;</strong>
											<font size="4"></font>
										</h4>
										<div class="teamskillbar clearfix m-top-2 text-uppercase" data-percent="100%">
											<div class="teamskillbar-bar" style="width: 0%;"></div>
										</div> 
										<blockquote><p class="pre_css">${ storeInfo.storeEtc }</p></blockquote>
									</div>
								</c:if>
							</div> <!-- End 기타 -->

							<!-- <a href="" class="btn btn-default m-top-40">Read More</a> -->
						</div>
					</div>
				</div>
				<!-- END 오른쪽 블럭 -->
				
			</div><!-- END main_service -->
		</div><!-- END row -->
	</div><!-- END container -->
</section> <!-- End 가게 정보 -->


<!-- 가게 리뷰 -->

<iframe src="storeReview.do"></iframe>


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