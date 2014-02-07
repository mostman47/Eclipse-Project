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
<script src="js/search.js"></script>

</head>

<body>
	<div class="container">

		<jsp:include page="template/header.jsp" />
		<form id="searchForm">
			<div class="input-group">
				<input id="searchValue" type="search" class="form-control"
					placeholder="Search" name="srch-term">
				<div class="input-group-btn">
					<button id="searchBt" class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
			<div class="row marketing">
				<div class="col-lg-12">
					<div class="bs-example">
						<table id="resultTable"
							class="table table-hover table-bordered table-striped">
							<thead>
								<tr>
									<th>#</th>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Email</th>
									<th>Phone</th>
									<th>Resume URL</th>
									<td><input type="checkbox" id="selectAllCheckBox"></td>
								</tr>
							</thead>
							<tbody id="result">
								<tr data-toggle="modal" data-target="#myModal">
									<td rowspan="2">143</td>
									<td>asd</td>
									<td>asd</td>
									<td>sd@ads</td>
									<td>111-423-3213</td>
									<td>sd@ads_1</td>
									<td><input type="checkbox" id="selectCheckBox" value="143"></td>
								</tr>
								<tr>
									<td colspan="3"><strong>Skills: </strong>asd</td>
									<td colspan="3"><strong>Description: </strong>asd</td>
								</tr>
								<tr data-toggle="modal" data-target="#myModal">
									<td rowspan="2">142</td>
									<td>dfs</td>
									<td>sdf</td>
									<td>dsf@fdsf</td>
									<td>111-423-3213</td>
									<td>dsf@fdsf_All.sql</td>
									<td><input type="checkbox" id="selectCheckBox" value="142"></td>
								</tr>
								<tr>
									<td colspan="3"><strong>Skills: </strong>dsf</td>
									<td colspan="3"><strong>Description: </strong>sdf</td>
								</tr>
								<tr data-toggle="modal" data-target="#myModal">
									<td rowspan="2">141</td>
									<td>sdf</td>
									<td>sdf</td>
									<td>sad@3</td>
									<td>111-423-3213</td>
									<td>sad@3_All.sql</td>
									<td><input type="checkbox" id="selectCheckBox" value="141"></td>
								</tr>
								<tr>
									<td colspan="3"><strong>Skills: </strong>sdf</td>
									<td colspan="3"><strong>Description: </strong>sdf</td>
								</tr>
								<tr data-toggle="modal" data-target="#myModal">
									<td rowspan="2">140</td>
									<td>sdf</td>
									<td>sdf</td>
									<td>dsf@fdsf</td>
									<td>111-423-3213</td>
									<td>dsf@fdsf_All.sql</td>
									<td><input type="checkbox" id="selectCheckBox" value="140"></td>
								</tr>
								<tr>
									<td colspan="3"><strong>Skills: </strong>sdf</td>
									<td colspan="3"><strong>Description: </strong>sdf</td>
								</tr>
								<tr data-toggle="modal" data-target="#myModal">
									<td rowspan="2">139</td>
									<td>daf</td>
									<td>daf</td>
									<td>df@dfsf</td>
									<td>111-423-3213</td>
									<td>df@dfsf_All.sql</td>
									<td><input type="checkbox" id="selectCheckBox" value="139"></td>
								</tr>
								<tr>
									<td colspan="3"><strong>Skills: </strong>sdf</td>
									<td colspan="3"><strong>Description: </strong>sdf</td>
								</tr>
							</tbody>
						</table>
						<ul id="pager" class="pager">
							<li id="pagerPrevious" class="previous disabled"><a href="#">←
									Older</a></li>
							<li id="pagerDelete"><a href="#">Delete</a></li>
							<li id="pagerNext" class="next"><a href="#">Newer →</a></li>
						</ul>
					</div>
				</div>
			</div>
		</form>
		<!-- Button trigger modal -->
		<button class="btn btn-primary btn-lg" data-toggle="modal"
			data-target="#myModal">Launch demo modal</button>

		<!-- Modal -->
		<div class="modal fade bs-modal-lg" id="myModal" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
							</blockquote>
						</form>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="template/footer.jsp" />

		<!-- /container -->
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<script src="js/search.js"></script>
	<script src="js/update.js"></script>
</body>

</html>