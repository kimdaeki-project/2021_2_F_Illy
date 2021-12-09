<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/member/myPage/myPageCommon.css">
	<link rel="stylesheet" href="/css/member/myPage/myPageOrder.css">
	<link rel="stylesheet" href="/css/member/myPage/myPageOrderDetail.css">
	<style type="text/css">
		#right_content{width:1000px;float:left;padding-left:40px; min-height: 500px;}
		.myPage_cont {padding-bottom: 50px;}
	</style>

<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>	
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>	
		<div id="container">
				
			<div id="contents">
			<c:import url="/WEB-INF/views/navbar/myPageLeftBar.jsp"></c:import>	
				<div id="right_content">
					<div class="myPage_cont">
						<div class="myPage_lately_info">						
							<div class="myPage_zone_tit">
								<h3>주문/배송상세 <strong class="order_num_view">(주문번호 : ${list.payment_id})</strong></h3>
							</div>
							
							<div class="myPage_lately_info_cont">
								<div class="myPage_type_table">
									<table>
									<colgroup></colgroup>
										<thead>
											<tr>
												<th>날짜/주문번호</th>
												<th>상품명/옵션</th>
												<th>상품금액/수량</th>
												<th>주문상태</th>
												<th>확인/리뷰</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list.carts}" var="carts" varStatus="status">
												<c:if test="${list.carts.size() eq 1}">
													<tr>
														<td rowspan="${list.carts.size()}" class="order_day_num">
															<em><fmt:formatDate value="${list.payment_date}" pattern="yyyy/MM/dd"/></em><br>
															<a class="order_num_link" href="/member/myPage/myPageOrderDetail?payment_id=${list.payment_id}" data-payment-id="${list.payment_id}"><span>${list.payment_id}</span></a>
															<c:if test="${carts.cart_state eq 'payment'}">
																<div class="btn_claim">
																	<span class="btn_order_cancel" data-payment-id="${list.payment_id}" data-payment-addPoint="${list.payment_add_point}"
																			data-payment-usePoint="${list.payment_use_point}">
																		<a>주문취소</a>
																	</span>
																</div>
															</c:if>
															<c:if test="${carts.cart_state eq 'done'}">
																<div class="btn_claim">
																	<span class="btn_order_refund" data-payment-id="${list.payment_id}" data-payment-addPoint="${list.payment_add_point}"
																			data-payment-usePoint="${list.payment_use_point}">
																		<a>환  불</a>
																	</span>
																</div>
															</c:if>
														</td>
														<td class="td_left">
															<div class="pick_add_cont">
																<span class="pick_add_img">
																	<a href="/product/select?product_categoryCode=${carts.product_categoryCode}&product_id=${carts.product_id}">
																		<img alt="${carts.product_name}" src="/upload/product/${carts.productFile_name}">
																	</a>
																</span>
																<div class="pick_add_info">
																	<a href="/product/select?product_categoryCode=${carts.product_categoryCode}&product_id=${carts.product_id}">
																		<em>${carts.product_name}</em>
																	</a>
																</div>
															</div>
														</td>
														<td>
															<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${carts.product_price}"/>원</strong> / ${carts.cart_cnt}개	
														</td>
														<td>
															<c:if test="${carts.cart_state eq 'payment'}">
																<em>결제완료</em>
																<div style="margin-top: 5px;"><div>(택배)</div></div>
															</c:if>
															<c:if test="${carts.cart_state eq 'delivery'}">
																<em>배송중</em>
																<div style="margin-top: 5px;"><div>(택배)</div></div>
															</c:if>
															<c:if test="${carts.cart_state eq 'done'}">
																<em>배송완료</em>
																<div style="margin-top: 5px;"><div>(택배)</div></div>
															</c:if>
															<c:if test="${carts.cart_state eq 'refund'}">
																<em>환불처리</em>
																<div style="margin-top: 5px;"><div>(택배)</div></div>
															</c:if>
															<c:if test="${carts.cart_state eq 'cancel'}">
																<em>고객요청취소</em>
																<div style="margin-top: 5px;"><div>(택배)</div></div>
															</c:if>
														</td>
														<td></td>
													</tr>
												</c:if>
																	
												<c:if test="${list.carts.size() ne 1}">
													<c:choose>
														<c:when test="${status.last}"><tr></c:when>
														<c:otherwise><tr class="row_line"></c:otherwise>
													</c:choose>
													<c:if test="${status.first}">
														<td rowspan="${list.carts.size()}" class="order_day_num">
															<em><fmt:formatDate value="${list.payment_date}" pattern="yyyy/MM/dd"/></em><br>
																<a class="order_num_link" href="/member/myPage/myPageOrderDetail?payment_id=${list.payment_id}" data-payment-id="${list.payment_id}"><span>${list.payment_id}</span></a>
																<c:if test="${carts.cart_state eq 'payment'}">
																	<div class="btn_claim">
																		<span class="btn_order_cancel" data-payment-id="${list.payment_id}" data-payment-addPoint="${list.payment_add_point}"
																				data-payment-usePoint="${list.payment_use_point}">
																			<a>주문취소</a>
																		</span>
																	</div>
																</c:if>
																<c:if test="${carts.cart_state eq 'done'}">
																	<div class="btn_claim">
																		<span class="btn_order_refund" data-payment-id="${list.payment_id}" data-payment-addPoint="${list.payment_add_point}"
																				data-payment-usePoint="${list.payment_use_point}">
																			<a>환  불</a>
																		</span>
																	</div>
																</c:if>
														</td>
													</c:if>
														<td class="td_left">
															<div class="pick_add_cont">
																<span class="pick_add_img">
																	<a>
																		<img alt="${carts.product_name}" src="/upload/product/${carts.productFile_name}">
																	</a>
																</span>
																<div class="pick_add_info">
																	<a>
																		<em>${carts.product_name}</em>
																	</a>
																</div>
															</div>
														</td>
														<td>
															<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${carts.product_price}"/>원</strong> / ${carts.cart_cnt}개	
														</td>
														<td>
															<c:if test="${carts.cart_state eq 'payment'}">
																<em>결제완료</em>
																<div style="margin-top: 5px;"><div>(택배)</div></div>
															</c:if>
															<c:if test="${carts.cart_state eq 'delivery'}">
																<em>배송중</em>
																<div style="margin-top: 5px;"><div>(택배)</div></div>
															</c:if>
															<c:if test="${carts.cart_state eq 'done'}">
																<em>배송완료</em>
																<div style="margin-top: 5px;"><div>(택배)</div></div>
															</c:if>
															<c:if test="${carts.cart_state eq 'refund'}">
																<em>환불처리</em>
																<div style="margin-top: 5px;"><div>(택배)</div></div>
															</c:if>
															<c:if test="${carts.cart_state eq 'cancel'}">
																<em>고객요청취소</em>
																<div style="margin-top: 5px;"><div>(택배)</div></div>
															</c:if>
														</td>
														<td></td>
													</tr>
												</c:if>
																	
											</c:forEach>
										</tbody>
									</table>
								</div> <!-- myPage_type_table end -->
							</div><!-- myPage_lately_info_cont end --> <!-- list 출력 -->
							
						</div><!-- myPage_lately_info end -->
						
						
						<div class="order_view_info">
							<div class="orderer_info">
								<div class="myPage_zone_tit"><h4>주문자 정보</h4></div>
								<div class="myPage_type_table">
									<table class="table_row">
									<colgroup>
										<col style="width:15%;">
										<col style="width:85%;">
									</colgroup>
										<tbody>
											<tr>
												<th scope="row">주문자 정보</th>
												<td>${list.payment_name}</td>
											</tr>
											<tr>
												<th scope="row">주소</th>
												<td>(${addressDefault.address_postcode}) ${addressDefault.main_address} ${addressDefault.address_reference} ${addressDefault.address_detail}</td>
											</tr>
											<tr>
												<th scope="row">휴대폰 번호</th>
												<td>${list.payment_phone}</td>
											</tr>
											<tr>
												<th scope="row">이메일</th>
												<td>${list.payment_email}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>  <!-- orderer_info end -->
							
							<div class="delivery_info">
								<div class="myPage_zone_tit"><h4>배송지 정보</h4></div>
								<div class="myPage_type_table">
									<table class="table_row">
									<colgroup>
										<col style="width:15%;">
										<col style="width:85%;">
									</colgroup>
										<tbody>
											<tr>
												<th scope="row">배송자 정보</th>
												<td>${addressOrder.address_recipient_name}</td>
											</tr>
											<tr>
												<th scope="row">주소</th>
												<td>(${addressOrder.address_postcode}) ${addressOrder.main_address} ${addressOrder.address_reference} ${addressOrder.address_detail}</td>
											</tr>
											<tr>
												<th scope="row">휴대폰 번호</th>
												<td>${addressOrder.address_recipient_phone}</td>
											</tr>
											<tr>
												<th scope="row">남기실 말씀</th>
												<td>${list.payment_comment}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div> <!-- delivery_info end -->
							
							<div class="payment_info">
								<div class="myPage_zone_tit"><h4>결제정보</h4></div>
								<div class="myPage_type_table">
									<table class="table_row">
									<colgroup>
										<col style="width:15%;">
										<col style="width:85%;">
									</colgroup>
										<tbody>
											<tr>
												<th scope="row">상품 합계 금액</th>
												<td>${list.payment_product_total}원</td>
											</tr>
											<tr>
												<th scope="row">배송비</th>
												<td>${list.payment_delivery}원</td>
											</tr>
											<tr>
												<th scope="row">할인혜택</th>
												<td>
													<div class="benefit_total_sale">
														<dl>
															<dt>상품</dt>
															<dd>(-) 0원</dd>
														</dl>
														<dl>
															<dt>쿠폰 및 포인트 할인</dt>
															<dd>(-) ${list.payment_total_discount}원</dd>
														</dl>
														<dl>
															<dt>총 할인</dt>
															<dd>${list.payment_total_discount}원</dd>
														</dl>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">총 결제 금액</th>
												<td><strong class="total_payMoney">${list.payment_total}원</strong></td>
											</tr>
											<tr>
												<th scope="row">결제수단</th>
												<td>
													<div class="pay_with_list">
														<strong class="pay_block_type">${list.payment_type}</strong>
														<br>
														<c:if test="${list.payment_type eq '신용카드' or list.payment_type eq '카카오페이'}">
															결제금액 : <strong>${list.payment_total}원</strong>
														</c:if>
														<c:if test="${list.payment_type ne '신용카드' and list.payment_type ne '카카오페이'}">
															입금금액 : <strong>${list.payment_total}원</strong>
														</c:if>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row">결제영수증</th>
												<td>미발급</td>
											</tr>
											<tr>
												<th scope="row">거래명세서</th>
												<td>미발급</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div> <!-- payment_info end -->
						
						</div><!-- order_view_info end -->
					</div><!-- myPage_cont end -->
				</div> <!--right_content END-->
				
			</div><!-- contents end -->
		</div><!-- container end -->
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div> <!-- wrapper end -->

