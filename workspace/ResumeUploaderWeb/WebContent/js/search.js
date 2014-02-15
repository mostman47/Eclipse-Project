/**
 * @author nam phan
 * @company Reliable{coders}
 */
// The root URL for the RESTful services
var webServiceRootURL = sessionStorage.getItem("webServiceRootURL");
var itemsEachPage = 10;
// sessionStorage.clear();
$(document).ready(function() {
	$("#pagerDelete").hide();
	$("#deleteSingleBt").hide();
});
$(document).on('click', '#selectCheckBox', function() {
	// alert("click");
	$('#myModal').modal('hide');
});
// document on click, prevent jquery not work after appending
$(document).on('click', '#selectAllCheckBox', function() {
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

});

// click previous event
$(document).on('click', '#pagerPrevious', function() {
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
$(document).on('click', '#pagerNext', function() {
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
	// sessionStorage.clear();
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
		url : webServiceRootURL + "/Search:" + searchKey,
		dataType : "json",
		cache : false,
		success : function(data, textStatus, jqXHR) {
			renderList(data, 0, true);
		}
	});

}

// find all
function findAll() {
	// alert(webServiceRootURL);
	console.log('findAll');
	$.ajax({
		type : 'GET',
		url : webServiceRootURL + "/GetAllResumes",
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
	var footerPager = "";
	var result = "<thead><tr>" + "<th>#</th>" + "<th>First Name</th>"
			+ "<th>Last Name</th>" + "<th>Email</th>" + "<th>Skills</th>"
			+ "<th>Description</th>"
			// + "<td><input type=\"checkbox\" id=\"selectAllCheckBox\"></td>"
			+ "</tr></thead>" + "<tbody id=\"result\">";
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
			result += "<tr data-toggle=\"modal\" data-target=\"#myModal\" id=\""
					+ element.res_id
					+ "\">"
					+ "<td id = \"index\">"
					+ index
					+ "</td>"
					+ "<td>"
					+ shorten(element.firstName, 10)
					+ "</td>"
					+ "<td>"
					+ shorten(element.lastName, 10)
					+ "</td>"
					+ "<td>"
					+ shorten(element.email, 10)
					+ "</td>"
					+ "<td>"
					+ shorten(element.skills, 10)
					+ "</td><td>"
					+ shorten(element.description, 10) + "</td>"
					// + "<td><input type=\"checkbox\" id=\"selectCheckBox\"
					// value=\""
					// + element.res_id + "\"></td>"
					+ "</tr>";
		}
		index--;
		footerPager = "<div class=\"row\">					"
				+ "	<ul id=\"pager\" class=\"pager\">						"
				+ "	<li id=\"pagerPrevious\" class=\"previous disabled\"><a href=\"#\">&larr;"
				+ "Older</a></li>"
				+ "<li id=\"pagerDelete\" style=\"display:none\"><a href=\"#\">Delete</a></li>"
				+ "<li id=\"pagerNext\" class=\"next disabled\"><a href=\"#\">Newer"
				+ "&rarr;</a></li>" + "	</ul>" + "</div>";
	}
	result += "</tbody>";
	$('#resultTable').html(result);
	$('#panelFooter').html(footerPager);
	$("#searchValue").focus();

	sessionStorage.setItem("localData", JSON.stringify(data));
	sessionStorage.setItem("currentIndex", index);
	updatePager(data, index);
}
function shorten(s, n) {
	var r = s;
	if (r && r.length > n)
		r = r.substring(0, n) + " ...";
	return r;
}
