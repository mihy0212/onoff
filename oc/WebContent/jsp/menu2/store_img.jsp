<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게 이미지 첨부</title>
</head>

<body>
<form id="frmimg" name="frmimg" action="storeInfoChange.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="choice" value="storeImgUp">
	<input type="file" id="store_img_file" name="store_img_file" size="100">
	<input type="button" onclick="check()" value="등록">
</form>
</body>

</html>