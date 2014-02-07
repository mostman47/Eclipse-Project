<%@ page import="java.util.Properties"%>
<%
	//System.out.println("login.jsp");
	String isLogin = (String) session.getAttribute("user");
	session.setAttribute("error", null);
	if ("GET".equalsIgnoreCase(request.getMethod())) {
		Properties prop = new Properties();
		prop.load(Thread.currentThread().getContextClassLoader()
				.getResourceAsStream("config.properties"));
		String user = prop.getProperty("loginUser");
		String pass = prop.getProperty("loginPass");
		String enterUser = request.getParameter("username");
		String enterPassword = request.getParameter("password");
		if(enterUser.equals(user) && enterPassword.equals(pass))
		{
			session.invalidate();
			session = request.getSession();
			session.setAttribute("user", user);
		}
		else
		{
			session.setAttribute("error","username or password is incorrect");
		}
	}
	else
		if("POST".equalsIgnoreCase(request.getMethod()))
		{
			//System.out.println("post");
			if(request.getParameter("logout")!=null)
			{
				session.invalidate();
				session = request.getSession();
				System.out.println("logout");
			};
		}
	response.sendRedirect(request.getContextPath() + "/index");
%>
<!-- <META HTTP-EQUIV=Refresh CONTENT="0; URL=../index.jsp"> -->