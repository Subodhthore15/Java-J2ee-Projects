package com.subodh.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseLink {

	static public Connection getConn() throws ClassNotFoundException, SQLException
	{
		Connection conn;
		Class.forName("com.mysql.cj.jdbc.Driver");  
		
		conn=DriverManager.getConnection(  
				"jdbc:mysql://localhost:3306/userauthproject","root","root");  
		
		return conn;
	
	
	}

}
