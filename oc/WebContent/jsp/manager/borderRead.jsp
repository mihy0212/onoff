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
<br /><br />
<h1 align="center">문의 내용 보기</h1><br />
<div class="container">
	<div class="row">
	
	<c:forEach items="${ list }" var="list">
		<c:choose>
		<c:when test="${ list.askNum == list.askRe }">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color : #eeeeee; text-align:center;">문의번호</th>	
				<th width="100" align="center">${list.askNum}</th>
				<th style="background-color : #eeeeee; text-align:center;">답변번호</th>		
				<th width="100" align="center">${list.askRe}</th>
				<th style="background-color : #eeeeee; text-align:center;">문의날짜</th>	
				<th width="100" align="center">${list.askDate} </th>
				
			</tr>
			</thead>
			<tr>
				<th style="background-color : #eeeeee; text-align:center;">문의제목</th>
				<td colspan="5" align="center">${list.askTitle }</td>
			</tr>
			<tr>
				<th style="background-color : #eeeeee; text-align:center;">문의내용</th>
				<td colspan="5" align="center">${list.askContent }</td>
			</tr>
		</table>
		</c:when>
		<c:otherwise>
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th width="30" style="background-color : #eeeeee; text-align:center;">답변날짜</th>	
				<th width="100" align="center">${list.askDate} </th>
			</tr>
			</thead>
			<tr>
				<th width="30" style="background-color : #eeeeee; text-align:center;">답변제목</th>
				<td align="center">${list.askTitle }</td>
			</tr>
			<tr>
				<th width="30" style="background-color : #eeeeee; text-align:center;">답변내용</th>
				<td align="center">${list.askContent }</td>
			</tr>
		</table>
		</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<!-- <a href="delete.do" class="btn btn-primary pull-right">삭제하기</a> -->
	<a href="writeForm.do" class="btn btn-primary pull-right">답변하기</a>
	
	
		</div>
		</div>
		
</body>
</html>