<%@page import="com.dabom.dto.Message"%>
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
 	<title>TRASH(${ deleteSendCount })</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />
   
 <!--********************************** Content body start **********************************-->
 
      <div class="content-body">
          <div class="container-fluid">
              <div class="row page-titles mx-0">
                  <div class="col-sm-6 p-md-0">
                      <div class="welcome-text">
                          <h4>보낸 메세지 휴지통</h4>
                          <span class="ml-1">MESSAGE</span>
                      </div>
                  </div>
                  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                       <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">보낸 메세지 휴지통</a></li>
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
	                                  <c:choose>
	                                    <c:when test="${ empty loginuser.memberId }">   
	                                    	<a href="/dabomweb/account/login" class="btn btn-primary btn-block">새 메세지 작성</a>
                                      	</c:when>
                                      	<c:otherwise>
                                      		<a href="message_write?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }" class="btn btn-primary btn-block">새 메세지 작성</a>
                                      	</c:otherwise>
                                   	</c:choose>	
                                  </div>
                                  <div class="mail-list mt-4">
                                      <a href="message_receive_list?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }" class="list-group-item"><i
                                              class="fa fa-inbox font-18 align-middle mr-2"></i> 받은메세지 <span
                                              class="badge badge-primary badge-sm float-right">${ receiveCount }</span></a>
                                      <a href="message_send_list?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }" class="list-group-item"><i
                                              class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸메세지<span
                                              class="badge badge-primary badge-sm float-right">${ sendCount }</span></a> 
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
                                <c:forEach var="message" items="${ messageList4 }">                            
	                              <div class="email-list">
	                                  <div class="message">
	                                      <div>	                                            
	                                          <div class="d-flex message-single">
	                                              <div class="custom-control custom-checkbox pl-4">
	                                                  <input type="checkbox">
	                                              </div>
	                                              <div class="ml-2">
	                                                  <button class="border-0 bg-transparent align-middle p-0"><i
	                                                          class="fa fa-star" aria-hidden="true"></i></button>
	                                              </div>	                                                  	                                                                                         
	                                          <a href="message_send_delete_detail?message_no=${ message.message_No }&sender=${ loginuser.memberId }" class="col-mail col-mail-3">  
	                                              <div class="sender">${ message.sender }</div>
	                                              <div class="subject">${ message.message_Title }</div>
	                                         	  <div class="date">${ message.send_Date }</div>                                              
	                                          </a>  
	                                           </div> 	                                              	                                     		                                        
	                                      </div>	                                     
	                                  </div>
	                              </div>
                            	</c:forEach> 
                            	
                                  <!-- panel -->
                                  <div class="row mt-4 m-4 mx-sm-4">
                                      <div class="col-7">
                                          <div class="text-left">전체글 수 > ${ deleteSendCount }</div>
                                      </div>
                                      <div class="col-5">
                                          <div class="btn-group float-right">
                                              <button class="btn btn-dark" type="button"><i
                                                      class="fa fa-angle-left"></i>
                                              </button>
                                              <button class="btn btn-dark" type="button"><i
                                                      class="fa fa-angle-right"></i>
                                              </button>
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

</body>
</html>