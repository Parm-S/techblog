<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>

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
<!-- navabar -->

<%@include file="navbar.jsp" %>

   <main class="primary-background banner-background " style="padding-bottom: 120px; padding-top: 30px;">
   
     <div class="container">
      
        <div class="col-md-6 offset-md-3">
         
           <div class="card">
           
              <div class="card-header text-center primary-background text-white">
                <br>
                <span class="fa fa-user-circle-o fa-3x"></span>
                <br>
                <p>Register Here</p> 
              </div>
               
               <div class="card-body">
                    <form id="reg-form" action = "RegisterServlet" method ="post">
                        <div class="mb-3">
					    <label for="username" class="form-label">User Name</label>
					    <input name = "user_name" type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter the user name">
					    </div>
					    
					    <div class="mb-3">
					    <label for="email" class="form-label">Email address</label>
					    <input name ="user_email"type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder = "Enter the Email Address">
					  </div>
					  
					  <div class="mb-3">
					    <label for="password" class="form-label">Password</label>
					    <input name = "user_password" type="password" class="form-control" id="password">
					  </div>
					  
					  <div class="mb-3">
					      <label for="dateofbirth">Date of Birth:</label>
                          <input name ="user_dateofbirth" type="date" class="form-control" id="dateofbirth" name="birthday">
					  </div>
					  
					  <div class="mb-3">
					    <label for="gender" class="form-label">Select Gender</label>
					    <br>
					    <input type="radio"  id="gender" name="gender" value="male"><label for="male">Male</label>
					    
					    <input type="radio"  id="gender" name="gender" value="female"><label for="female">Female</label>
					    </div>
					    
					   <div class="mb-3">
					    <label for="profilepic" class="form-label">Upload Profile Picture</label>
					    <input name = "user_profilepicture" type="file" class="form-control" id="profilepicture" aria-describedby="emailHelp" placeholder="Enter the user name">
					   </div>
					  
					  <div class="mb-3 form-check">
					    <input name ="check" type="checkbox" class="form-check-input" id="Check" value="checked">
					    <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
					  </div>
					  <br>
					  <div class = "container text-center" id="loader" style ="display:none;">
					   <span class="fa fa-refresh fa-spin fa-4x"></span>
					   <h4>Please Wait..</h4>
					  </div>
					  <button type="submit" id = "submit-btn" class="btn btn-primary">Submit</button>
					</form>
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
   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js">
    </script>
    
   <script>
       $(document).ready(function () {
        	console.log("loaded")
        	
        	$('#reg-form').on('submit',function(event){
        		event.preventDefault();
        		//submit form data from here
        		let form = new FormData(this);
        		$("#submit-btn").hide();
        		$("#loader").show();
        		
        		// send register servlet
        		$.ajax ({
        			url: "RegisterServlet",
        			type: 'POST' ,
        			data: form,
        			success: function (data , textStatus , jqXHR){
        				console.log(data)
        				
        				$("#submit-btn").show();
                		$("#loader").hide();
                		
                		if(data.trim()==='done')
                	    {
                		     swal("Registered Successfully.. We are going to redirect to login page")
                		     .then((value) => {
                		     window.location = "login_page.jsp"
                		    });
                		}
                		else
                		{
                			swal(data);
                		}
        				
        			},
        			error: function (jqXHR , textStatus,errorThrown){
        				
        				
        				$("#submit-btn").show();
                		$("#loader").hide();
                		
                		swal("Something went wrong..try again");
                		
        			},
        			processData:false,
        			contentType:false
        		});
        	});
        });
        
   </script>
</body>
</html>