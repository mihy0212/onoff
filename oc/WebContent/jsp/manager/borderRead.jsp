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
	
	<div class="container">
	<div class="main-portfolio roomy-80">
	<div class="head_title text-left sm-text wow fadeInDown">
		<h2><strong>회원의 문의</strong></h2>
	</div>
	</div>
	</div>
	
	<c:forEach items="${ list }" var="alist">
		<c:if test="${ alist.askNum == alist.askRe }">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<th width="100" style="background-color : #eeeeee; text-align:center;">문의 번호</th>	
					<td width="300" align="center">${alist.askNum}</td>
					<th width="100" style="background-color : #eeeeee; text-align:center;">문의 날짜</th>	
					<td width="300" align="center">${alist.askDate} </td>
					<th width="100" style="background-color : #eeeeee; text-align:center;">처리 상태</th>
					<td width="300" align="center">${alist.askStatus }</td>
				</tr>
				<tr>
					<th style="background-color : #eeeeee; text-align:center;">회원</th>		
					<td align="center">${alist.userName } &nbsp;&nbsp;(회원 번호: ${ alist.userNum })</td>
					<th style="background-color : #eeeeee; text-align:center;">가게</th>
					<td align="center" colspan="3">
						<c:choose>
							<c:when test="${ !empty alist.userName && empty alist.storeName }">없음</c:when>
							<c:otherwise>${alist.storeName} &nbsp;&nbsp;(${ alist.storeNum })</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th style="background-color : #eeeeee; text-align:center;">문의 제목</th>
					<td colspan="5" align="center">${alist.askTitle }</td>
				</tr>
				<tr>
					<th style="background-color : #eeeeee; text-align:center;">문의 내용</th>
					<td colspan="5" align="left"><pre>${alist.askContent }</pre></td>
				</tr>
				<tr>
					<th style="background-color : #eeeeee; text-align:center;">처리 상태</th>
					<td colspan="5" align="center">${alist.askStatus }</td>
				</tr>
			</table>
		</c:if>
	</c:forEach>
	
	<div class="container">
	<div class="main-portfolio roomy-80">
	<div class="head_title text-left sm-text wow fadeInDown">
		<h2><strong>관리자의 답변</strong></h2>
	</div>
	</div>
	</div>
	
	<c:forEach items="${ list }" var="blist">
		<c:if test="${ blist.askNum != blist.askRe }">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<th width="30" style="background-color : #eeeeee; text-align:center;">답변 날짜</th>	
					<th width="100" align="center">${blist.askDate} </th>
				</tr>
				<tr>
					<th width="30" style="background-color : #eeeeee; text-align:center;">답변 제목</th>
					<td align="center">${blist.askTitle }</td>
				</tr>
				<tr>
					<th width="30" style="background-color : #eeeeee; text-align:center;">답변 내용</th>
					<td align="center"><pre>${blist.askContent }</pre></td>
				</tr>
			</table>
		</c:if>
	</c:forEach>
	
	
	<!-- <a href="delete.do" class="btn btn-primary pull-right">삭제하기</a> -->
	<a href="writeForm.do" class="btn btn-primary pull-right">답변하기</a>
	
	
		</div>
		</div>
		
</body>
</html>