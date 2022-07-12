<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>DABOM | ������ ���ε�</title>
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/dabom.jpg">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dabomweb/resources/vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="/dabomweb/resources/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="/dabomweb/resources/css/style.css" rel="stylesheet">

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/modules/css/top.jsp" />
   
	<div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>������ ���ε�</h4>
                            <span class="ml-1">����, Ŀ��, â�� �� �������� ��ǰ�� �����Ӱ� �÷��ּ���</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Channel</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">������ε�</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->
                <div class="email-right-box ml-0 ml-sm-4 ml-sm-0">
                                    <div role="toolbar" class="toolbar ml-4 ml-sm-0">
                                        <div class="p-0">
                                        <a href="/dabomweb/video/upload" class="btn btn-primary float-right">�� ������ ���ε�</a>
                                    	</div>
                                    </div>
                                   <thead style="text-align:center">
                    <tr>
                    <th style="width:50px">��ȣ</th>
<!--                     <th style="width:80px">�з�</th> -->
					<th style="width:300px">����</th>
					<th style="width:120px">�ۼ���</th>
					<th style="width:80px">�ۼ���</th>
					<th style="width:70px">��ȸ��</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                   
                    </tr>
                  </tbody>
                                    <!-- panel -->
                                    <div class="row mt-4 m-4 mx-sm-4">
                                        <div class="col-7">
                                            <div class="text-left"></div>
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


	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

</body>
</html>