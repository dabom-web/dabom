<%@page import="com.dabom.dto.Message"%>
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
 	<title>MESSAGEDETAIL(${ sendCount })</title>
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
                            <h4>보낸 메세지 읽기!</h4>
                            <span class="ml-1">MESSAGE</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="messagelist">받은메세지</a></li>
                            <li class="breadcrumb-item active"><a href="messagedetail?message_no=${ message.message_No }">메세지읽기</a></li>
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
                                      <a href="message_write" class="btn btn-primary btn-block">새 메세지 작성</a>
                                  </div>
                                  <div class="mail-list mt-4">
                                      <a href="message_receive_list?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }" class="list-group-item"><i
                                              class="fa fa-inbox font-18 align-middle mr-2"></i> 받은메세지 <span
                                              class="badge badge-primary badge-sm float-right">${ receiveCount }</span></a>
                                      <a href="message_send_list?receiver=${ loginuser.memberId }&sender=${ loginuser.memberId }" class="list-group-item active"><i
                                              class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸메세지<span
                                              class="badge badge-primary badge-sm float-right">${ sendCount }</span></a>
                                      <a href="javascript:void()" class="list-group-item"><i
                                              class="fa fa-star font-18 align-middle mr-2"></i>메세지 보관함 <span
                                              class="badge badge-danger text-white badge-sm float-right">47</span>
                                      </a>
                                      <a href="javascript:void()" class="list-group-item"><i
                                              class="fa fa-trash font-18 align-middle mr-2"></i>삭제된 메세지</a>
                                  </div>                                  
                              </div>
                                <div class="email-right-box ml-0 ml-sm-4 ml-sm-0">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="right-box-padding">
                                               
                                                <div class="read-content">
                                                    <div class="media pt-3">
                                                        <img class="mr-4 rounded-circle" alt="image" src="./images/avatar/1.jpg">
                                                        <div class="media-body">
                                                            <h5 class="text-primary">${ message.message_Title }</h5>
                                                        </div>
                                                        <a href="javascript:void()" class="text-muted "><i
                                                                class="fa fa-reply"></i> </a>
                                                        <a href="javascript:void()" class="text-muted ml-3"><i
                                                                class="fa fa-long-arrow-right"></i> </a>
                                                        <a href="javascript:void()" class="text-muted ml-3"><i
                                                                class="fa fa-trash"></i></a>
                                                    </div><hr>
                                                        <div class="media-body"><span class="pull-right">${ message.send_Date }</span>
                                                            <h5 class="my-1 text-primary">보낸사람 : ${ message.sender }</h5>
                                                            <p class="read-content-email">
                                                                To:Me,invernessmckenzie@example.com</p>
                                                        </div>
                                                    </div>
                                                    </div>
                                                    <div class="read-content-body">
                                                        <h5 class="pt-3">${ message.message_Content }</h5><hr>
                                                    </div>    
                                                    <div class="read-content-attachment">
                                                        <h6><i class="fa fa-download mb-2"></i> 첨부파일
                                                            <span>(3)</span></h6>
                                                        <div class="row attachment">
                                                            <div class="col-auto">
                                                                <a href="javascript:void()" class="text-muted">My-Photo.png</a>
                                                            </div>
                                                            <div class="col-auto">
                                                                <a href="javascript:void()" class="text-muted">My-File.docx</a>
                                                            </div>
                                                            <div class="col-auto">
                                                                <a href="javascript:void()" class="text-muted">My-Resume.pdf</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="form-group pt-3">
                                                        <textarea class="w-100" name="write-email" id="write-email" cols="30" rows="5" placeholder="It's really an amazing.I want to know more about it..!"></textarea>
                                                    </div>
                                                </div>
                                                <div class="text-right">
                                                    <button class="btn btn-primary btn-sl-sm mb-5" type="button">Send</button>
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

</body>
</html>