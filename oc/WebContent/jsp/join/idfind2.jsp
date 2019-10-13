<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script>
 function gohome() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./home.jsp"; //넘어간화면
  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
 }

 function gojoin() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./join.jsp"; //넘어간화면
  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
 }

 function gologin() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./login.jsp";
  frm.submit();
 }

 function goidfind() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./id_find.jsp";
  frm.submit();
 }

 function gopwfind() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./pw_find.jsp";
  frm.submit();
 }
 function logout() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./logoutCtl.jsp";
  frm.submit();
 }
 function id_search1() { //이름,핸드폰으로 '찾기' 버튼

  var frm = document.idfindscreen;

  if (frm.name.value.length < 1) {
   alert("이름을 입력해주세요");
   return;
  }

  if (frm.phone1.value.length<2 || frm.phone1.value.length>4) {
   alert("핸드폰번호를 정확하게 입력해주세요");
   return;
  }
  if (frm.phone2.value.length<2 || frm.phone2.value.length>4) {
   alert("핸드폰번호를 정확하게 입력해주세요");
   return;
  }

  frm.method = "post";
  frm.action = "./id_searchCtl.jsp"; //넘어간화면
  frm.submit();  }

​

 function id_search2() { //이름,이메일로 '찾기' 버튼

  var frm = document.idfindscreen;

  if (frm.name2.value.length < 1) {
   alert("이름을 입력해주세요");
   return;
  }
  if (frm.email.value.length < 1 || frm.e_domain.value.length < 1) {
   alert("이메일을 입력해주세요");
   return;
  }

  frm.method = "post";
  frm.action = "./id_searchCtl2.jsp"; //넘어간화면
  frm.submit();  }

​

 //이메일 부분

 function checkid() {

  var frm = document.idfindscreen;

  var regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/';

  if (!regExp.test(frm.email.value)) {

   alert('올바른 email을 입력해주세요.');

   frm.email.focus();

  }

 }

 function domainCheck() {

  var frm = document.idfindscreen;

  if (frm.domain.value == 0) {
   frm.e_domain.value = "";
   frm.e_domain.disabled = false;

  } else {
   frm.e_domain.value = frm.domain.value;
   frm.e_domain.disabled = true;

  }

 }
</script>
<title>아이디 찾기</title>
</head>
<body>
<br /><br /><br /><br />
<div class="container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
<div class="jumbotron" style="padding-top: 20px;">
<form method="post"  name="idfindscreen" action="login.do">
	<h3 style="text-align: center;">아이디 찾기</h3><p>
	<div class="form-group">
          <td>
           <table width="380px" height="70px" align="center" border="0"
            style="font-size: 16px;">
            <tr>
             <td>이름</td>
             <td><input type="text" name="name2"></td>
            </tr>
            <tr>
             <td style="text-align: center;">e-mail&nbsp;</td>
             <td><input type="text" name="email"
              style="width: 80px" onblur="checkid()"> @ <input
              type="text" name="e_domain" style="width: 80px"> <select
              name="domain" onchange="domainCheck();">
               <option value="0" selected="selected">직접입력</option>
               <option value="naver.com">naver.com</option>
               <option value="hanmail.net">hanmail.net</option>
               <option value="nate.com">nate.com</option>
               <option value="yahoo.com">yahoo.com</option>
             </select></td>
            </tr>
           </table>
          </td>
          </tr>

          <tr>
           <td>
            <table width="140px" height="10px" border="0"
             style="margin-top: 2%" align="center">
             <tr>
              <td><input type="button" name="enter2" value="  찾기  "
               align="center"
               style="cursor: pointer; background: white; color: black; border-color: black;"
               onClick="id_search2()"></td>
              <td><input type="button" name="cancle2"
               value="  취소  " align="center"
               style="cursor: pointer; background: white; color: black; border-color: black"
               onClick="cancle()"></td>
             </tr>
            </table>
         
           </td>
          </tr>


</form>
</div>
</div>
<div class="col-lg-4"></div>
</div>

</body>
</html>