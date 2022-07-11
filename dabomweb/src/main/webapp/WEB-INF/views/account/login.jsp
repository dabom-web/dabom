<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>LOGIN</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/dabomweb/resources/images/favicon.png">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">

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
                                    <h4 class="text-center mb-4">로그인</h4>
                                    <form id="loginform" method="post" action="/dabomweb/account/login">
                                        <div class="form-group">
                                            <label><strong>아이디</strong></label>
                                            <input type="text" id="memberId" name="memberId" class="form-control" placeholder="아이디를 입력하세요">
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Password</strong></label>
                                            <input type="password" id="passwd" name="passwd" class="form-control" placeholder="Password">
                                        </div>
                                        <div class="form-row d-flex justify-content-between mt-4 mb-2">
                                            <div class="form-group">
                                                <div class="form-check ml-2">
                                                    <input class="form-check-input" type="checkbox" id="basic_checkbox_1">
                                                    <label class="form-check-label" for="basic_checkbox_1">아이디 기억</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <a href="page-forgot-password.html">비밀번호를 잃어버리셨나요?</a>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <a href="javascript:" id="login" class="btn btn-primary btn-block" >Sign me in</a>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3">
                                        <p>Don't have an account? <a class="text-primary" href="resources/page-register.html">Sign up</a></p>
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

	<script type="text/javascript">
	$(function() {		
	
		$('#login').on("click",function(event){
			event.preventDefault();
			if(!check()){
				return;
			}
			$('#loginform').submit();
		})

		function check(){
			var memberId = document.getElementById("memberId");
			var passwd = document.getElementById("passwd");
			
			if(memberId.value==""){
				alert("아이디를 입력해주세요")
				return false;
			}else if(passwd.value==""){
				alert("비밀번호를 입력해주세요")
				return false;
			}
			return true;
		}
		
		if(${not empty param.loginFail}) {
			alert("올바른 아이디와 비밀번호를 입력해주세요");
			location.href="login";
		}
	
		
	});
	
	
	
	</script>
	
	

</body>
</html>