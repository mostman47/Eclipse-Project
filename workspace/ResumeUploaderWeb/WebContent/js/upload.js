/**
 * @author nam phan
 * @company Reliable{coders}
 */
// The root URL for the RESTful services
var webServiceRootURL = sessionStorage.getItem("webServiceRootURL");

// Variable to store your files
var files;

// Add events
$('input[type=file]').on('change', prepareUpload);

// Grab the files and set them to our variable
function prepareUpload(event) {
	files = event.target.files;
}

// submit form
$('#uploadForm').submit(function(e) {// check validation?
	e.preventDefault();
	// submit via ajax
	addResume();
	return false;
});

function addResume() {
	$('html, body').css("cursor", "wait");
	$('#resultSpan').empty();
	$.ajax({
		type : 'POST',
		contentType : 'application/json',
		url : webServiceRootURL + "/addResume",
		dataType : "json",
		data : formToJSON(),
		success : function(data, textStatus, jqXHR) {
			//alert('Resume created successfully');
			//
			var dt = new FormData();
			dt.append("file", files[0]);
			dt.append("fileName",data.res_URL);
			//
			uploadFile(dt);
			//
			$("#uploadForm")[0].reset();
			$("#resultSpan").html('Resume created successfully');
			$("#firstName").focus();
			$('html, body').animate({
				scrollTop : 0
			}, 'slow');
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('addResume error: ' + textStatus + " " + errorThrown);
		}
	});
	$('html, body').css("cursor", "auto");
}

function uploadFile(data) {
	$.ajax({// upload file
		url : 'uploadFile',
		data : data,
		cache : false,
		contentType : false,
		processData : false,
		type : 'POST',
		success : function(data) {
			//alert("File uploaded successfully");
		},
	error:  function(jqXHR, textStatus, errorThrown){
		alert('Upload file error: ' + textStatus + " " + errorThrown);
	}
	});
}
function formToJSON() {
	return JSON.stringify({
		"firstName" : $('#firstName').val(),
		"lastName" : $('#lastName').val(),
		"email" : $('#email').val(),
		"phone" : $('#phone').val(),
		"skills" : $('#skills').val(),
		"description" : $('#description').val(),
		"res_URL" : $('#res_URL').val(),
	});
}
