<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
 	<title>결제하기</title>
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
						<h4> 포인트 결제하기 </h4><br>
						<span class="ml-1">포인트 구매화면</span>
					</div>
				</div>
			
			</div>
			<!-- row -->
			<!-- row -->
			<div class="row">
				<div class="d-flex" style="padding: 0 20px;">
					<!-- <div class="card">
						<div class="card-header">
							<h4 class="card-title">포인트충전</h4>		
							<h5 button="point"> 얼마를 충전하시겠습니까</h5>					
						</div>
						<div class="card-body">
						
						내용채우기
						
							<div class="basic-list-group" style="text-align:  center;">
								<button type="button" class="btn btn-rounded btn-primary" ><span
                                        class="btn-icon-left text-primary"><i class="fa fa-plus"></i>
                                    </span>구매</button>
                                    
							</div>
						</div>
					</div> -->
					
					
                        <div class="card" style="width: 580px; margin-right: 40px;">
                            <div class="card-header">
                                <h4 class="card-title">Vertical Form</h4>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    <form action="purchase-point" method="post">
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">구매자아이디</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="memberId" value="${ loginuser.memberId }" class="form-control" placeholder="구매자 아이디">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">구매포인트수량</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="amount"  class="form-control" placeholder="구매할 포인트 수량">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">가격</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="price" value="10000" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-10">
                                                <button type="submit" class="btn btn-primary">구매하기</button>
                                                <button class="btn btn-primary">취소</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                       
                        
                        
                        
                        <div class="card" style="width: 580px;">
                            <div class="card-header">
                                <h4 class="card-title">구매내역</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table >
                                        <thead>
                                            <tr>
                                                <th> </th>
                                                <th>Name</th>
                                                <th>Product</th>
                                                <th>quantity</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="round-img">
                                                        <a href=""><img width="35" src="./images/avatar/1.png" alt=""></a>
                                                    </div>
                                                </td>
                                                <td>Lew Shawon</td>
                                                <td><span>Dell-985</span></td>
                                                <td><span>456 pcs</span></td>
                                                <td><span class="badge badge-success">Done</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="round-img">
                                                        <a href=""><img width="35" src="./images/avatar/1.png" alt=""></a>
                                                    </div>
                                                </td>
                                                <td>Lew Shawon</td>
                                                <td><span>Asus-565</span></td>
                                                <td><span>456 pcs</span></td>
                                                <td><span class="badge badge-warning">Pending</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="round-img">
                                                        <a href=""><img width="35" src="./images/avatar/1.png" alt=""></a>
                                                    </div>
                                                </td>
                                                <td>lew Shawon</td>
                                                <td><span>Dell-985</span></td>
                                                <td><span>456 pcs</span></td>
                                                <td><span class="badge badge-success">Done</span></td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div class="round-img">
                                                        <a href=""><img width="35" src="./images/avatar/1.png" alt=""></a>
                                                    </div>
                                                </td>
                                                <td>Lew Shawon</td>
                                                <td><span>Asus-565</span></td>
                                                <td><span>456 pcs</span></td>
                                                <td><span class="badge badge-warning">Pending</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="round-img">
                                                        <a href=""><img width="35" src="./images/avatar/1.png" alt=""></a>
                                                    </div>
                                                </td>
                                                <td>lew Shawon</td>
                                                <td><span>Dell-985</span></td>
                                                <td><span>456 pcs</span></td>
                                                <td><span class="badge badge-success">Done</span></td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div class="round-img">
                                                        <a href=""><img width="35" src="./images/avatar/1.png" alt=""></a>
                                                    </div>
                                                </td>
                                                <td>Lew Shawon</td>
                                                <td><span>Asus-565</span></td>
                                                <td><span>456 pcs</span></td>
                                                <td><span class="badge badge-warning">Pending</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                        
				</div>
				
			</div>
		</div>
	</div>





	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />

</body>
</html>