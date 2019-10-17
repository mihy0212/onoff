<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br />
	<br />
	<br />
	<h1 align="center">유저 리스트</h1>
	<br />
	<form action='userdelete.do'>
		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">선택</th>
							<th style="background-color: #eeeeee; text-align: center;">유저번호</th>
							<th style="background-color: #eeeeee; text-align: center;">유저이메일</th>
							<th style="background-color: #eeeeee; text-align: center;">유저이름</th>
							<th style="background-color: #eeeeee; text-align: center;">유저닉네임</th>
							<th style="background-color: #eeeeee; text-align: center;">유저주소</th>
							<th style="background-color: #eeeeee; text-align: center;">유저
								가입일</th>
						</tr>
						<!-- db 목록을 가져와서 뿌려주는 곳 -->
						<c:if test="${list.isEmpty()}">
							<tr>
								<td colspan="5">등록된 글이 존재하지 않습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${userlist }" var="dto">

							<tr>
								<td align="center" width="20"><input id='userNum'
									name='userNum' type="checkbox" value="${dto.userNum}" /></td>
								<td align="center" width="20">${dto.userNum }</td>
								<td width="20">&nbsp;&nbsp;${dto.userEmail}</td>
								<td align="center" width="100">${dto.userName }</td>
								<td align="center" width="100">${dto.userNick }</td>
								<td align="center" width="20">${dto.userAddr }</td>
								<td align="center" width="100">${dto.userInday }</td>

							</tr>

						</c:forEach>
						<!-- db 목록을 가져와서 뿌려주는 곳 -->
				</table>
				<a><button type='submit' class="btn btn-primary pull-right">
						삭제하기</button></a> <br>
			</div>
		</div>
	</form>

</body>
</html>