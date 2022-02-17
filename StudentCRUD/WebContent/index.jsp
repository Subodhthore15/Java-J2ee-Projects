<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@page import="java.sql.*" %>
  
  <%
  		if(request.getParameter("submit")!=null)
  		{
  			String name= request.getParameter("sname");
  			String course= request.getParameter("course");
  			String fees= request.getParameter("fee");
  			
  			Connection conn;
  			PreparedStatement pst;
  			ResultSet rs;
  			Class.forName("com.mysql.cj.jdbc.Driver"); 
  			conn=DriverManager.getConnection(  
  					"jdbc:mysql://localhost:3306/schooll","root","root");  
			
  			String sql ="insert into records(stname,course,fee) value(?,?,?); ";
  			
  			pst=conn.prepareStatement(sql);
  			
  			pst.setString(1,name);
  			pst.setString(2,course);
  			pst.setString(3,fees);
  			pst.executeUpdate();
  			
  			
  			%>
  			
  				<script>
  					alert("record added");
  				</script>
  			<%
  		}
  			%>
  		
  	
 
  	
  		
  		
  		
  			
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
		<h1>Hello world</h1>
		<div class="row">
			<div class="col-sm-4"> 
		<!-- form creation -->	
		<!-- An action of # indicates that the form stays on the same page, simply suffixing the url with a #. Similar use occurs in anchors. <a href=#">Link</a> for example, will stay on the same page.

Thus, the form is submitted to the same page, which then processes the data  -->
		
				<form  action="#" method="post">
				
					<div align="left">
						<label class="form-lable">StudentName:</label>
					    <input type="text" class="form-control" name="sname" id="sname" required >
					</div>
					
					
					<div align="left">
						<label class="form-lable">Course:</label>
					    <input type="text" class="form-control" name="course" id="course" required >
					</div>
					
					<div align="left">
						<label class="form-lable">Fee:</label>
					    <input type="text" class="form-control" name="fee" id="fee" required >
					</div>
					
					<div align="left" class="mt-2">
						
					    <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
					     <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
					</div>
					
				</form>
			</div>
			<div class="col-sm-8"> 
		<!--table creation  -->	
		
		 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                         	<tr>
                         		<th>ID</th>
                         		<th>Student Name</th>
                         		<th>Course</th>
                         		<th>Fee</th>
                         		<th>Edit</th>
                         		<th>Delete</th>
                         	</tr>
                         </thead>
                          
                           
                           <%
                           
                           Connection conn;
                 		
                 			ResultSet rs;
                 			Class.forName("com.mysql.cj.jdbc.Driver"); 
                 			conn=DriverManager.getConnection(  
                 					"jdbc:mysql://localhost:3306/schooll","root","root");  
                 			Statement stmt=conn.createStatement();  
                 			 rs=stmt.executeQuery("select * from records");  
                 			
                 			 while(rs.next())
                 			 {
                 				 String id=rs.getString("id");
                 				 
                 				
                 				 %>
                 				 
                 				 <tr>
                           			<td><%= id%></td>
                           			<td><%= rs.getString("stname") %></td>
                           			<td><%= rs.getString("course") %></td>
                           			<td><%= rs.getString("fee") %></td>
                           			<td> <a href="update.jsp?id=<%= id%>">Edit</a>  </td>
                           			<td> <a href="delete.jsp?id=<%= id%>">Delete</a>  </td>
                           		
                           		
                           		</tr>
                           		
                           		
                 	 <%
                 			 }
                 	%>
                 			 
                          
                           		
                           		
                          
                     </table>    
                 </div>
			</div>
		</div>
</body>
</html>