var places;

$(function() {
	$.ajax({
		url : 'openStore.do',
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