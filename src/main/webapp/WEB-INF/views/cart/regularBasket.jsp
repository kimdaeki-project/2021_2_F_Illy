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
					
					<ul id="cart_top">
						<li>
							<a href="http://localhost/cart/normalBasket">일반구매()</a>
						</li>
						<li class="on">
							<a href="http://localhost/cart/regularBasket">정기배송(0)</a>
						</li>
					</ul>
					
					<div id="cart_main">
						<div id="cart_list">
							<div id="cart_table">정기배송은 없어요~!</div>
						</div> <!-- cart_list end -->
						
					</div> <!-- cart_main end -->
				</div> <!-- order_main end -->
				<em id="order_bottom">주문서 작성단계에서 할인/일리 포인트 적용을 하실 수 있습니다.</em>	
				
				
			</div> <!-- contetns end -->
			
		</div> <!-- container end -->
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
</body>
</html>