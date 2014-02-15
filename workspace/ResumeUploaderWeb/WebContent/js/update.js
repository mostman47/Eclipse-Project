/**
 * @author nam phan
 * @company Reliable{coders}
 */
var webServiceRootURL = sessionStorage.getItem("webServiceRootURL");
//
var files;

//Add events
$('input[type=file]').on('change', prepareUpload);

//Grab the files and set them to our variable
function prepareUpload(event) {
	files = event.target.files;
}
//
$(document).on('click', 'tbody tr', function(e) {
	$("tr[class=success]").removeClass("success");
	$("tr[class=active]").removeClass("active");
	$(this).addClass("active");
	$("#res_URL").hide();

	searchResumeByID($(this).attr('id'));
});
$('#deleteSingleBt').click(function() {
	// $('#myModal').hide();
});
$('#zoomURL').click(
		function() {
//			var url = "http://docs.google.com/gview?url=";
//			url +=webServiceRootURL + "/getResumeURL:" + $("#save").val()+",show";
//			url+="&embedded=true";
			window.open(webServiceRootURL + "/getResumeURL:" + $("#save").val()+",show",'_blank' ,'resume file',
					'window settings');
			return false;
		});
$('#saveURL').click(
		function() {
			// alert("click");
			window.open(webServiceRootURL + "/getResumeURL:" + $("#save").val()+",download",'resume file');
			return false; // this is critical to stop the click event which
							// will trigger a normal file download!
		});
$('#newURL').click(function() {
	$("#res_URL").show();
	$("#res_URL").prop("disabled", false);
	return false; // this is critical to stop the click event which will
					// trigger a normal file download!
});
$('#editBt').click(function() {
	var editStatus = sessionStorage.getItem("isEditing") + "";
	if (editStatus == "false" || editStatus == null) {
		sessionStorage.setItem("isEditing", true);
		changeEditStatus($(this), true);

	}
});
$('#pagerDelete').click(function() {
	// collect selected items
	var deleteListJson = new Array();
	$("input[id='selectCheckBox']:checked").each(function() {
		var element = {
			'res_id' : $(this).val()
		};
		deleteListJson.push(element);
	});
	// check how many existing item
	if (deleteListJson.length > 0) {
		$('html, body').css("cursor", "wait");
		sendDeleteRequest(deleteListJson);
		$('html, body').css("cursor", "auto");
	}
});
$('#updateForm').submit(function(e) {

	e.preventDefault();
	// submit via ajax
	$('html, body').css("cursor", "wait");
	updateResume();
	$('html, body').css("cursor", "auto");
	return false;
});
//
function updateResume() {
	// alert(formToJSON());
	$.ajax({
		type : 'POST',
		contentType : 'application/json',
		url : webServiceRootURL + "/UpdateResume",
		dataType : "json",
		data : formToJSON(),
		success : function(data, textStatus, jqXHR) {
			if ($("#res_URL").is(":visible")) {//save new file
				var dt = new FormData();
				dt.append("file", files[0]);
				dt.append("fileName",data.res_URL);
				//
				$('#res_URL_text').html(data.res_URL);
				//
				uploadFile(dt);
				$("#res_URL").hide();
			}
			alert('Resume updated successfully');
			sessionStorage.setItem("isEditing", false);
			changeEditStatus($('#editBt'), false);
			refreshTableAfterUpdate(data);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('Update Resume error: ' + textStatus + " " + errorThrown);
		}
	});
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
			// alert(data);
		}
	});
}
function refreshTableAfterUpdate(element) {
	$('tr[id=' + element.res_id + ']')
			.each(
					function() {
						var result = "<td id = \"index\">"
								+ $('tr[id=' + element.res_id+ '] td[id=\'index\']').html()
								+ "</td>"
								+ "<td>"
								+ shorten(element.firstName,10)
								+ "</td>"
								+ "<td>"
								+ shorten(element.lastName,10)
								+ "</td>"
								+ "<td>"
								+ shorten(element.email,5)
								+ "</td>"
								+ "<td>"
								+ shorten(element.skills,5)
								+ "</td><td>"
								+ shorten(element.description,5) + "</td>"
//								+ "<td><input type=\"checkbox\" id=\"selectCheckBox\" value=\""
//								+ element.res_id + "\"></td>"
								;
						$(this).html(result);
						$(this).removeClass("active");
						$(this).addClass("success");
					});
}
function changeEditStatus(button, editing) {

	if (editing) {
		button.prop('disabled', true);
		button.html('Editing...');
		$("#firstName").prop('disabled', false);
		$("#lastName").prop('disabled', false);
		$("#email").prop('disabled', false);
		$("#phone").prop('disabled', false);
		$("#skills").prop('disabled', false);
		$("#description").prop('disabled', false);
		$("#res_URL").prop('disabled', true);
		$("#save").prop('disabled', false);
		//
		$("#zoomURL").addClass("disabled");
		$("#saveURL").addClass("disabled");
		$("#newURL").removeClass("disabled");
	} else {
		button.prop('disabled', false);
		button.html('Edit');
		//
		$("#firstName").prop('disabled', true);
		$("#lastName").prop('disabled', true);
		$("#email").prop('disabled', true);
		$("#phone").prop('disabled', true);
		$("#skills").prop('disabled', true);
		$("#description").prop('disabled', true);
		$("#res_URL").prop('disabled', true);
		$("#save").prop('disabled', true);
		//
		$("#zoomURL").removeClass("disabled");
		$("#saveURL").removeClass("disabled");
		$("#newURL").addClass("disabled");
	}
}
function searchResumeByID(searchKey) {
	$.ajax({
		type : "GET",
		url : webServiceRootURL + "/SearchByID:" + searchKey,
		dataType : "json",
		cache : false,
		success : function(data, textStatus, jqXHR) {
			prepareBeforeEdit(data);
		}
	});
}
function prepareBeforeEdit(data) {
	$("#myModalLabel").html(
			"Information of <strong>" + data.lastName + ", " + data.firstName
					+ "</strong>");
	$("#save").val(data.res_id);// where to store ID
	$("#firstName").val(data.firstName);
	$("#lastName").val(data.lastName);
	$("#email").val(data.email);
	$("#phone").val(data.phone);
	$("#skills").val(data.skills);
	$("#description").val(data.description);
	$("#res_URL_text").html(data.res_URL);
	//
	changeEditStatus($('#editBt'), false);
	sessionStorage.setItem("isEditing", false);
}
function sendDeleteRequest(deleteListJson) {
	$.ajax({
		type : 'POST',
		contentType : 'application/json',
		url : webServiceRootURL + "/deleteResumes",
		dataType : "json",
		data : JSON.stringify(deleteListJson),
		success : function(data, textStatus, jqXHR) {
			//
			refreshTableAfterDelete(data);
			//
			$('html, body').animate({
				scrollTop : 0
			}, 'slow');
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('addResume error: ' + textStatus + " " + errorThrown);
		}
	});
}

