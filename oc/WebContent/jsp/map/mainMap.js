var map;
var currentLocation;
var markers = [];
var ps = new kakao.maps.services.Places();
var infowindow = new kakao.maps.InfoWindow({
	zIndex : 1
});
var callback;
var myLocation;
var placesDB = [ {
	address_name : "대구 중구 수창동 95-1",
	category_group_code : "FD6",
	category_group_name : "음식점",
	category_name : "음식점 > 한식 > 육류,고기 > 불고기,두루치기",
	distance : "776",
	id : "11834053",
	phone : "",
	place_name : "태능집",
	place_url : "http://place.map.kakao.com/11834053",
	road_address_name : "대구 중구 달성로22길 88",
	x : "128.586937309682",
	y : "35.8744288590096"
}, {
	address_name : "대구 서구 원대동3가 1223-13",
	category_group_code : "FD6",
	category_group_name : "음식점",
	category_name : "음식점 > 한식 > 육류,고기",
	distance : "602",
	id : "21226094",
	phone : "053-352-5219",
	place_name : "진미식육식당",
	place_url : "http://place.map.kakao.com/21226094",
	road_address_name : "대구 서구 달서천로83길 13",
	x : "128.577802456869",
	y : "35.8832290353752"
} ]
window.onload = function() {
	if (navigator.geolocation) {
		navigator.geolocation
				.getCurrentPosition(
						function(position) {
							var container = document.getElementById('map'), mapOption = {
								center : new kakao.maps.LatLng(
										position.coords.latitude,
										position.coords.longitude),
								level : 4
							};

							currentLocation = new kakao.maps.LatLng(
									position.coords.latitude,
									position.coords.longitude);
							map = new kakao.maps.Map(container, mapOption);

							var imageSrc = 'img/mylocation.png', imageSize = new kakao.maps.Size(
									20, 20), imageOption = {
								offset : new kakao.maps.Point(0, 0)
							};

							var markerImage = new kakao.maps.MarkerImage(
									imageSrc, imageSize, imageOption);

							myLocation = new kakao.maps.Marker({
								position : currentLocation,
								image : markerImage
							});

							myLocation.setMap(map);

							var options = {
								location : new kakao.maps.LatLng(
										35.877986299999996, 128.5795303)
							}

							for (var i = 0; i < placesDB.length; i++) {
								var DBPosition = new kakao.maps.LatLng(
										placesDB[i].y, placesDB[i].x);
								markDBPlaces(DBPosition, i);
							}
							ps.categorySearch('FD6', callback, options);

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

callback = function(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		displayPlaces(result);
	}
};

function markDBPlaces(DBPosition, i) {
	var imageSrc = 'img/openmarker.png', imageSize = new kakao.maps.Size(36, 36),

	imgOptions = {
		spriteSize : new kakao.maps.Size(30, 30),
		spriteOrigin : new kakao.maps.Point(0, 0),
		offset : new kakao.maps.Point(12, 48)

	}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker(
			{
				map : map,
				position : DBPosition,
				image : markerImage
			});

}

function displayPlaces(places) {
	var fragment = document.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds();

	removeMarker();

	for (var i = 0; i < places.length; i++) {
		var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = addMarker(
				placePosition, i);

		bounds.extend(placePosition);

		(function(marker, title) {
			kakao.maps.event.addListener(marker, 'mouseover', function() {
				displayInfowindow(marker, title);
			});

			kakao.maps.event.addListener(marker, 'mouseout', function() {
				infowindow.close();
			});

		})(marker, places[i].place_name);
	}
	map.setBounds(bounds);

	map.setLevel(4);
}

function displayInfowindow(marker, title) {
	var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	infowindow.setContent(content);
	infowindow.open(map, marker);
}

function addMarker(position, idx, title) {
	var imageSrc = 'img/locations.png', imageSize = new kakao.maps.Size(36, 36),

	imgOptions = {
		spriteSize : new kakao.maps.Size(10, 10),
		spriteOrigin : new kakao.maps.Point(0, 0),
		offset : new kakao.maps.Point(3, 20)

	}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker(
			{
				position : position,
				image : markerImage
			});

	marker.setMap(map);
	markers.push(marker);

	return marker;
}

function removeMarker() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
}