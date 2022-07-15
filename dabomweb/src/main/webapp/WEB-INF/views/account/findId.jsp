<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>findId</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/dabomweb/resources/images/favicon.png">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">
<style type="text/css">

	body {
			background-color: #050a23;
			opacity: 0.9;
		  }

</style>
</head>
<body>
    <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <h4 class="text-center mb-4">비밀번호 찾기</h4>
                                    <form id="loginform" method="post" action="/dabomweb/account/login">
                                        <div class="form-group">
                                            <label><strong>아이디</strong></label>
                                            <input type="text" id="memberId" name="memberId" class="form-control" placeholder="아이디를 입력하세요">
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Email</strong></label>
                                            <input type="email" id="email" name="email" class="form-control" placeholder="이메일을 입력하세요">
                                        </div>
                                        <div class="form-row d-flex justify-content-between mt-4 mb-2">
                                            <div class="form-group">
                                             
                                            </div>
                                           
                                        </div>
                                        <div class="text-center">
                                            <a href="javascript:" id="login" class="btn btn-primary btn-block">비밀번호 찾기</a>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3">
                                        <p>Don't have an account? <a class="text-primary" href="/dabomweb/account/register">Sign up</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="/dabomweb/resources/vendor/global/global.min.js"></script>
    <script src="/dabomweb/resources/js/quixnav-init.js"></script>
    <script src="/dabomweb/resources/js/custom.min.js"></script>