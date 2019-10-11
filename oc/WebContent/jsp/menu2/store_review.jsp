<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="u" %>

<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<title>가게 리뷰 보기</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--Google Font link-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">



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



<!-- 화면 전환 및 폰트와 제목 디자인 -->
<!--For Plugins external css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/plugins.css" />
<!--Theme custom css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css">
<!--Theme Responsive css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/responsive.css" />

<script src="${pageContext.request.contextPath }/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script> 

$(document).ready(function(){
	
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
	
	
	//리뷰 입력하기 (DB)
	$('#btn_insert').on('click', function(){
		//console.log($('#insertText').val());//텍스트창에 입력한 값
		var starNum =0;
		for(var i=1; i<=$('.insert_star').length; i++){
			if($('#star'+i).css("color") == "rgb(255, 255, 0)"){
				starNum = i;
			}
		}
		console.log(starNum);
		var content = $('#insertText').val();
		//console.log(starNum);
		if(starNum == 0){
			alert("별점을 입력해 주세요.");
			return false;
		}
		if(content == ""){
			alert("리뷰 내용을 입력해 주세요.");
		} else {
			$.ajax({
				url: "storeInfoChange.do",
				type: "post",
				data: {
					action: "reviewInsert",
					storeNum: "${ storeInfo.storeNum }",
					userNum: "${ userNum }",
					reviewStar: starNum,
					reviewContent: content
				},
				dataType: "json",
				success: function(seq){
					if(seq != 0){
						alert("리뷰 등록에 성공했습니다.");
						
						var last_list_id_num = $('.review_list').children().last().attr('id').substring(4,5);
						var today_date = new Date().toISOString().substring(0,10);
						
						//copy_review를 먼저 바꾸고 클론을 붙임.
						var copy_re = $('#copy_reivew');
						copy_re.children().eq(0).val(seq);
						copy_re.children().eq(1).val(seq);
						copy_re.children().eq(2).children().eq(1).text( "${userNick}" );
						var star_c = "★";
						for(var i=1; i<starNum; ++i){
							star_c += "★";
						}
						copy_re.children().eq(3).children().eq(0).children().eq(0).text(star_c);
						copy_re.children().eq(3).children().eq(0).children().eq(1).html(content + " &nbsp;&nbsp;&nbsp;(" + today_date + ")");

						//var new_id_num = last_list_id_num + 1;
						//copy_re.attr('id','list'+ new_id_num);
						//copy_re.children().eq(4).children().eq(0).attr('id','btn_up_'+new_id_num);
						//copy_re.children().eq(4).children().eq(0).attr('id','btn_del_'+new_id_num);
						$('#copy_reivew').clone().prependTo($('.review_list'));
						$('.review_list').children().first().attr('id',last_list_id_num+1);
						
						//입력창 빈값으로 되돌리기
						$('#star1').css("color","gray");
						$('#star2').css("color","gray");
						$('#star3').css("color","gray");
						$('#star4').css("color","gray");
						$('#star5').css("color","gray");
						$('#insertText').val("");
						
					} else {
						alert("리뷰 등록에 실패했습니다.");
					}
				}
			});
		}
		
	});

	//리뷰 삭제
	$('.review_list').on('click', '.btn_delete', function(){
		//console.log($(this).parent().parent().attr('id'));
		var parentDiv = $(this).parent().parent();
		var reviewNum = parentDiv.children().eq(0).val();

		var con = confirm("정말 삭제하시겠습니까?");
		if(con){
			$.ajax({
				url: "storeInfoChange.do",
				data: {
					action: "reviewDelete",
					reviewNum: reviewNum
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
	
	
	//리뷰 업데이트
	$('.btn_update').on('click', function(){
		var parentDiv = $(this).parent().parent();
		var reviewNum = parentDiv.children().eq(0).val();
		
		var blockquote = parentDiv.children().eq(3).children().eq(0);
		var con1 = blockquote.children().last().text();
		var con2 = con1.substring(0,con1.length-15);
		console.log(con2)
		
		var starNum = 0;
		for(var i=0; i<5; i++){
			if(blockquote.children().eq(i).text() == "★"){
				starNum += 1;
			}
		}
		console.log(starNum);
		star_up${ list.reviewNum }
		blockquote.hide();//blockquote 숨김처리
		var span_star = $('<blockquote>');
		for(var i=1; i<=starNum; i++){
			span_star.append( $('<span>').attr({'class':'reviewStars', 'id':'star'+i, 'style':'color:yellow;'}).text("★") );
		}
		for(var i=1; i<=5-starNum; i++){
			span_star.append( $('<span>').attr({'class':'reviewStars', 'id':'star'+i, 'style':'color:gray;'}).text("★") );
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
		
	})
	
	//리뷰 댓글달기
	$('.btn_reply').on('click', function(){
		console.log($(this));
	})
	
	
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


<!-- 가게 리뷰 -->
<section id="portfolio" class="portfolio margin-top-120">
	<div class="container">
		<div class="row">
			<div class="main-portfolio roomy-80">
				
				<!-- 리뷰 헤드 부분 -->
				<!-- 제목 -->
				<div class="col-md-4">
					<div class="head_title text-left sm-text wow fadeInDown">
						<h2><strong>리뷰</strong></h2>
					</div>
				</div>
				
				<!-- 가게 전체 별점 -->
				<div id="star" class="col-md-8 text-right">
					<button class="btn button is-checked" data-filter="*">★</button>
					<button class="btn button" data-filter=".metal">★</button>
					<button class="btn button" data-filter=".transition">★</button>
					<button class="btn button" data-filter=".alkali">★</button>
					<button class="btn button" data-filter=".ar">★</button>&nbsp;&nbsp;
					<font size="5"><strong>${ stars }</strong></font> /5.0
				</div>
				
				<!-- END 리뷰 헤드 부분 -->
				<div style="clear: both;"></div>
				
				
				<!-- 리뷰 목록 뿌려주기 -->
				<div class="col-md-12 ">
				
					<%-- 가게 사업자가 본인이면 댓글을 달 수는 없고 대댓만 달 수 있고, 대댓을 수정/삭제 할 수 있음.
                		 / 가게 사업자가 본인이 아니면 댓글을 달 수 있고 본인의 댓글은 수정/삭제할 수 있음 --%>
                		 
					<%-- 댓글 입력창 --%>
					<c:if test="${ storeInfo.storeNum != storeNum && !empty userNum}">
						<div id="divInsert" class="choose_item_text fix col-md-offset-1 div_content_ceo">
							<div class="col-md-2 text-center">
								<font size="6"><i class="icon icon icon-smile text-black"></i></font> <h6>${ userNick }</h6>
							</div>
							<div class="col-md-9 text-left">
								<blockquote>
									<span class="reviewStars insert_star" id="star1">★</span>
									<span class="reviewStars insert_star" id="star2">★</span>
									<span class="reviewStars insert_star" id="star3">★</span>
									<span class="reviewStars insert_star" id="star4">★</span>
									<span class="reviewStars insert_star" id="star5">★</span>
									<br><textarea cols="73" rows="3" id="insertText" name="insertText"></textarea>
								</blockquote>
							</div>
							<div class="col-md-1">
								<button id="btn_insert" class="btn button is-checked" type="button">확인</button>
							</div>
						</div>
					</c:if><%-- END 댓글 입력창 --%>
				
					<!-- DB 리뷰 목록 : 등록된 리뷰가 없을 때-->
					<c:if test="${storeReview.isEmpty()}">
						<div class="choose_item_text fix">
							<p> 등록된 리뷰가 없습니다. </p>
						</div>
					</c:if>
					
					<%-- DB 리뷰 목록 --%>
					<div class="review_list">
						<c:forEach items="${ storeReview }" var="list" varStatus="status">
						
							<c:choose>
							
								<%-- 1. 리뷰글(글번호와 댓글 번호가 일치) --%>
								<c:when test="${ list.reviewRe == list.reviewNum }">
									<div id="list${status.count}" class="choose_item_text fix div_content_user">
										<input type="hidden" value="${ list.reviewNum }">
										<input type="hidden" value="${ list.reviewRe }">
										
										<%-- 리뷰 왼쪽 영역 : 아이콘/회원 닉네임 --%>
										<div class="col-md-2 text-center">
											<font size="6"><i class="icon icon icon-smile text-black"></i></font>
											<h6 class="content_user">${ list.userNick }</h6>
										</div>
										<%-- 리뷰 중간 영역 : 별점/리뷰글 --%>
										<div class="col-md-9 text-left content_star">
											<blockquote>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<c:forEach var="i" begin="1" end="${ list.reviewStar }" step="1">
													<font class="reviewStarsYellow star_up${ list.reviewNum }">★</font>
												</c:forEach>
												<p class="pre_css">${ list.reviewContent } &nbsp;&nbsp;&nbsp;(${ list.reviewDate })</p>
											</blockquote>
										</div>
										<%-- 리뷰 오른쪽 영역 : 댓글/수정/삭제 버튼 --%>
										<div class="col-md-1">
											<c:choose>
												<c:when test="${ storeInfo.storeNum == storeNum && list.userNum != userNum }">
													<br><button id="btn_re_${status.count}" class="btn button is-checked btn_reply" type="button">댓글</button>
												</c:when>
												<c:when test="${ storeInfo.storeNum != storeNum && list.userNum == userNum }">
													<button id="btn_up_${status.count}" class="btn button is-checked btn_update" type="button">수정</button>
													<button id="btn_del_${status.count}" class="btn button is-checked btn_delete" type="button">삭제</button>
												</c:when>
											</c:choose>
										</div>
										
									</div>
								</c:when>
								
								<%-- 2. 리뷰 댓글(글번호와 댓글 번호 불일치) 사장님만 댓글 달 수 있으므로- 수정/삭제 할 수 있음 --%>
								<c:otherwise>
									<div id="list${status.count}" class="choose_item_text fix col-md-offset-1 div_content_ceo">
										<input type="hidden" value="${ list.reviewNum }">
										<input type="hidden" value="${ list.reviewRe }">
										<%-- 리뷰 왼쪽 영역 : 아이콘/회원 닉네임 --%>
										<div class="col-md-2 text-center">
											<font size="6"><i class="icon icon icon-restaurant2 text-black"></i></font>
											<h6 class="content_user">${ list.storeName }</h6>
										</div>
										<%-- 리뷰 중간 영역 : 별점/리뷰글 --%>
										<div class="col-md-9 text-left content_reply">
											<blockquote>
												<p class="pre_css">${ list.reviewContent } &nbsp;&nbsp;&nbsp;(${ list.reviewDate })</p>
											</blockquote>
										</div>
										<%-- 리뷰 오른쪽 영역 : 수정/삭제 버튼 --%>
										<div class="col-md-1">
											<c:if test="${ storeInfo.storeNum == storeNum }">
												<button id="btn_up_${status.count}" class="btn button is-checked btn_update" type="button">수정</button>
												<button id="btn_del_${status.count}" class="btn button is-checked btn_delete" type="button">삭제</button>
											</c:if>
										</div>
									</div>
								</c:otherwise>
							
							</c:choose>
						</c:forEach>
					</div>
					<%-- END DB 리뷰 목록 --%>
               		
               		<%-- 리뷰글 삽입을 위한 히든 div --%>
               		<div class="hidden">
						<div id="copy_reivew" class="choose_item_text fix div_content_user">
							<input type="hidden" value="#">
							<input type="hidden" value="#">
							
							<%-- 리뷰 왼쪽 영역 : 아이콘/회원 닉네임 --%>
							<div class="col-md-2 text-center">
								<font size="6"><i class="icon icon icon-smile text-black"></i></font>
								<h6 class="content_user"></h6>
							</div>
							<%-- 리뷰 중간 영역 : 별점/리뷰글 --%>
							<div class="col-md-9 text-left content_star">
								<blockquote>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<font class="reviewStarsYellow">★</font>
									<p class="pre_css"></p>
								</blockquote>
							</div>
							<%-- 리뷰 오른쪽 영역 : 댓글/수정/삭제 버튼 --%>
							<div class="col-md-1">
								<button class="btn button is-checked btn_update" type="button">수정</button>
								<button class="btn button is-checked btn_delete" type="button">삭제</button>
							</div>
						</div>
					</div>
					
					<!-- 페이징 -->
					<form name="pagefrm" action="storeInfo.do">
						<input type="hidden" name="p">
						<input type="hidden" name="storeNum" value="${ storeInfo.storeNum }">
					</form>
					
					<u:paging pgfunc="doList" paging="${ paging }"></u:paging>
					<script>
					function doList(p) {
						document.pagefrm.p.value = p;
						document.pagefrm.submit();
					}
					</script>
					
				</div>
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