<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">

<h1>Login (signin)</h1>
 <form action="login" method="post">
 	Username(Email): <input type="text" name="username" > 
 	<br>
 	<br>
 	Password: <input type="password" name="password" >
 	<br>
 	<br>
 	
 	<input type="checkbox" name="remember-me"> remember me
 	<br>
 	<br>
 	<input type="submit" value="log_in" name="signin"> 
 	
  </form>
  
  
  <div>
	<a href="registration.jsp" >Create an account </a>
	</div>
	
	
	<script>
	
		var status = document.getElementById("status").value;
		

		if(status=="failed")
			{
			alert("Sorry! Wrong credential");
			}
		if(status=="invalid Email")
			{
			alert("Enter email id");
			}
		if(status=="invalid password")
		{
		alert("Enter password");
		}
		
	</script>
</body>
</html>