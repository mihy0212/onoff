<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>현재 유저정보 출력화면</title>
    
   
    
    
</head>
<body>
 <article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>나의 정보</h3>
			</div>

		</div>
        <div class="col-sm-6 col-md-offset-3">
			<form action="userberjoinpro.do" method="post" role="form"
				id="usercheck" name="userber">
                        <!-- 가져온 회원정보를 출력한다. -->
        	<div class="form-group">
			 	<label for="user_email">아이디</label> 
				${userEmail}
		</div>
       <div class="form-group">
					<label for="userNum">이름</label> 
					${userDto.userName}
				</div>

				<div class="form-group">
					<label for="user_birth">닉네임</label> 
						${userDto.userNick}
				
				</div>
				<div class="form-group">
					<label for="user_birth">주소</label>
						${userDto.userAddr}
				</div>
       
        <div class="form-group text-center">
        <input type="button" class="btn btn-primary" value="회원정보 변경" onclick="location.href='myinfoupForm.do'">
        <input type="button" class="btn btn-primary" value="회원탈퇴" onclick="location.href='delete.do'">
		</div>
		</form>
		</div>
	</article>
</body>
</html>


