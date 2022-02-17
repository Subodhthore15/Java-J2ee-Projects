 <%@page import="java.sql.*" %>

<%
  		
  			String id=request.getParameter("id");
  			
  			
  			Connection conn;
  			PreparedStatement pst;
  			ResultSet rs;
  			Class.forName("com.mysql.cj.jdbc.Driver"); 
  			conn=DriverManager.getConnection(  
  					"jdbc:mysql://localhost:3306/schooll","root","root");  
			
  			String sql ="DELETE FROM records where id="+id+"; ";
  			
  			pst=conn.prepareStatement(sql);
  			
  		
  			pst.executeUpdate();
  			
  			
  			%>
  			
  				<script>
  					alert("record Deleted");
  				</script>
  			<%
  		
  			%>
  		
  	<a href="index.jsp"> Go to index</a>
