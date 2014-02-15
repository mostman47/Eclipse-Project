<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="controller/controller.jsp"%>
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

		<form id="uploadForm" name="uploadForm" method="post">

			<span id="resultSpan" class="label label-success"></span>
			<blockquote>
				<strong>Personal Information</strong>
				<div class="row marketing">
					<div class="col-lg-6">
						<label>First Name*</label> <input type="text" class="form-control"
							id="firstName" name="firstName" placeholder="first-name" required>
					</div>
					<div class="col-lg-6">
						<label>Last Name*</label> <input type="text" class="form-control"
							id="lastName" name="lastName" placeholder="last-name" required>
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

						<textarea class="form-control" rows="3" id="skills" name="skills"
							required></textarea>
					</div>
				</div>
				<div class="row marketing">
					<div class="col-lg-6">
						<label>Description*</label>

						<textarea class="form-control" rows="3" id="description"
							name="description" required></textarea>
					</div>
					<div class="col-lg-6">
						<label>Resume*</label> <input type="file" id="res_URL"
							name="res_URL" required>
					</div>

				</div>
			</blockquote>
			<div class="row marketing">
				<div class="col-lg-12">
					<button id="submitBt" name="submitBt" class="btn btn-default">Submit</button>
					<button id="resetBt" name="resetBt" type="reset"
						class="btn btn-default">Reset</button>
				</div>

			</div>

		</form>

		<jsp:include page="template/footer.jsp" />

	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script src="js/upload.js"></script>
</body>

</html>