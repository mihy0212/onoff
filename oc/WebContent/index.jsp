<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e415eb9e7187154cd9c6308c036f0a6&libraries=services,clusterer"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="assets/js/map/mainMap.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/map/placeList.css">
<style>
#map {
	width: 100%;
	height: 780px;
	margin-top: 0px;
}
</style>
</head>
<body>
	<div align="center">
		<div class="map_wrap">
			<div id="map" style="position: relative; overflow: hidden;"></div>

			<div id="menu_wrap" class="bg_white">
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
		</div>
	</div>
</body>
</html>