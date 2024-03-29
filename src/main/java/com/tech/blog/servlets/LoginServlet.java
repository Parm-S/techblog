package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet", urlPatterns="/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		try
		{
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			//validations
			
			//authenticating user
			Userdao userDao =  new Userdao();
			User user = userDao.getUserByEmailAndPassword(email, password);
			HttpSession httpSession = request.getSession();
			if(user==null)
			{
				
				httpSession.setAttribute("message", "Invalid Details !! Try with another one");
				response.sendRedirect("login_page.jsp");
				return;
			}
			else
			{
				httpSession.setAttribute("currentUser", user);
				response.sendRedirect("profile.jsp");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}

}
