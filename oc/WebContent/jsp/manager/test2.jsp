<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br /><br /><br />
<h1 align="center">문의</h1><br />
	<form action='borderdelete.do'>
<div class="container">
	<div class="row">
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
	<thead>
		<tr>
			<th style="background-color : #eeeeee; text-align:center;">선택</th>
			<th style="background-color : #eeeeee; text-align:center;">문의번호</th>
			<th style="background-color : #eeeeee; text-align:center;">답변번호</th>
			<th style="background-color : #eeeeee; text-align:center;">문의제목</th>
			<th style="background-color : #eeeeee; text-align:center;">문의내용</th>		
			<th style="background-color : #eeeeee; text-align:center;">처리상태</th>
			<th style="background-color : #eeeeee; text-align:center;">문의등록일</th>
		</tr>
	<!-- db 목록을 가져와서 뿌려주는 곳 -->
			<c:if test="${list.isEmpty()}">
			<tr>
				<td colspan="5"> 등록된 글이 존재하지 않습니다. </td>
			</tr>
			</c:if>
			<c:forEach items="${list }" var="dto">
			<tr >
				<td align="center" width="20"><input type="checkbox"></td>
				<td align="center" width="20">${dto.askNum } </td>
				<td width="20"><c:choose>
											<c:when test="${dto.askRe==dto.askNum}">
											<p>문의</p>
											</c:when>
											<c:when test="${dto.askRe=!dto.askNum}'">
											<p>답변</p>
											</c:when>
										</c:choose></td> 
				<td align="center" width="100">${dto.askTitle }  </td>
				<td align="center" width="100">${dto.askContent }  </td>
				<td align="center" width="20"> 
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
										</c:choose></td>
				<td align="center" width="100">${dto.askDate }</td>
			</tr>
			</c:forEach>
			<!-- db 목록을 가져와서 뿌려주는 곳 -->
	</table> 
	<a><button type='submit' class="btn btn-primary pull-right">
						삭제하기</button></a> <br>
<!-- 	<a href="borderdelete.do" class="btn btn-primary pull-right">삭제하기</a> -->
	</div>
</div>
</form>
</body>
</html>