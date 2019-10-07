<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function(e){
		$('#secession').click(function(){
			//패스워드 입력 확인
			if($('#passwd').val() == ''){
				alert("패스워드를 입력해 주세요.");
				$('#passwd').focus();
				return;
			}
			
			//패스워드 맞는지 확인
			$.ajax({
				url: ".do",
				type: "POST",
				data: $('#delFrm').serializeArray(),
				success: function(data){
					if(data==0){
						alert("패스워드가 틀렸습니다.");
						return;
					}else{
						//탈퇴
						var result = confirm('정말 탈퇴 하시겠습니까?');
						if(result){
							$('#delFrm').submit();
						}
					}
				},
				error: function(){
					alert("서버 에러.");
				}
			});
		});
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원탈퇴</h1>
	<hr />
	<form action="secessionProc.do" name="delFrm" id="delFrm" method="post">
	<div align="center">
		<input type="hidden" name="userId" value="${userEmail}">
		<table border=1>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="passwd" id="passwd"></td>
			</tr>
			</table>
				<input id="secession" onclick="location.href='delete.do'" value="탈퇴">
					<input id="secession" onclick="location.href='myinfo.do'" value="취소">
		</div>
	</form>
	<hr>
</body>


</html>