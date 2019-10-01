<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>현재 유저정보 출력화면</title>
    
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
        <b><font size="6" color="gray">내 정보</font></b>
        <br><br><br>
                        <!-- 가져온 회원정보를 출력한다. -->
        <table>
           <tr>
                <td id="title">이메일</td>
                <td>
                 "${Mail1 }"@
                 "${Mail2 }"
                </td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td>"${Password}"</td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td>"${name }" </td>
            </tr>
                   
            <tr>
                <td id="title">휴대전화</td>
                <td>"${Phone }"</td>
            </tr>
            
            <tr>
                <td id="title">주소</td>
                <td>
                   "${Address }" 
                </td>
            </tr>
            
        </table>
        
        <br>
        <input type="button" value="뒤로" onclick="changeForm(-1)">
        <input type="button" value="회원정보 변경" onclick="changeForm(0)">
        <input type="button" value="회원탈퇴" onclick="delete.do)">
</body>
</html>


