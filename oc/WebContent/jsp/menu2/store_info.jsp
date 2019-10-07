<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script> 

$(document).ready(function(){
	
	//카테고리1 출력하기
	if( ${ storeInfo.storeCateg1 } == "01" ){
		$('#categ1').text("음식점");
	}
	
	//카테고리2 출력하기
	if( ${ storeInfo.storeCateg2 } == "01" ){
		$('#categ2').text("점포 가게");
	} else if( ${ storeInfo.storeCateg2 } == "02" ){
		$('#categ2').text("이동 가게");
	}
	
	//카테고리3 출력하기
	if( ${ storeInfo.storeCateg2 } == "01" ){
		$('#categ3').text("한식");
	} else if( ${ storeInfo.storeCateg2 } == "02" ){
		$('#categ3').text("양식");
	} else if( ${ storeInfo.storeCateg2 } == "03" ){
		$('#categ3').text("중식");
	} else if( ${ storeInfo.storeCateg2 } == "04" ){
		$('#categ3').text("일식");
	} else if( ${ storeInfo.storeCateg2 } == "05" ){
		$('#categ3').text("분식");
	} else if( ${ storeInfo.storeCateg2 } == "06" ){
		$('#categ3').text("기타");
	}
	
	$('#heart').hover(function(){
		console.log($(this).text())
		 if( $(this).text() == "♥" ){
			 $(this).text('♡');
		 } else {
			 $(this).text('♥');
		 }
	}, function(){
		if(	$(this).text() == "♥" ){
			$(this).text('♡');
		} else {
			$(this).text('♥');
		}
	});
});


