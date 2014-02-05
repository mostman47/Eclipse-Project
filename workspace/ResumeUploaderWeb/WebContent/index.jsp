<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	//@author: nam phan
	//@company: Reliable{coders}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="template/head.jsp" />
</head>
<body>


	<div class="container">

		<jsp:include page="template/header.jsp" />

		<div class="jumbotron">
			<div class="row">
				<div class="col-xs-12 col-md-8">
					<h1>Welcome</h1>
					<p class="lead">
						to <b>Resume Uploader</b>
					</p>
				</div>
				<div class="col-xs-6 col-md-4">
					<img src="template/image/Upload-file.png" alt="uploadImage"
						class="img-rounded" style="width: 100px">
				</div>
			</div>
		</div>
		<blockquote>
			<div class="row">
				<%
					String loginUser = (String) session.getAttribute("isLogin");
					if (loginUser == null) {
				%>
				<div class="col-md-8 col-md-offset-3">
					<form id="loginForm" class="form-horizontal" action="jsp/login.jsp"
						method="get">
						<div class="form-group">
							<div class="col-sm-10">
								<div class="input-group">
									<span class="input-group-addon">&#64;</span> <input type="text"
										class="form-control" placeholder="Username" id="username"
										name="username">
								</div>
							</div>

						</div>

						<div class="form-group">
							<div class="col-sm-10">
								<div class="input-group">
									<span class="input-group-addon">&hearts;&hearts;</span> <input
										type="password" class="form-control" placeholder="Password"
										id="password" name="password">
								</div>
							</div>
						</div>

						<%
							String errorMessage = (String) session.getAttribute("error");
								if (errorMessage != null) {
						%>
						<div class="form-group">
							<div class="col-sm-10">
								<p id="error" class="alert alert-warning alert-dismissable">
									<small><%=errorMessage%></small>
								</p>
							</div>
						</div>
						<%
							}
						%>

						<div class="form-group">
							<div class="col-sm-10">
								<button type="submit" class="btn btn-default">Sign in</button>
							</div>
						</div>
					</form>
				</div>
				<%
					} else {
				%>
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="row">
						<h1>
							Hi <strong><%=loginUser%></strong>!
						</h1>
					</div>
					<div class="row">
						<a href="upload.jsp"><button type="button"
								class="btn btn-success">Upload</button></a> <a href="search.jsp"><button
								type="button" class="btn btn-success">Search</button></a>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</blockquote>

		<jsp:include page="template/footer.jsp" />

	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
</body>

</html>