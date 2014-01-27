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

		<div class="jumbotron">

			<h1>Welcome</h1>
			<p class="lead">Welcome to Resume Uploader. 
			Click <b>UPLOAD</b> button to upload a resume. Click <b>SEARCH</b> button to navigate uploaded resumes. </p>
			<p>
				<a class="btn btn-lg btn-success" href="upload.jsp" role="button">Upload</a>
					
					<a class="btn btn-lg btn-success" href="search.jsp" role="button">Search</a>
			</p>
		</div>
		
		<jsp:include page="template/footer.jsp" />

	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
</body>

</html>