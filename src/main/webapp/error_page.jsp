<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry ! something went wrong</title>

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
   <div class ="container text-center">
         <img src ="image\error.png" class="img-fluid">
         <h3 class="display-3"> Sorry! Something went wrong...</h3>
         <%= exception %> <!-- implicit object -->
         <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
   
   
   </div>

</body>
</html>