<%@ include file="enum.jsp"%>

<!DOCTYPE html>
<html>
<div class="header">
	<div class="row">
		<ul class="nav nav-pills pull-right" id="topMenu">
			<%
				for (int i = 0; i < menuBars.length; i++) {
					String m = menuBars[i];
					String p = pageNames[i];
					if (m.equalsIgnoreCase(currentMenuBar))// check current tab
					{
			%>
			<li class="active"><a href="<%=p%>" id="<%=m%>"><%=m%></a></li>
			<%
				} else {
			%>
			<li><a href="<%=p%>" id="<%=m%>"><%=m%></a></li>

			<%
				}
				}
			String loginUser = (String) session.getAttribute("user");
			if(loginUser!=null){
			%>
			<li>
				<form action="controller/login.jsp" method="post">
					<button type="submit" class="btn btn-default" id="logout" name="logout">
						<span class="glyphicon glyphicon-lock"></span> Logout
					</button>
				</form>
			</li>
			<%} %>
		</ul>
		<a href="http://www.reliablecoders.com/" ><img src="template/image/logo.png" alt="logo"></a>

	</div>
	<div class="row">
	<div class="col-md-3 col-md-offset-1">
		<p class="text-muted nav pull-left">Resume Uploader</p>
		</div>
	</div>
</div>
<script>

	var loginUser = "<%=loginUser%>";
	jQuery.fn.extend({
        disable: function(state) {
            return this.each(function() {
                var $this = $(this);
                $this.toggleClass('disabled', state);
            });
        }
    });
	if(loginUser === null)
		{
			//$("#logout").addClass("disabled");
			$("#topMenu li").each(function(){
				$(this).addClass("disabled");
			});
		    
		    $('a#Upload').disable(true);
		    $('a#Search').disable(true);
		    
		    
		}
	else
		{
			//$("#logout").removeClass("disabled");
			$("#topMenu li").each(function(){
				$(this).removeClass("disabled");
			});
		};
		$('body').on('click', 'a.disabled', function(event) {
	        event.preventDefault();
	    });
		  
	    
</script>
<%
// System.out.println(request.getServletPath());
// 	if(!request.getServletPath().contains("index.jsp"))
// 	{
// 		 HttpServletResponse res = (HttpServletResponse) response;
// 		//System.out.println(request.getServletPath());
// 		if(session==null || session.getAttribute("user")==null)
// 		{
			%>
<!-- 			<META HTTP-EQUIV=Refresh CONTENT="0; URL=index.jsp"> -->
			<%
//  			System.out.println("out");
// // 			String rootUrl = request.getRequestURL().toString();
// // 			rootUrl = rootUrl.replaceFirst(request.getServletPath(), "/index");
// // 			System.out.println(rootUrl);
// 			//response.sendRedirect(rootUrl);
// 			//response.sendRedirect( "/index" );
// 			//res.sendRedirect(request.getContextPath() + "/index");
// 			response.sendRedirect("http://localhost:8080/ResumeUploaderWeb/index.jsp");
// 		}
// 	}
%>
</html>