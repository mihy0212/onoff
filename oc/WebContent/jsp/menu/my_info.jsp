<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>���� �������� ���ȭ��</title>
    
   
    
    
</head>
<body>
 <article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>���� ����</h3>
			</div>

		</div>
        <div class="col-sm-6 col-md-offset-3">
			<form action="userberjoinpro.do" method="post" role="form"
				id="usercheck" name="userber">
                        <!-- ������ ȸ�������� ����Ѵ�. -->
        	<div class="form-group">
			 	<label for="user_email">���̵�</label> 
				${userEmail}
		</div>
       <div class="form-group">
					<label for="userNum">�̸�</label> 
					${userDto.userName}
				</div>

				<div class="form-group">
					<label for="user_birth">�г���</label> 
						${userDto.userNick}
				
				</div>
				<div class="form-group">
					<label for="user_birth">�ּ�</label>
						${userDto.userAddr}
				</div>
       
        <div class="form-group text-center">
        <input type="button" class="btn btn-primary" value="ȸ������ ����" onclick="location.href='myinfoupForm.do'">
        <input type="button" class="btn btn-primary" value="ȸ��Ż��" onclick="location.href='delete.do'">
		</div>
		</form>
		</div>
	</article>
</body>
</html>


