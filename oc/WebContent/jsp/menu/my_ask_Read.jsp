<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문읽기</title>
</head>
<body>
<form action="myAskRead.dao">
	<div align="center">
		<div>
			<h1>글 내용 보기</h1>
		</div>
		<div>
			<table border="1">
				<tr>
					<th width="100">번호</th>
					<td width="100" align="center">${list.askNum }</td>
					<th width="350">제목</th>
					<td width="100" align="center">${list.askTitle }</td>
					<th width="100">내용</th>
					<td width="100" align="center">${list.askNum }</td>
					<th width="200">상태</th>
					<td width="100" align="center">${list.askContent }</td>
					<th width="80">작성일</th>
					<td width="100" align="center">${list.askDate }</td>
				<tr>
				
			</table>
	</div><br />
	

	
	<c:if test="${id == list.bId }">
	<input type="button" onclick="location.href='borderUpdateForm.do?key=${list.askNum}'" value="글수정"> &nbsp;&nbsp;
	<input type="button" onclick="location.href='borderDelete.do?key=${list.askNum}'" value= "글삭제"> &nbsp;&nbsp;
	
	</c:if>

	<button type="button" onclick="location.href='borderList.do'">목록으로</button></div>
	</form>


</body>
</html>