<%@ page import="java.util.Properties"%>
<%
	if (!request.getServletPath().contains("index.jsp")) {
		if (session == null || session.getAttribute("user") == null) {
			//System.out.println("out");
			response.sendRedirect(request.getContextPath() + "/index");
		}
	}
	//get properties
	Properties prop = new Properties();
	prop.load(Thread.currentThread().getContextClassLoader()
			.getResourceAsStream("config.properties"));

	String directoryRootURL = prop.getProperty("rootDirectory");
	String webService = prop.getProperty("webService");
	//System.out.println(directoryRootURL);
	//System.out.println(webService);
%>
<script type="text/javascript">
sessionStorage.clear();
var w = "<%=webService%>";
var d = "<%=directoryRootURL%>";
sessionStorage.setItem("webServiceRootURL",w);
sessionStorage.setItem("directoryRootURL",d);
</script>