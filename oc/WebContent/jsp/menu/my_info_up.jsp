<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <%-- <%
        String id = session.getAttribute("sessionID").toString();
        MemberDAO dao = MemberDAO.getInstance();
        MemberDTO memberDTO = dao.getUserInfo(id);
    %> --%>
 
    <title>ȸ������ ����ȭ��</title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
    
    <script type="text/javascript">
    
 
        function setComboValue(val) 
        {
            var selectMail = document.getElementById('userEmail'); // select ���̵� �����´�.
            for (i = 0, j = selectMail.length; i < j; i++)  // select �ϴ� option ����ŭ �ݺ��� ������.
            {
                if (selectMail.options[i].value == val)  // �ԷµȰ��� option�� value�� ������ ��
                {
                    selectMail.options[i].selected = true; // ��������� üũ�ǵ��� �Ѵ�.
                    break;
                }
            }
        }
        
        // ��й�ȣ �Է¿��� üũ
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
        }
        
    </script>
    
    
    
    
</head>
<body onload="init()">
  <div align="center">
        <br><br>
        <b><font size="6" color="gray">ȸ������ ����</font></b>
        <br><br><br>
       
        <!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
        <!-- ��(�Ķ����) ������ POST ��� -->
        <form method="post" action="MainForm.jsp?contentPage=member/pro/ModifyPro.jsp" 
                name="userInfo" onsubmit="return checkValue()">
                
            <table>
               <tr>
                    <td id="title">���̵�</td>
                    <td>
                        <input type="text" name="mail1" maxlength="50" 
                            value="${Mail }" readonly="readonly">
                        
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">��й�ȣ</td>
                    <td>
                        <input type="password" name="password" maxlength="50" 
                            value="${Password}">
                    </td>
                </tr>
            </table>
                
            <br><br> 
               
            <table>
 
               <tr>
                <td id="title">�̸�</td>
                <td>"${name }" </td>
           	  </tr>
                      
                <tr>
                    <td id="title">�޴���ȭ</td>
                    <td>
                        <input type="text" name="phone" value="${Phone }"/>
                    </td>
                </tr>
                
                <tr>
                    <td id="title">�ּ�</td>
                    <td>
                        <input type="text" size="50" name="address"
                            value= "${Address }" />
                    </td>
                </tr>
                
            </table>
            <br><br>
            <input type="button" value="���" onclick="location.href='my_info.jsp">
            <input type="submit" value="����"/>  
             <input type="submit" value="Ż��" onclick="location.href='DeleteForm.jsp" /> 
        </form>
        </div>
</body>
</html>


