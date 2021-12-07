<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/order/payment.css">
	
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
								<colgroup>
 									<col>
 									<!-- 상품/옵션 정보 -->
 									<col style="width:13%">
 									<!-- 수량 -->
 									<col style="width:10%">
 									<!-- 상품금액 -->
 									<col style="width:11%">
 									<!-- 할인/적립 -->
 									<col style="width:10%">
 									<!-- 합계금액 -->
 									<col style="width:10%">
 									<!-- 배송비 -->
 								</colgroup>
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
<%-- 								<c:if test="${paymentList ne null}"> --%>
									<c:forEach items="${paymentList}" var="carts" varStatus="status">
										<c:if test="${status.last}">
											<input type="hidden" value="${carts.product_name}" id="full_cartProduct">
											<input type="hidden" value="${status.index}" id="full_cartSize">
										</c:if>
											<tr class="sumTotal">
												<td class="tb_product">
													<div class="product_name_file">
														<span class="product_name_file_fileAdd">
															<a>
																<img alt="${carts.product_name}" src="/upload/product/${carts.productFile_name}">
															</a>
														</span>
														<div class="product_name_file_nameAdd">
															<a>${carts.product_name}</a>
														</div>
													</div>
												</td>
												<td class="tb_border">
	        										${carts.cart_cnt}개
												</td>
												<td class="tb_border" data-price="${carts.product_price}">
													<fmt:formatNumber value="${carts.product_price}" pattern="###,###,###"/>원
												</td>
												<td class="tb_border"><input type="hidden" class="member_id" value="${carts.member_id}"></td>
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
<%-- 								</c:if>
								<c:if test="${paymentList eq null}">
									
								</c:if>	 --%>
								</tbody>
							</table>
						</div> <!-- payment_table end -->
						
					</div> <!-- payment_cont_list end -->
					
					<div id="btn_leftBox">
						<a href="../cart/normalBasket">&lt; 장바구니 가기</a>
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
							<em>적립예정 일리 포인트 : <span class="add_bean"></span>콩</em>
						</div>
					</div> <!-- price_sum end -->
					
					<div id="payment_view_info"> <!-- 주문자정보, 배송정보, 결제정보, 결제수단 선택/결제 -->
						<div class="member_info">
							<div class="member_info_tit">
								<h4>주문자 정보</h4>
							</div>
							<div class="order_info_table">
								<table>
								<colgroup>
									<col style="width:15%">
 									<col style="width:85%">
 								</colgroup>
									<tbody>
										<tr>
											<th scope="row"><span class="essential" >주문하시는 분</span></th>
											<td class="order_cont payment_name">
												<input type="text" value="${memberVO.member_name}" class="order_name">
											</td>
										</tr>
										<tr>
											<th scope="row">
												주소
												<input type="hidden" id="full_address" value="${addressJoin.main_address}&nbsp;${addressJoin.address_reference}&nbsp;${addressJoin.address_detail}">
												<input type="hidden" id="full_main_address" value="${addressJoin.main_address}&nbsp;${addressJoin.address_reference}">
												<input type="hidden" id="full_address_detail" value="${addressJoin.address_detail}">
											</th>
											<td class="address_read">[${addressJoin.address_postcode}]${addressJoin.main_address}&nbsp;${addressJoin.address_reference}&nbsp;${addressJoin.address_detail}</td>
										</tr>
										<tr>
											<th scope="row"><span class="essential">휴대폰 번호</span></th>
											<td class="order_cont">
												<input type="text" value="${memberVO.member_phone}" class="order_phone" placeholder="EX) 010-1234-5678">
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="essential">이메일</span></th>
											<td class="order_cont">
												<input class="selectedMail" type="email" value="${memberVO.member_email}" class="order_email">
												<select id="emailDomail" style="width: 120px;" onChange="optionChange(this.value);">
													<option value="@">직접입력</option>
													<option value="@naver.com">naver.com</option>
													<option value="@hanmail.net">hanmail.net</option>
													<option value="@daum.net">daum.net</option>
													<option value="@nate.com">nate.com</option>
													<option value="@hotmail.com">hotmail.com</option>
													<option value="@gmail.com">gmail.com</option>
													<option value="@icloud.com">icloud.com</option>
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
								<colgroup>
									<col style="width:15%">
 									<col style="width:85%">
 								</colgroup>
									<tbody>
										<tr>
											<th scope="row">배송지 확인</th>
											<td>
												<div class="delivery_control">
													<ul>
														<li>
															<input type="hidden" value="${addressDefault.address_recipient_name}"> <!-- 기본배송지 관련 hidden -->
															<input type="hidden" id="full_postcode" value="${addressDefault.address_postcode}">
															<input type="hidden" value="${addressDefault.main_address}&nbsp;${addressDefault.address_reference}">
															<input type="hidden" value="${addressDefault.address_detail}">
															<input type="hidden" value="${addressDefault.address_recipient_phone}">
															<input type="hidden" value="${addressDefault.address_id}">
															<input type="radio" id="default" class="dC">
															<label for="default" class="choice_s">기본 배송지</label>
														</li>
														<li>
															<input type="radio" id="latest" class="dC">
															<label for="latest" class="choice_s">최근 배송지</label>
														</li>
														<li>
															<input type="radio" id="selfDelivery" class="dC">
															<label for="selfDelivery" class="choice_s on">직접 입력</label> <!-- 기본값 -->
														</li>
														<li>
															<input type="radio" id="sameDelivery" class="dC">
															<label for="sameDelivery" class="choice_s">주문자정보와 동일</label>
														</li>
													</ul>
													<span class="delivery_myAddress">
														<a>배송지 관리</a>
													</span>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="essential">받으실 분</span></th>
											<td class="order_cont">
												<input type="hidden" value="${addressVO.address_recipient_name}"> <!-- 최근배송지 관련 hidden -->
												<input type="text" class="delivery_name">
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="essential">받으실 곳</span></th>
											<td class="order_cont">
												<div class="address_postcode">
													<input type="hidden" value="${addressVO.address_postcode}">
													<input type="text" id="sample6_postcode" readonly="true" class="delivery_postcode">
													<button class="postcode_btn" onclick="sample6_execDaumPostcode()">우편번호검색</button>
													
												</div>
												<div class="address_input">
													
													<input type="text" id="sample6_address" class="address_input address_reference" readonly="true">
													<input type="hidden" value="${addressVO.main_address}&nbsp;${addressVO.address_reference}">
													<input type="hidden" value="${addressVO.address_detail}">
													<input type="text" id="sample6_detailAddress" placeholder="상세주소" class="address_input address_detail">
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="essential">휴대폰 번호</span></th>
											<td class="order_cont">
												<input type="hidden" value="${addressVO.address_recipient_phone}" >
												<input type="text" class="delivery_phone" placeholder="EX) 010-1234-5678">
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
												<div class="delivery_add delivery_control">
													<input type="checkbox" id="myDeliveryAdd" value="no">
													<label for="myDeliveryAdd" class="check_s">나의 배송지에 추가합니다.</label>
												</div>
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
								<colgroup>
									<col style="width:15%">
 									<col style="width:85%">
 								</colgroup>
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
												<ul class="order_sale_point">
													<li class="order_sale">
														<em>
															할인 : <strong>(-) 0원</strong> <span>( 상품 0원 , 회원 0원 , 쿠폰 0원 )</span>
														</em>
													</li>
													<li class="order_point">
														<em>
															적립 일리 포인트 : <strong>(+) <strong class="add_bean"></strong>콩</strong> <span>( 상품 <span class="add_bean"></span>콩 , 회원 0콩 , 쿠폰 0콩 )</span>
														</em>
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">쿠폰 사용</th>
											<td>
												<ul class="coupon_use_ul dn">
													<li class="coupon_use_benefit">
														<em>주문할인 : 
															<strong>(-) <b class="productSale">0</b>원</strong>
														</em>
													</li>
													<li class="coupon_use_benefit">
														<em>배송비할인 : 
															<strong>(-) <b class="deliverySale">0</b>원</strong>
														</em>
													</li>
													<li class="coupon_use_benefit_final">
														<em>적립 일리 포인트 : 
															<strong>(+) <b>0</b>콩</strong>
														</em>
													</li>
												</ul>
												
												<button class="coupon_use">쿠폰 조회 및 적용</button>												
											</td>
										</tr>												
										<tr>
											<th scope="row">일리 포인트 사용</th>
											<td class="order_cont use_bean">
												<b><input type="number" class="read_bean"> 콩</b>
												<div class="use_bean_chk">
													<input type="checkbox" id="allBeanUse">
													<label for="allBeanUse" class="allBeanUse">전액 사용하기</label>
													<span>
														(보유 일리 포인트 : <span class="all_beanUse" data-member-point="${memberVO.member_point}">${memberVO.member_point}</span> 콩)
													</span>
													<em></em>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">최종 결제 금액</th>
											<td><strong class="total_total_sum"></strong>원</td>
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
											<dd>
												<div class="payment_pay">
													<ul>
														<li>
															<input type="radio" class="pC" id="card" value="신용카드" checked="checked">
															<label for="card" class="pay_s on">신용카드</label>
														</li>
														<li>
															<input type="radio" class="pC" id="account" value="계좌이체">
															<label for="account" class="pay_s">계좌이체</label>
														</li>
														<li>
															<input type="radio" class="pC" id="account_d" value="가상계좌">
															<label for="account_d" class="pay_s">가상계좌</label>
														</li>
														<li>
															<input type="radio" class="pC" id="kakao" value="카카오페이">
															<label for="kakao" class="pay_s">카카오페이</label>
														</li>
													</ul>
												</div>
											</dd>
										</dl>
									</div>
									<div class="pay_content_last">
										<dl>
											<dt>에스크로결제</dt>
											<dd>
												<div class="payment_pay">
													<ul>
														<li>
															<input type="radio" class="pC" id="as_account" value="계좌이체">
															<label for="as_account" class="pay_s">계좌이체</label>
														</li>
													</ul>
												</div>
											</dd>
										</dl>
									</div>
								</div>
							</div> <!-- payment_progress_list end -->
							
							<div class="payment_final">
								<div class="payment_final_total">
									<dl>
										<dt>최종 결제 금액</dt>
										<dd><span><strong class="total_total_sum"></strong>원</span></dd>
									</dl>
								</div>
								<div class="payment_final_check">
									<input type="checkbox" id="import_s">
									<label for="import_s" class="import_s"><b>(필수)</b> 구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
								</div>
								<div class="payment_final_btn">
									<button class="btnDefault red btn_center_order">결제하기</button>
								</div>
							</div> <!-- payment_final end -->
						</div> <!-- payment_progress end -->											
					
					
					</div> <!-- payment_view_info end -->
					
				</div> <!-- payment_cont end --> 
	
			</div> <!-- payment_main end -->		
			
		<!-- ---------------------------------------------- modal창 띄우기 ---------------------------------------------------  -->
									<!-- 쿠폰적용 modal -->
									<div class="modal coupon_modal_list dn">
										<div class="modal_window">
											<div class="modal_tit">
												<h4>
													쿠폰 적용하기
													<span>가능한 쿠폰만 노출됩니다. </span>
												</h4>
											</div><!-- modal_tit end -->
											<div class="modal_cont">
												<div class="coupon_scroll_box">
																
													<c:if test="${coupon.size() eq 0}">
														<h4>적용 가능한 쿠폰이 없습니다.</h4>
													</c:if>
																
													<c:if test="${coupon.size() ne 0}">
														<h5 class="order_h5">주문쿠폰</h5>
														<div class="top_table_type">
															<table>
																<thead>
																	<tr>
																		<th>&nbsp;</th>
																		<th>쿠폰</th>
																		<th>사용조건</th>
																		<th>사용기한</th>	
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${coupon}" var="coupon" varStatus="status">
																		<tr>
																			<%-- <c:if test="${coupon.coupon_type eq 'delivery'}">
																				<c:if test="${status.first}">
																				<td rowspan="${status.end+1}" colspan="4" style="padding: 30px 15px 28px;
																																 font-size: 13px;
																																 font-weight: 600;">상품 쿠폰이 없습니다.</td>
																				</c:if>
																			</c:if> --%>
																			<c:if test="${coupon.coupon_type eq 'cart'}" var="cart">
																				<td>
																					<span class="coupon_element">
																						<input type="hidden" value="${coupon.coupon_id}" class="couponID">
																						<input type="checkbox" id="couponCheck_cart${coupon.coupon_id}" value="${coupon.coupon_discount}" class="coupon_s cart_one">
																						<label for="couponCheck_cart${coupon.coupon_id}" class="couponCheck_cart"></label>
																						
																					</span>
																				</td>
																				<td>${coupon.coupon_name}
																					<br>
																					<fmt:formatNumber value="${coupon.coupon_discount}" pattern="###,###,###"/>원 할인
																				</td>
																				<td>- 중복 사용불가</td>
																				<td>${coupon.coupon_validity}</td>
																			</c:if>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div><!-- top_table_type end -->
														<h5 class="delivery_h5">배송비쿠폰</h5>
														<div class="top_table_type">
															<table>
																<thead>
																				
																	<tr>
																		<th>&nbsp;</th>
																		<th>쿠폰</th>
																		<th>사용조건</th>
																		<th>사용기한</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${coupon}" var="coupon" varStatus="status">
																	<tr>
																		<%-- <c:if test="${coupon.coupon_type eq 'cart'}">
																			<c:if test="${status.first}">
																			<td rowspan="${status.end+1}" colspan="4" style="padding: 30px 15px 28px;
																															 font-size: 13px;
																															 font-weight: 600;">배송지 쿠폰이 없습니다.</td>
																			</c:if>
																		</c:if> --%>
																		<c:if test="${coupon.coupon_type eq 'delivery'}" var="delivery">
																			<td>
																				<span class="coupon_element">
																					<input type="hidden" value="${coupon.coupon_id}" class="couponID">
																					<input type="checkbox" id="couponCheck_delivery${coupon.coupon_id}" value="${coupon.coupon_discount}" class="coupon_s delivery_one">
																					<label for="couponCheck_delivery${coupon.coupon_id}" class="couponCheck_delivery"></label>
																				</span>
																			</td>
																			<td>${coupon.coupon_name}
																				<br>
																				<fmt:formatNumber value="${coupon.coupon_discount}" pattern="###,###,###"/>원 할인
																			</td>
																			<td>- 중복 사용불가</td>
																			<td>${coupon.coupon_validity}</td>
																		</c:if>
																	</tr>																		
																	</c:forEach>
																</tbody>
															</table>
														</div><!-- top_table_type end -->
													</c:if>
												</div> <!-- coupon_scroll_box end -->												
												<div class="coupon_total_box">
													<dl>
														<dt>총 할인금액</dt>
														<dd><strong class="coupon_product_sale">0</strong>원</dd>
													</dl>
													<dl>
														<dt>총 적립금액</dt>
														<dd><strong>0</strong>원</dd>
													</dl>
													<dl>
														<dt>배송비 할인금액</dt>
														<dd><strong class="coupon_delivery_sale">0</strong>원</dd>
													</dl>
												</div> <!-- coupon_total_box end -->
												
												<div class="btn_center_box">
													<button type="button" class="btn_cancel_box close_a_btn">
														<strong>취소</strong>
													</button>
													<button type="button" class="btn_coupon_chk close_a_btn_coupon">
														<strong>쿠폰 적용</strong>
													</button>
												</div> <!-- btn_center_box end -->
											</div><!-- modal_cont end -->
											<a class="modal_close close_a_btn"><img src="/images/cart/btn_layer_close.png" alt="닫기"></a>
										</div><!-- modal_window end -->
									</div><!-- 쿠폰적용 modal end -->
									
									
									
									<!-- 배송지관리 modal -->
									<div class="modal delivery_modal_list dn">
										<div class="delivery_window">
											<div class="delivery_modal_tit">
												<h4>나의 배송지 관리</h4>
											</div>
											<div class="delivery_modal_cont">
												<div class="delivery_modal_scroll">
													<h5>배송지 목록</h5>
													<div class="delivery_add_list">
														<div class="delivery_modal_table">
															<table>
																<thead>
																	<tr>
																		<th>선택</th>
																		<th>배송지이름</th>
																		<th>받으실분</th>
																		<th>주소</th>
																		<th>연락처</th>
																		<th>수정/삭제</th>
																	</tr>
																</thead>
																<tbody>
																<c:if test="${addressList.size() eq 0}">
																	<tr>
																		<td colspan="6">
																			<div style="width: 100%;
																						text-align: center;
																						position: relative;
																						padding: 50px 30px;
																						font-size: 12px;
																						color: #333;">
																				배송지 내역이 없습니다.
																			</div>
																		</td>
																	</tr>
																</c:if>
																<c:if test="${addressList.size() ne 0}">
																	<c:forEach items="${addressList}" var="al">
																		<c:if test="${al.address_default eq 1}">
																			<tr>
																				<td>
																					
																					<span class="delivery_btn_click delivery_myAddress_chk"><a>선택</a></span>
																				</td>
																				<td>
																					<span>(기본배송지)</span><br>
																					<strong>${al.address_name}</strong>
																				</td>
																				<td>${al.address_recipient_name}</td>
																				<td class="td_address">[${al.address_postcode}] ${al.main_address} ${al.address_reference} ${al.address_detail}</td>
																				<td class="td_phone">휴대폰 : ${al.address_recipient_phone}</td>
																				<td class="td_hidden_info">
																					<span class="delivery_btn_click delivery_myAddress_up" data-address-id="${al.address_id}">
																						<span>
																							<input type="hidden" value="${al.address_name}" class="address_name_modal">
																							<input type="hidden" value="${al.address_default}" class="address_default_modal">
																							<input type="hidden" value="${al.member_id}" class="member_id_modal">
																							<input type="hidden" value="${al.address_id}" class="address_id_modal">
																							<input type="hidden" value="${al.address_recipient_name}" class="address_recipient_name_modal">
																							<input type="hidden" value="${al.address_postcode}" class="address_postcode_modal">
																							<input type="hidden" value="${al.main_address}" class="main_address_modal">
																							<input type="hidden" value="${al.address_reference}" class="address_reference_modal">
																							<input type="hidden" value="${al.address_detail}" class="address_detail_modal">
																							<input type="hidden" value="${al.address_recipient_phone}" class="address_recipient_phone_modal">
																						</span>
																						<a>수정</a>
																					</span>
																					<span class="delivery_btn_click delivery_myAddress_del" data-default-chk="${al.address_default}" data-myDelivery-del="${al.address_id}">
																						<a>
																							<input type="hidden" value="${al.address_name}" class="address_name_modal">
																							삭제
																						</a>
																					</span>
																				</td>
																			</tr>
																		</c:if>
																	</c:forEach>
																	<c:forEach items="${addressList}" var="al">
																		<c:if test="${al.address_default eq 0}">
																			<tr>
																				<td>
																					<span class="delivery_btn_click delivery_myAddress_chk"><a>선택</a></span>
																				</td>
																				<td>
																					<span></span>
																					<strong>${al.address_name}</strong>
																				</td>
																				<td>${al.address_recipient_name}</td>
																				<td class="td_address">[${al.address_postcode}] ${al.main_address} ${al.address_reference} ${al.address_detail}</td>
																				<td class="td_phone">휴대폰 : ${al.address_recipient_phone}</td>
																				<td class="td_hidden_info">
																					<span class="delivery_btn_click delivery_myAddress_up" data-address-id="${al.address_id}">
																						<span>
																							<input type="hidden" value="${al.address_name}" class="address_name_modal">
																							<input type="hidden" value="${al.address_default}" class="address_default_modal">
																							<input type="hidden" value="${al.member_id}" class="member_id_modal">
																							<input type="hidden" value="${al.address_id}" class="address_id_modal">
																							<input type="hidden" value="${al.address_recipient_name}" class="address_recipient_name_modal">
																							<input type="hidden" value="${al.address_postcode}" class="address_postcode_modal">
																							<input type="hidden" value="${al.main_address}" class="main_address_modal">
																							<input type="hidden" value="${al.address_reference}" class="address_reference_modal">
																							<input type="hidden" value="${al.address_detail}" class="address_detail_modal">
																							<input type="hidden" value="${al.address_recipient_phone}" class="address_recipient_phone_modal">
																						</span>
																						<a>수정</a>
																					</span>
																					<span class="delivery_btn_click delivery_myAddress_del" data-default-chk="${al.address_default}" data-myDelivery-del="${al.address_id}">
																						<a>
																							<input type="hidden" value="${al.address_name}" class="address_name_modal">
																							삭제
																						</a>
																					</span>
																				</td>
																			</tr>
																		</c:if>
																	</c:forEach>
																</c:if>
																</tbody>
															</table>
														</div>
														<a class="new_delivery_add">+ 새 배송지 추가</a>
													</div> <!-- delivery_add_list end  -->
												</div> <!-- delivery_modal_scroll end -->
											</div><!-- delivery_modal_cont end -->
											<a class="modal_close delivery_a_close"><img src="/images/cart/btn_layer_close.png" alt="닫기"></a>
										</div><!-- delivery_window end -->
									</div><!-- 배송지관리 modal end -->
		<!-- ------------------------------------------------------------------------------------------------------------  -->				
 		</div> <!-- contents end	 -->
		</div><!-- container end -->
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="/js/cart/payment.js"></script>
<script type="text/javascript">

price();
pointZero();

function price() {
	
	let sum = 0;
   let count = ${paymentList.size()};
   let delivery = 0;
   
   $('.sumTotal').each(function(){
		
		$(this).find('.checkTotal').each(function(){
			sum += parseInt($(this).attr('data-total-price'));
		});
	});
   
   
  if(sum>0 && sum<50000) {
   	delivery=3500;
   }
   
   let sd = sum+delivery;
   let bean=0;
   bean=parseInt(sum)*0.012;
	sum=Number(sum).toLocaleString();
	delivery=Number(delivery).toLocaleString();
	sd=Number(sd).toLocaleString();
	
   $(".ttPrice").html(sum);
   $('.deliveryPrice').html(delivery);
   $('.total_sum').html(sd);
   $('.total_total_sum').html(sd);
   $('.add_bean').html(bean);
}

function pointZero() {
	if($('.all_beanUse').attr("data-member-point") == 0) {
		$('.read_bean').attr('readonly', true);
		$('#allBeanUse').attr('disabled', true);
	}
}
</script>

<!-- iamport.payment.js --> <!-- 카카오API -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

</body>
</html>