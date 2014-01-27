<%
String uri = request.getRequestURI();
String pageName = uri.substring(uri.lastIndexOf("/")+1);
pageName = pageName.substring(0,pageName.lastIndexOf("."));

//set title, menuBar
String title = "";
String currentMenuBar = "";
String[] pageNames = {"index","upload", "search"};
String[] titles = {"Resume Uploader", "Upload", "Search"};
String[] menuBars = {"Home", "Upload", "Search"}; 
for(int i = 0;i < pageNames.length;i++)
{
	if(pageName.equalsIgnoreCase(pageNames[i]))
	{
		title = titles[i];
		currentMenuBar = menuBars[i];
		break;
	}
}
%>