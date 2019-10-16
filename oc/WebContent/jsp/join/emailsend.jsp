<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.mail.*" %>
    <%@ page import="java.util.Properties" %>
        <%@ page import="co.oc.dao.UserDAO" %>
     <%@ page import="co.oc.dto.UserDTO" %>
     <%@ page import= "co.oc.command.join.SHA256" %>
     <%@ page import= "java.io.PrintWriter" %>
     <%
     UserDAO userDAO = new UserDAO();
     String userEmail = null;
     if(session.getAttribute("userEmail") != null) {
    	 userEmail = (String) session.getAttribute("userEmail");
     }
     boolean emailChecked = userDAO.getUserEmailChecked(userEmail);
     if(emailChecked == true){
    	 PrintWriter script = response.getWriter();
    	 script.println("<script>");
    	 script.println("alert('이미 인증 된 회원 입니다.');");
    	 script.println("location.href='login.do'");
    	 script.println("</script>");
    	 script.close();
    	 return;
     }
     String host = "http://localhost/oc/index.jsp";
     String from = "yedam8246@gmail.com";
     String to = userDAO.getUserEmail(userEmail);
     String subject = "회원가입을 위한 이메일 인증입니다.";
     String content = "다음 링크에 접속하여 이메일 인증을 진행하세요";
     "<a href='" + host "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";

     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>