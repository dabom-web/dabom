<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>DABOM HOME</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
    <link rel="stylesheet" href="resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    
    <style type="text/css">

	img {
		 object-fit: cover;
 		 overflow: hidden;
	}
	
	.box {
		width: 100%;
		height: 300px;
	}
	
	.text-box {
			  overflow: hidden;
			  text-overflow: ellipsis;
			  white-space: nowrap;
			  width: 100%;
			  
			}
	
</style>
    
</head>
<body>
    
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
 
    <div id="main-wrapper">
      <jsp:include page="/WEB-INF/views/modules/header.jsp"></jsp:include>
      <jsp:include page="/WEB-INF/views/modules/sidebar.jsp"></jsp:include>
    </div>
  
<div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>DABOM</h4>
                            <span class="ml-1">(대충 사이트 소개 문구)</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">DABOM</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">HOME</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->
                <div class="email-box col-lg-12">
                                   
                    
                  <div class="card">
                            <div class="card-header">
                                <h4 class="card-title"><b>업로드한 동영상</b></h4>
                            </div>
                             
                            <div class="container-fluid">
                            <div class="row page-titles mx-0">
                            
                            <c:forEach var="vUpload" items="${ videoList }">
                                <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                            <c:if test="${ vUpload.open }">
                            	
                            </c:if>
                                <a href="/dabomweb/video/detail?videoNo=${ vUpload.videoNo }">
                        <div class="card mb-3">
                            <img class="box" src='/dabomweb/resources/upload-files/${ vUpload.thumbnailSavedName }'>
                            <div class="card-header">
                                <h4 class="card-title">[${ vUpload.videoType }] ${ vUpload.videoTitle }</h4>
                                <h5 class="card-writer">${ vUpload.memberId }</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text text-box">${ vUpload.content }</p>
                                <p class="card-text text-dark">${ vUpload.uploadTime }</p>
                                <p class="card-text text-dark">조회수: ${ vUpload.readCount }</p>
                            </div>
                        </div>
                         </a>
                    </div>
                    
                    </c:forEach>
                   
                    </div>
                            </div>
                        </div>
                                    <!-- panel -->
                                    <div class="row mt-4 m-4 mx-sm-4">
                                        <div class="col-7">
                                            <div class="text-left"></div>
                                        </div>
                                        <div class="col-5">
                                            <div class="btn-group float-right">
                                                <!-- <button class="btn btn-dark" type="button"><i class="fa fa-angle-left"></i>
                                                </button>
                                                <button class="btn btn-dark" type="button"><i class="fa fa-angle-right"></i>
                                                </button> -->
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>

            </div>
        </div>





    <!-- Required vendors -->
    <script src="/dabomweb/resources/vendor/global/global.min.js"></script>
    <script src="/dabomweb/resources/js/quixnav-init.js"></script>
    <script src="/dabomweb/resources/js/custom.min.js"></script>


    <!-- Vectormap -->
    <script src="/dabomweb/resources/vendor/raphael/raphael.min.js"></script>
    <script src="/dabomweb/resources/vendor/morris/morris.min.js"></script>


    <script src="/dabomweb/resources/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="/dabomweb/resources/vendor/chart.js/Chart.bundle.min.js"></script>

    <script src="/dabomweb/resources/vendor/gaugeJS/dist/gauge.min.js"></script>

    <!--  flot-chart js -->
    <script src="/dabomweb/resources/vendor/flot/jquery.flot.js"></script>
    <script src="/dabomweb/resources/vendor/flot/jquery.flot.resize.js"></script>

    <!-- Owl Carousel -->
    <script src="/dabomweb/resources/vendor/owl-carousel/js/owl.carousel.min.js"></script>

    <!-- Counter Up -->
    <script src="/dabomweb/resources/vendor/jqvmap/js/jquery.vmap.min.js"></script>
    <script src="/dabomweb/resources/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
    <script src="/dabomweb/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>


    <script src="/dabomweb/resources/js/dashboard/dashboard-1.js"></script>


</body>
</html>