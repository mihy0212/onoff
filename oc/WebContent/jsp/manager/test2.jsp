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
<div class="container">
	<div class="row">
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
	<thead>
		<tr>
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
			<tr onclick="location.href='borderRead.do?key=${dto.askNum}'">
				<td align="center" width="20"><input type="checkbox">${dto.askNum } </td>
				<td width="20">&nbsp;&nbsp;${dto.askRe}  </td>
				<td align="center" width="100">${dto.askTitle }  </td>
				<td align="center" width="100">${dto.askContent }  </td>
				<td align="center" width="20">${dto.askStatus }  </td>
				<td align="center" width="100">${dto.askDate }</td>
			</tr>
			</c:forEach>
			<!-- db 목록을 가져와서 뿌려주는 곳 -->
	</table> 
	<a href="delete.do" class="btn btn-primary pull-right">삭제하기</a>
	</div>
</div>
</body>
</html>