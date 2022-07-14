<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>채널만들기</title>
    <link rel="icon" type="image/png" sizes="16x16" href="/dabomweb/resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />
   
<!--********************************** Content body start ***********************************-->

   <div class="content-body">
       <div class="container-fluid">
           <div class="row page-titles mx-0">
               <div class="col-sm-6 p-md-0">
                   <div class="welcome-text">
                       <h4>채널 만들기</h4>
                       <p class="mb-1">channel create</p>
                   </div>
               </div>               
           </div>
           <!-- row -->
           <div class="row justify-content-center">
               <div class="col-lg-12">
                   <div class="card">
                       <div class="card-header justify-content-center">                         
                           <h4><br>정보를 입력하세요</h4>
                       </div>
                       <div class="card-body justify-content-center">
                           <div class="form-validation">
                               <form class="form-valide" action="#" method="post">
                                   <div class="row">
                                       <div class="col-xl-8" style="float: none; margin: 0 auto;">
                                           <div class="form-group row justify-content-center">
                                               <label class="col-lg-2 col-form-label" for="val-username">채널 이름
                                                   <span class="text-danger">*</span>
                                               </label>
                                               <div class="col-lg-8">
                                                   <input type="text" class="form-control" id="val-username" name="val-username" placeholder="Enter a username..">
                                               </div>
                                           </div>
                                           <div class="form-group row justify-content-center">
                                               <label class="col-lg-2 col-form-label" for="val-email">Email <span
                                                       class="text-danger">*</span>
                                               </label>
                                               <div class="col-lg-8">
                                                   <input type="text" class="form-control" id="val-email" name="val-email" placeholder="Your valid email..">
                                               </div>
                                           </div>
                                           <div class="form-group row justify-content-center">
                                               <label class="col-lg-2 col-form-label" for="val-password">Password
                                                   <span class="text-danger">*</span>
                                               </label>
                                               <div class="col-lg-8">
                                                   <input type="password" class="form-control" id="val-password" name="val-password" placeholder="Choose a safe one..">
                                               </div>
                                           </div>
                                           <div class="form-group row justify-content-center">
                                               <label class="col-lg-2 col-form-label" for="val-confirm-password">Confirm Password <span
                                                       class="text-danger">*</span>
                                               </label>
                                               <div class="col-lg-8">
                                                   <input type="password" class="form-control" id="val-confirm-password" name="val-confirm-password" placeholder="..and confirm it!">
                                               </div>
                                           </div>
                                           <div class="form-group row justify-content-center">
                                               <label class="col-lg-2 col-form-label" for="val-suggestions">Suggestions <span
                                                       class="text-danger">*</span>
                                               </label>
                                               <div class="col-lg-8">
                                                   <textarea class="form-control" id="val-suggestions" name="val-suggestions" rows="5" placeholder="What would you like to see?"></textarea>
                                               </div>
                                           </div> 
                                           <div class="form-group row justify-content-center">
                                               <div class="col-lg-8 ml-auto">
                                                   <button type="submit" class="btn btn-primary">Submit</button>
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               </form>
                           </div>
                       </div>
                   </div>
               </div>               
           </div>
       </div>
   </div>
       
<!--********************************** Content body end ***********************************-->

	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

</body>
</html>