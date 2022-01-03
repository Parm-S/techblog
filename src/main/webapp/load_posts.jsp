<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class = "row">
<% 

   PostDao pd = new PostDao();
    int cId = Integer.parseInt(request.getParameter("cid"));
    System.out.println(cId);
    List<Post> posts = null;
    if(cId == 0)
    {
    	 posts = pd.getAllPosts();
    	 System.out.println(cId);
    }else
    {
    	posts = pd.getPostByCatId(cId);
    	System.out.println(cId);
    }
    if(posts.size()==0)
    {
    	out.println("<h3 class='display-3 text-center'>No Post available in this category..</h3>");
    	return;
    }

   
   for(Post p: posts)
   {
%>
    <div class="col-md-6 mt-2">
      <div class="card">
      <img src="image/blog_pics/<%= p.getPicture() %>" class="card-img-top" alt="...">
      <div class="card-body">
        <b><%= p.getpTittle() %></b>
        <p><%= p.getpContent() %></p>
        
      
      
      </div>
      <div class="card-footer primary-background text-center">
      
          
          <!--  <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i>
           <span>10</span></a> -->
           <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read More..</a>
         <!--   <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i>
           <span>10</span></a> -->
      </div>
      
      
      </div>
    
    
    </div>

<% 
   }
%>
</div>