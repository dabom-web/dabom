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
									<img src="/dabomweb/resources/images/avatar/BDNS.jpg"
										class="img-fluid rounded-circle" alt="">
								</div>
							</div>
							<div class="profile-info">
								<div class="row justify-content-center">
									<div class="col-xl-12">
										<div class="row">
											<div class="col-6 border-right-1 prf-col">
												<div class="profile-name" style="text-align: center;">
													<h3 class="text-primary">ä�θ�</h3>
													<p>������ : ��</p>
												</div>
											</div>
											<div class="col-6"><br>
											<div style="width:170px;float: right;heigh:100%;">
											<button class="btn btn-danger" type="button" style="width:80pt;heigh:80pt">
												����
											</button>
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
                                          <h3 class="m-b-0">150</h3><span>�ȷο�</span>
                                      </div>
                                      <div class="col">
                                          <h3 class="m-b-0">140</h3><span>���ƿ�</span>
                                      </div>
                                      <div class="col">
                                          <h3 class="m-b-0">45</h3><span>Reviews</span>
                                      </div>
                                  </div>
                                  <div class="mt-4">
	                                 <a href="javascript:void()" class="btn btn-primary pl-4 pr-4 mr-3 mb-4">�ȷο�</a> 
	                                 <a href="javascript:void()" class="btn btn-primary pl-4 pr-4 mr-3 mb-4">���ƿ�</a> 
	                                 <a href="javascript:void()" class="btn btn-dark pl-5 pr-5 mb-4">�޼��� ������</a>
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
                                      <li class="nav-item"><a href="#my-posts" data-toggle="tab" class="nav-link active show">Ŀ�´�Ƽ</a>
                                      </li>
                                      <li class="nav-item"><a href="#about-me" data-toggle="tab" class="nav-link">ä������</a>
                                      </li>
                                      <li class="nav-item"><a href="#profile-settings" data-toggle="tab" class="nav-link">ä������ ����(����� ä�μ����ڸ� �ٲٰ�)</a>  
                                      </li>
                                  </ul>
                                  <div class="tab-content">
                                      <div id="my-posts" class="tab-pane fade active show">
                                          <div class="my-post-content pt-3">                                              
                                              <div class="profile-uoloaded-post border-bottom-1 pb-2">
                                                  <img src="images/profile/8.jpg" alt="" class="img-fluid">
                                                  <a class="post-title" href="javascript:void()">
                                                      <h4>����</h4>
                                                  </a>
                                                  <p>����</p>
                                                  <button class="btn btn-primary mr-3"><span class="mr-1">
                                                  	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
													  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
													</svg></span></button>
                                                  <button class="btn btn-secondary"><span class="mr-2">
                                                  	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
													  <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
													</svg>
                                                  </span>���</button>
                                              </div><hr>
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
                                                  <textarea name="textarea" id="textarea" cols="30" rows="5" class="form-control bg-transparent" placeholder="ä�����θ� �����ְ�...."></textarea> 
                                                  <a href="javascript:void()"><i class="ti-clip"></i> </a>
                                                  <a href="javascript:void()"><i class="ti-camera"></i> </a><a href="javascript:void()" class="btn btn-primary">���</a>
                                              </div>
                                          </div>
                                      </div>
                                      <div id="about-me" class="tab-pane fade">
                                          <div class="profile-about-me">
                                              <div class="pt-4 border-bottom-1 pb-4">
                                                  <h4 class="text-primary">����</h4>
                                                  <p>��¼�� ��¼��~</p>
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