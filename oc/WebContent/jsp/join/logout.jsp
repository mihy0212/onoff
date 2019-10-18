<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function delect() {
		if (confirm("정말 로그아웃하시겠습니까??") == true) { //확인
			onclick = "location.href='delectMyReiview.do?key=${alist.reviewNum}'"
		} else { //취소
			return;
		}
	}
</script>
</head>
<body>

	<div align="center">
		<h1>정상적으로 로그아웃 되었습니다.</h1>
	</div>

</body>
</html>