<%
	if(!request.getServletPath().contains("index.jsp"))
	{
		if(session==null || session.getAttribute("user")==null)
		{
 			//System.out.println("out");
			response.sendRedirect(request.getContextPath() + "/index");
		}
	}
%>