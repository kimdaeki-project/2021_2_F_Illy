<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/payment.css">
	<style type="text/css">
		
	</style>

<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>		
		<div id="container">
		<div id="contents">
			<div id="payment_main">
				<div id="payment_tit">
					<h2>주문서작성/결제</h2>
						
					<ol>
						<li>
							<span>01</span>
							장바구니
							<span>
								<img src="https://shop.illycaffe.co.kr/data/skin/front/udweb_200529/img/member/icon_join_step_off.png">
							</span>
						</li>
						<li class="payment_tit_black">
							<span>02</span>
							주문서작성/결제
							<span>
								<img src="https://shop.illycaffe.co.kr/data/skin/front/udweb_200529/img/member/icon_join_step_on.png">
							</span>
						</li>
						<li>
							<span>03</span>
							주문완료
						</li>
					</ol>
				</div> <!-- payment_tit end -->
				
				<div id="payment_cont">
					<div id="payment_cont_list">
						<div id="payment_cont_list_tit">
							<h3>주문상세내역</h3>
						</div> <!-- payment_cont_list_tit end -->
						
						<div class="payment_table">
						
							<table>
								<thead>
									<tr>
										<th>상품/옵션정보</th>
										<th>수량</th>
										<th>상품금액</th>
										<th>할인/적립</th>
										<th>합계금액</th>
										<th>배송비</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${paymentList}" var="carts" varStatus="status">
											<tr class="sumTotal">
												<td class="tb_product">${carts.product_name}</td>
												<td class="tb_border">
	        										${carts.cart_cnt}개
												</td>
												<td class="tb_border" data-price="${carts.product_price}">
													<fmt:formatNumber value="${carts.product_price}" pattern="###,###,###"/>원
												</td>
												<td class="tb_border"></td>
												<td class="tb_border checkTotal" data-total-price="${carts.product_price * carts.cart_cnt}">
													<fmt:formatNumber value="${carts.product_price * carts.cart_cnt}" pattern="###,###,###"/>원
												</td>
												<c:if test="${status.first}">
													<td class="delivery tb_border" rowspan="${paymentList.size()}">
														배송비 기본정책<br> <span class="deliveryPrice"></span>원<br>(택배-선결제)
													</td>
												</c:if>
											</tr>
										</c:forEach>
								</tbody>
							</table>
						</div> <!-- payment_table end -->
						
					</div> <!-- payment_cont_list end -->
					
					<div id="btn_leftBox">
						<a href="#">&lt; 장바구니 가기</a>
					</div> <!-- btn_leftBox end -->
					
					<div id="price_sum">
						<div id="totalPrice_rg">
							<div id="totalPrice_rg_list">
								<dl>
									<dt>총 <strong class="ttCount">${paymentList.size()}</strong>개의 상품</dt>
									<dd><strong class="ttPrice"></strong>원</dd>
								</dl>
								<span>
									<img alt="더보기" src="/images/cart/order_price_plus.png">
								</span>
								<dl>
									<dt>배송비</dt>
									<dd><strong class="deliveryPrice"></strong>원</dd>
								</dl>
								<span>
									<img alt="플러스" src="/images/cart/order_price_total.png">
								</span>
								<dl id="totalPrice_last">
									<dt>합계</dt>
									<dd><strong class="total_sum"></strong>원</dd>
								</dl>
							</div>
							<em>적립예정 일리 포인트 : 0콩</em>
						</div>
					</div> <!-- price_sum end -->
					
					<div id="payment_view_info"> <!-- 주문자정보, 배송정보, 결제정보, 결제수단 선택/결제 -->
						<div class="member_info">
							<div class="member_info_tit">
								<h4>주문자 정보</h4>
							</div>
							<div class="order_info_table">
								<table>
									<tbody>
										<tr>
											<th scope="row"><span class="essential">주문하시는 분</span></th>
											<td class="order_cont">
												<input type="text" value="">
											</td>
										</tr>
										<tr>
											<th scope="row">주소</th>
											<td>[우편번호] 우리집주소</td>
										</tr>
										<tr>
											<th scope="row"><span class="essential">휴대폰 번호</span></th>
											<td class="order_cont">
												<input type="text" value="">
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="essential">이메일</span></th>
											<td class="order_cont">
												<input class="selectedMail" type="text">
												<select id="emailDomail" style="width: 120px;" onChange="optionChange(this.value);">
													<option value="">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="daum.net">daum.net</option>
													<option value="nate.com">nate.com</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="gmail.com">gmail.com</option>
													<option value="icloud.com">icloud.com</option>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
							</div> <!-- order_info_table end -->
						</div> <!-- member_info end -->
						
						<div id="delivery_info">
							<div class="member_info_tit">
								<h4>배송정보</h4>
							</div>
							<div class="order_info_table">
								<table>
									<tbody>
										<tr>
											<th scope="row">배송지 확인</th>
											<td>
												<div class="delivery_control">
													<ul>
														<li>
															<input type="radio" id="default">
															<label for="default">기본 배송지</label>
														</li>
														<li>
															<input type="radio" id="latest">
															<label for="latest">최근 배송지</label>
														</li>
														<li>
															<input type="radio" id="selfDelivery">
															<label for="selfDelivery">직접 입력</label> <!-- 기본값 -->
														</li>
														<li>
															<input type="radio" id="sameDelivery">
															<label for="sameDelivery">주문자정보와 동일</label>
														</li>
													</ul>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="essential">받으실 분</span></th>
											<td class="order_cont">
												<input type="text" value="">
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="essential">받으실 곳</span></th>
											<td class="order_cont">
												<div class="address_postcode">
													<input type="text"> <!-- 우편번호 -->
													<button class="postcode_btn">우편번호검색</button>
												</div>
												<div class="address_input">
													<input type="text" class="recieveAddress"> <!-- 도로명주소 -->
													<input type="text" class="receiveAddressSeb"> <!-- 나머지 상세주소 -->
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="essential">휴대폰 번호</span></th>
											<td class="order_cont">
												<input type="text" value="">
											</td>
										</tr>
										<tr>
											<th scope="row">남기실 말씀</th>
											<td class="order_cont long_cont">
												<input type="text" value="">
											</td>
										</tr>
										<tr>
											<th scope="row">회원정보 반영</th>
											<td>
												<input type="checkbox" id="myDeliveryAdd">
												<label for="myDeliveryAdd">나의 배송지에 추가합니다.</label>
											</td>
										</tr>
									</tbody>
								</table>
							</div> <!-- order_info_table end -->
						</div> <!-- delivery_info end -->
						
						<div id="payment_info">
							<div class="member_info_tit">
								<h4>결제정보</h4>
							</div>
							<div class="order_info_table">
								<table>
									<tbody>
										<tr>
											<th scope="row">상품 합계 금액</th>
											<td><strong class="ttPrice order_payment_sum"></strong><strong class="order_payment_sum">원</strong></td>
										</tr>
										<tr>
											<th scope="row">배송비</th>
											<td><span class="deliveryPrice"></span>원</td>
										</tr>
										<tr>
											<th scope="row">할인 및 적립</th>
											<td>
												<ul>
													<li>
														<em>
															할인 : <strong>(-) 0원</strong> <span>( 상품 0원 , 회원 0원 , 쿠폰 0원 )</span>
														</em>
													</li>
													<li>
														<em>
															적립 일리 포인트 : <strong>(+) 0콩</strong> <span>( 상품 0콩 , 회원 0콩 , 쿠폰 0콩 )</span>
														</em>
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">쿠폰 사용</th>
											<td>
												<button>쿠폰 조회 및 적용</button>
											</td>
										</tr>
										<tr>
											<th scope="row">일리 포인트 사용</th>
											<td class="order_cont">
												<input type="text" value=""> 콩
											</td>
										</tr>
										<tr>
											<th scope="row">최종 결제 금액</th>
											<td><strong class="total_sum order_payment_sum"></strong>원</td>
										</tr>
									</tbody>
								</table>
							</div> <!-- order_info_table end -->
						</div> <!-- payment_info end -->
						
						<div id="payment_progress">
							<div class="member_info_tit">
								<h4>결제수단 선택 / 결제</h4>
								<p>※ 고객님은 안전거래를 위해 현금으로 결제시 저희 쇼핑몰에서 가입한 구매안전서비스인 KG 이니시스의 구매안전(에스크로)서비스를 이용하실 수 있습니다.</p>
							</div>
							
							<div class="payment_progress_list">
								<div class="pay_content">
									<div class="pay_content_first">
										<dl>
											<dt>일반결제</dt>
											<dd></dd>
										</dl>
									</div>
									<div class="pay_content_last">
										<dl>
											<dt>에스크로결제</dt>
											<dd></dd>
										</dl>
									</div>
								</div>
							</div> <!-- payment_progress_list end -->
						</div> <!-- payment_progress end -->											
					
					
					</div> <!-- payment_view_info end -->
					
				</div> <!-- payment_cont end --> 
	
			</div> <!-- payment_main end -->		
				
 		</div> <!-- contents end	 -->
		</div><!-- container end -->
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
price();
function price() {
	
	let sum = 0;
    let count = ${paymentList.size()};
    let delivery = 0;
    
    $('.sumTotal').each(function(){
		
		$(this).find('.checkTotal').each(function(){
			sum += parseInt($(this).attr('data-total-price'));
		});
	});
    
    console.log(sum);
   if(sum>0 && sum<50000) {
    	delivery=3500;
    }
    
    let sd = sum+delivery;
    
    
	sum=Number(sum).toLocaleString();
	delivery=Number(delivery).toLocaleString();
	sd=Number(sd).toLocaleString();
	
    $(".ttPrice").html(sum);
    $('.deliveryPrice').html(delivery);
    $('.total_sum').html(sd);
}

//이메일 select option함수
function optionChange(value) {
	console.log(value);
	$('.selectedMail').val(value);
}

</script>
</body>
</html>