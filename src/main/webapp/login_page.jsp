<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

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
 
 <%@include file="navbar.jsp" %>
 
 <main class="d-flex align-items-center primary-background banner-background" style="height: 80vh">
  <div class="container " >
  
     <div class="row">
       
          <div class="col-md-4 offset-md-4">
          
              <div class="card">
                 
                 <div class = "card-header primary-background text-white text-center">
                 <br>
                  <span class="fa fa-user-circle-o fa-3x"></span>
                  <br>
                   <p>Login here</p> 
                 </div>
                 
                  <div class = "card-body">
                    <form action="LoginServlet" method="post">
                       
                           <%@include file="message.jsp" %>
                    
						  <div class="mb-3">
						    <label for="email" class="form-label">Email address</label>
						    <input name="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" required>
						  </div>
					
						  <div class="mb-3">
						    <label for="password" class="form-label">Password</label>
						    <input name="password" type="password" class="form-control" id="password" required>
						  </div>
						  <div class="mb-3">
						    <a href="register_page.jsp" >if you are not Registered.Click here...</a>
						    
						  </div>
						  <div class="container text-center">
						  <button type="submit" class="btn btn-outline-primary  btn-lg ">Login</button>
					      </div>   
						</form>
                 </div>
              
              
              </div>
          
          </div>
   
     </div>  
  
  </div>
</main>



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