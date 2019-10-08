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
	if( "${likeAct}" == "0"){
		$('#btn_like').html('<font size="5">♡</font> ${ storeInfo.storeLike }');
	} else {
		$('#btn_like').html('<font size="5" color="red">♥</font> ${ storeInfo.storeLike }');
	}
	
	//별점 표시하기
	console.log($('#star').children().size())
	console.log($('#star').children().eq(1))
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
			for(var i=5; i>star_num; i--){
				var starNum = "star"+i;
				$('#'+starNum).css("color","gray");
			}
		}
		
	})
	
	
	
});

function likeUpDown(){
	if( "${ storeInfo.storeNum }" != "${storeNum }"){
		var storeNum = ${ storeInfo.storeNum };
		$.ajax({
			url: "likeClick.do",
			data: {
				userNum: "${ userNum }",
				storeNum: "${ storeInfo.storeNum }"
			},
			dataType: "json",
			success: function(result){
				
				if(result.likeChk == 0){
					$('#btn_like').html('<font size="5" color="red">♥</font>' + result.likeCount);	
				} else {
					$('#btn_like').html('<font size="5">♡</font>' + result.likeCount);
				}
			}
		});
	}
	
}

function btnReply(){
	console.log($(this).parent().parent().attr("id"));
};

function btnUpdate(){
	console.log($(this).parent().parent().attr("id"));
};

