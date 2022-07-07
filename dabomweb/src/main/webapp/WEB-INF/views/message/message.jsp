<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>DABOM HOME</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
    <link rel="stylesheet" href="resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">

</head>
<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->


    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

      <jsp:include page="/WEB-INF/views/modules/header.jsp"></jsp:include>
      <jsp:include page="/WEB-INF/views/modules/sidebar.jsp"></jsp:include>




      


    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
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