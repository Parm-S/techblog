 <%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="index.jsp"><span class="fa fa-gears"></span> TechBlog</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="index.jsp"><span class="fa fa-home"></span> Home</a>
			        </li>
			        
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			          <span class="fa fa-list-alt"></span>
			            Categories
			          </a>
			          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <%
					     PostDao pd2 = new PostDao();
            		     ArrayList<Category> list2 = pd2.getAllCategories();
            		      for(Category cc2 : list2) {
            		    %>
			            <li><a class="dropdown-item" href="login_page.jsp"><%=cc2.getName() %></a></li>
			              <% 	  
            		      }
					  %>

			          </ul>
			        </li>
				      <li class="nav-item">
				          <a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact</a>
				       </li>
				        <li class="nav-item">
				          <a class="nav-link" href="login_page.jsp"><span class="fa fa-sign-in"></span> Login</a>
				       </li>
				       
				       <li class="nav-item">
				          <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span> Signup</a>
				       </li>
			      </ul>
			      <form class="d-flex">
			        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			        <button class="btn btn-outline-light" type="submit">Search</button>
			      </form>
			    </div>
			  </div>
			</nav>