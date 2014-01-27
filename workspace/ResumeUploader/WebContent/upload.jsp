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
			<blockquote>
				<cite>Personal Info</cite>
				<div class="row marketing">
					<div class="col-lg-6">
						<label for="firstnameInput">First Name*</label> <input
							type="firstname" class="form-control" id="firstname"
							placeholder="Enter first-name">
					</div>
					<div class="col-lg-6">
						<label for="firstnameInput">Last Name*</label> <input
							type="lastname" class="form-control" id="lastname"
							placeholder="Enter last-name">
					</div>
				</div>
				<div class="row marketing">
					<div class="col-lg-6">
						<label for="firstnameInput">Email*</label> <input type="email"
							class="form-control" id="email" placeholder="Enter Email">
					</div>
					<div class="col-lg-6">
						<label for="firstnameInput">Phone*</label> <input type='tel'
							class="form-control" id="phone" placeholder="Enter Phone Number">

					</div>
				</div>
			</blockquote>
			<blockquote>
				<div class="row marketing">
					<div class="col-lg-12">
						<label for="skillInput">Skills*</label>

						<textarea class="form-control" rows="3"></textarea>
					</div>
				</div>
				<div class="row marketing">
					<div class="col-lg-12">
						<label for="descriptionInput">Description*</label>

						<textarea class="form-control" rows="3"></textarea>
					</div>
				</div>
			</blockquote>
			<blockquote>
				<div class="row marketing">
					<div class="col-lg-12">
					
						<label for="exampleInputFile">File Resume*</label> <input
							type="file" id="exampleInputFile">
					</div>
				
				</div>
			</blockquote>
			<div class="row marketing">
				<div class="col-lg-12">
					<button type="button" class="btn btn-default">Upload</button>
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