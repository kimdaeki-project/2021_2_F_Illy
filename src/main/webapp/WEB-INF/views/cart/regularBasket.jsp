<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/order/basket.css">
	<style type="text/css">
		
	</style>

<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>		
		<div id="container">
				
			<div id="contents">
			
				<div id="order_main">
					<div id="order_tit">
						<h2>장바구니</h2>
						
						<ol>
							<li>
								<span>01</span>
								장바구니
								<span>
									<img src="https://shop.illycaffe.co.kr/data/skin/front/udweb_200529/img/member/icon_join_step_off.png">
								</span>
							</li>
							<li>
								<span>02</span>
								주문서작성/결제
								<span>
									<img src="https://shop.illycaffe.co.kr/data/skin/front/udweb_200529/img/member/icon_join_step_off.png">
								</span>
							</li>
							<li>
								<span>03</span>
								주문완료
							</li>
						</ol>
					</div> <!-- order_tit end-->
					
					<div id="cart_ajax">
						<ul id="cart_top">
						<li>
							<a href="http://localhost/cart/normalBasket">일반구매(0)</a>
						</li>
						<li class="on">
							<a href="http://localhost/cart/regularBasket">정기배송(0)</a>
						</li>
					</ul>
					
					<div id="cart_main">
						<div id="cart_list">
							<div id="cart_table">
 								<table>
 								<colgroup>
 									<col style="width:3%">
 									<!-- 체크박스 -->
 									<col>
 									<!-- 상품/옵션 정보 -->
 									<col style="width:15%">
 									<!-- 수량 -->
 									<col style="width:10%">
 									<!-- 상품금액 -->
 									<col style="width:9%">
 									<!-- 할인/적립 -->
 									<col style="width:10%">
 									<!-- 합계금액 -->
 									<col style="width:10%">
 									<!-- 배송비 -->
 								</colgroup>
									<thead>
										<tr>
											<th>
												<div class="tableCheck">
													<input type="checkbox" id="allCheck" class="allCheck">
													<label for="allCheck" class="check_s allCheck_s"></label>
												</div>
											</th>
											<th>상품/옵션 정보</th>
											<th>수량</th>
											<th>상품금액</th>
											<th>할인/적립</th>
											<th>합계금액</th>
											<th>배송비</th>
										</tr>
									</thead>
									<tbody class="cartMain">
										<tr><td colspan="7"><div>
											<p id="cart_null">정기배송은 없어요~!</p>
										</div></td></tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					</div> <!-- cart_ajax end -->
				</div> <!-- order_main end -->
				<div id="order_bottom"><p>주문서 작성단계에서 할인/일리 포인트 적용을 하실 수 있습니다.</p></div>	
				
				
			</div> <!-- contetns end -->
			
		</div> <!-- container end -->
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>

<script type="text/javascript">
$('#allCheck').click(function(){
	
	let boolean;
	if($('#allCheck').is(':checked') == true) {
		boolean = true;
		$('.check_s').addClass('on');
	}
	else {
		boolean = false;
		$('.check_s').removeClass('on');
	}
});
</script>
</body>
</html>