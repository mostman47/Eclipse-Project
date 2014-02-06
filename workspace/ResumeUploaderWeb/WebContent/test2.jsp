



<!DOCTYPE html>
<html lang="en">

<head>


<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="template/image/favicon.png">
<link href="css/style.css" rel="stylesheet">
<script src="js/JQuery-Session-Plugin-master/jquery.session.js"></script>
<script src="js/jquery-1.7.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<title>Search</title>

</html>
</head>

<body>
	<div id='content'></div>
	<div class="container">



		<!DOCTYPE html>
		<html>
<div class="header">
	<div class="row">
		<ul class="nav nav-pills pull-right" id="topMenu">

			<li><a href="index" id="Home">Home</a></li>


			<li><a href="upload" id="Upload">Upload</a></li>


			<li class="active"><a href="search" id="Search">Search</a></li>

			<li>
				<form action="controller/login.jsp" method="post">
					<button type="submit" class="btn btn-default" id="logout"
						name="logout">
						<span class="glyphicon glyphicon-lock"></span> Logout
					</button>
				</form>
			</li>

		</ul>
		<a href="http://www.reliablecoders.com/"><img
			src="template/image/logo.png" alt="logo"></a>

	</div>
	<div class="row">
		<div class="col-md-3 col-md-offset-1">
			<p class="text-muted nav pull-left">Resume Uploader</p>
		</div>
	</div>
</div>
<script>
	var loginUser = admin;
	jQuery.fn.extend({
		disable : function(state) {
			return this.each(function() {
				var $this = $(this);
				$this.toggleClass('disabled', state);
			});
		}
	});
	if (loginUser === null) {
		//$("#logout").addClass("disabled");
		$("#topMenu li").each(function() {
			$(this).addClass("disabled");
		});

		$('a#Upload').disable(true);
		$('a#Search').disable(true);

	} else {
		//$("#logout").removeClass("disabled");
		$("#topMenu li").each(function() {
			$(this).removeClass("disabled");
		});
	};
	$('body').on('click', 'a.disabled', function(event) {
		event.preventDefault();
	});
</script>

		</html>

		<form id="searchForm">
			<div class="input-group">
				<input id="searchValue" type="search" class="form-control"
					placeholder="Search" name="srch-term" id="srch-term">
				<div class="input-group-btn">
					<button id="searchBt" class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
			<div class="row marketing">
				<div class="col-lg-12">
					<div class="bs-example">
						<blockquote>
							<table id="resultTable" class="table table-hover table-bordered">
								<thead>
									<tr>
										<th>#</th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Email</th>
										<th>Phone</th>
										<th>Resume URL</th>
									</tr>
								</thead>
								<tbody id="result">
									<tr data-toggle="modal" data-target="#myModal">
										<td rowspan="2">94</td>
										<td>nam</td>
										<td>phan</td>
										<td>aasd@d</td>
										<td>111-423-3213</td>
										<td>aasd@d_Resume_Database.zip</td>
									</tr>
									<tr>
										<td colspan="3"><strong>Skills: </strong>asd</td>
										<td colspan="2"><strong>Description: </strong>asd</td>
									</tr>
								
								</tbody>
							</table>
						</blockquote>
						<ul id="pager" class="pager">
							<li id="pagerPrevious" class="previous disabled"><a href="#">&larr;
									Older</a></li>
							<li id="pagerNext" class="next disabled"><a href="#">Newer
									&rarr;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</form>

		<!DOCTYPE html>
		<html>
<div class="footer">
	<p>&copy; ReliableCoders, Inc. All Rights Reserved. 2014</p>
</div>
		</html>

	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<script src="js/search.js"></script>
</body>

</html>