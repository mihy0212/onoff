<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css"><!--Theme custom css -->

<script type="text/javascript">
	$(document).ready(function(){
		
		if($('#ask_status').text() == '1'){
			$('#ask_status').text("<font color='red'>답변 대기 중</font>");
		} else if($('#ask_status').text() == '2'){
			$('#ask_status').html("<font color='blue'>답변 완료</font>");
		}
		
		$('#replydo').on('click', function(){
			$('#reply_hidden').attr('class','replyfrm');
		});
		
		$('#submitbtn').on('click', function(){
			var askRe = $('#askRe_num').text();
			$('#askRe1').val(askRe);
			console.log($('#askRe1').val())
			var con = confirm("답변을 등록하시겠습니까?");
			if(con){
				document.refrm.submit();
			} else {
				return false;
			}
		});
		
		$('#canclebtn').on('click', function(){
			$('#reply_hidden').attr('class','reply hidden');
			$('#re_title').val("");
			$('#re_content').val("");
			
		});
		
		$('#asklist').on('click', function(){
			location.href='list.do';
		});
		
	});

</script>

</head>
<body>
<br /><br />
<h1 align="center">문의 내용 보기</h1><br />
<div class="container">
	<div class="row">
	


	<div class="head_title text-left sm-text wow fadeInDown">
		<h2><strong>회원의 문의</strong></h2>
	</div>
	
	<c:forEach items="${ list }" var="alist">
		<c:if test="${ alist.askNum == alist.askRe }">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<th width="100" style="background-color : #eeeeee; text-align:center;">문의 번호</th>	
					<td width="300" align="center" id="askRe_num">${alist.askNum}</td>
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
					<td colspan="5" align="center" id="ask_status">${alist.askStatus }</td>
				</tr>
			</table>
		</c:if>
	</c:forEach>
	
	<input type="button" class="btn btn-default pull-right" id="replydo" value="답변하기">
	<input type="button" class="btn btn-default pull-right" id="asklist" value="목록으로">
	
	<c:forEach items="${ list }" var="blist">
		<c:if test="${ blist.askNum != blist.askRe }">
		
			<div class="head_title text-left sm-text wow fadeInDown">
				<h2><strong>관리자의 답변</strong></h2>
			</div>
			
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<th width="100" style="background-color : #eeeeee; text-align:center;">답변 날짜</th>	
					<th align="center">${blist.askDate} </th>
				</tr>
				<tr>
					<th style="background-color : #eeeeee; text-align:center;">답변 제목</th>
					<td align="center">${blist.askTitle }</td>
				</tr>
				<tr>
					<th style="background-color : #eeeeee; text-align:center;">답변 내용</th>
					<td align="center"><pre>${blist.askContent }</pre></td>
				</tr>
			</table>
		</c:if>
	</c:forEach>
	
	<div class="hidden" id="reply_hidden">
		<form name="refrm" id="refrm" method="post" action="answer.do">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<th width="100" style="background-color : #eeeeee; text-align:center;">답변 제목</th>
				<td align="center"><input type="text" size="130" id="reTitle" name="reTitle"></td>
			</tr>
			<tr>
				<th style="background-color : #eeeeee; text-align:center;">답변 내용</th>
				<td align="center"><textarea id="reContent" name="reContent" cols="130" rows="20"></textarea>
			</tr>
		</table>
		<input type="hidden" name="askRe1" id="askRe1">
		<input type="hidden" name="userNum" id="userNum" value="${ userNum }">
		<input type="button" class="btn btn-default pull-right" id="submitbtn" value="확인"> &nbsp;&nbsp;&nbsp;
		<input type="button" class="btn btn-default pull-right" id="canclebtn" value="취소">
	</form>
	</div>
</div>
</div>
		
</body>
</html>