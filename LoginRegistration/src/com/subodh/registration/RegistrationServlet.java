package com.subodh.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.subodh.helper.DatabaseLink;


@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("Registraion servlet called");
		
		String uname= request.getParameter("name");
		String email= request.getParameter("email");
		String pwd=request.getParameter("pass");
		String contact = request.getParameter("contact");
		
		
		
		// form validation
		
		RequestDispatcher rd=null;
		
		
		if(uname==null || uname.equals(""))
		{
			request.setAttribute("status", "Invalid username");
			rd=request.getRequestDispatcher("registration.jsp");
			rd.forward(request, response);
		}
		if(email==null || email.equals(""))
		{
			request.setAttribute("status", "Invalid email");
			rd=request.getRequestDispatcher("registration.jsp");
			rd.forward(request, response);
		}
		if(pwd==null || pwd.equals(""))
		{
			request.setAttribute("status", "Invalid pwd");
			rd=request.getRequestDispatcher("registration.jsp");
			rd.forward(request, response);
		}
		if(contact==null || contact.equals(""))
		{
			request.setAttribute("status", "Invalid Contact");
			rd=request.getRequestDispatcher("registration.jsp");
			rd.forward(request, response);
		}
		
		
		Connection conn=null;
		
		PreparedStatement pst=null;
		try {
			 conn = DatabaseLink.getConn();
			 String sql = "insert into users (uname,upwd,uemail,umobile) values(?,?,?,?)";
				
			 pst=conn.prepareStatement(sql);
			 pst.setString(1,uname);
			 pst.setString(2,pwd);
			 pst.setString(3,email);
			 pst.setString(4,contact);
			 
			 int rowCount=pst.executeUpdate();// numbers of record inserted
			 
			  rd=request.getRequestDispatcher("registration.jsp");
			 
			 if(rowCount>0)// redirected to login page
			 {
				 request.setAttribute("status","success");
				
				 rd.forward(request, response);
			 
			 }
			 else {
				 
				 request.setAttribute("status","failed");
				 rd.forward(request, response);
			 }
			 
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally
		{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
	}

}
