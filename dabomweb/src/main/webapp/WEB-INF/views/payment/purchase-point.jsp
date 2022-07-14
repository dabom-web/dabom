<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <script src="https://cdn.tailwindcss.com"></script>
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
                          <form action="purchase-point" method="post">
                              <div class="flex-col border-2 rounded-md">
                                    <div class="bg-neutral-50 p-2 border-b">
                                        <h3 class="text-lg">포인트 구매</h3>
                                    </div>
                                    <div class="flex p-2 items-center justify-center items-center">
                                        <p class="text-md text-neutral-800 w-44">구매자 아이디</p>
                                        <input type="text" name="memberId" value="${ loginuser.memberId }" class="transition-all bg-gray-50 border-2 border-gray-200 text-gray-900 text-sm rounded-lg focus:bg-gray-150 focus:border-blue-200 block p-2.5 w-full" placeholder="구매자 아이디" required />
                                    </div>
                                    <div class="flex p-2 justify-center items-center">
                                        <p class="text-neutral-800 w-44">포인트 구매옵션</p>
                                        <select id="point-box" class="transition-all bg-gray-50 border-2 border-gray-200 text-gray-900 text-sm rounded-lg focus:bg-gray-150 focus:border-blue-200 block w-full p-2.5">
                                            <option name="purchase-option" selected value="1000" data-price="1000" data-point="100">100 point 구매(1,000원)</option>
                                            <option name="purchase-option" value="1300"  data-price="10000" data-point="1300">1,300 point 구매(10,000원)</option>
                                            <option name="purchase-option" value="4800" data-price="30000" data-point="4800">4,800 point 구매(30,000원)</option>
                                         </select>
                                         <input type="hidden" id="price" name="price" value="1000" class="form-control">
                                          <input type="hidden" id="amount" name="amount" value="100" class="form-control">
                                    </div>
                                  <div class="flex p-2 justify-end">
                                    <button type="submit" class="transition-all text-slate-50 bg-neutral-800 focus:outline-none hover:bg-neutral-600 font-medium rounded-md text-sm px-3 py-1.5 mr-2 mb-2">구매하기</button>
                                    <button type="button" class="transition-all text-slate-50 bg-neutral-800 focus:outline-none hover:bg-neutral-600 font-medium rounded-md text-sm px-3 py-1.5 mr-2 mb-2">취소</button>
                                  </div>
                              </div>
                          </form>
                          <div>
                            <div class="flex-col border-2 rounded-md">
                                  <div class="bg-neutral-50 mb-4 p-2 border-b">
                                      <h3 class="text-lg">${ loginuser.memberId }" 님의 구매내역</h3>
                                  </div>
                                  <div class="flex items-center justify-center items-center p-2">
                                    <table class="w-full text-sm text-left text-gray-500">
                                        <thead class="text-md text-white bg-violet-400">
                                            <tr>
                                                <th scope="col" class="py-3 px-6">
                                                    구매 포인트
                                                </th>
                                                <th scope="col" class="py-3 px-6">
                                                    가격
                                                </th>
                                                <th scope="col" class="py-3 px-6">
                                                    결제일자
                                                </th>
                                                <th scope="col" class="py-3 px-6">
                                                    취소일자
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="pointPurchase" items="${ pointPurchaseList }">
                                                <tr>
                                                    <td scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap">
                                                        ${ pointPurchase.price }
                                                    </td>
                                                    <td class="py-4 px-6">
                                                        ${ pointPurchase.amount }
                                                    </td>
                                                    <td class="py-4 px-6">
                                                        ${ pointPurchase.purchaseDate }
                                                    </td>
                                                    <td class="py-4 px-6">
                                                        ${ pointPurchase.cancelDate }
                                                    </td>
                                                </tr>
                                              </c:forEach>
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
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<jsp:include page="/WEB-INF/views/modules/css/bottom.jsp" />
	
	<script type="text/javascript">
	$(function() {
		$("input[name=purchase-option]").on('click', function(event) {
			$('#price').val($(this).attr('data-price'));
			$('#amount').val($(this).attr('data-point'));
		});
	});
	</script>
	<script type="text/javascript">
	    const pointBox = document.getElementById('point-box');
	    const priceInput = document.getElementById('price');
	    const pointAmountInput = document.getElementById('amount');
	
	    pointBox.addEventListener('change', () => {
	        const selectedIndex = pointBox.selectedIndex;
	        const selectedOption = pointBox.children[selectedIndex];
	
	        priceInput.value = selectedOption.dataset.price;
	        pointAmountInput.value = selectedOption.dataset.point;
	    })
	</script>
</body>
</html>