function likeUpDown(){
	var storeNum = ${ storeInfo.storeNum };
	if(${storeNum} != storeNum){
		$.ajax({
			url: "likeClick.do",
			data: {
				storeNum: ${ storeInfo.storeNum }
			},
			success: function(result){
				console.log(result)
				if(result == 1){
					$('#heart').text('♥');
					$('#like_num').text(${ likes }+1);
				} else {
					$('#heart').text('♡');
					$('#like_num').text(${ likes }-1);
				}
			}
		});
	}
}
/*
$('#btnlike').on('click', function(){
	console.log( ${storeInfo.storeNum} )
	$.ajax({
		url: "likeClick.do",
		data: {
			storeNum: ${ storeInfo.storeNum }
		},
		success: function(result){
			if(result == 0){
				$('#heart').text('♥');
				$('#like_num').text(${ likes }+1);
			} else {
				$('#heart').text('♡');
				$('#like_num').text(${ likes }-1);
			}
		}
	});
});*/


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
                        	
                        	<!-- 가게 이름/아이콘 -->
                            <div class="service_slid_text">
                                <span class="icon icon icon-restaurant2 text-black"></span>
                                <h5 class="text-black m-top-20">${ storeInfo.storeName }</h5>
                            </div>
                            
                            <!-- 가게 사진 -->
                            <div class="service_slid_text">
                                <span class="icon icon icon-sports-2 text-black"></span>
                                <h5 class="text-black m-top-20">UI/UX Design</h5>
                            </div>
                            
                        </div>
                    </div>
                    
                    <!-- 좋아요 구역 -->
                    <br>
                    <div align="center" id="likeDiv" onclick="likeUpDown()">
                       <c:choose>
                       <c:when test="${likeHeart == 0}">
	                   	<font id="heart" color="red">♡</font>&nbsp;&nbsp;
	                   </c:when>
	                   	<c:otherwise><font id="heart" color="red">♥</font>&nbsp;&nbsp;
	                   </c:otherwise>
	                   </c:choose>
	                   <font id="like_num" color="gray">${ likes }</font>
	                   <input id="btnlike" type="button" onclick="likeUpDown()" value="좋아요">
                    </div>
                    
                </div>
                
                
                <!-- 오른쪽 블럭 -->
                <div class="col-md-7 col-md-offset-1">
                    <div class="service_item sm-m-top-50">
                        <div class="head_title">
                            <h2 class="text-uppercase"><strong>${ storeInfo.storeName }</strong><font size="4">&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;가게 정보</font></h2>
                        </div>
                        <div class="service_content">
                           
                           <!-- 항목 뿌려지는 부분 -->
                           
                           
                           
                           <div class="main-portfolio roomy">
                           <h4 class="m-top-20">카테<strong>고리</strong> &nbsp;&nbsp;&nbsp;
	                           <button id="categ1" name="categ1" class="btn button">카테고리1</button>
	                           <button id="categ2" name="categ2" class="btn button">카테고리2</button>
	                           <button id="categ3" name="categ3" class="btn button">카테고리3</button>
	                           <!-- <h2><span class="icon icon icon-gear text-black"></span></h2> -->
                           </h4></div>
                           <div class="teamskillbar clearfix m-top-2 text-uppercase" data-percent="0%">
                           <div class="teamskillbar-bar" style="width: 100%;"></div>
                           </div>
                            <!-- End Skill Bar -->
                           
                           <h4 class="m-top-50">주<strong>소 |&nbsp;&nbsp;&nbsp;</strong>
                            <font size="4">${ storeInfo.storeAddr }</font>
                           </h4>
                           <div class="teamskillbar clearfix m-top-2 text-uppercase" data-percent="20%">
                           <div class="teamskillbar-bar" style="width: 80%;"></div>
                           </div> <!-- End Skill Bar -->
                           
                           <c:if test="${ !empty storeInfo.storeTime }">
	                           <h4 class="m-top-50">평균 <strong>운영시간 |&nbsp;&nbsp;&nbsp;</strong>
	                           <font size="4"></font>
	                           </h4>
	                           <div class="teamskillbar clearfix m-top-2 text-uppercase" data-percent="40%">
	                           <div class="teamskillbar-bar" style="width: 60%;"></div>
	                           </div>
	                           <blockquote><p>${ storeInfo.storeTime }</p></blockquote>
                           </c:if> <!-- End Skill Bar -->
                           
                           <c:if test="${ !empty storeInfo.storeTel }">
	                           <h4 class="m-top-50">전화<strong>번호 |&nbsp;&nbsp;&nbsp;</strong>
	                           <font size="4">${ storeInfo.storeTel }</font>
	                           </h4>
	                           <div class="teamskillbar clearfix m-top-2 text-uppercase" data-percent="60%">
	                           <div class="teamskillbar-bar" style="width: 40%;"></div>
	                           </div> <!-- End Skill Bar -->
                           </c:if>
                           
                           <c:if test="${ !empty storeInfo.storeMenu }">
	                           <h4 class="m-top-50">판매 <strong>메뉴 |&nbsp;&nbsp;&nbsp;</strong>
	                           <font size="4"></font>
	                           </h4>
	                           <div class="teamskillbar clearfix m-top-2 text-uppercase" data-percent="80%">
	                           <div class="teamskillbar-bar" style="width: 20%;"></div>
	                           </div>
	                           <blockquote><p>${ storeInfo.storeMenu }</p></blockquote>
                           </c:if> <!-- End Skill Bar -->
                           
                           <c:if test="${ !empty storeInfo.storeEtc }">
	                           <h4 class="m-top-50">기<strong>타 |&nbsp;&nbsp;&nbsp;</strong>
	                           <font size="4"></font>
	                           </h4>
	                           <div class="teamskillbar clearfix m-top-2 text-uppercase" data-percent="100%">
	                           <div class="teamskillbar-bar" style="width: 0%;"></div>
	                           </div> 
	                           <blockquote><p>${ storeInfo.storeEtc }</p></blockquote>
                           </c:if> <!-- End Skill Bar -->

                            <a href="" class="btn btn-default m-top-40">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section><!-- End 가게 정보 -->


<section id="portfolio" class="portfolio margin-top-120">

    <!-- Portfolio container-->
    <div class="container">
        <div class="row">
            <div class="main-portfolio roomy-80">

                <div class="col-md-4">
                    <div class="head_title text-left sm-text-center wow fadeInDown">
                        <h2><strong>리뷰</strong></h2>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="filters-button-group text-right sm-text-center">
                        <button class="btn button is-checked" data-filter="*">★</button>
                        <button class="btn button" data-filter=".metal">★</button>
                        <button class="btn button" data-filter=".transition">★</button>
                        <button class="btn button" data-filter=".alkali">★</button>
                        <button class="btn button" data-filter=".ar">★</button>
                    </div>
                </div>



                <div style="clear: both;"></div>

                <div class="grid text-center">
                
                	<form id="reviewFrm" name="reviewFrm" method="post" action="reviewWrite.do">

                    </form>

                </div>

                <div style="clear: both;"></div>


            </div>
        </div>
    </div><!-- Portfolio container end -->
</section><!-- End off portfolio section -->



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