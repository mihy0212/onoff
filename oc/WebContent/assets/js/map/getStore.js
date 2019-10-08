var places;

$(function() {
	$.ajax({
		url : 'map.do',
		type : 'GET',
		dataType : 'json',
		success : function(data) {
			places=data;
			for (var i = 0; i < data.length; i++) {
				console.log(data[i].userNum);
			}
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	})
})