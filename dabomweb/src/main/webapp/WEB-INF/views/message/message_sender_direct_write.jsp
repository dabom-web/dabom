<%@page import="com.dabom.dto.Member"%>
<%@page import="java.util.List"%>
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
 	<title>메세지쓰기</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
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
                            <h4>메세지 보내기!</h4>
                            <span class="ml-1">MESSAGE</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                            <a href="javascript:void()" id="go-receive-list">받은메세지</a></li>
                            <li class="breadcrumb-item active">
                            <a href="javascript:void()" id="new-message-write2">메세지작성</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="email-left-box px-0 mb-5">
                                    <div class="p-0">
                                        <a href="javascript:void()" id="new-message-write"
                                           class="btn btn-primary btn-block">새 메세지 작성</a>
                                    </div>
                                    <div class="mail-list mt-4">
                                      <a href="message_receive_list?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }" class="list-group-item active"><i
                                              class="fa fa-inbox font-18 align-middle mr-2"></i> 받은메세지 <span
                                              class="badge badge-danger text-white badge-sm float-right">${ receiveCount }</span></a>
                                      <a href="message_send_list?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }" class="list-group-item"><i
                                              class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸메세지<span
                                              class="badge badge-primary badge-sm float-right">${ sendCount }</span></a> 
                                      <a href="javascript:void()" class="list-group-item"><i
                                              class="fa fa-star font-18 align-middle mr-2"></i>메세지 보관함 <span
                                              class="badge badge-primary badge-sm float-right">?</span>
                                      </a>
                                      <a href="javascript:void()" class="list-group-item"><i
                                              class="fa fa-trash font-18 align-middle mr-2"></i>삭제된 메세지</a>
                                  </div>                                   
                                </div>
                                <div class="email-right-box ml-0 ml-sm-4 ml-sm-0">                                    
                                    <div class="compose-content">
                                        <form id="messagewriteform" action="message_sender_direct_write" 
									          method="post"	enctype="multipart/form-data">
									        <div class="form-group">
                                                <input type="text"
                                                	   id="message_Title"
                                                	   name="message_Title"                                                	                                               	   
                                                	   class="form-control bg-transparent"                                                	   
                                                	   placeholder="제목을 입력해주세요"></div>  
                                            <div class="form-group">                                            
                                                <input type="hidden"
                                                	   id="receiver"
                                                	   name="receiver"                                                	      
                                                	   value="${ message.receiver }">                                              	 
                                            </div>                                            
                                            <div class="form-group">
                                                <input type="hidden"
							 						   name="sender" id="sender" value="${ loginuser.memberId }">                                             	     						                        
                                            </div>
                                            <div class="form-group">
                                                <textarea name="message_Content" id="message_Content" 
                                                		  class="textarea_editor form-control bg-transparent" rows="15" 
                                                		  placeholder="메세지를 입력하세요"></textarea>
                                            </div>
                                        </form>                                        
                                    </div>
                                    <div class="text-left mt-4 mb-5">
                                        <button class="btn btn-primary btn-sl-sm mr-3" 
                                        		type="button" id="send" href='javascript:'><span
                                                class="mr-2"><i class="fa fa-paper-plane"></i></span>전송</button>
                                        <button class="btn btn-dark btn-sl-sm" 
                                        		type="button" id="cancel" href="javascript:"><span 
                                        		class="mr-2"><i class="fa fa-times" aria-hidden="true"></i></span>취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
<!--********************************** Content body end ***********************************-->

	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />
	

	<script type="text/javascript">
		$(function() {
			$('#new-message-write').on('click',function(event) { 
				event.preventDefault();
				var ok = confirm('이 페이지를 벗어나면 작성중인 내용은 저장되지 않습니다.');
				if (ok) {
					location.href = 'message_write?sender=${ loginuser.memberId }';
				}			
			});
		 });
		$(function() {
			$('#new-message-write2').on('click',function(event) { 
				event.preventDefault();
				var ok = confirm('이 페이지를 벗어나면 작성중인 내용은 저장되지 않습니다.');
				if (ok) {
					location.href = 'message_write?sender=${ loginuser.memberId }';
				}			
			});
		 });
		$(function() {
			$('#go-receive-list').on('click',function(event) { 
				event.preventDefault();
				var ok = confirm('이 페이지를 벗어나면 작성중인 내용은 저장되지 않습니다.');
				if (ok) {
					location.href = 'message_receive_list?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }';
				}			
			});
		 });		
		$(function() {
			$('#send').on('click',function(event) { 
				event.preventDefault();				
				var ok = confirm('메세지를 전송할까요?');
				if (ok) {					
					$('#messagewriteform').submit();
					
				}			
			});
		 });		
		$(function() {
			$('#cancel').on('click',function(event) { 
				event.preventDefault();
				var ok = confirm('메세지를 전송을 취소합니다.');
				if (ok) {
					location.href = 'message_send_list';
				}			
			});
		 });

	</script>	
	
</body>

</html>	
	
	
	
	