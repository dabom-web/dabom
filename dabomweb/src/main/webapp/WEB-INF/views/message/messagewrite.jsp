<%@page import="com.dabom.dto.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>MESSAGEWRITE</title>
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
                            <h4>�޼��� ������!</h4>
                            <span class="ml-1">MESSAGE</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="messagelist">�����޼���</a></li>
                            <li class="breadcrumb-item active">
                            <a href="javascript:void()" id="new-message-write2">�޼����ۼ�</a></li>
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
                                           class="btn btn-primary btn-block">�� �޼��� �ۼ�</a>
                                    </div>
                                    <div class="mail-list mt-4">
                                        <a href="messagelist" class="list-group-item active"><i
                                           class="fa fa-inbox font-18 align-middle mr-2"></i> �����޼��� <span
                                           class="badge badge-primary badge-sm float-right">${ count }</span></a>
                                      	<a href="javascript:void()" class="list-group-item"><i
                                           class="fa fa-paper-plane font-18 align-middle mr-2"></i>�����޼���</a> <a href="javascript:void()" class="list-group-item"><i
                                           class="fa fa-star font-18 align-middle mr-2"></i>�޼��� ������ <span
                                           class="badge badge-danger text-white badge-sm float-right">47</span>
	                                    </a>
	                                    <a href="javascript:void()" class="list-group-item"><i
                                           class="fa fa-trash font-18 align-middle mr-2"></i>������ �޼���</a>
                                  </div>                                   
                                </div>
                                <div class="email-right-box ml-0 ml-sm-4 ml-sm-0">                                    
                                    <div class="compose-content">
                                        <form id="messagewriteform" action="messagewrite" 
									          method="post"	enctype="multipart/form-data">
									        <div class="form-group">
                                                <input type="text"
                                                	   id="message_Title"
                                                	   name="message_Title"                                                	                                               	   
                                                	   class="form-control bg-transparent"                                                	   
                                                	   placeholder="������ �Է����ּ���"></div>  
                                            <div class="form-group">
                                                <input type="text"
                                                	   id="receiver"
                                                	   name="receiver"
                                                	   list="seachreceiver"                                                 	   
                                                	   class="form-control bg-transparent" 
                                               		   placeholder="�޴»��">
                                               	 <datalist id="seachreceiver">
                                               	  <c:forEach var="member" items="${ memberList }">
								                     <option value="${ member.memberId }"></option>
				                        		  </c:forEach>
						                         </datalist>
                                            </div>
                                            <div class="form-group">
                                                <input type="text"
                                                	   id="sender"
                                                	   name="sender"  
                                                	   list="seachsender"                                                	   
                                                	   class="form-control bg-transparent"                                                	   
                                                	   placeholder="�����»��" />
                                           	     <datalist id="seachsender">
                                           		  <c:forEach var="member" items="${ memberList }">
								                    <option value="${ member.memberId }"></option>
				                        		  </c:forEach>
						                         </datalist>						                        
                                            </div>
                                            <div class="form-group">
                                                <textarea name="message_Content" id="message_Content" 
                                                		  class="textarea_editor form-control bg-transparent" rows="15" 
                                                		  placeholder="�޼����� �Է��ϼ���"></textarea>
                                            </div>
                                        </form>
                                        <h5 class="mb-4"><i class="fa fa-paperclip"></i> ÷������</h5>
                                        <form action="#" class="d-flex flex-column align-items-center justify-content-center">
                                            <div class="fallback w-100">
                                                <input type="file" class="dropify" data-default-file="" />
                                            </div>
                                        </form>
                                    </div>
                                    <div class="text-left mt-4 mb-5">
                                        <button class="btn btn-primary btn-sl-sm mr-3" 
                                        		type="button" id="send" href='javascript:'><span
                                                class="mr-2"><i class="fa fa-paper-plane"></i></span>����</button>
                                        <button class="btn btn-dark btn-sl-sm" 
                                        		type="button" id="cancel" href="javascript:"><span 
                                        		class="mr-2"><i class="fa fa-times" aria-hidden="true"></i></span>���</button>
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
				var ok = confirm('�� �������� ����� �ۼ����� ������ ������� �ʽ��ϴ�.');
				if (ok) {
					location.href = 'messagewrite';
				}			
			});
		 });
		$(function() {
			$('#new-message-write2').on('click',function(event) { 
				event.preventDefault();
				var ok = confirm('�� �������� ����� �ۼ����� ������ ������� �ʽ��ϴ�.');
				if (ok) {
					location.href = 'messagewrite';
				}			
			});
		 });
		$(function() {
			$('#send').on('click',function(event) { 
				event.preventDefault();
				var ok = confirm('�޼����� �����ұ��?');
				if (ok) {
					$('#messagewriteform').submit();
				}			
			});
		 });
		$(function() {
			$('#cancel').on('click',function(event) { 
				event.preventDefault();
				var ok = confirm('�޼����� ������ ����մϴ�.');
				if (ok) {
					location.href = 'messagelist';
				}			
			});
		 });

	</script>	
	
</body>

</html>	
	
	
	
	