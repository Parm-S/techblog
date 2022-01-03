<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.Userdao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%

User user = (User)session.getAttribute("currentUser");
if(user==null)
{
	response.sendRedirect("login_page.jsp");
}

%>
<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao pd1 = new PostDao();
Post pt = pd1.getPostByPostId(postId);
System.out.println(pt.getUserid());

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- css -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
<link href="css/mystyle.css" rel= "stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    
    .banner-background{
      clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 70% 85%, 30% 100%, 0 86%, 0 0);
    }
    .post-tittle{
       font-weight:200;
       font-size:30px;
    }
    .post-content{
       font-weight:200;
       font-size:25px;
    }
    .post-date{
      font-style:italic;
      font-weight:bold;
    }
    .post-user{
       font-size:20px;
       font-weight:300;
    }
    .row-user{
        border:1px solid #e2e2e2;
        padding-top:15px;
    }
     body{
      background:url(image/techblog1.png);
      background-size:cover;
      background-attachment:fixed;
    }
   
</style>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v11.0&appId=1601486410005254&autoLogAppEvents=1" nonce="UlvWPrid"></script>
<title><%= pt.getpTittle() %>|TechBlog</title>

</head>
<body>

<!-- navbar -->
        
         <nav class="navbar navbar-expand-lg navbar-dark primary-background">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="index.jsp"><span class="fa fa-gears"></span> TechBlog</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="profile.jsp"><span class="fa fa-home"></span> Home</a>
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
			            <li><a class="dropdown-item" href="#"><%=cc2.getName() %></a></li>
			              <% 	  
            		      }
					  %>

			          </ul>
			        </li>
				      <li class="nav-item">
				          <a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact</a>
				       </li>
				        <li class="nav-item">
				          <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-pencil-square"></span> Do Post</a>
				       </li> 
				      
			      </ul>
			      <ul class="navbar-nav mr-right">
			            
			            <li class="nav-item">
				          <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profilemodal"><span class="fa fa-user-circle"></span>  <%= user.getUsername() %></a>
				       </li>
				       
			           <li class="nav-item">
				          <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a>
				       </li>
			      
			      </ul>
			    </div>
			  </div>
			</nav>
        
        <!-- end of navbar -->
        
         <%@include file="message.jsp" %>
         <!-- main content of body -->
         
         <div class="container">
            <div class="row my-4">
               
               <div class="col-md-8 offset-md-2">
               
                <div class="card">
                
                   <div class="card-header primary-background text-white">
                       
                       <h4 class="post-tittle"><%= pt.getpTittle() %></h4> 
                   
                   </div>
                  <div class="card-body">
                       <div class="text-center">
                      <img src="image/blog_pics/<%= pt.getPicture() %>" class="card-img-top my-2  " alt="No-image" style="max-height:300px; max-width:500px;" >
                      </div>
                      <div class="row my-3 row-user">
                         <div class="col-md-8">
                         <% 
                           Userdao ud = new Userdao();
                           User use = pt.getUserid();
                           System.out.println(use);
                         %>
                           <p class="post-user">Posted By: <a href="#"></a></p>
                         </div>
                         <div class="col-md-4">
                             <p class="post-date"><%= DateFormat.getDateTimeInstance().format(pt.getpDate()) %>
                         </div>
                      </div>
                      <p class="post-content"><%= pt.getpContent() %></p>
                      <br>
                      <br>
                      <div class="post-code">
                        <pre><%= pt.getpCode() %></pre>
                      </div>
                  
                  </div>
                  
                   <!-- <div class="card-footer primary-background text-center">
      
          
			           <a href="#!" onclick="doLike(<%= pt.getPid() %>,<%= user.getUserid() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i>
			           <span>10</span></a>
			           
			           <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i>
			           <span>10</span></a>
			      </div> -->
			      <div class="card-footer" style="background:#fce4ec;">
			          <div class="fb-comments" data-href="http://localhost:8080/TechBlog/show_blog_page.jsp?post_id=<%=pt.getPid() %>" data-width="" data-numposts="5"></div>
			      </div>
                
                </div>
               
               
               
               </div>
            
            
            </div>
         
         </div>


        <!-- end main content of body -->
        
         
        <!-- profile modal -->
        <!-- Button trigger modal -->
	
	<!-- Modal -->
	<div class="modal fade" id="profilemodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header primary-background text-white text-center">
	        <h5 class="modal-title" id="staticBackdropLabel">TechBlog</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="container text-center">
	            <img src="image\userprofile\<%= user.getProfilepicture() %>" class="img-fluid" style="border-radius:50%; max-width:200px;">
	            <br>
	            <h5 class="modal-title mt-3 mb-3" id="staticBackdropLabel"><%= user.getUsername() %></h5>
	            <!-- Details -->
	            
	            <div id="profile-details">
	            <table class="table table-striped" >
                  
					  <tbody>
					    <tr>
					      <th scope="row">ID :</th>
					      <td><%= user.getUserid() %></td>
					      
					    </tr>
					    <th scope="row">Name :</th>
					    <td><%= user.getUsername().toUpperCase() %></td>
					    <tr>
					      <th scope="row">Email :</th>
					      <td><%= user.getEmail() %></td>
					    </tr>
					    <tr>
					      <th scope="row">Date of Birth :</th>
					      <td><%  SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
					              String dob = sdf.format(user.getDateofbirth());%> <%= dob %></td>
					    </tr>
					    <tr>
					      <th scope="row">Gender :</th>
					      <td><%= user.getGender().toUpperCase() %></td>
					    </tr>
					  </tbody>
					
                </table>
                </div>
                
                <!-- profile-edit -->
                <div id="profile-edit" style="display:none;">
                  <h3 class="mt-2">Please Edit Carefully</h3>
                  <form action="EditServlet" method="post" enctype="multipart/form-data">
                     <table class="table table-striped" >
                       <tr>
                          <td>ID :</td>
                           <td><%= user.getUserid() %></td>
                       </tr>
                       <tr>
                          <td>Name :</td>
                           <td><input type="text" class="form-control" name="username" value="<%= user.getUsername() %>"></td> 
                       
                       </tr>
                       <tr>
                          <td>Email :</td>
                           <td><input type="email" class="form-control" name="useremail" value="<%= user.getEmail() %>"></td> 
                       </tr>
                       <tr>
                          <td>Password :</td>
                           <td><input type="password" class="form-control" name="userpassword" value="<%= user.getPassword() %>"></td> 
                       </tr>
                       <tr>
                          <td>Gender :</td>
                           <td><%= user.getGender().toUpperCase() %></td> 
                       </tr>
                       <tr>
                          <td>Date of Birth:</td>
                           <td><input type="date" class="form-control" name="userdateofbirth" value="<%= user.getDateofbirth() %>" ></td>
                           <% System.out.println(user.getDateofbirth()); %> 
                       </tr>
                       <tr>
                          <td>New Profile:</td>
                           <td><input type="file" class="form-control" name="userimage"></td> 
                       </tr>
                     
                     </table>
                     <div class="container">
                       <button type="submit" class="btn btn-outline-success">Save</button>
                     </div>
                  </form>
                
                </div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
	      </div>
	    </div>
	  </div>
	</div>
	        
	        
        
        <!-- end of profile modal -->
        
        <!-- Post Modal -->
        
        
        
	     <div class="modal fade" id="add-post-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Provide the Post Details</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		         
		          <form id="add-post-form" action="AddPostServlet" method="post"  enctype="multipart/form-data">
		           <div class="form-group">
		           <select class="form-control" name="cid">
		             <option selected disabled>---Select the Category---</option>
		             
		             <%
		              PostDao postd = new PostDao();
		             ArrayList<Category> list = postd.getAllCategories();
		             for(Category c:list)
		             {
		             %>
		             <option value="<%= c.getCid() %>"><%= c.getName() %></option>
		             <%
		             }
		             %>
		           </select>
		           </div>
		            <div class="form-group">
		              <label for="tittle" class="form-label">Tittle</label>
		              <input type="text" name="ptittle" placeholder="Enter the Post Tittle" class="form-control"/>
		            </div>
		            <div class="form-group">
		              <label for="content" class="form-label">Content</label>
		               <textarea name="pcontent" style="height:200px;" class="form-control" placeholder="Enter Your Content"></textarea>
		            </div>
		            <div class="form-group">
		              <label for="code" class="form-label">Code</label>
		               <textarea name="pcode" style="height:200px;" class="form-control" placeholder="Enter Your Code (if any)"></textarea>
		            </div>
		            <div class="form-group">
		            <label for ="postpic" class="form-label">Post Image</label>
		            <input type="file" name ="pic" class="form-control"/>
		            </div>
		            <br>
		            <div class="container text-center">
		              
		             <button type="submit" class="btn btn-outline-primary">Post</button>
		         </div>
		           
		           </form>
		      </div>
		      
		    </div>
		  </div>
		 </div>
		        
        
        <!-- End of Post Modal -->
        
        
        
         <!-- javascript -->
   <script  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous">
   </script>
   
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" 
   integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" 
   crossorigin="anonymous">
   </script>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" 
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" 
    crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <script src = "js/myjs.js" type = "text/javascript">
   </script>
   <script>
      $(document).ready(function(){
    	  let editStatus=false;
    	  $('#edit-profile-button').click(function()
    			  {
    		  
    		     if(editStatus==false)
    			  {
    			  $("#profile-details").hide()
        		  
        		  $("#profile-edit").show();
    			  console.log(editStatus);
    			  editStatus = true;
    			  $(this).text("Back")
    			  console.log(editStatus);
    			  }
    		     else
    		     {
    				  console.log(editStatus);
    				  $("#profile-edit").hide()
    	    		  
    	    		  $("#profile-details").show();
    				  
    				  editStatus = false;
    				  $(this).text("Edit")
    				  console.log(editStatus);
    			  }
    		  
    	  });
    	  
      }); 
   
   </script>
   
  <!--   now add post js -->
  
  <script>
      $(document).ready(function (e){
    	  
    	  $("#add-post-form").on("submit",function(event){
    		  //this code get called when form is submitted
    	       event.preventDefault();
    		  
    		   let form = new FormData(this);
    		   
    		   //now requesting to server
    		   $.ajax({
    			   url:"AddPostServlet",
    			   type:'POST',
    			   data: form,
    			   success: function(data, textStatus, jqXHR){
    				   if(data.trim()=='done')
    					   {
    					   swal({tittle:"Good job!",
    							   text:"Saved Successfully!!",
    							   type:"success"}).then(function(){
    								   window.location.href = 'profile.jsp';
    								   console.log('The Ok Button was clicked.')
    							   });
    					   }
    				   else
    					   {
    					   swal("Error!", "Something went wrong try again...", "error");
    					   }
    				
    			   },
    			   error: function(jqXHR, textStatus, errorThrown){
    				   swal("Error!", "Something went wrong try again...", "error");
    			   },
    			   processData:false,
    			   contentType:false
    		   });
    	  });
      });
  
  </script>
  <script >
   function doLike(pid,uid)
   {
	   console.log(pid + "," + uid)
	   const d ={
		   uid:uid,
		   pid:pid,
		   operation:'like'
	   }
	   $.ajax({
		   url:"LikeServlet",
		   data: d,
		   success: function(data,textstatus,jqXHR){
			   console.log(data);
		   },
		   error: function(jqXHR, textStatus,errorThrown)
		   {
			   console.log(data);
		   }
	   })
   }
  </script>
  

</body>
</html>