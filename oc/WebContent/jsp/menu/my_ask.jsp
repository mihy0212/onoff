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
		
			<div class="col-md-4">
				<div class="head_title text-left sm-text-center wow fadeInDown">
					<h2>질문</h2>
				</div>
			</div>
<div align="center">
			<table >
			
			<tr>
					<th width="100">제 목</th>
					<td ><input type="text" id="askTitle" name="askTitle" size="150"></td>
					<th width="100">작성일자</th>
					<td width="200"><input type="date" id="askDate" name="askDate" readonly="readonly"></td>
					
				</tr>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<tr>
					<th width="100" >내 용</th>
					<td colspan="4"><textarea cols="185" rows="10" id="askContent" name="askContent"></textarea></td>
				</tr>
				
				<tr align="center">
					<td>&nbsp;</td>
					<td colspan="2"><input type=button value="등록" onclick="replyCheck();">
					<input type="reset" value="취소"></td>
				</tr>
			</table>
		</div>
	</form>
	<br><br><br>
	<!--  ---------------------목록 보기-------------------------------->
	<div align="center">
	<form action="myAskWrite.do">
		<table class=" table table-striped" >
			<tr>
			<td width="50" align="center">#</td>
				<td width="100" align="center">제목</td>
				<td width="350" align="center">내용</td>
				<td width="80" align="center">작성일</td>
				<td width="80" align="center">상태</td>
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
				<c:if test="${dto.askNum == dto.askRe }">  <!--딥글은  askNum이랑 askRe다름  -->
				<tr onclick="location.href='myAskRead.do?key=${dto.askNum}'">
					<td align="center">${dto.askNum }</td>
					<td align="center">${dto.askTitle }</td>
					<td align="center">${dto.askContent }</td>
					<td align="center">${dto.askDate }</td>
					<td align="center">${dto.askStatus }</td>
				</tr>
				</c:if>
			</c:forEach>
			<!-- db 목록을 가져와서 뿌려주는 곳끝 -->

		</table>
	</form>
	
	<!-- 페이징 -->
	 	<div class="col-sm-6" align="center">
				<div align="center">
					<ul class="pagination" id="page_num">
						<li>
						<c:forEach var="i" begin="1" end="${tot}" >
						 <a href="myAsklist.do?Page_num=${i}">${i}</a>
						</c:forEach>
						</li>
					</ul>
				</div>
		</div>
	</div>

	<script>
		  	document.getElementById('askDate').value = new Date().toISOString().substring(0, 10);
		</script>
		
</body>
</html>