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

	<div id='content'></div>
	<div class="container">

		<jsp:include page="template/header.jsp" />

		<form id="searchForm">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<div class="input-group">
								<input id="searchValue" type="search" class="form-control"
									placeholder="Search" name="srch-term" id="srch-term"> <span
									class="input-group-btn">
									<button id="searchBt" class="btn btn-default" type="submit">
										<i class="glyphicon glyphicon-search"></i> Search
									</button>
								</span>
							</div>
							<!-- /input-group -->
						</div>
						<!-- /.col-lg-6 -->
					</div>
					<!-- /.row -->
				</div>
				<table id="resultTable" class="table table-hover">
				</table>
				<div id="panelFooter" class="panel-footer">
<!-- 					<div class="row"> -->

<!-- 						<ul id="pager" class="pager"> -->
<!-- 							<li id="pagerPrevious" class="previous disabled"><a href="#">&larr; -->
<!-- 									Older</a></li> -->
<!-- 							<li id="pagerDelete" style="display:none"><a href="#" >Delete</a></li> -->
<!-- 							<li id="pagerNext" class="next disabled"><a href="#">Newer -->
<!-- 									&rarr;</a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
				</div>
			</div>
		</form>

		<jsp:include page="template/footer.jsp" />

	</div>
	<!-- /container -->
	<!-- Modal -->
	<div class="modal fade bs-modal-lg" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form id="updateForm" name="updateForm" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">Information of ...</h4>
					</div>
					<div class="modal-header">
						<button type="button" class="btn btn-info"
							data-loading-text="Loading..." id="editBt">Edit</button>
						<button type="button" class="btn btn-danger" id="deleteSingleBt"
							disabled>Delete</button>
					</div>
					<div class="modal-body">

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
								<div class="col-lg-6">
									<label>Skills*</label>

									<textarea class="form-control" rows="3" id="skills"
										name="skills" required></textarea>
								</div>
								<div class="col-lg-6">
									<label>Description*</label>

									<textarea class="form-control" rows="3" id="description"
										name="description" required></textarea>
								</div>
							</div>

							<div class="row marketing">
								<div class="col-lg-12">
									<label>Resume*</label> <input type="file" id="res_URL"
										name="res_URL" required>
									<p>
										<span id="res_URL_text">File Name</span>
										<button type="button" class="btn btn-link" id="zoomURL">
											<span class="glyphicon glyphicon-zoom-in"></span> View
										</button>
										<button type="button" class="btn btn-link" id="saveURL">
											<span class="glyphicon glyphicon-cloud-download"></span> Save
										</button>
										<button type="button" class="btn btn-link" id="newURL">
											<span class="glyphicon glyphicon-cloud-upload"></span> New
										</button>
									</p>

								</div>
							</div>
						</blockquote>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary" id="save"
							name="save">Save changes</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script src="js/search.js"></script>
	<script src="js/update.js"></script>
	<script src="js/jquery-2.1.0.js"></script>
</body>

</html>