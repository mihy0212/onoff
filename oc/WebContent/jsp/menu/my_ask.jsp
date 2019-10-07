<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>
<script type="text/javascript">
	function replyCheck() {
		var form = document.replyform;
		if (!form.title.value) {
			alert("제목을 적어주세요");
			form.title.focus();
			return;
		}
		if (!form.memo.value) {
			alert("내용을 적어주세요");
			form.memo.focus();
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
				</div>
			</div>

			<table>
				<tr>
					<td>&nbsp;</td>
					<td align="center">제목</td>
					<td><input name="title" size="200" maxlength="100"></td>
					<td>&nbsp;</td>
				</tr>
			</table>
			<br>
			<table>
				<tr>
					<td>&nbsp;</td>
					<td align="center">내용</td>
					<!--(rows값)줄, cols는  (cols값)자  -->
					<td><textarea name="memo" cols="200" rows="10"></textarea></td>
					<td>&nbsp;</td>
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
		<table class=" table table-striped">
			<tr>
				<th width="100">번호</th>
				<th width="350">제목</th>
				<th width="100">내용</th>
				<th width="200">상태</th>
				<th width="80">작성일</th>
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
				<tr onclick="location.href='myAskRead.do?key=${list.askNum }'">
					<td align="center">${list.askTitle }</td>
					<td>&nbsp;&nbsp;${list.askNum }</td>
					<td align="center">${list.askContent }</td>
					<td align="center">${list.askStatus }</td>
					<td align="center">${list.askDate }</td>
				</tr>
			</c:forEach>
			<!-- db 목록을 가져와서 뿌려주는 곳끝 -->

		</table>
		<hr />
	</div>


	</form>
</body>
</html>