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
	
	
</style>

</head>
<body>


<body class="h-100" >	
    <div class="h-100">
    <div class="authincation h-100">
        <div class="container-fluid h-100">        
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">                    
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <h4 class="text-center mb-4">비활성화 회원입니다.</h4>                                  
                                    <form id="active-form" method="post" action="active-change">
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
                                            </div>
                                            <div class="form-group">
                                                <a href="/dabomweb/account/findId">비밀번호를 잃어버리셨나요?</a>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <a href="javascript:" id="active" class="btn btn-primary btn-block" style="vertical-align: center;" >
                                            비활성화 해제하기</a>
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
</div>

    <script src="/dabomweb/resources/vendor/global/global.min.js"></script>
    <script src="/dabomweb/resources/js/quixnav-init.js"></script>
    <script src="/dabomweb/resources/js/custom.min.js"></script>

</body>

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