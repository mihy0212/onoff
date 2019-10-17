<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		$('.pull-right').on('click', function(){
			var con = confirm("선택한 문의글을 삭제하시겠습니까?");
			if(con){
				document.frm.submit();
			} else{
				return false;
			}
			
		})
	});
	$(document).ready(function() {
	    //라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
	    $('input[type="checkbox"][name="userNum"]').click(function(){
	        //클릭 이벤트 발생한 요소가 체크 상태인 경우
	        if ($(this).prop('checked')) {
	            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
	            $('input[type="checkbox"][name="userNum"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	    });
	});

</script>
</head>
<body>
	<br />
	<br />
	<br />
	<h1 align="center">문의</h1>
	<br />
	<form name="frm" id="frm" action='borderdelete.do'>
		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">답변</th>
							<th style="background-color: #eeeeee; text-align: center;">문의번호</th>
							<th style="background-color: #eeeeee; text-align: center;">문의제목</th>
							<th style="background-color: #eeeeee; text-align: center;">처리상태</th>
							<th style="background-color: #eeeeee; text-align: center;">문의등록일</th>
							<th style="background-color: #eeeeee; text-align: center;">선택</th>
						</tr>
						<!-- db 목록을 가져와서 뿌려주는 곳 -->
						<c:if test="${list.isEmpty()}">
							<tr>
								<td colspan="5">등록된 글이 존재하지 않습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${list }" var="dto">
							<tr>
								
								<td width="20"><c:choose>
										<c:when test="${dto.askRe==dto.askNum}">
											<p>문의</p>
										</c:when>
										<c:when test="${dto.askRe=!dto.askNum}'">
											<p>답변</p>
										</c:when>
									</c:choose></td>
									<td align="center" width="20">${dto.askNum }</td>
								<td align="center" width="100">${dto.askTitle }</td>
								<td align="center" width="20"><c:choose>
										<c:when test="${dto.askStatus=='1'}">
											<p>답변 대기 중</p>
										</c:when>
										<c:when test="${dto.askStatus=='2'}">
											<p>답변 완료</p>
										</c:when>
										<c:when test="${dto.askStatus=='3'}">
											<p>답변 글</p>
										</c:when>
										<c:when test="${dto.askStatus=='4'}">
											<p>답변 보류</p>
										</c:when>
									</c:choose></td>
								<td align="center" width="100">${dto.askDate }</td>
								<td align="center" width="20"><input type="checkbox" name="askNum" value="${dto.askNum}"></td>
							</tr>
						</c:forEach>
						<!-- db 목록을 가져와서 뿌려주는 곳 -->
				</table>
				<a><button type='button' class="btn btn-primary pull-right">
						삭제하기</button></a> <br>
				<!-- 	<a href="borderdelete.do" class="btn btn-primary pull-right">삭제하기</a> -->
			</div>
		</div>
	</form>
</body>
</html>