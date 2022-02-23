package com.subodh.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.subodh.helper.DatabaseLink;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		HttpSession session = request.getSession();
		Connection conn=null;
		PreparedStatement pst=null;
		
		RequestDispatcher rd=null; 
		
		//Client side validation
		if(email==null || email.equals(""))
		{
			request.setAttribute("status","invalid Email");
				rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
		}
		
		if(password==null || password.equals(""))
		{
			request.setAttribute("status","invalid password");
				rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
		}
		
		try {
			conn= DatabaseLink.getConn();
			String sql ="select * from users where uemail=? and upwd=? ";
			
			 pst=conn.prepareStatement(sql);
			 pst.setString(1,email);
			 pst.setString(2,password);
			 ResultSet rs=pst.executeQuery();
			 if(rs.next())
			 {// After login we have to set name attribute for further use.
				 session.setAttribute("name", rs.getString("uname"));
				 
				  rd=request.getRequestDispatcher("index.jsp");
				 rd.forward(request, response);
			 }
			 else {
				 request.setAttribute("status", "failed");
				  rd=request.getRequestDispatcher("login.jsp");
				 rd.forward(request, response);
			 }
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
	}

}
