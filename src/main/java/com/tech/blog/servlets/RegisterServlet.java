package com.tech.blog.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.User;

/**
 * Servlet implementation class RegisterServlet
 */


@WebServlet(name="RegisterServlet", urlPatterns="/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		String check =  request.getParameter("check");
		if (check==null)
		{
			  response.setContentType("text/html");
			  PrintWriter out=response.getWriter();
			  out.println("Check Box not Checked");
			  /*out.println("<h3>Register again</h3>");*/
	     }
		else 
		{
			String username = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String dob = request.getParameter("user_dateofbirth");
			Date dateofbirth = new SimpleDateFormat("yyyy-MM-dd").parse(dob);
			String gender = request.getParameter("gender");
			Part part = request.getPart("user_profilepicture");
			User user = new User();
			
			user.setUsername(username);
			user.setEmail(email);
			user.setPassword(password);
			user.setDateofbirth(dateofbirth);
			user.setGender(gender);
			user.setProfilepicture(part.getSubmittedFileName());
			
			Userdao userdao = new Userdao();
			if(userdao.saveUser(user))
			{
				//save
				PrintWriter out=response.getWriter();
				out.println("done");
				//pic upload
				
				String path = request.getRealPath("image") + File.separator + "userprofile" + File.separator +part.getSubmittedFileName();
				System.out.println(path);
				
				try 
				{
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				//reading data
				byte [] data = new byte[is.available()];
				is.read(data);
				//writing data
				fos.write(data);
				fos.close();
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
			else {
				PrintWriter out=response.getWriter();
				out.println("error");
			}
			/*
			if(userdao.saveUser(user))
			{
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("success.jsp");
				requestDispatcher.forward(request, response);
			}
			else 
			{
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("error.jsp");
				requestDispatcher.forward(request, response);
			} */
		}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