function refreshTableAfterDelete(deletedList) {

	var successMessage = "Deleted items by ID: ";
	var localData = sessionStorage.getItem("localData");
	var index = sessionStorage.getItem("currentIndex");
	localData = JSON.parse(localData);// need to parse to Json first
	//
	$.each(deletedList, function(i, deletedValue) {
		successMessage += deletedValue.res_id + " ";
		for (var j = 0; j < localData.length; j++) {
			if (localData[j].res_id == deletedValue.res_id) {
				localData.splice(j, 1);
			}
		}
		;
		$("#resultTable tr[id=" + deletedValue.res_id + "]").each(function() {
			$(this).addClass("danger");
		});
	});
	alert(successMessage);
	index = index - deletedList.length;
	if (localData.length < itemsEachPage || index < itemsEachPage - 1)
		index = 0;
	else {
		if (deletedList == itemsEachPage && index < deletedList.length - 1)
			index++;
		index++;
		index -= index % itemsEachPage;
		index--;
	}
	renderList(localData, index++, true);
}
function formToJSON() {
	return JSON.stringify({
		"res_id" : $("#save").val(),
		"firstName" : $('#firstName').val(),
		"lastName" : $('#lastName').val(),
		"email" : $('#email').val(),
		"phone" : $('#phone').val(),
		"skills" : $('#skills').val(),
		"description" : $('#description').val(),
		"res_URL" : ($("#res_URL").is(":visible")?$('#res_URL').val():"")
			//$('#res_URL_text').html()),
	});
}