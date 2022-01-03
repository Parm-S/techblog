<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>TechBlog</title>

<!-- css -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
<link href="css/mystyle.css" rel= "stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    .banner-background{
      clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 70% 85%, 30% 100%, 0 86%, 0 0);
    }
</style>


</head>
<body>

    <!-- navbar -->
    	
	 <%@include file = "navbar.jsp"%>	
	
	<!-- banner --> 
	
	<div class = "container-fluid p-0 m-0 banner-background">
	 <!-- full width -->
	 
	  
	  <div class ="jumbotron primary-background text-white mb-3  p-3 ">
	  <div class ="container " >
	  
	     <h3 class = "display-3"> Welcome to TechBlog</h3>
	     
	     <p>Welcome to technical blog, world of technology. 
	        A programming language is a formal language comprising a set of strings that produce various kinds of machine code output. 
	        Programming languages are one kind of computer language, and are used in computer programming to implement algorithms. 
	     </p>
	     
	     <p>
	     Most programming languages consist of instructions for computers. 
	     There are programmable machines that use a set of specific instructions, rather than general programming languages.
	     </p>
	     
	     <p>
	     The description of a programming language is usually split into the two components of syntax (form) and semantics (meaning). 
	     Some languages are defined by a specification document (for example, the C programming language is specified by an ISO Standard) while other languages (such as Perl) have a dominant implementation that is treated as a reference. 
	     Some languages have both, with the basic language defined by a standard and extensions taken from the dominant implementation being common.
	     </p>
	     
	     <a href="register_page.jsp" class= "btn btn-outline-light btn-lg mb-5"><span class="fa fa-user-plus"></span> Start ! its Free</a>
	      <a href="login_page.jsp" class= "btn btn-outline-light btn-lg mb-5 "><span class="fa fa-sign-in fa-spin"></span> Login</a>
	  
	   </div>
	  </div> 
	  
	</div> 
	
	<br>
	<!-- cards -->
	
	<div class="container">
	
	     <div class="row mb-3">
	        
	          <div class="col-md-4">
	             <div class="card" >
					  
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
	          </div>
	          
	          <div class="col-md-4">
	             <div class="card" >
					  
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
	          </div>
	          
	          <div class="col-md-4">
	             <div class="card" >
					  
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
	          </div>
	     </div>
	     
	     <div class="row mb-3">
	        
	          <div class="col-md-4">
	             <div class="card" >
					  
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
	          </div>
	          
	          <div class="col-md-4">
	             <div class="card" >
					  
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
	          </div>
	          
	          <div class="col-md-4">
	             <div class="card" >
					  
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
	          </div>
	     </div>
	     
	</div>

			   
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
    
   <script src = "js/myjs.js" type = "text/javascript">
   </script>
</body>
</html>