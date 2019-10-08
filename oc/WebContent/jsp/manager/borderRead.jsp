<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
	<thead>
		<tr>
			<th style="background-color : #eeeeee; text-align:center;">문의번호</th>	
			<th width="100" align="center">${dto.askNum}</th>
			<th style="background-color : #eeeeee; text-align:center;">답변번호</th>		
			<th width="100" align="center">${dto.askRe}</th>
			<th style="background-color : #eeeeee; text-align:center;">문의날짜</th>	
			<th width="100" align="center">${dto.askDate} </th>
			
		</tr>
		</thead>
		<tr>
				<th style="background-color : #eeeeee; text-align:center;">문의제목</th>
				<td colspan="5" align="center">${dto.askTitle }</td>
			</tr>
			<tr>
				<th style="background-color : #eeeeee; text-align:center;">문의내용</th>
				<td colspan="5" align="center">${dto.askContent }</td>
			</tr>
		</table>
	<a href="delete.do" class="btn btn-primary pull-right">삭제하기</a>
	<a href="writeForm.do" class="btn btn-primary pull-right">답변하기</a>
		</div>
		</div>
		
</body>
</html>