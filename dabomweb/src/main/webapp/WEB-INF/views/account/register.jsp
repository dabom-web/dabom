<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Insert title here</title>

<link rel="icon" type="image/png" sizes="16x16" href="/dabomweb/resources/images/favicon.png">
<link href="/dabomweb/resources/css/style.css" rel="stylesheet">

</head>
<body class="h-100">
    <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <h4 class="text-center mb-4">회원가입</h4>
                                    <form action="index.html">
                                        <div class="form-group">
                                            <label><strong>이름</strong></label>
                                            <input type="text" class="form-control" placeholder="이름을 입력하세요">
                                        </div>
                                        <div class="form-group">
                                            <label><strong>생년월일</strong></label>
                                            <input type="text" class="form-control" placeholder="6자리를 입력하세요">
                                        </div>
                                         <div class="form-group">
                                            <label><strong>아이디</strong></label>
                                            <input type="text" class="form-control" placeholder="아이디를 입력하세요">
                                        </div>  
                                         <div class="form-group">
                                            <label><strong>닉네임</strong></label>
                                            <input type="text" class="form-control" placeholder="닉네임을 입력하세요">
                                        </div>  
                                        <div class="form-group">
                                            <label><strong>비밀번호</strong></label>
                                            <input type="password" class="form-control" value="비밀번호 확인">
                                        </div>
                                         <div class="form-group">
                                            <label><strong>비밀번호 확인</strong></label>
                                            <input type="password" class="form-control" value="비밀번호 확인">
                                        </div>
                                         <div class="form-group">
                                            <label><strong>이메일</strong></label>
                                            <input type="email" class="form-control" placeholder="hello@example.com">
                                        </div>
                                          <div class="form-group">
                                            <label><strong>핸드폰</strong></label>
                                            <input type="text" class="form-control" placeholder="010-0000-0000">
                                        </div>  
                                        
                                        <div class="basic-dropdown">
		                                    <div class="dropdown">
		                                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
		                                            회원 종류
		                                        </button>
		                                        <div class="dropdown-menu">
		                                            <a class="dropdown-item" href="#">일반 회원</a>
		                                            <a class="dropdown-item" href="#">영상 업로더</a>
		                                            <a class="dropdown-item" href="#">웹툰 업로더</a>
		                                        </div>
		                                    </div>
		                                </div>
                                        
                                        <div class="text-center mt-4">
                                            <button type="submit" class="btn btn-primary btn-block">Sign me up</button>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3">
                                        <p>Already have an account? <a class="text-primary" href="/dabomweb/account/login">Sign in</a></p>
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
    <!--endRemoveIf(production)-->
</body>
</html>