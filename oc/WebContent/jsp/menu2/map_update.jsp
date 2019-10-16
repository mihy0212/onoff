<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게 주소 변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e415eb9e7187154cd9c6308c036f0a6&libraries=services,clusterer"></script>
<script>

window.onload = function(){
	var opner_addr = opener.document.getElementById("new_addr").value;
	var opner_xy = opener.document.getElementById("addr_xy").value;
	var addr = document.getElementById('storeAddr').value = opner_addr;
	var xy = document.getElementById('storeXy').value = opner_xy;
}
function opener_insert(){
	
	opener.document.getElementById("new_addr").value = document.getElementById('storeAddr').value;
	opener.document.getElementById("addr_xy").value = document.getElementById('storeXy').value;
	//console.log(opener.document.getElementById("new_addr").value)
	
	window.close();
}

</script>
<style>
.inputxt{
	width:100%;
	
}
</style>
</head>
<body>

<input type="text" class="inputxt storeXy" name="storeXy" id="storeXy" value="" readonly>
<input type="text" class="inputxt storeAddr" placeholder="주소" id="storeAddr" name="storeAddr" readonly>
<div id="map" style="width:100%;height:350px;"></div>
<input type="button" class="btn btn-primary" onclick="opener_insert()" value="확인">


<script>
var xy;
var addr;
var geo = new kakao.maps.services.Geocoder();

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng("${param.x}", "${param.y}"), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var xy = document.getElementById('storeXy');
    xy.value = latlng.getLat()+", "+latlng.getLng();
    
    geo.coord2Address(latlng.getLng(), latlng.getLat(), callAddr);
});

var callAddr = function(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		var addr = document.getElementById('storeAddr');
		addr.value = result[0].address.address_name;
	}
};

</script>
</body>
</html>