<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkForm(){
		var form = document.frm;
		if(form.id.value==""){
			alert("아이디를 입력하세요.")
			form.id.focus();
			return false;
		}
		if(form.pw.value==""){
			alert("패스워드를 입력하세요.")
			form.pw.focus();
			return false;
		}
		if(form.name.value==""){
			alert("이름을 입력하세요.")
			form.name.focus();
			return false;
		
		}
		if(form.pnum.value==""){
		alert("전화번호를 입력하세요.")
		form.name.focus();
		return false;
		}

		form.submit();
	}
</script>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<div align="center">
	<div><h1>회 원 가 입</h1></div>
	<div>
		<form id="frm" name="frm" action="loginform.jsp" method="post">
			<div>
			<table border="1">
				<tr>
					<th width="100">아이디</th>
					<td><input type="text" id="id" name="id" size=30></td>
					
				</tr>
				<tr>
					<th width="100">패스워드</th>
					<td><input type="text" id="pw" name="pw" size=30></td>
				</tr>
				<tr>
					<th width="100">이름</th>
					<td><input type="text" id="name" name="name" size=30></td>
				</tr>
				<tr>
					<th width="100">전화번호</th>
					<td><input type="text" id="pnum" name="pnum" size=30></td>
				</tr>
								<tr>
					<th width="100">닉네임</th>
					<td><input type="text" id="nickname" name="nickname" size=30></td>
				</tr>
			</table>
			</div><p>
			<div>
				<input type="button" onclick="checkForm()" value="등록">&nbsp;&nbsp;&nbsp;
				<input type="button" onclick="location.href='insertchoice.jsp'" value="취소">
			</div>
		</form>
	</div>
</div><p>
</body>
</html>