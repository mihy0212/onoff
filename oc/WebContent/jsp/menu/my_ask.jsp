<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>
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


	function replyCheck() {
		var form = document.replyform;
		if (!form.askTitle.value) {
			alert("제목을 적어주세요");
			form.askTitle.focus();
			return;
		}
		if (!form.askContent.value) {
			alert("내용을 적어주세요");
			form.askContent.focus();
			return;
		}
		form.submit();
	}
	

</script>


<title>게시판</title>
</head>
<body>
	<!--  ---------------------질문 쓰기-------------------------------->
	<div class="container">
		<div class="row">
	<form name=replyform method=post action="myAskWrite.do">
		<div class="main-portfolio roomy-80">

			<div class="col-md-4">
				<div class="head_title text-left sm-text-center wow fadeInDown">
					<h2>관리자 1:1문의 목록</h2>
				</div>
			</div>
			<div align="center">
				<table>
					<tr>
						<th width="80">제 목</th>
						<td><input type="text" id="askTitle" name="askTitle" size="100"></td>
						<th width="80">작성일자</th>
						<td width="150"><input type="date" id="askDate" name="askDate" readonly="readonly"></td>

					</tr>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<tr>
						<th width="80">내 용</th>
						<td colspan="4"><textarea cols="130" rows="10"
								id="askContent" name="askContent"></textarea></td>
					</tr>
					<tr align="center">
						<td>&nbsp;</td>
						<td colspan="2">
						<input type="button"class="btn button is-checked btn_update" value="등록"onclick="replyCheck();"> 
						<input type="reset" class="btn button is-checked btn_update" value="취소"></td>
					</tr>

				</table>
			</div>
		</div>
	</form>
	</div>
	</div>
	
	<!--  ---------------------목록 보기-------------------------------->
	<div class="container">
		<div class="row">
		<div class="col-md-4">
				<div class="head_title text-left sm-text-center wow fadeInDown">
					<h2>관리자 1:1문의 목록</h2>
				</div>
			</div>
			<div align="center">
				<div class="main-portfolio roomy-80">
					<div class="col-md-4">
				
			</div>
						<table class=" table table-striped table-bordered results">
							<tr>
								<th width="50" align="center">#</th>
								<th width="100" align="center">제목</th>
								<th width="350" align="center">내용</th>
								<th width="80" align="center">작성일</th>
								<th width="80" align="center">상태</th>
							</tr>


							<!-- db 목록을 가져와서 뿌려주는 곳 -->
							<!-- db에 목록이 이없으면 -->
							<c:if test="${list.isEmpty()}">
								<tr>
									<td colspan="5">등록된 글이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<!--목록이 있으면  -->
							<c:forEach items="${list }" var="dto">
								<c:if test="${dto.askNum == dto.askRe }">
									<!--딥글은  askNum이랑 askRe다름  -->
									<tr onclick="location.href='myAskRead.do?askNum=${dto.askNum}'">
										<td align="center">${dto.askNum }</td>
										<td align="center">${dto.askTitle }</td>
										<td align="center">${dto.askContent }</td>
										<td align="center">${dto.askDate }</td>
										<td>
										<c:choose>
											<c:when test="${dto.askStatus=='1'}">
											<p>답변 대기 중</p>
											</c:when>
											<c:when test="${dto.askStatus=='2'}">
											<p>답변 완료 </p>
											</c:when>
											<c:when test="${dto.askStatus=='4'}">
											<p>답변 보류</p>
											</c:when>
										</c:choose>
										</td>
									</tr>
								</c:if>
							</c:forEach>
							<!-- db 목록을 가져와서 뿌려주는 곳끝 -->

						</table>
				
						
						
						
						
<!-- 페이징 -->
			<div class="col-sm-6" align="center">
				<div align="center">
					<ul class="pagination" id="page_num">
						<li><c:forEach var="i" begin="1" end="${tot}">
								<a href="myAsklist.do?Page_num=${i}">${i}</a>
							</c:forEach></li>
					</ul>
				</div>
			</div>

				</div>
			</div>
		</div>
	</div>
	
	
	
	<script>
		document.getElementById('askDate').value = new Date().toISOString()
				.substring(0, 10);
	</script>


<%-- 	<!-- JS includes -->

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
	<script src="${pageContext.request.contextPath }/assets/js/main.js"></script> --%>



</body>
</html>
