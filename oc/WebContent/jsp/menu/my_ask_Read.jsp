<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>질문읽기</title>
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

<script type="text/javascript">
$(document).ready(function() {	
	// 수정1
	$('#btn_update').on('click', function(){
		var parentDiv = $(this).parent().parent();
		var askNum = parentDiv.children().eq(0).val();
		
		// 내용
		var tr1 = parentDiv.children().eq(3).children().eq(0);
		var con1 = tr1.children().last().text();
		var con2 = con1.substring(0,con1.length-15);
	

		tr1.hide();//blockquote 숨김처리
		span_star.append( $('<textarea>').attr({'cols':'73', 'rows':'3'}).val(con2) );
		parentDiv.children().eq(3).append(span_star);
		
		//버튼 변경
		parentDiv.children().eq(4).children().eq(0).hide();
		parentDiv.children().eq(4).children().eq(1).hide();
		parentDiv.children().eq(4).append(
				$('<button>').attr({'type':'button', 'class':'btn button is-checked'}).text('변경').click(ask_update),
				$('<button>').attr({'type':'button', 'class':'btn button is-checked'}).text('취소').click(ask_up_cancle)
		);
		
	});

	
	//수정2
	function ask_update(){
		var thisbtn = $(this);
		var divParent = $(this).parent().parent();
		var askNum = divParent.children().eq(0).val();
		var tr1 = divParent.children().eq(3).children().eq(0);
		var tr2 = divParent.children().eq(3).children().eq(1);
		var askContent = tr2.children().eq(5).val();
		if(askContent == ""){
			alert("문의 내용을 입력해 주세요.");
			return false;
		}
		var con = confirm("입력한 내용으로 문의를 변경하시겠습니까?");
		if(con){
			$.ajax({
				url: "updateMyAsk.do",
				type: "post",
				data: {
					storeNum: "${list[0].askNum }",
					askNum: askNum,
					askContent: askContent
				},
				dataType: "json",
				success: function(result){
					if(result.n != 0){
						alert("문의 변경에 성공했습니다.");

						var tr3 = $('<tr>');
						var today_date = new Date().toISOString().substring(0,10);
						tr3.append( $('<p>').attr({'class':'pre_css'}).html(askContent + " &nbsp;&nbsp;&nbsp;(" + today_date + ")") );
						divParent.children().eq(3).append(tr3);
						tr1.remove();
						tr2.remove();
						
						//버튼 변경
						divParent.children().eq(4).children().eq(0).show();
						divParent.children().eq(4).children().eq(1).show();
						divParent.children().eq(4).children().eq(3).remove();
						divParent.children().eq(4).children().eq(2).remove();
						

					} else {
						alert("문의 변경에 실패했습니다.");
					}
				}
			});
		}
	}

	//수정 취소
	function ask_up_cancle(){
		var divParent = $(this).parent().parent();
		console.log(divParent);
		var tr1 = divParent.children().eq(3).children().eq(0);
		var tr2 = divParent.children().eq(3).children().eq(1);
		tr1.show();
		tr2.remove();
		divParent.children().eq(4).children().eq(0).show();
		divParent.children().eq(4).children().eq(1).show();
		divParent.children().eq(4).children().eq(2).remove();
		divParent.children().eq(4).children().eq(3).remove();
		divParent.children().eq(4).children().eq(2).remove();
	}

	
	
	
	function removeCheck() {
		/* var con = confirm("장말 삭제하시겠습니까?");
		if(con){
			
		} */
		if (confirm("정말 삭제하시겠습니까??") == true) { //확인
			document.removefrm.submit();
		} else { //취소
			return false;
		}
	}
</script>

</head>
<body>
	<form action="myAskdelecte.do?askNum=${list[0].askNum}"
		name="removefrm" method="post">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="head_title text-left sm-text-center wow fadeInDown">
						<h2>관리자 1:1문의 목록</h2>
					</div>
				</div>
				<div>
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">제목</th>
								<td  colspan="5" align="center">${list[0].askTitle }</td>
								<th width="80" style="background-color: #eeeeee; text-align: center;">답변상태</th>
								<td width="100" align="center">
										<c:choose>
											<c:when test="${list[0].askStatus=='1'}">
											<p>답변 대기 중</p>
											</c:when>
											<c:when test="${list[0].askStatus=='2'}">
											<p>답변 완료 </p>
											</c:when>
											<c:when test="${list[0].askStatus=='4'}">
											<p>답변 보류</p>
											</c:when>
										</c:choose>
										</td>
								<th width="80" style="background-color: #eeeeee; text-align: center;">작성일</th>
								<td width="100" align="center">${list[0].askDate}</td>
							</tr>
						</thead>
						<tr id="askContent">
							<th  style="background-color: #eeeeee; text-align: center;">내용</th>
							<td colspan="9" align="center">${list[0].askContent }</td>
						</tr>
					</table>
				</div>
				<br />
				<c:if test="${list[0].askStatus =='2'}">
					<div align="center">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">답변제목</th>
								<td colspan="5" width="800" align="center">${list[1].askTitle }</td>
							</tr>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">답변내용</th>
								<td colspan="5" width="800" align="center">${list[1].askContent }</td>
							</tr>
						</table>
					</div>
				</c:if>
				<br />
			<div align="center">
							<%-- <c:if test="${ list[0].askStatus=='2' || list[0].askStatus=='4'} ">  --%>
						<!-- 	<input type="button"  id="btn_update" class="btn button is-checked btn_update" style="background-color: rgb(253,220,87); color: black;" value="글수정">&nbsp;&nbsp;  -->
							<input type="button"  id="btn_delete"  value="삭제"onclick="removeCheck()"  style="background-color: rgb(253,220,87); color: black;  border-style: solid; border-color:rgb(253,220,87); border-radius: 5px; width:60pt;height:30pt;"> &nbsp;&nbsp; 
							<input type="button" value="목록으로" style="background-color: rgb(253,220,87); color: black;  border-style: solid; border-color:rgb(253,220,87); width:60pt;height:30pt; border-radius: 5px;" onclick="location.href='myAsklist.do'">
						</div>
			</div>
		</div>
	</form>

</body>
</html>