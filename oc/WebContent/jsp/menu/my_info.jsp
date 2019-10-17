<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>현재 유저정보 출력화면</title>
<script type="text/javascript">

      function delect(){
    		if (confirm("정말 틸퇴하시겠습니까??") == true){ //확인
    			window.open("deletech.do","탈퇴 비밀번호 확인","width=500,height=600");
    		}else{   //취소
    		    return;
    		}
    		}
      
</script> 
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
			 	<label for="user_email">아이디</label> ${UserDTO.userEmail}
		</div>
       <div class="form-group">
					<label for="userNum">이름</label> 
					${UserDTO.userName}
				</div>

				<div class="form-group">
					<label>닉네임</label> 
						${UserDTO.userNick}
				</div>
				
				<div class="form-group">
					<label>주소</label>
						${UserDTO.userAddr}
				</div>
				
				<%-- <c:if test="${ !empty userEmail && UserDTO.userGrant != 'U' && UserDTO.userGrant != 'S' }"> --%>
				<div class="form-group">
					<%-- <label>신청상태</label>${list.addStatus} --%>
				</div>
        <div class="form-group text-center">
        <input type="button" class="btn btn-primary" value="회원정보 변경" onclick="location.href='myinfoupForm.do'">
        <input type="button" class="btn btn-primary" value="회원탈퇴" onclick="delect()">
		</div>
		</form>
		</div>
	</article>
</body>
</html>


