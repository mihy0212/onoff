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
var favoritePlaces;
var clusterer = new kakao.maps.MarkerClusterer({
	map : map
});
var userNum;
var userGrant;
var storeOc;
var DBSearchResult;
window.onload = function() {
	userNum = $('#userNum').val();
	userGrant = $('#userGrant').val();

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

							markerShowStart();
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

	// userNum 로그인 안 했을 시 어떻게 나오는 지 확인하고 조건문 수정
	console.log(userGrant);

	// 유저로 로그인 되있고 사장 일 시 가게 열기/닫기 버튼을 만듬
	if (userNum != "" && userGrant == "C") {
		$.ajax({
			url : 'ajaxStoreState.do',
			data : {
				user : userNum
			},
			type : 'GET',
			dataType : 'json',
			success : function(data) {

				// 데이터 어떻게 넘어오는지 보고 변수 지정
				console.log(data);

				storeButton(data);

			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		})
	}
}

function markerShowStart() {
	if (userNum != "") {
		$.ajax({
			url : 'ajaxFavoriteStore.do',
			type : 'GET',
			data : {
				userNum : userNum
			},
			dataType : 'json',
			success : function(data) {
				favoritePlaces = data;
				console.log(favoritePlaces);
				openMarkerShow();
				closeMarkerShow();
			}
		})
	} else {
		noLogInMarkerShow();
	}
}

function noLogInMarkerShow() {
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
}

function openMarkerShow() {
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

						if (userNum != "") {

							var favBoolean;

							// 즐겨찾기가 되있는지 체크
							for (var k = 0; k < favoritePlaces.length; k++) {

								console.log(i, k);

								if (openPlaces[i].storeNum == favoritePlaces[k].storeNum) {
									favBoolean = true;
									break;
								} else {
									favBoolean = false;
								}
							}

							if (favBoolean) {
								markOpenFavoritePlaces(DBPosition, i);
							} else {
								markOpenPlaces(DBPosition, i);
							}
						} else {
							markOpenPlaces(DBPosition, i);
						}
					}
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			})
}

function closeMarkerShow() {
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
						if (userNum != "") {
							var favBoolean;

							// 즐겨찾기가 되있는지 체크
							for (var k = 0; k < favoritePlaces.length; k++) {
								console.log(i, k);
								if (closePlaces[i].storeNum == favoritePlaces[k].storeNum) {
									favBoolean = true;
									break;
								} else {
									favBoolean = false;
								}
							}

							if (favBoolean) {
								markCloseFavoritePlaces(DBPosition, i);
							} else {
								markClosePlaces(DBPosition, i);
							}
						} else {
							markClosePlaces(DBPosition, i);
						}
					}
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			})
}

// 가게 상태에 따라 버튼을 만듬
function storeButton(result) {
	if (result == 0) {
		var openButton = $('	<li><a href="storeOpen.do">open</a></li>');
		$('#navbar1').prepend(openButton);
	}

	if (result == 1) {
		var closeButton = $('	<li><a href="storeClose.do">close</a></li>');
		$('#navbar1').prepend(closeButton);
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

	clusterer.addMarker(marker);

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
			window.open('storeInfo.do?storeNum=' + num);
		})

	})(marker, openPlaces[i].storeName, openPlaces[i].storeLike,
			openPlaces[i].storeCateg2, openPlaces[i].storeCateg3,
			openPlaces[i].storeTime, openPlaces[i].storeNum);
}

function markOpenFavoritePlaces(DBPosition, i) {
	var imageSrc = 'img/favoritemarker.png', imageSize = new kakao.maps.Size(
			36, 36),

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

	clusterer.addMarker(marker);

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
			window.open('storeInfo.do?storeNum=' + num);
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

	clusterer.addMarker(marker);

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
			window.open('storeInfo.do?storeNum=' + num);
		})

	})(marker, closePlaces[i].storeName, closePlaces[i].storeLike,
			closePlaces[i].storeCateg2, closePlaces[i].storeCateg3,
			closePlaces[i].storeTime, closePlaces[i].storeNum);

}

