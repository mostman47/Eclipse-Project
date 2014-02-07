/**
 * @author nam phan
 * @company Reliable{coders}
 */
// The root URL for the RESTful services
var rootURL = "http://localhost:8080/ResumeUploaderWeb/rest/Web";

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
		url : rootURL + "/addResume",
		dataType : "json",
		data : formToJSON(),
		success : function(data, textStatus, jqXHR) {
			alert('Resume created successfully');
			var data = new FormData();
			data.append("file", files[0]);
			//
			uploadFile(data);
			//
			$("#uploadForm")[0].reset();
			$("#resultSpan").html('Resume created successfully');
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
		url : 'controller/uploadFile.jsp',
		data : data,
		cache : false,
		contentType : false,
		processData : false,
		type : 'POST',
		success : function(data) {
			// alert(data);
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
