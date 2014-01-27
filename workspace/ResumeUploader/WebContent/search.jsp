<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Bootstrap core CSS -->
<link href="bootstrap/dist/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="template/css/jumbotron-narrow.css" rel="stylesheet">
<jsp:include page="template/head.jsp" />
</head>

<body>
	<div class="container">

		<jsp:include page="template/header.jsp" />

		<form role="form">
			<div class="input-group">
				<input type="search" class="form-control" placeholder="Search"
					name="srch-term" id="srch-term">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
			<div class="row marketing">
				<div class="col-lg-12">
					<p>Result:</p>
					<div class="bs-example">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Username</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Mark</td>
									<td>Otto</td>
									<td>@mdo</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Jacob</td>
									<td>Thornton</td>
									<td>@fat</td>
								</tr>
								<tr>
									<td>3</td>
									<td colspan="2">Larry the Bird</td>
									<td>@twitter</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</form>
		<jsp:include page="template/footer.jsp" />

	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
</body>

</html>