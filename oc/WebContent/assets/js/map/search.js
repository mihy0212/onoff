var currentLocation;
var map;

$(function() {
	getLocation();

})

function getLocation() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			currentLocation = new kakao.maps.LatLng(position.coords.latitude,
					position.coords.longitude);
			showMap();
		}, function(error) {
			console.error(error);
		}, {
			enableHighAccuracy : false,
			maximumAge : 0,
			timeout : Infinity
		});
	} else {
		alert('GPS를 지원하지 않습니다');
	}
}

function showMap() {
	var container = document.getElementById('map'), mapOption = {
		center : currentLocation,
		level : 4
	};

	
	map = new kakao.maps.Map(container, mapOption);

	var imageSrc = 'img/mylocationEdit.png', imageSize = new kakao.maps.Size(
			70, 70), imageOption = {
		offset : new kakao.maps.Point(0, 0)
	};

	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
			imageOption);

	myLocation = new kakao.maps.Marker({
		position : currentLocation,
		image : markerImage
	});

	myLocation.setMap(map);
	
	searchKakao();
}

function searchKakao(){
	
}

function searchLocation(){
	
}