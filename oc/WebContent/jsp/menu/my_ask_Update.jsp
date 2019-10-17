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


function upCheck() {
	
	if (confirm("정말 수정하시겠습니까??") == true) { //확인
		document.upfrm.submit();
	} else { //취소
		return false;
	}
}

	
</script>

</head>
<body>
	<form action="myAskupdate.do?askNum=${list[0].askNum}"name="upfrm" method="post">
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
								<td  colspan="5" align="center">${{list[0].askTitle }</td>
								<th width="80" style="background-color: #eeeeee; text-align: center;">작성일</th>
								<td width="100" align="center">${{list[0].askDate}</td>
							</tr>
						</thead>
						<tr id="askContent">
							<th  style="background-color: #eeeeee; text-align: center;">내용</th>
							<td colspan="9" align="center">${list[0].askContent }</td>
						</tr>
					</table>
				</div>
				<br />
			<div align="center">
							<input type="button"  id="btn_delete"  value="변경" onclick="upCheck()" style="background-color: rgb(253,220,87); color: black;  border-style: solid; border-color:rgb(253,220,87); width:55pt;height:25pt; border-radius: 5px;">
							<input type="reset" value="취소" style="background-color: rgb(253,220,87); color: black;  border-style: solid; border-color:rgb(253,220,87); width:55pt;height:25pt; border-radius: 5px;" onclick="location.href='myAsklist.do'">
			</div>
			</div>
		</div>
	</form>

</body>
</html>