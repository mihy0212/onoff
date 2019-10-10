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
	
	//즐겨찾기 표시하기
	if( "${favoAct}" == "0"){
		$('#btn_favo').html('<font size="5">☆</font><br>즐겨찾기 하기');
	} else {
		$('#btn_favo').html('<font size="5" class="reviewStarsYellow">★</font><br>즐겨찾는 가게');
	}
	
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
	$('.btn_delete').on('click', function(){
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

//좋아요 등록/삭제 (DB)
function likeUpDown(){
	if( "${ storeInfo.storeNum }" != "${storeNum }"){
		var storeNum = ${ storeInfo.storeNum };
		
		$.ajax({
			url: "storeInfoChange.do",
			data: {
				action: "likeClick",
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

//즐겨찾기 등록/삭제(DB)
function favoUpDown(){
	if( "${ storeInfo.storeNum }" != "${storeNum }"){
		var storeNum = ${ storeInfo.storeNum };
		$.ajax({
			url: "storeInfoChange.do",
			data: {
				action: "favoClick",
				userNum: "${ userNum }",
				storeNum: "${ storeInfo.storeNum }"
			},
			dataType: "json",
			success: function(result){
				if(result == 0){
					$('#btn_favo').html('<font size="5" class="reviewStarsYellow">★</font><br>즐겨찾는 가게');	
				} else {
					$('#btn_favo').html('<font size="5">☆</font><br>즐겨찾기 하기');
				}
			}
		});
	}
}

//가게 정보 수정 (DB)
function info_update2(){
	var inputParent;
	var inputTag;
	var content;
	var check;
	var btnUpdate = $(this);
	var id = btnUpdate.attr('id');
	//console.log(id);
	if(id == 'addr' || id == 'tel'){
		inputParent = $(this).parent().parent().parent().children().eq(1).children().eq(0);
		inputTag = inputParent.children().eq(2);
		content = inputTag.val();
		//console.log(content);
		check = "store_" + id;
	} else if(id == 'time' || id == 'menu' || id == 'etc'){
		inputParent = $(this).parent().parent().parent().children().eq(1).children().eq(2);
		inputTag = inputParent.children().eq(1);
		content = inputTag.val();
		check = "store_" + id;
	}
	var con = confirm("입력한 내용으로 변경하시겠습니까?");
	if(con){
		$.ajax({
			url: "storeInfoChange.do",
			type: "post",
			data: {
				action: "storeInfoUpdate",
				check: check,
				content: content,
				storeNum: "${ storeInfo.storeNum }"
			},
			dataType: "json",
			success: function(result){
				if(result == 1){
					if(id == 'addr' || id == 'tel'){
						inputTag.after( $('<font>').attr({'size':'4'}).text( content ) );
						inputParent.children().eq(1).remove; //숨겨진 예전정보 삭제
						inputTag.remove();
						btnUpdate.parent().append( $('<span>').attr({'class':'icon icon icon-cogwheels16', 'id': id}) );
						btnUpdate.remove();
						btnUpdate.parent().children().eq(1).remove();
					} else if(id == 'time' || id == 'menu' || id == 'etc'){
						inputParent.append( $('<p>').text( content ) );
						inputParent.children().eq(0).remove; //숨겨진 예전정보 삭제
						inputTag.remove();
						btnUpdate.parent().append( $('<span>').attr({'class':'icon icon icon-cogwheels16 type_1', 'id': id}) );
						btnUpdate.remove();
						btnUpdate.parent().children().eq(1).remove();
					}
				} else {
					alert("변경에 실패했습니다.")
				}
			}
		})
	} else {
		if(id == 'addr' || id == 'tel'){
			var inputParent = $(this).parent().parent().parent().children().eq(1).children().eq(0);
			inputParent.children().eq(1).show();
			inputParent.children().eq(2).remove();
			$(this).parent().append( $('<span>').attr({'class':'icon icon icon-cogwheels16', 'id': id }) );
			$(this).remove();
			$(this).parent().children().eq(1).remove();
		} else if(id == 'time' || id == 'menu' || id == 'etc'){
			var inputParent = $(this).parent().parent().parent().children().eq(1).children().eq(2);
			inputParent.children().eq(1).remove();
			inputParent.children().eq(0).show();
			$(this).parent().append( $('<span>').attr({'class':'icon icon icon-cogwheels16 type_1', 'id': id}) );
			$(this).remove();
			$(this).parent().children().eq(1).remove();
		}
	}
}

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
					<c:if test="${ storeInfo.storeNum != storeNum }">
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