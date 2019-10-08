var map;
var currentLocation;
window.onload = function() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			var container = document.getElementById('map'), mapOption = {
				center : new kakao.maps.LatLng(position.coords.latitude,
						position.coords.longitude),
				level : 4
			};

			currentLocation = new kakao.maps.LatLng(position.coords.latitude,
					position.coords.longitude);
			map = new kakao.maps.Map(container, mapOption);

			var search = $('#search');
			search.addEventListener("keydown", function(e) {
				if (e.keyCode === 13) {
					searchKakao();
				}
			})

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

var markers = [];
var ps = new kakao.maps.services.Places();
var infowindow = new kakao.maps.InfoWindow({
	zIndex : 1
});

function searchKakao() {
	var keyword = $('#search').text();
	console.log(keyword);
	if (!keyword.replace(/^\s+|\s+$/g, '')) {
		alert('키워드를 입력해주세요!')
		return false;
	}

	var options = {
		category_group_code : "FD6",
		location : map.getCenter()
	}

	ps.keywordSearch(keyword, placesSearchCB, options);
}

function placesSearchCB(data, status) {
	if (status === kakao.maps.services.Status.OK) {
		console.log(data);
		displayPlaces(data);
		displayPagination(pagination);
	} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		alert('검색 결과가 존재하지 않습니다.');
		return;
	} else if (status === kakao.maps.services.Status.ERROR) {
		alert('검색 결과 중 오류가 발생했습니다.');
		return;
	}
}

function displayPlaces(places) {
	var listEl = document.getElementById('placesList'), menuEl = document
			.getElementById('menu_wrap'), fragment = document
			.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

	removeAllChildNods(listEl);

	removeMarker();

	for (var i = 0; i < places.length; i++) {
		var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = addMarker(
				placePosition, i), itemEl = getListItem(i, places[i]);

		bounds.extend(placePosition);

		(function(marker, title, url) {
			kakao.maps.event.addListener(marker, 'click', function() {
				infowindow.close();
				displayInfowindow(marker, title, url);
			});

			itemEl.onclick = function() {
				infowindow.close();
				displayInfowindow(marker, title, url);
			};
		})(marker, places[i].place_name, places[i].place_url);

		fragment.appendChild(itemEl);
	}
	listEl.appendChild(fragment);
	menuEl.scrollTop = 0;

	map.setBounds(bounds);
}

function getListItem(index, places) {
	var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
			+ (index + 1)
			+ '"></span>'
			+ '<div class="info">'
			+ '     <h5>'
			+ places.place_name + '</h5>';
	if (places.road_address_name) {
		itemStr += '      <span>' + places.road_address_name + '</span>'
				+ '   <span class="jibun gray">' + places.address_name
				+ '</span>';
	} else {
		itemStr += '<span>' + places.address_name + '</span>';
	}

	itemStr += '<span class="tel">' + places.phone + '</span>' + '</div>';

	el.innerHTML = itemStr;
	el.className = 'item';

	return el;
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
		el.href = '#';
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

function displayInfowindow(marker, title, url) {
	var content = '<div style="padding:5px;z-index:1;"><a href="' + url + '">'
			+ title + '</a></div>';

	infowindow.setContent(content);
	infowindow.open(map, marker);
}

function removeAllChildNods(el) {
	while (el.hasChildNodes()) {
		el.removeChild(el.lastChild);
	}
}

function addMarker(position, idx, title) {
	var imageSrc = 'img/locations.png', imageSize = new kakao.maps.Size(36, 36),

	imgOptions = {
		spriteSize : new kakao.maps.Size(10, 10),
		spriteOrigin : new kakao.maps.Point(0, 0),
		offset : new kakao.maps.Point(3, 10)

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