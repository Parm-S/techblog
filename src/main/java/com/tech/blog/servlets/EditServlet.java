package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet(name="EditServlet", urlPatterns="/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//fetch all data
		try {
		String username = request.getParameter("username");
		String useremail = request.getParameter("useremail");
		String userpassword = request.getParameter("userpassword");
		String dob = request.getParameter("userdateofbirth");
		Date dateofbirth = new SimpleDateFormat("yyyy-MM-dd").parse(dob);
		Part part = request.getPart("userimage");
		String imageName = part.getSubmittedFileName();
		
		//get user from the session..
		
		HttpSession session = request.getSession();
		User user =(User)session.getAttribute("currentUser");
		
		user.setUsername(username);
		user.setEmail(useremail);
		user.setPassword(userpassword);
		user.setDateofbirth(dateofbirth);
		String oldFile = user.getProfilepicture();
		user.setProfilepicture(imageName);
		
		//update database...
		Userdao userDao = new Userdao();
		 boolean ans = userDao.updateUser(user);
		 if(ans)
		 {
			
			
			 String path = request.getRealPath("/")+ File.separator + "image" + File.separator + "userprofile"+File.separator + user.getProfilepicture();
			 
			 
			 //delete code
			 String pathOldFile = request.getRealPath("/")+ File.separator + "image" + File.separator + "userprofile"+File.separator + oldFile;
			 Helper.deleteFile(pathOldFile);
			 
				 if(Helper.saveFile(part.getInputStream(), path))
				 {
					 PrintWriter out = response.getWriter();
					 out.println("updated");
					 session.setAttribute("message", "profile updated");
						
				 }
				 else {
					 session.setAttribute("message", "profile not updated");
				 }
			 }
		 
		 else {
			 PrintWriter out = response.getWriter();
			 out.println("not updated");
			 session.setAttribute("message", "profile not updated");
		 }
		
		 response.sendRedirect("profile.jsp");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
