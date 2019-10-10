/*var search = $('#keyword').text();

$('#search').on('submit', function() {
	if ($.trim($('#keyword').val()) == "null") {
		alert("키워드를 입력하세요");
	} else {
		return true;
	}
})*/

function checkForm(){
	if ($.trim($('#keyword').val()) == "") {
		alert("키워드를 입력하세요");
		return false;
	} else {
		return true;
	}
}