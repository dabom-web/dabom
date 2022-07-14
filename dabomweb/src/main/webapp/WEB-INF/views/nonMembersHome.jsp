<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>다봄을 이용하시려면 로그인하세요.</title>
<link href="/dabomweb/resources/css/style.css" rel="stylesheet">
<style type="text/css">
	
	body {
			background-image: url('/dabomweb/resources/images/dabom.gif');
			background-size: cover;
			background-color: black;
			background-repeat: no-repeat;
			background-position: left -10%; 
	}
	
	.authincation {
					justify-content: center;
					 opacity: 0.7;
	
	}
	
	a:link { color:black; }
	a:visited { color:black; }
	a:hover { color:lightgray; }
	
</style>

</head>
<body>


<body class="h-100" >	
    <div class="authincation h-100" >
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                              <div class="auth-form" style=" opacity: 0.7;">
                                    <h4 class="text-center" style="font-weight: bolder;">로그인 후 이용하세요</h4>
                                    <div class="text-center" ><br><br><br>
                                    <h1>                                    
                                    <a href="/dabomweb/account/login">
                                    Sign In
                                    </a>
                                    <small>or</small>
                                    <a href="/dabomweb/account/register">
                                     Sign Up
                                    </a>                                    
                                    </h1>
                                    </div>
                                    <br><br>
                                    <div class="text-center"><a href="/dabomweb/account/findId"><span>아이디/비밀번호찾기</span></div></a>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="/dabomweb/resources/vendor/global/global.min.js"></script>
    <script src="/dabomweb/resources/js/quixnav-init.js"></script>
    <script src="/dabomweb/resources/js/custom.min.js"></script>

</body>




</body>
</html>