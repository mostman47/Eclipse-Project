<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="template/head.jsp" />
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="bootstrap/dist/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<body>
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
					<td colspan="3"><strong>Skills:</strong> java, css, html, json, mysql</td>
					<td colspan="2"><strong>Description:</strong> great programmer and busy</td>
				</tr>
			</tbody>
		</table>
	</blockquote>
	<!-- Button trigger modal -->
	<button class="btn btn-primary btn-lg" data-toggle="modal"
		data-target="#myModal">Launch demo modal</button>
		
	<!-- Modal -->
		<div class="modal fade bs-modal-lg" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Information of ...</h4>
				</div>
				<div class="modal-header">
					<button type="button" class="btn btn-info">Edit</button>
					<button type="button" class="btn btn-danger">Delete</button>
				</div>
				<div class="modal-body">
										<form id="uploadForm" name="uploadForm" method="post">
											<span id="resultSpan" class="label label-success"></span>
											<blockquote>
												<strong>Personal Information</strong>
												<div class="row marketing">
													<div class="col-lg-6">
														<label>First Name*</label> <input type="text"
															class="form-control" id="firstName" name="firstName"
															placeholder="first-name" required>
													</div>
													<div class="col-lg-6">
														<label>Last Name*</label> <input type="text"
															class="form-control" id="lastName" name="lastName"
															placeholder="last-name" required>
													</div>
												</div>
												<div class="row marketing">
													<div class="col-lg-6">
														<label>Email*</label> <input type="email" class="form-control"
															id="email" name="email" placeholder="Email" required>
													</div>
													<div class="col-lg-6">
														<label>Phone*</label> <input type='tel' class="form-control"
															id="phone" name="phone" placeholder="111-111-1111" required
															pattern="\d{3}[\-]\d{3}[\-]\d{4}"
															oninvalid="setCustomValidity('Required. PLease match: ###-###-####')"
															onchange="try{setCustomValidity('')}catch(e){}">
													</div>
												</div>
											</blockquote>
											<blockquote>
												<strong>Experiences</strong>
												<div class="row marketing">
													<div class="col-lg-12">
														<label>Skills*</label>

														<textarea class="form-control" rows="3" id="skills"
															name="skills" required></textarea>
													</div>
												</div>
												<div class="row marketing">
													<div class="col-lg-12">
														<label>Description*</label>

														<textarea class="form-control" rows="3" id="description"
															name="description" required></textarea>
													</div>
												</div>
											</blockquote>
										</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>