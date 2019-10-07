<%-- 
	Review 게시판 
	작성자 : 배창현
	작성일 : 2015.11.30
--%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
	//파라미터 한글처리
	request.setCharacterEncoding("utf-8");

	int tot = 0;
	// Null값일때 형변환 하면 에러가나니.. 체크
	if (request.getAttribute("tot") != null) {

		tot = (Integer) request.getAttribute("tot");

	}
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<%-- jQuery CDN --%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<%-- BootStrap CDN --%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>



</head>
<body>
	<div align="center">
		<div>
		
		</div>


		<div>
			<table class=" table table-striped table-bordered results">
				<thead>
					<tr>
						<th width="80" class="col-md-1 col-xs-1">번호</th>
						<th width="100" class="col-md-1 col-xs-1">제목</th>
						<th width="100" class="col-md-1 col-xs-1">내용</th>
						<th width="100" class="col-md-1 col-xs-1">상태</th>
						<th width="100" class="col-md-1 col-xs-1">일자</th>
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
				<c:forEach items="${list }" var="dto">
					<tr onclick="location.href='myAsklist.dao?key=${list.askNum }'">
						<th scope="row" align="center">${list.askTitle  }</th>
						<td align="center">${dto.askContent }</td>
						<td align="center">${dto.askStatus }</td>
						<td align="center">${dto.askDate }</td>
					</tr>
				</c:forEach>
				<!-- db 목록을 가져와서 뿌려주는 곳끝 -->
			</table>
		</div>
	</div>
</body>
</html>