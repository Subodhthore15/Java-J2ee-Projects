

<%
	if(session.getAttribute("name")==null)
	{
		// not logged in so we have to redirect him to log in page
		response.sendRedirect("login.jsp");
		
	}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> Hello
 <% if(session.getAttribute("name")!=null)
		out.print(session.getAttribute("name"));
	
	
	%> Boss this is home page</h1>
	
	
	<h1> <a href="logout">Logout</a>  </h1>
</body>
</html>