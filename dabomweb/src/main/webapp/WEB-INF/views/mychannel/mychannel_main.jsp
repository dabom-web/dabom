<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>MYCHANNEL</title>
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
          
          <!-- row -->
          <div class="row">
              <div class="col-lg-12">
                  <div class="profile">
                      <div class="profile-head">
                          <div class="photo-content">
                              <div class="cover-photo"> 
								<img src="/dabomweb/resources/images/avatar/BDNSYOYO.png"
									 style="min-height: 250px; width: 100%;">
                              </div>
                              <div class="profile-photo">
                                  <img src="/dabomweb/resources/images/avatar/BDNS.jpg" class="img-fluid rounded-circle" alt="">
                              </div>
                          </div>
                          <div class="profile-info">                          
                              <div class="row justify-content-center">		                           
                                  <div class="col-xl-7">
                                      <div class="row">
                                          <div class="col-xl-4 col-sm-4 border-right-1 prf-col">
                                              <div class="profile-name">
                                                  <h3 class="text-primary">채널명</h3>
                                                  <p>구독자 : 명</p>
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
          <div class="row">
              <div class="col-lg-4">
                  <div class="card">
                      <div class="card-body">
                          <div class="profile-statistics">
                              <div class="text-center mt-4 border-bottom-1 pb-3">
                                  <div class="row">
                                      <div class="col">
                                          <h3 class="m-b-0">150</h3><span>Follower</span>
                                      </div>
                                      <div class="col">
                                          <h3 class="m-b-0">140</h3><span>Place Stay</span>
                                      </div>
                                      <div class="col">
                                          <h3 class="m-b-0">45</h3><span>Reviews</span>
                                      </div>
                                  </div>
                                  <div class="mt-4"><a href="javascript:void()" class="btn btn-primary pl-5 pr-5 mr-3 mb-4">Follow</a> <a href="javascript:void()" class="btn btn-dark pl-5 pr-5 mb-4">Send
                                          Message</a>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="col-lg-8">
                  <div class="card">
                      <div class="card-body">
                          <div class="profile-tab">
                              <div class="custom-tab-1">
                                  <ul class="nav nav-tabs">
                                      <li class="nav-item"><a href="#my-posts" data-toggle="tab" class="nav-link active show">커뮤니티</a>
                                      </li>
                                      <li class="nav-item"><a href="#about-me" data-toggle="tab" class="nav-link">채널정보</a>
                                      </li>
                                      <li class="nav-item"><a href="#profile-settings" data-toggle="tab" class="nav-link">채널정보 수정(여기는 채널소유자만 바꾸게)</a>  
                                      </li>
                                  </ul>
                                  <div class="tab-content">
                                      <div id="my-posts" class="tab-pane fade active show">
                                          <div class="my-post-content pt-3">                                              
                                              <div class="profile-uoloaded-post border-bottom-1 pb-5">
                                                  <img src="images/profile/8.jpg" alt="" class="img-fluid">
                                                  <a class="post-title" href="javascript:void()">
                                                      <h4>제목</h4>
                                                  </a>
                                                  <p>내용</p>
                                                  <button class="btn btn-primary mr-3"><span class="mr-3"><i
                                                              class="fa fa-heart"></i></span>Like</button>
                                                  <button class="btn btn-secondary"><span class="mr-3"><i
                                                              class="fa fa-reply"></i></span>Reply</button>
                                              </div>
	                                             <div class="col-12">
		                                            <div class="btn-group float-right">
		                                                <button class="btn btn-dark" type="button"><i
		                                                        class="fa fa-angle-left"></i>
		                                                </button>
		                                                <button class="btn btn-dark" type="button"><i
		                                                        class="fa fa-angle-right"></i>
		                                                </button>
		                                            </div><br><br><hr>
		                                        </div>
	                                              
                                              <div class="post-input">
                                                  <textarea name="textarea" id="textarea" cols="30" rows="5" class="form-control bg-transparent" placeholder="Please type what you want...."></textarea> <a href="javascript:void()"><i class="ti-clip"></i> </a>
                                                  <a
                                                      href="javascript:void()"><i class="ti-camera"></i> </a><a href="javascript:void()" class="btn btn-primary">Post</a>
                                              </div>
                                          </div>
                                      </div>
                                      <div id="about-me" class="tab-pane fade">
                                          <div class="profile-about-me">
                                              <div class="pt-4 border-bottom-1 pb-4">
                                                  <h4 class="text-primary">설명</h4>
                                                  <p>어쩌고 저쩌고~</p>
                                              </div>
                                          </div>
                                        </div>                                      
                                      <div id="profile-settings" class="tab-pane fade">
                                          <div class="pt-3">
                                              <div class="settings-form">
                                                  <h4 class="text-primary">Account Setting</h4>
                                                  <form>
                                                      <div class="post-input">
                                                  <textarea name="textarea" id="textarea" cols="30" rows="5" class="form-control bg-transparent" placeholder="Please type what you want...."></textarea> <a href="javascript:void()"><i class="ti-clip"></i> </a>
                                                  <a
                                                      href="javascript:void()"><i class="ti-camera"></i> </a><a href="javascript:void()" class="btn btn-primary">Post</a>
                                              </div>
                                                  </form>
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

</body>
</html>