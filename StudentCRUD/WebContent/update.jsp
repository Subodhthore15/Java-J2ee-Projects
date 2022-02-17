<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<%
  		if(request.getParameter("submit")!=null)
  		{
  			String id=request.getParameter("id");
  			String name= request.getParameter("sname");
  			String course= request.getParameter("course");
  			String fees= request.getParameter("fee");
  			
  			Connection conn;
  			PreparedStatement pst;
  			ResultSet rs;
  			Class.forName("com.mysql.cj.jdbc.Driver"); 
  			conn=DriverManager.getConnection(  
  					"jdbc:mysql://localhost:3306/schooll","root","root");  
			
  			String sql ="update  records set stname=?, course=?,fee=? where id="+id+"; ";
  			
  			pst=conn.prepareStatement(sql);
  			
  			pst.setString(1,name);
  			pst.setString(2,course);
  			pst.setString(3,fees);
  			pst.executeUpdate();
  			
  			
  			%>
  			
  				<script>
  					alert("record Updated");
  				</script>
  			<%
  		}
  			%>
  		
  	

<h1>Hello world update(Edit)</h1>	

		<div class="row">
			<div class="col-sm-4"> 
		
				<form  action="#" method="post">
				
				<%
					String i=request.getParameter("id");

					Connection conn;
					PreparedStatement pst;
					ResultSet rs;
							Class.forName("com.mysql.cj.jdbc.Driver"); 
						conn=DriverManager.getConnection(  
								"jdbc:mysql://localhost:3306/schooll","root","root");  

					Statement stmt=conn.createStatement();  
					 rs=stmt.executeQuery("select * from records where id="+i);  
	
					while(rs.next())
						{
			
				%>
					<div align="left">
						<label class="form-lable">StudentName:</label>
					    <input type="text" value="<%= rs.getString("stname") %>" class="form-control" name="sname" id="sname" required >
					</div>
					
					
					<div align="left">
						<label class="form-lable">Course:</label>
					    <input type="text" value="<%= rs.getString("course") %>"class="form-control" name="course" id="course" required >
					</div>
					
					<div align="left">
						<label class="form-lable">Fee:</label>
					    <input type="text" value="<%= rs.getString("fee") %>"  class="form-control" name="fee" id="fee" required >
					</div>
					
					<%
					   } 
					
					%>
					
					
				
  		
					<div align="left" class="mt-2">
						
					    <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
					    
					</div>
					
				</form>
				
				<a href="index.jsp">Click back</a>
			</div>
		</div>
</body>
</html>