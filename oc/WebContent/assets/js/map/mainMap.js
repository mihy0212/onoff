var map;
var currentLocation;
var markers = [];
var ps = new kakao.maps.services.Places();
var infowindow = new kakao.maps.InfoWindow({
	zIndex : 1
});
var callback;
var myLocation;
var placesDB;

window.onload = function() {
	$.ajax({
		url : 'map.do',
		type : 'GET',
		dataType : 'json',
		success : function(data) {
			placesDB = data;
			for (var i = 0; i < placesDB.length; i++) {
				var DBxy = placesDB[i].storeXy.split(","), DBx = DBxy[0], DBy = DBxy[1]
						.trim();
				var DBPosition = new kakao.maps.LatLng(DBx, DBy);
				markDBPlaces(DBPosition, i);
			}
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	})
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

							var imageSrc = 'img/mylocationEdit.png', imageSize = new kakao.maps.Size(
									70, 70), imageOption = {
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
		spriteSize : new kakao.maps.Size(35, 35),
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