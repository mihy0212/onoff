<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게 이미지 첨부</title>

</head>

<body>
<form id="frmimg" name="frmimg" action="/oc/storeInfoChange.do" method="post" enctype="multipart/form-data">
	<input type="text" name="choice" value="storeImgUp">
	<input type="file" id="fileName1" name="fileName1" size="100">
	<input type="button" onclick="imgUp()"value="등록">
</form>
<script type="text/javascript">
function imgUp(){
	var con = confirm("사진을 등록하시겠습니까?");
	if(con){
		document.frmimg.submit();
	}
}
</script>
</body>

</html>