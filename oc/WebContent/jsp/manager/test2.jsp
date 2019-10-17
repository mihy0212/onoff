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
<style>
.movebtn{
	border:0;
	padding: 3px;
	background-color: gray;
	border-radius: 8px;
	color: yellow;
}
.movebtn:hover{
	border:0;
	padding: 3px;
	background-color: #F2F2F2;
	border-radius: 8px;
	color: #886A08;
}
</style>
</head>
<body>
	<br />
	<br />
	<br />
	<h1 align="center">문의</h1>
	<br /><br />
	<form name="frm" id="frm" method="post" action='borderdelete.do'>
		<div class="container">
			<div class="row">
				<table class="table table-striped table-bordered" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th width="10" style="background-color: #eeeeee; text-align: center;">답변</th>
							<th width="10" style="background-color: #eeeeee; text-align: center;">문의번호</th>
							<th width="200" style="background-color: #eeeeee; text-align: center;">문의제목</th>
							<th width="20" style="background-color: #eeeeee; text-align: center;">처리상태</th>
							<th width="80" style="background-color: #eeeeee; text-align: center;">문의등록일</th>
							<th width="10" style="background-color: #eeeeee; text-align: center;">문의글로 이동</th>
							<th width="10" style="background-color: #eeeeee; text-align: center;">선택</th>
						</tr>
						<!-- db 목록을 가져와서 뿌려주는 곳 -->
						<c:if test="${list.isEmpty()}">
							<tr>
								<td colspan="5">등록된 글이 존재하지 않습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${list }" var="dto">
							<tr>
								<td><c:choose>
										<c:when test="${dto.askRe==dto.askNum}">
											<p><font color="red" style="font-weight: bold;">문의</font></p>
										</c:when>
										<c:otherwise>
											<p><font color="#045FB4" style="font-weight: bold;">답변</font></p>
										</c:otherwise>
									</c:choose></td>
									<td align="center">${dto.askNum }</td>
								<td align="center">${dto.askTitle }</td>
								<td align="center"><c:choose>
										<c:when test="${dto.askStatus=='1'}">
											<p><font color="red">답변 대기 중</font></p>
										</c:when>
										<c:when test="${dto.askStatus=='2'}">
											<p><font color="#045FB4">답변 완료</font></p>
										</c:when>
										<c:when test="${dto.askStatus=='3'}">
											<p><font color="#04B404">답변 글</font></p>
										</c:when>
										<c:when test="${dto.askStatus=='4'}">
											<p>답변 보류</p>
										</c:when>
									</c:choose></td>
								<td align="center">${dto.askDate }</td>
								<td>
									<c:if test="${dto.askRe==dto.askNum}">
										<input type="button" class="movebtn" onclick="location.href='borderRead.do?key=${dto.askNum}'" value="이동">											
									</c:if>
								</td>
								<td align="center"><input type="checkbox" name="askNum" value="${dto.askNum}"></td>
							</tr>
						</c:forEach>
						<!-- db 목록을 가져와서 뿌려주는 곳 -->
				</table>
				<a><button type='button' class="btn btn-primary pull-right">삭제하기</button></a> <br>
				<!-- 	<a href="borderdelete.do" class="btn btn-primary pull-right">삭제하기</a> -->
			</div>
		</div>
	</form>
	<br><br><br>
</body>
</html>