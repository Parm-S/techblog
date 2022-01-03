package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet(name="AddPostServlet", urlPatterns="/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
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
		
		String pTittle = request.getParameter("ptittle");
		System.out.println("the tittle is :" +pTittle);
		String pContent = request.getParameter("pcontent");
		String pCode = request.getParameter("pcode");
		int cid=Integer.parseInt(request.getParameter("cid"));
		Part part = request.getPart("pic");
		//getting currentuserid
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("currentUser");
		user.getUserid();
		Post p = new Post();
		p.setpTittle(pTittle);
		p.setpContent(pContent);
		p.setpCode(pCode);
		p.setPicture(part.getSubmittedFileName());
		p.setPcategory(cid);
		p.setUserid(user);
		
		PostDao dao=new PostDao();
		if(dao.savePost(p))
		{
			PrintWriter out = response.getWriter();

			String path = request.getRealPath("/")+ File.separator + "image" + File.separator + "blog_pics"+File.separator + part.getSubmittedFileName();
			System.out.println(path);
		//	String pathOldFile = request.getRealPath("/")+ File.separator + "image" + File.separator + "userprofile"+File.separator + oldFile;
			Helper.saveFile(part.getInputStream(), path);
			out.println("done");
		}
		else {
			PrintWriter out = response.getWriter();
			out.println("error");
		}
	}

}
