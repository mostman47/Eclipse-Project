/**
 * @author nam phan
 * @company Reliable{coders}
 */
// The root URL for the RESTful services
var rootURL = "http://localhost:8080/ResumeUploaderWeb/rest/Web";
var itemsEachPage = 5;
sessionStorage.clear();
$(document).on('click', '#selectCheckBox', function() {
	$('#myModal').modal('hide')
});
// document on click, prevent jquery not work after appending
$(document).on('click', '#selectAllCheckBox', function() {
	// click select all event
	// $('#selectAllCheckBox').on( "click", function() {// not work after
	// appending
	if ($(this).prop('checked')) {
		$("input[id='selectCheckBox']").each(function() {
			$(this).prop('checked', true);
		});
	} else {
		$("input[id='selectCheckBox']").each(function() {
			$(this).prop('checked', false);
		});
	}

	// });

});

// click previous event
$('#pagerPrevious').click(function() {
	var data = sessionStorage.getItem("localData");
	if (data != null) {
		data = JSON.parse(data);
		var index = sessionStorage.getItem("currentIndex");
		index++;
		if (index >= itemsEachPage) {
			renderList(data, index, false);
		}
	}
});
// click next event
$('#pagerNext').click(function() {
	var data = sessionStorage.getItem("localData");
	if (data != null) {
		data = JSON.parse(data);

		var index = sessionStorage.getItem("currentIndex");
		index++;
		if (index < data.length) {
			renderList(data, index, true);
		}
	}
});
// submit form
$('#searchForm').submit(function(e) {
	e.preventDefault();
	sessionStorage.clear();
	// submit via ajax
	$('html, body').css("cursor", "wait");
	var searchKey = $("#searchValue").val();
	if (searchKey.length === 0) {
		findAll();
	} else {
		searchResume(searchKey);
	}
	$('html, body').css("cursor", "auto");
	return false;
});

// search with key
function searchResume(searchKey) {
	$.ajax({
		type : "GET",
		url : rootURL + "/Search:" + searchKey,
		dataType : "json",
		cache : false,
		success : function(data, textStatus, jqXHR) {
			renderList(data, 0, true);
		}
	});

}

// find all
function findAll() {
	console.log('findAll');
	$.ajax({
		type : 'GET',
		url : rootURL + "/GetAllResumes",
		dataType : "json", // data type of response
		success : function(data, textStatus, jqXHR) {
			renderList(data, 0, true);
		}
	});
}

// update pager
function updatePager(data, index) {
	if (index > (itemsEachPage - 1)) {
		$("#pager li.previous").removeClass("disabled");
	} else {
		$("#pager li.previous").addClass("disabled");
	}

	if (data.length > (index + 1)) {
		$("#pager li.next").removeClass("disabled");
	} else {
		$("#pager li.next").addClass("disabled");
	}
}

// display
function renderList(data, index, isNext) {
	// JAX-RS serializes an empty list as null, and a 'collection of one' as an
	// object (not an 'array of one')
	var result = "<thead><tr>"
			+ "<th>#</th>"
			+ "<th>First Name</th>"
			+ "<th>Last Name</th>"
			+ "<th>Email</th>"
			+ "<th>Phone</th>"
			+ "<th>Resume URL</th>"
			+ "<td><input type=\"checkbox\" id=\"selectAllCheckBox\"></td></tr></thead>"
			+ "<tbody id=\"result\">";
	if (data.length === 0) {
		result += "<td>No Result</td>";
	} else {
		if (!isNext) {
			index = index
					- (index % itemsEachPage == 0 ? itemsEachPage : index
							% itemsEachPage) - itemsEachPage;
		}
		for (var i = index, j = index; i < data.length
				&& (i - j) < itemsEachPage; i++) {
			index++;
			var element = data[i];
			result += "<tr data-toggle=\"modal\" data-target=\"#myModal\">"
					+ "<td rowspan=\"2\">"
					+ element.res_id
					+ "</td>"
					+ "<td>"
					+ element.firstName
					+ "</td>"
					+ "<td>"
					+ element.lastName
					+ "</td>"
					+ "<td>"
					+ element.email
					+ "</td>"
					+ "<td>"
					+ element.phone
					+ "</td>"
					+ "<td>"
					+ element.res_URL
					+ "</td>"
					+ "<td><input type=\"checkbox\" id=\"selectCheckBox\" value=\""
					+ element.res_id + "\"></td>" + "</tr>";
			result += "<tr><td colspan=\"3\"><strong>Skills: </strong>"
					+ element.skills
					+ "</td><td colspan=\"3\"><strong>Description: </strong>"
					+ element.description + "</td></tr>";
		}
		index--;
	}
	result += "</tbody>";
	$('#resultTable').html(result);
	$("#searchValue").focus();

	sessionStorage.setItem("localData", JSON.stringify(data));
	sessionStorage.setItem("currentIndex", index);
	updatePager(data, index);
}

// //JAX-RS serializes an empty list as null, and a 'collection of one' as an
// // object (not an 'array of one')
// var result = "<thead><tr>" + "<th>#</th>" + "<th>First Name</th>"
// + "<th>Last Name</th>" + "<th>Email</th>" + "<th>Phone</th>"
// + "<th>Skills</th>" + "<th>Description</th>"
// + "<th>Resume URL</th>" + "</tr></thead>" + "<tbody id=\"result\">";
// if (data.length === 0) {
// result += "<td>No Result</td>";
// } else {
// if (!isNext) {
// index = index - (index % itemsEachPage==0?itemsEachPage:index %
// itemsEachPage) - itemsEachPage;
// }
// for (var i = index, j = index; i < data.length
// && (i - j) < itemsEachPage; i++) {
// index++;
// var element = data[i];
// result += "<tr>" + "<td>" + element.res_id + "</td>" + "<td>"
// + element.firstName + "</td>" + "<td>" + element.lastName
// + "</td>" + "<td>" + element.email + "</td>" + "<td>"
// + element.phone + "</td>" + "<td>" + element.skills
// + "</td>" + "<td>" + element.description + "</td>" + "<td>"
// + element.res_URL + "</td>" + "</tr>";
// }
// index--;
// }
// result += "</tbody>";
// $('#resultTable').html(result);
// $("#searchValue").focus();
//
// sessionStorage.setItem("localData", JSON.stringify(data));
// sessionStorage.setItem("currentIndex", index);
// updatePager(data, index);
