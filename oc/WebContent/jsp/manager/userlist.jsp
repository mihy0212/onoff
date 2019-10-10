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
<h1 align="center">유저 리스트</h1><br />
<div class="container">
	<div class="row">
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
	<thead>
		<tr>
			<th style="background-color : #eeeeee; text-align:center;">선택</th>
			<th style="background-color : #eeeeee; text-align:center;">유저번호</th>
			<th style="background-color : #eeeeee; text-align:center;">유저이메일</th>
			<th style="background-color : #eeeeee; text-align:center;">유저이름</th>
			<th style="background-color : #eeeeee; text-align:center;">유저닉네임</th>		
			<th style="background-color : #eeeeee; text-align:center;">유저주소</th>
			<th style="background-color : #eeeeee; text-align:center;">유저 가입일</th>
		</tr>
	<!-- db 목록을 가져와서 뿌려주는 곳 -->
			<c:if test="${list.isEmpty()}">
			<tr>
				<td colspan="5"> 등록된 글이 존재하지 않습니다. </td>
			</tr>
			</c:if>
			<c:forEach items="${userlist }" var="dto">
			<tr onclick="location.href='userRead.do?key=${dto.userNum}'">
				<td align="center" width="20"><input type="checkbox" value="${dto.userNum}"/></td>
				<td align="center" width="20">${dto.userNum } </td>
				<td width="20">&nbsp;&nbsp;${dto.userEmail}  </td>
				<td align="center" width="100">${dto.userName }  </td>
				<td align="center" width="100">${dto.userNick }  </td>
				<td align="center" width="20">${dto.userAddr }  </td>
				<td align="center" width="100">${dto.userInday }</td>
			</tr>
			</c:forEach>
			<!-- db 목록을 가져와서 뿌려주는 곳 -->
	</table> 
	<a href="userdelete.do" class="btn btn-primary pull-right">삭제하기</a>
	</div>
</div>
</body>
</html>