function btnInsert(){
	console.log($('#insertText').val());//텍스트창에 입력한 값
	var starNum;
	for(var i=0; i<$('.reviewStars').length; ++i){
		if($('#star'+i).css("color") == "rgb(255, 255, 0)"){
			starNum = i;
		}
	}
	console.log(starNum);
	$.ajax({
		url: "reviewInsert.do",
		type: "post",
		data: {
			storeNum: "${ storeInfo.storeNum }",
			userNum: "${ userNum }",
			reviewStar: starNum,
			reviewContent: $('#insertText').val()
		},
		dataType: "json",
		success: function(result){
			if(result != 0){
				alert("리뷰 등록에 성공했습니다.")
				$('#copy_review').clone().preppendTo($('#reviewList'));
				console.log($('.contentOut').first());
				var id_num = $('.contentOut').children().eq(1).attr('id').substring(4,5);
				$('.contentOut').first().attr('id','list'+id_num);
				$('.content_user').text(${userNum});
				for(var i=0; i<starNum; i++){
					$('.content').children.eq(0).append('<font class="reviewStarsYellow">★</font>')
				}
				$('.content').children.eq(0).append('<br>'+ $('#insertText').val() +'&nbsp;&nbsp;&nbsp;('+ 날짜 넣기 여기 2019-10-08+')&nbsp;&nbsp;&nbsp;');
			} else {
				alert("리뷰 등록에 실패했습니다.")
				
				
			}
		}
	})
};

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
});
*/

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
                    <div align="center">
                       <button id="btn_like" class='btn btn-default' type="button" onclick="likeUpDown()"></button>
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
                    <div class="head_title text-left sm-text wow fadeInDown">
                        <h2><strong>리뷰</strong></h2>
                    </div>
                </div>
                
                <div class="col-md-8 text-right">
						<button class="btn button is-checked" data-filter="*">★</button>
		                <button class="btn button" data-filter=".metal">★</button>
		                <button class="btn button" data-filter=".transition">★</button>
		                <button class="btn button" data-filter=".alkali">★</button>
		                <button class="btn button" data-filter=".ar">★</button>
		                &nbsp;&nbsp;<font size="5"><strong>${ stars }</strong></font> /5.0
                </div>
                <div style="clear: both;"></div>

                <div class="col-md-12 ">
                
                	<form id="reviewFrm" name="reviewFrm" method="post" action="reviewWrite.do">
                	
                		<%-- 가게 사업자가 본인이면 댓글을 달 수는 없고 대댓만 달 수 있고, 대댓을 수정/삭제 할 수 있음
                		 / 가게 사업자가 본인이 아니면 댓글을 달 수 있고 본인의 댓글은 수정/삭제할 수 있음 --%>
                		<c:choose>
                		
                		<%-- 사장님일 경우 출력 --%>
                		<c:when test="${ storeInfo.storeNum == storeNum }">
                		
	                		<!-- DB 목록을 가져와서 뿌려주는 곳 : 등록된 글이 없을 때와 있을 때 구분해서 작성-->
							<c:if test="${storeReview.isEmpty()}">
								<div class="choose_item_text fix">
	                            <p> 등록된 리뷰가 없습니다. </p>
	                        </div>
							</c:if>
							
							<c:forEach items="${ storeReview }" var="list" varStatus="status">
								<c:choose><%-- 글번호와 댓글 번호가 일치하면-리뷰의 댓글이 아닐 경우-사장님은 대댓을 달 수 있음. --%>
									<c:when test="${ list.reviewRe == list.reviewNum }">
										<div id="list${status.count}" class="choose_item_text fix" style="padding: 15px; margin: 10px;"onmouseover="this.style.background='#F2F2F2'"
											 onmouseout="this.style.background='white'">
											<div class="col-md-2 text-center">
												<font size="6"><i class="icon icon icon-smile text-black"></i></font> <h6>${ list.userNick }</h6>
											</div>
											<div class="col-md-9 text-left">
												<p> <c:forEach var="i" begin="0" end="${ list.reviewStar }" step="1">
														<font class="reviewStarsYellow">★</font>
													</c:forEach><br>${ list.reviewContent } &nbsp;&nbsp;&nbsp;(${ list.reviewDate })
												</p>
											</div>
											<div class="main-portfolio roomy col-md-1">
												<br><button class="btn button is-checked" type="button" onclick="btnReply()">댓글</button>
											</div>
					                    </div>
				                    </c:when>
			                    	<c:otherwise><%-- 글번호와 댓글 번호가 일치하지 않으면-댓글일 경우, 사장님만 댓글 달 수 있으므로- 수정/삭제 할 수 있음 --%>
										<div id="list${status.count}" class="choose_item_text fix col-md-offset-1" style="background-color: #F2F2F2; padding: 15px;" onmouseover="this.style.background='white'"
											 onmouseout="this.style.background='#F2F2F2'">
											 <div class="col-md-2 text-center">
											<font size="6"><i class="icon icon icon-restaurant2 text-black"></i></font> <h6>${ list.storeName }</h6>
											</div>
											<div class="col-md-9 text-left">
											<p><br> ${ list.reviewContent } &nbsp;&nbsp;&nbsp;(${ list.reviewDate }) </p>
											</div>
											<div class="main-portfolio roomy col-md-1">
												<c:if test="${ list.userNum == userNum }">
													<br><button class="btn button" type="button" onclick="btnUpdate()">수정</button>
												</c:if>
											</div>
										</div>
				                    </c:otherwise>
			                    </c:choose>
							</c:forEach><%-- DB 목록을 가져와서 뿌려주는 곳 end --%>
                		</c:when>
                		
                		<%-- 사장님이 아닐 경우 출력--%>
                		<c:otherwise>
                			<%-- 댓글 입력창 --%>
	                		<div id="divInsert" class="choose_item_text fix col-md-offset-1" style="background-color: #F2F2F2; padding: 15px;" onmouseover="this.style.background='white'"
								 onmouseout="this.style.background='#F2F2F2'">
								<div class="col-md-2 text-center">
									<font size="6"><i class="icon icon icon-smile text-black"></i></font> <h6>${ userNick }</h6>
								</div>
								<div class="col-md-9 text-left">
									<span class="reviewStars" id="star1">★</span>
									<span class="reviewStars" id="star2">★</span>
									<span class="reviewStars" id="star3">★</span>
									<span class="reviewStars" id="star4">★</span>
									<span class="reviewStars" id="star5">★</span>
									<p><textarea rows="2" cols="75" id="insertText" name="insertText"></textarea></p>
								</div>
								<div class="main-portfolio roomy col-md-1">
									<br><button class="btn button is-checked" type="button" onclick="btnInsert()">확인</button>
								</div>
							</div><%-- END 댓글 입력창 --%>
	                	
							<%-- DB 목록을 가져와서 뿌려주는 곳 : 등록된 글이 없을 때와 있을 때 구분해서 작성--%>
							<c:if test="${storeReview.isEmpty()}">
								<div class="choose_item_text fix">
	                            <p> 등록된 리뷰가 없습니다. </p>
	                        </div>
							</c:if>
							
							<div id="insert" class="hidden">
							<div id="copy_reivew" class="choose_item_text fix" style="padding: 15px; margin: 10px;"onmouseover="this.style.background='#F2F2F2'"
											 onmouseout="this.style.background='white'">
											<div class="col-md-2 text-center">
												<font size="6"><i class="icon icon icon-smile text-black"></i></font> <h6 class="content_user">사업자회원2</h6>
											</div>
											<div class="col-md-9 text-left content">
												<p> 
														<font class="reviewStarsYellow">★</font>
													
														<font class="reviewStarsYellow">★</font>
													
														<font class="reviewStarsYellow">★</font>
													<br>ㅁㄴㅇㄹ &nbsp;&nbsp;&nbsp;(2019-10-08)&nbsp;&nbsp;&nbsp;
												</p>
											</div>
											<div class="main-portfolio roomy col-md-1">
												
													<br><button class="btn button" type="button" onclick="btnUpdate()">수정</button>
												
											</div>
					                    </div>
							</div>
							
							<div id="reviewList">
							<c:forEach items="${ storeReview }" var="list" varStatus="status">
								<c:choose><%-- 글번호와 댓글 번호가 일치하면-리뷰의 댓글이 아닐 경우 --%>
									<c:when test="${ list.reviewRe == list.reviewNum }">
										<div id="list${status.count}" class="choose_item_text fix contentOut" style="padding: 15px; margin: 10px;"onmouseover="this.style.background='#F2F2F2'"
											 onmouseout="this.style.background='white'">
											<div class="col-md-2 text-center">
												<font size="6"><i class="icon icon icon-smile text-black"></i></font> <h6>${ list.userNick }</h6>
											</div>
											<div class="col-md-9 text-left">
												<p> <c:forEach var="i" begin="1" end="${ list.reviewStar }" step="1">
														<font class="reviewStarsYellow">★</font>
													</c:forEach><br>${ list.reviewContent } &nbsp;&nbsp;&nbsp;(${ list.reviewDate })&nbsp;&nbsp;&nbsp;
												</p>
											</div>
											<div class="main-portfolio roomy col-md-1">
												<c:if test="${ list.userNum == userNum }">
													<br><button class="btn button" type="button" onclick="btnUpdate()">수정</button>
												</c:if>
											</div>
					                    </div>
				                    </c:when>
				                    
			                    	<c:otherwise><%-- 글번호와 댓글 번호가 일치하지 않으면-리뷰의 댓글일 경우 --%>
										<div id="list${status.count}" class="choose_item_text fix col-md-offset-1" style="background-color: #F2F2F2; padding: 15px;" onmouseover="this.style.background='white'"
											 onmouseout="this.style.background='#F2F2F2'">
											<div class="col-md-2 text-center">
												<font size="6"><i class="icon icon icon-restaurant2 text-black"></i></font> <h6>${ list.storeName }</h6>
											</div>
											<div class="col-md-10 text-left">
												<p><br> ${ list.reviewContent } &nbsp;&nbsp;&nbsp;(${ list.reviewDate }) </p>
											</div>
										</div>
				                    </c:otherwise>
				                    
			                    </c:choose>
							</c:forEach><%-- DB 목록을 가져와서 뿌려주는 곳 end --%>
							</div>
							
                		</c:otherwise>
                		</c:choose>
                		
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