<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>회원가입</title>

<link rel="icon" type="image/png" sizes="16x16" href="/dabomweb/resources/images/favicon.png">
<link href="/dabomweb/resources/css/style.css" rel="stylesheet">
<style type="text/css">

	body {
			background-color: #050a23;
			opacity: 0.9;
		  }

</style>
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
                                    <form id="writeform" method="post" action="/dabomweb/account/register">
                                        <div class="form-group">
                                            <label><strong>이름</strong></label>
                                            <input type="text" id="userName" name="userName" class="form-control" placeholder="이름을 입력하세요">
                                        </div>
                                        <div class="form-group">
                                            <label><strong>생년월일</strong></label>
                                            <input type="text" id="birth" name="birth" class="form-control" placeholder="6자리를 입력하세요">
                                        </div>
                                         <div class="form-group">
                                            <label><strong>아이디</strong></label>
                                            <input type="text" id="memberId" name="memberId" class="form-control" placeholder="아이디를 입력하세요">
                                        </div>  
                                         <div class="form-group">
                                            <label><strong>닉네임</strong></label>
                                            <input type="text" id="nickName" name="nickName" class="form-control" placeholder="닉네임을 입력하세요">
                                        </div>  
                                        <div class="form-group">
                                            <label><strong>비밀번호</strong></label>
                                            <input type="password" id="passwd" name="passwd" class="form-control" placeholder="Password">
                                        </div>
                                         <div class="form-group">
                                            <label><strong>비밀번호 확인</strong></label>
                                            <input type="password" id="confirm" name="confirm" class="form-control" placeholder="Password">
                                        </div>
                                         <div class="form-group">
                                            <label><strong>이메일</strong></label>
                                            <input type="email" id="email" name="email" class="form-control" placeholder="hello@example.com">
                                        </div>
                                          <div class="form-group">
                                            <label><strong>핸드폰</strong></label>
                                            <input type="text" id="phone" name="phone" class="form-control" placeholder="010-0000-0000">
                                        </div>  
                                  
                                 			<select id="single-select" name="type">
			                                    <option value="AL">일반회원</option>
			                                    <option value="WY">영상업로더</option>
			                                    <option value="WY">웹툰업로더2</option>
			                                </select>
                                        
                                        <div class="text-center mt-4">
                                            <a href="javascript:" id="write" class="btn btn-primary btn-block">Sign me up</a>
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
    
    <script type="text/javascript">
    
	  	$('#write').on("click", function(event){
			event.preventDefault();
			if (!check()) {
				return;
			}	
			$('#writeform').submit();
		})
    		
		// 회원가입 유효성 검사
		
    	function check(){
			var userName = document.getElementById("userName");
			var birth = document.getElementById("birth");
			var memberId = document.getElementById("memberId");
			var nickName = document.getElementById("nickName");
			var passwd = document.getElementById("passwd");
			var confirm = document.getElementById("confirm");
			var email = document.getElementById("email");
			var phone = document.getElementById("phone");		
			
			
			if(userName.value=="" || !isKoreaOnly(userName.value)){
				alert("이름을 정확히 입력하세요")	
				return false;
			}else if(!isCheckBirth(birth.value)){
				alert("6자리 생년월일 입력하세요")
				return false;
			}else if(memberId.value=="" || !isCheckId(memberId.value)){
				alert("4~12자리 아이디를 입력하세요(영문,숫자)")
				return false;
			}else if(nickName.value=="" ){
				alert("별명을 입력하세요(한글,영문,숫자)")
				return false;
			}else if(passwd.value==""){
				alert("비밀번호를 입력하세요")	
				return false;
			}else if(confirm.value !== passwd.value){
				alert("비밀번호가 일치하지 않습니다")	
				return false;
			}else if(email.value==""){
				alert("올바른 이메일 형식을 입력해주세요")	
				return false;
			}else if(!isCheckPhone(phone.value) ) {
				alert("11자리 핸드폰 번호를 입력하세요");
				return false;
			}
			return true;
    	}
    	
    		function isCheckBirth(text) { 
				var checkBirth = /^[0-9]{6}$/; // 숫자만 입력하는 정규식, 함수로 뺀 이유는 얘는 위치를 기억하므로 함수로 처리를 하지 않으면 111, 111 이렇게 똑같이 세자리씩 들어오면 인식을 하지 x 
				return checkBirth.test(text);
    		} 
    		
    		function isCheckPhone(text){
    			var checkPhone = /^[0-9]{11}$/;
    			return checkPhone.test(text);
    		}
    		
     		function isCheckId(text){
    			var checkId = /^[a-zA-Z0-9]{4,12}$/;
    			return checkId.test(text);
    		} 
    		
    		function isKoreaOnly(text){
    			var checkKorea =/^[가-힣]/;
    			return checkKorea.test(text);
    		}
    		
    		function isNickName(text){
    			var checkNickName =/^[a-zA-Z가-힣]/;
    			return checkNickName.test(text);
    		}
    		
    		/* fucntion isCheckEmail(text){
    			var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    			return checkEmail.test(text);
    		} */


    
    		
	</script>
    
</body>
</html>