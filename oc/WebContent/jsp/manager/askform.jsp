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
<h1 align="center">문의 답변하기</h1><br />
<div class="container">
	<div class="row">
	
<div align="center">

		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<c:forEach items="${list }" var="dto">
			<tr>
				<th width="100" style="background-color : #eeeeee; text-align:center;">답변번호</th>	
				<th width="100" align="center">${list.askNum} </th>
			</tr>
			</thead>
			<tr>
				<th width="30" style="background-color : #eeeeee; text-align:center;">답변제목</th>
				<td align="center"><input type="text" class="form-control" placeholder="제목"
								id="title" name="title" maxlength="20"></td>
			</tr>
			<tr>
				<th width="30" style="background-color : #eeeeee; text-align:center;">답변내용</th>
				<td rowspan="4" align="center"><textarea cols="150" rows="10"
								id="Content" name="Content"></textarea></td>
			</tr>
			</c:forEach>	
		</table>
		
		<a href="answer.do" class="btn btn-primary pull-right">답변등록하기</a>
 </div>
 </div>
 </div>
</body> 
</html>