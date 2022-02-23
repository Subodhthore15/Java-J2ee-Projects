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


<h1>Sign up</h1>

	<form  method="post" action="register" >
		Name: <input name="name" type="text">
		<br>
		<br>
		Email <input type="email" name="email">
	<br>
		<br>
		Password <input type="password" name="pass">
		<br>
		<br>
		
		Confirm Password <input type="password" name="re_pass">
		<br>
		<br>
		COntact <input type="text" name="contact">
		 
		<br>
		<br>
		Agree <input type="checkbox" name="agree-term" >
		<br>
		<br>
		<input type="submit" name="signup">
	</form>
	
	
	<div>
	<a href="login.jsp" >Already member</a>
	</div>
	
	<script>
	
		var status = document.getElementById("status").value;
		

		if(status=="success")
			{
			alert("Account created succesfully");
			}
		else if(status=="failed"){
			alert("Details Not stored(Error Occured)");
		}
		if(status=="Invalid username")
			{
			alert("Enter username");
			}
		
		if(status=="Invalid email")
		{
		alert("Enter email");
		}
		if(status=="Invalid pwd")
		{
		alert("Enter password");
		}
		if(status=="Invalid Contact")
		{
		alert("Enter Contact");
		}
	</script>
</body>
</html>