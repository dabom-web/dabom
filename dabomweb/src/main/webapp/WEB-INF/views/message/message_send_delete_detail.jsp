<%@page import="com.dabom.dto.Message"%>
<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>메세지읽기</title>
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
                            <h4>메세지 읽기!</h4>
                            <span class="ml-1">MESSAGE</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="message_receive_list?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }">받은메세지</a></li>
                            <li class="breadcrumb-item active"><a href="#">메세지읽기</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="email-left-box generic-width px-0 mb-5">
                                    <div class="p-0">
                                     <a href="message_write?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }" class="btn btn-primary btn-block">새 메세지 작성</a>
                                  </div>
                                  <div class="mail-list mt-4">
                                      <a href="message_receive_list?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }" class="list-group-item"><i
                                              class="fa fa-inbox font-18 align-middle mr-2"></i> 받은메세지 <span
                                              class="badge badge-primary badge-sm float-right"></span></a>
                                      <a href="message_send_list?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }" class="list-group-item"><i
                                              class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸메세지<span
                                              class="badge badge-primary badge-sm float-right"></span></a> 
                                      <a href="javascript:void()" class="list-group-item"><i
                                              class="fa fa-star font-18 align-middle mr-2"></i>메세지 보관함 <span
                                              class="badge badge-primary badge-sm float-right"></span>
                                      </a>
                                      <a href="message_receive_delete_list?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }" class="list-group-item"><i
                                              class="fa fa-trash font-18 align-middle mr-2"></i> 받은메세지 휴지통 <span
                                              class="badge badge-primary badge-sm float-right"></span></a>                                              
                                      <a href="message_send_delete_list?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }" class="list-group-item active"><i
                                              class="fa fa-trash font-18 align-middle mr-2"></i> 보낸메세지 휴지통 <span
                                              class="badge badge-danger text-white badge-sm float-right">${ deleteSendCount }</span></a>
                                  </div>                                       
                              </div>
                                <div class="email-right-box ml-0 ml-sm-4 ml-sm-0">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="right-box-padding">                                               
                                                <div class="read-content">
                                                    <div class="media pt-3">
                                                        <img class="mr-4 rounded-circle" alt="image" src="/dabomweb/resources/images/avatar/2.png">
                                                        <div class="media-body">
                                                            <h5 class="text-primary">${ message.message_Title }</h5>
                                                        </div>
                                                        
                                                    </div><hr>
                                                        <div class="media-body"><span class="pull-right">${ message.send_Date }</span>
                                                            
                                                            <h5 class="my-1 text-primary">받은 사람 :&nbsp; 
                                                            <div class="dropdown custom-dropdown">
					                                            <button type="button" 
					                                            		class="btn btn-sm btn-outline-primary" data-toggle="dropdown">&nbsp;
					                                            		${ message.receiver }
					                                                <i class="fa fa-angle-down ml-3"></i>
					                                            </button>
					                                            <div class="dropdown-menu dropdown-menu-right">
					                                                <a class="dropdown-item" 
					                                                   href="/dabomweb/mychannel/channel?member_Id=${ message.receiver }&subscriber=${loginuser.memberId}">채널방문</a>
					                                                <a class="dropdown-item" 
					                                                   href="message_direct_write?receiver=${ message.receiver }&message_no=${ message.message_No}">
					                                                   메세지 보내기</a>					                                                
					                                            </div>
					                                        </div>
					                                     </div>    
					                                                                                  
                                                    <div class="read-content-body" >                                                    
                                                        <h5 class="pt-3"><br>
<% String enter2 = "\r\n"; %>
<c:set var="enter" value="
" />
		                								${ fn:replace(message.message_Content, enter, '<br>') }
                                                        <br><br><br><br><br><br><br><br><br><br></h5><hr>                                                      
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
            </div>
        </div>
<!--********************************** Content body end ***********************************-->


	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />
	
	
	<script type="text/javascript">		
		var deleteBtn = document.querySelector('#delelte-btn');
		deleteBtn.addEventListener('click', function (event) {
		event.preventDefault();		
		var ok = confirm('메세지를 삭제하시겠습니까?');				
		if (ok) {					
			location.href = 'delete?message_no=${ message.message_No}';					
		}			
	});
	
	</script>

</body>
</html>