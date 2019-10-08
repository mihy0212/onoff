<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>
<script type="text/javascript">
	function replyCheck() {
		var form = document.replyform;
		if (!form.askTitle.value) {
			alert("제목을 적어주세요");
			form.askTitle.focus();
			return;
		}
		if (!form.askContent.value) {
			alert("내용을 적어주세요");
			form.askContent.focus();
			return;
		}
		form.submit();
	}
</script>
<title>게시판</title>
</head>
<body>
	<!--  ---------------------목록 쓰기-------------------------------->
	<form name=replyform method=post action="myAskWrite.do">
		<div align="center">
			<div class="col-md-4">
				<div class="head_title text-left sm-text-center wow fadeInDown">
					<h2>질문</h2>
					${userNum }
				</div>
			</div>

			<table>
				<tr>
				<td>&nbsp;</td>
					<th align="center">제목</th>
					<td><input name="askTitle" size="150" maxlength="80"></td>
					<td>&nbsp;</td>
					<th width="100">작성일자</th>
					<td width="200"><input type="date" id="askDate" name="askDate"></td>
				</tr>
				
			</table>
			<br>
			<table>
				<tr>
					<th>&nbsp;</th>
					<th align="center">내용</th>
					<!--(rows값)줄, cols는  (cols값)자  -->
					<td><textarea name="askContent" cols="200" rows="10"></textarea></td>
				</tr>
				
				<tr align="center">
					<td>&nbsp;</td>
					<td colspan="2"><input type=button value="등록" onclick="replyCheck();"> 
						<input type="reset" value="취소">
						&nbsp;&nbsp;&nbsp;
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
	</form>
	<!--  ---------------------목록 보기-------------------------------->
	<div>
	<form action="myAskWrite.do">
		<table class=" table table-striped">
			<tr>
				<th width="100">제목</th>
				<th width="350">내용</th>
				<th width="80">작성일</th>
				<th width="200">상태</th>
			</tr>


			<!-- db 목록을 가져와서 뿌려주는 곳 -->
			<!-- db에 목록이 이없으면 -->
			<c:if test="${list.isEmpty()}">
				<tr>
					<td colspan="5">등록된 글이 존재하지 않습니다.</td>
				</tr>
			</c:if>

			<!--목록이 있으면  -->
			<c:forEach items="${list }" var="dto">
				<tr onclick="location.href='myAskRead.do?key=${dto.askTitle  }'">
					<td align="center">${dto.askTitle }</td>
					<td align="center">${dto.askContent }</td>
					<td align="center">${dto.askDate }</td>
					<td align="center">${dto.askStatus }</td>
				</tr>
			</c:forEach>
			<!-- db 목록을 가져와서 뿌려주는 곳끝 -->

		</table>
	</form>
	</div>

	<script>
		  	document.getElementById('askDate').value = new Date().toISOString().substring(0, 10);
		</script>
		
</body>
</html>