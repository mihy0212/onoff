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
					<th width="50">상태</th>
					<td width="100" align="center">${list[0].askStatus }</td>
					<th width="50">작성일</th>
					<td width="100" align="center">${list[0].askDate }</td>
				</tr>
				<tr>	
					<th width="100">제목</th>
					<td  colspan="5" width="100" align="center">${list[0].askTitle }</td>
				</tr>
				<tr>
					<th width="100" height="200">내용</th>
					<td colspan="5"  width="800" align="center">${list[0].askContent }</td>	
				<tr>
				
			</table>
	</div><br />
	
	<div>
			<table border="1">
				<tr>
					
					<th width="100" height="200">답변</th>
					<td colspan="5"  width="800" align="center">${list[1].askContent }</td>	
				<tr>
				
			</table>
	</div><br />
	

	
	<input type="button" value="글수정"> &nbsp;&nbsp;
	<input type="button" onclick="location.href='myAskdelecte.do'" value= "글삭제"> &nbsp;&nbsp;
	

	<button type="button" onclick="location.href='myAsklist.do'">목록으로</button>
	</div>
	</form>


</body>
</html>