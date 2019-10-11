var map;
var currentLocation;
var markers = [];
var ps = new kakao.maps.services.Places();
var infowindow = new kakao.maps.InfoWindow({
	zIndex : 1
});
var callback;
var myLocation;
var openPlaces;
var closePlaces;
window.onload = function() {
	$
			.ajax({
				url : 'ajaxOpenStore.do',
				type : 'GET',
				dataType : 'json',
				success : function(data) {
					openPlaces = data;
					for (var i = 0; i < openPlaces.length; i++) {
						var DBxy = openPlaces[i].storeXy.split(","), DBx = DBxy[0], DBy = DBxy[1]
								.trim();
						var DBPosition = new kakao.maps.LatLng(DBx, DBy);
						markOpenPlaces(DBPosition, i);
					}
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			})

	$
			.ajax({
				url : 'ajaxCloseStore.do',
				type : 'GET',
				dataType : 'json',
				success : function(data) {
					closePlaces = data;
					for (var i = 0; i < closePlaces.length; i++) {
						var DBxy = closePlaces[i].storeXy.split(","), DBx = DBxy[0], DBy = DBxy[1]
								.trim();
						var DBPosition = new kakao.maps.LatLng(DBx, DBy);
						markClosePlaces(DBPosition, i);
					}
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			})
	if (navigator.geolocation) {
		navigator.geolocation
				.getCurrentPosition(
						function(position) {
							currentLocation = new kakao.maps.LatLng(
									position.coords.latitude,
									position.coords.longitude);
							
							var container = document.getElementById('map'), mapOption = {
								center : currentLocation,										
								level : 4
							};

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
								location : currentLocation
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

function markOpenPlaces(DBPosition, i) {
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

	(function(marker, name, like, category2, category3, time, num) {
		kakao.maps.event.addListener(marker, 'mouseover',
				function() {
					displayDBwindow(marker, name, like, category2, category3,
							time, num);
				});

		kakao.maps.event.addListener(marker, 'mouseout', function() {
			infowindow.close();
		});

		kakao.maps.event.addListener(marker, 'click', function() {
			window.open('storeInfo.do?storeNum='+num);
		})

	})(marker, openPlaces[i].storeName, openPlaces[i].storeLike,
			openPlaces[i].storeCateg2, openPlaces[i].storeCateg3,
			openPlaces[i].storeTime, openPlaces[i].storeNum);
}

function markClosePlaces(DBPosition, i) {
	var imageSrc = 'img/closemarker.png', imageSize = new kakao.maps.Size(36,
			36),

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

	(function(marker, name, like, category2, category3, time, num) {
		kakao.maps.event.addListener(marker, 'mouseover',
				function() {
					displayDBwindow(marker, name, like, category2, category3,
							time, num);
				});

		kakao.maps.event.addListener(marker, 'mouseout', function() {
			infowindow.close();
		});

		kakao.maps.event.addListener(marker, 'click', function() {
			window.open('storeInfo.do?storeNum='+num);
		})

	})(marker, closePlaces[i].storeName, closePlaces[i].storeLike,
			closePlaces[i].storeCateg2, closePlaces[i].storeCateg3,
			closePlaces[i].storeTime, closePlaces[i].storeNum);

}

function displayPlaces(places) {
	var fragment = document.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds();

	removeMarker();

	for (var i = 0; i < places.length; i++) {
		var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = addMarker(
				placePosition, i);

		bounds.extend(placePosition);

		(function(marker, title, url) {
			kakao.maps.event.addListener(marker, 'mouseover', function() {
				displayInfowindow(marker, title);
			});

			kakao.maps.event.addListener(marker, 'mouseout', function() {
				infowindow.close();
			});

			kakao.maps.event.addListener(marker, 'click', function() {
				window.open(url);
			})

		})(marker, places[i].place_name, places[i].place_url);
	}
	map.setBounds(bounds);

	map.setLevel(4);
}

function displayInfowindow(marker, title) {
	var content = '<div align="center" style="padding:5px;z-index:1;">' + title
			+ '</div>';

	infowindow.setContent(content);
	infowindow.open(map, marker);
}

function displayDBwindow(marker, name, like, category2, category3, time, num) {
	// 이동 유무 변환
	if (category2 == 02) {
		category2 = '이동';
	} else {
		category2 = '점포';
	}

	// 카테고리 변환

	if (category3 == 01) {
		category3 = '한식';
	}
	if (category3 == 02) {
		category3 = '양식';
	}
	if (category3 == 03) {
		category3 == '중식';
	}
	if (category3 == 04) {
		category3 = '일식';
	}
	if (category3 == 05) {
		category3 = '분식';
	}
	if (category3 == 06) {
		category3 = '기타';
	}

	// 시간 입력 부탁
	if (time == "") {
		time = '00:00 ~ 00:00';
	}

	var content = '<div align="center" style="z-index:1;">' + name
			+ '<br>' + category2 + '<br>' + category3 + '<br>' + time
			+ '<br><b>좋아요</b>: ' + like + '</div>';

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