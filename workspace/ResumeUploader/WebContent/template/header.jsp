<%@ include file="enum.jsp"%>
<!DOCTYPE html>
<html>
<div class="header">
	<ul class="nav nav-pills pull-right">
		<%
 	for(int i = 0;i < menuBars.length;i++)
 {
 	String m = menuBars[i];
 	String p = pageNames[i];
	if(m.equalsIgnoreCase(currentMenuBar))// check current tab
{%>
		<li class="active"><a href="<%=p%>.jsp"><%=m%></a></li>
		<%}
else{
%>
		<li><a href="<%=p%>.jsp"><%=m%></a></li>

		<%}
 }
%>

	</ul>
	<h3 class="text-muted">Resume Uploader</h3>
</div>

</html>