<script type="text/javascript">
/*  주문취소 */
$('.myPage_lately_info_cont').on('click', '.btn_order_cancel', function(){
	console.log($(this).attr('data-payment-id'));
	let pn = 1;
	if(confirm('주문취소 처리를 하시겠습니까?')){
		$.ajax({
			type:"GET",
			url:"/cart/setPaymentCancelDetail",
			data: {
				payment_id:$(this).attr('data-payment-id'),
				payment_add_point: $(this).attr('data-payment-addPoint'),
				payment_use_point: $(this).attr('data-payment-usePoint')
			},
			success: function(result){
				alert(result);
				location.reload();
			
			}
		});
	}else{
		
	}
});

/* 환불처리 */
$('.myPage_lately_info_cont').on('click', '.btn_order_refund', function(){
	console.log($(this).attr('data-payment-id'));
	let pn = 1;
	if(confirm('환불 처리를 하시겠습니까?')){
 		$.ajax({
			type:"GET",
			url:"/cart/setPaymentRefundDetail",
			data: {
				payment_id:$(this).attr('data-payment-id'),
				payment_add_point: $(this).attr('data-payment-addPoint'),
				payment_use_point: $(this).attr('data-payment-usePoint')
			},
			success: function(result){
				alert(result);
				location.reload();
			
			}
		});
	}else{
		
	}
});
</script>
</body>
</html>