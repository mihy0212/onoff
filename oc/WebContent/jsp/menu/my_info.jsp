<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>���� �������� ���ȭ��</title>
    
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
    
        function changeForm(val){
            if(val == "-1"){
                location.href="map.jsp";
            }else if(val == "0"){
                location.href="MainForm.jsp?contentPage=member/view/ModifyFrom.jsp";
            }else if(val == "1"){
                location.href="MainForm.jsp?contentPage=member/view/DeleteForm.jsp";
            }
        }
        
    </script>
    
</head>
<body>
 
 
        <br><br>
        <b><font size="6" color="gray">�� ����</font></b>
        <br><br><br>
                        <!-- ������ ȸ�������� ����Ѵ�. -->
        <table>
           <tr>
                <td id="title">�̸���</td>
                <td>
                 "${Mail1 }"@
                 "${Mail2 }"
                </td>
            </tr>
                        
            <tr>
                <td id="title">��й�ȣ</td>
                <td>"${Password}"</td>
            </tr>
                    
            <tr>
                <td id="title">�̸�</td>
                <td>"${name }" </td>
            </tr>
                   
            <tr>
                <td id="title">�޴���ȭ</td>
                <td>"${Phone }"</td>
            </tr>
            
            <tr>
                <td id="title">�ּ�</td>
                <td>
                   "${Address }" 
                </td>
            </tr>
            
        </table>
        
        <br>
        <input type="button" value="�ڷ�" onclick="changeForm(-1)">
        <input type="button" value="ȸ������ ����" onclick="changeForm(0)">
        <input type="button" value="ȸ��Ż��" onclick="delete.do)">
</body>
</html>


