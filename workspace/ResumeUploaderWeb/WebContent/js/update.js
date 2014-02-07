var rootURL = "http://localhost:8080/ResumeUploaderWeb/rest/Web";
$('#pagerDelete').click(function() {
	var data = sessionStorage.getItem("localData");
	data = JSON.parse(data);
	//alert(data[0].res_id);
	data = ["angel", "clown", "mandarin", "surgeon"];
	alert(data.length);
	var remove = data.splice(1, 2);
	alert(JSON.stringify(remove));
	alert(data.length);
	renderList(remove,0,true);
	//
//	var deleteListJson = new Array();
//	$("input[id='selectCheckBox']:checked").each(function() {
//		var element = {
//			'res_id' : $(this).val()
//		};
//		deleteListJson.push(element);
//	});
//	//
//	if (deleteListJson.length > 0) {
//		$('html, body').css("cursor", "wait");
//		sendDeleteRequest(deleteListJson);
//		$('html, body').css("cursor", "auto");
//	}
});
function sendDeleteRequest(deleteListJson) {
	$.ajax({
		type : 'POST',
		contentType : 'application/json',
		url : rootURL + "/deleteResumes",
		dataType : "json",
		data : JSON.stringify(deleteListJson),
		success : function(data, textStatus, jqXHR) {
			alert("delete all");
			$('html, body').animate({
				scrollTop : 0
			}, 'slow');
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('addResume error: ' + textStatus + " " + errorThrown);
		}
	});
}
function formToJSON() {
	return JSON.stringify([ {
		"res_id" : "10"
	}, {
		"res_id" : "9"
	} ]);
}