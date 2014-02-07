<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="controller/controller.jsp" %> 
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
						<table id="resultTable" class="table table-hover table-bordered table-striped">

						</table>
						<ul id="pager" class="pager">
							<li id="pagerPrevious"  class="previous disabled"><a href="#" >&larr; Older</a></li>
							<li id="pagerDelete"><a href="#">Delete</a></li>
							<li id="pagerNext" class="next disabled"><a href="#" >Newer &rarr;</a></li>
						</ul>
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
	<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script src="js/search.js"></script>
<script src="js/update.js"></script>
</body>

</html>