function markCloseFavoritePlaces(DBPosition, i) {
	var imageSrc = 'img/favoritemarkerclosed.png', imageSize = new kakao.maps.Size(
			36, 36),

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

	clusterer.addMarker(marker);

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
			window.open('storeInfo.do?storeNum=' + num);
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

	var content = '<div align="center" style="z-index:1;">' + name + '<br>'
			+ category2 + '<br>' + category3 + '<br>' + time
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

function enterCheck() {
	if (event.keyCode == 13) {
		searchLocation();
	}
}

function searchLocation() {

	var keyword = $('#keyword').val();
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
	clusterer.clear();

	var center = map.getCenter();

	console.log(keyword);

	ps.keywordSearch(keyword, callback, {
		category_group_code : 'FD6',
		location : center
	});

	$.ajax({
		url : 'ajaxSearch.do',
		data : {
			keyword : keyword
		},
		type : 'GET',
		dataType : 'json',
		success : function(data) {

			DBSearchResult = data;

			DBOpenMarker();
			DBCloseMarker();
		},
		error : function(xhr, status, error) {
			console.log(error);
		}
	})
}

function DBCloseMarker(){
	
}

function DBOpenMarker(){
	$.ajax({
		url : 'ajax'
	})
}

var callback = function(result, status, pagination) {
	if (status === kakao.maps.services.Status.OK) {

		displayKakao(result);

		displayPagination(pagination);

	} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

		alert('검색 결과가 존재하지 않습니다.');
		return;

	} else if (status === kakao.maps.services.Status.ERROR) {

		alert('검색 결과 중 오류가 발생했습니다.');
		return;

	}
};

var listEl;

function displayKakao(places) {
	var listEl = document.getElementById('placesList'), menuEl = document
			.getElementById('menu_wrap'), fragment = document
			.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

	// 검색 결과 목록에 추가된 항목들을 제거합니다
	removeAllChildNods(listEl);

	for (var i = 0; i < places.length; i++) {

		// 마커를 생성하고 지도에 표시합니다
		var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = searchMarker(
				placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과
		// 항목
		// Element를
		// 생성합니다

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		// LatLngBounds 객체에 좌표를 추가합니다
		bounds.extend(placePosition);

		// 마커와 검색결과 항목에 mouseover 했을때
		// 해당 장소에 인포윈도우에 장소명을 표시합니다
		// mouseout 했을 때는 인포윈도우를 닫습니다
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

			itemEl.onclick = function() {
				infowindow.close();
				displayInfowindow(marker, title);
				map.setCenter(marker.getPosition());
			};

		})(marker, places[i].place_name, places[i].place_url);

		fragment.appendChild(itemEl);
	}

	// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	listEl.appendChild(fragment);
	menuEl.scrollTop = 0;

	// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	map.setBounds(bounds);
}

function getListItem(index, places) {

	var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
			+ (index + 1)
			+ '"></span>'
			+ '<div class="info">'
			+ '   <h5>'
			+ places.place_name + '</h5>';

	itemStr += '    <span>' + places.address_name + '</span>';

	itemStr += '  <span class="tel">' + places.phone + '</span>' + '</div>';

	el.innerHTML = itemStr;
	el.className = 'item';

	return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function searchMarker(position, idx, title) {
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

	marker.setMap(map); // 지도 위에 마커를 표출합니다
	markers.push(marker); // 배열에 생성된 마커를 추가합니다

	return marker;
}

function displayPagination(pagination) {
	var paginationEl = document.getElementById('pagination'), fragment = document
			.createDocumentFragment(), i;

	// 기존에 추가된 페이지번호를 삭제합니다
	while (paginationEl.hasChildNodes()) {
		paginationEl.removeChild(paginationEl.lastChild);
	}

	for (i = 1; i <= pagination.last; i++) {
		var el = document.createElement('a');
		el.href = "#";
		el.innerHTML = i;

		if (i === pagination.current) {
			el.className = 'on';
		} else {
			el.onclick = (function(i) {
				return function() {
					pagination.gotoPage(i);
				}
			})(i);
		}

		fragment.appendChild(el);
	}
	paginationEl.appendChild(fragment);
}
function displayPagination(pagination) {
	var paginationEl = document.getElementById('pagination'), fragment = document
			.createDocumentFragment(), i;

	// 기존에 추가된 페이지번호를 삭제합니다
	while (paginationEl.hasChildNodes()) {
		paginationEl.removeChild(paginationEl.lastChild);
	}

	for (i = 1; i <= pagination.last; i++) {
		var el = document.createElement('a');
		el.href = "#";
		el.innerHTML = i;

		if (i === pagination.current) {
			el.className = 'on';
		} else {
			el.onclick = (function(i) {
				return function() {
					pagination.gotoPage(i);
				}
			})(i);
		}

		fragment.appendChild(el);
	}
	paginationEl.appendChild(fragment);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
	while (el.hasChildNodes()) {
		el.removeChild(el.lastChild);
	}
}