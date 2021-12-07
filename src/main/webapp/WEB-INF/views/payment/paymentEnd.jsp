<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/order/paymentEnd.css">
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
				<div id="end_main">
				<div id="end_tit">
					<h2>주문완료</h2>
						
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
						<li class="end_tit_black">
							<span>03</span>
							주문완료
						</li>
					</ol>
				</div> <!-- end_tit end -->
				<div class="end_center">
				
					<div class="end_cont">
						<div class="end_cont_complete">
							<span><img src="/images/cart/order_end_completion.png" alt=""></span>
							<p>
								<strong>주문이 정상적으로 접수 되었습니다.</strong><br>
								<em>감사합니다.</em>
							</p>
						</div> <!-- end_cont_complete end -->
						
						<div class="end_cont_tit">
							<h4>주문요약정보</h4>
						</div> <!-- end_cont_tit end -->
						<div class="end_cont_table">
							<table class="table_left">
								<colgroup>
									<col style="width:15%">
 									<col style="width:85%">
 								</colgroup>
								<tbody>
									<tr>
										<th>결제수단</th>
										<td>
											<div class="pay_with_list">
												<strong>${paymentVO.payment_type}</strong>
												<br><br>
												<c:if test="${paymentVO.payment_type eq '신용카드' or paymentVO.payment_type eq '카카오페이'}">
													결제금액 : <strong>${paymentVO.payment_total}원</strong>
												</c:if>
												<c:if test="${paymentVO.payment_type ne '신용카드' and paymentVO.payment_type ne '카카오페이'}">
													입금금액 : <strong>${paymentVO.payment_total}원</strong>
												</c:if>
												
											</div>
										</td>
									</tr>
									<tr>
										<th>주문번호</th>
										<td>${paymentVO.payment_id}</td>
									</tr>
									<tr>
										<th>주문일자</th>
										<td>
											<fmt:formatDate value="${paymentVO.payment_date}" pattern="yyyy-MM-dd hh:mm:ss"/>
										</td>
									</tr>
									<tr>
										<th>주문상품</th>
										<td>
											<c:if test="${cartList.size() eq 1}">
												<c:forEach items="${cartList}" var="cart" begin="0" end="0" >
													${cart.product_name}
												</c:forEach>
											</c:if>
											<c:if test="${cartList.size() ne 1 and cartList.size() ne 0}">
												<c:forEach items="${cartList}" var="cart" begin="0" end="0" >
													${cart.product_name} 외 ${cartList.size()-1}개
												</c:forEach>
											</c:if>

										</td>
									</tr>
									<tr>
										<th>주문자명</th>
										<td>${paymentVO.payment_name}</td>
									</tr>
									<tr>
										<th>배송정보</th>
										<td>
											<p>
												<strong>${addressVO.address_recipient_name}</strong><br>
												[${addressVO.address_postcode}] ${addressVO.main_address} ${addressVO.address_reference} ${addressVO.address_detail}<br>
												// ${addressVO.address_recipient_phone}<br>
												남기실 말씀: ${paymentVO.payment_comment}
											</p>
										</td>
									</tr>
									<tr>
										<th>상품 금액</th>
										<td>
											<strong class="order_payment_sum">${paymentVO.payment_product_total}원</strong>
										</td>
									</tr>
									<tr>
										<th>배송비</th>
										<td>기본배송 ${paymentVO.payment_delivery}원</td>
									</tr>
									<tr>
										<th>할인 및 적립</th>
										<td>
											<ul class="pay_with_list">
												<li class="pay_benefit_sale">
													<em>
														할인 : <strong>(-) ${paymentVO.payment_total_discount}원</strong>
														<span>
															(상품 0원, 회원 0원, 배송비 0원, 상품쿠폰 0원, 주문쿠폰 ${paymentVO.payment_use_coupon}원, 포인트사용 ${paymentVO.payment_use_point}콩)
														</span>
													</em>
												</li>
												<li class="pay_benefit_milege">
													<em>
														적립 일리 포인트 : <strong>(+) ${paymentVO.payment_add_point}콩</strong>
														<span>(  )</span>
													</em>
												</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th>총 결제금액</th>
										<td>
											<strong class="order_payment_sum">${paymentVO.payment_total}원</strong>
										</td>
									</tr>
									<tr>
										<th>현금영수증</th>
										<td>미발급</td>
									</tr>
									<tr>
										<th>세금계산서</th>
										<td>미발급</td>
									</tr>
								</tbody>
							</table> <!-- table_left end -->
						</div> <!-- end_cont_table end -->
						
					</div><!-- end_cont end -->
					
					<div class="end_btn">
						<a href="/" class="end_btn_black">확인</a>
					</div> <!-- end_btn end -->
					
				</div><!-- end_center end -->
				
				</div> <!-- end_main end -->
 				
			</div> <!-- contetns end -->
		</div> <!-- container end -->
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
</body>
</html>