<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:if test="${empty list}">
	<span class="pick_list_num">주문목록 / 배송조회 목록 총 <strong>0</strong> 건</span>
	<div class="myPage_type_table">
		<table>
		<colgroup>
			<col style="width:15%"> <!-- 날짜/주문번호 -->
			<col> <!-- 상품명/옵션 -->
			<col style="width:15%"> <!-- 상품금액/수량 -->
			<col style="width:15%"> <!-- 주문상태 -->
			<col style="width:15%"> <!-- 확인/리뷰 -->
		</colgroup>
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
				<tr><td colspan="5"><div class="emptyList"><span>조회내역이 없습니다.</span></div></td></tr>
			</tbody>
		</table>	
	</div>
</c:if>		
<c:if test="${!empty list}">												
 		<span class="pick_list_num" data-total-count="${count}">주문목록 / 배송조회 목록 총 <strong>${count}</strong> 건</span>
		<div class="myPage_type_table">
			<table>
			<colgroup>
				<col style="width:15%"> <!-- 날짜/주문번호 -->
				<col> <!-- 상품명/옵션 -->
				<col style="width:15%"> <!-- 상품금액/수량 -->
				<col style="width:15%"> <!-- 주문상태 -->
				<col style="width:15%"> <!-- 확인/리뷰 -->
			</colgroup>
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
				<c:forEach items="${list}" var="list">
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
									<td>
										<c:if test="${carts.cart_state eq 'done'}">
											<c:if test="${carts.cart_review_state eq 0}">
												<input hidden="" class="review_state_date" value="${list.payment_date}">
												<input hidden="" class="cart_id" value="${carts.cart_id}">	
												<div class="reviewState">
												
												</div>															
											</c:if>
											<c:if test="${carts.cart_review_state eq 1}">
												<span class="checkReview">"리뷰쓰기완료"</span>
												<button class="reviewBtn goReview" type="button" onClick="location.href='./myReviewSelect?cart_id=${carts.cart_id}'">보러가기</button>
											</c:if>
										</c:if>
									</td>
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
									<td>
										<c:if test="${carts.cart_state eq 'done'}">
											<c:if test="${carts.cart_review_state eq 0}">
												<input hidden="" class="review_state_date" value="${list.payment_date}">
												<input hidden="" class="cart_id" value="${carts.cart_id}">
												<div class="reviewState">
													
												</div>	
											</c:if>
											<c:if test="${carts.cart_review_state eq 1}">
												<span class="checkReview">"리뷰쓰기완료"</span>
												<button class="reviewBtn goReview" type="button" onClick="location.href='./myReviewSelect?cart_id=${carts.cart_id}'">보러가기</button>
											</c:if>
										</c:if>
									</td>
								</tr>
							</c:if>
												
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
	</div> <!-- myPage_type_table end -->
					
							
				
				<div class="pagination">
					<c:if test="${pager.curBlock>1}">
						<button type="button" data-list-pn="${pager.curBlock=1}"  class="btnPage pageBtn">&#9001;&#9001; 맨앞</button>
						<button type="button" data-list-pn="${pager.startNum-1}" style="margin-right:10px;" class="btnPage pageBtn">&#9001; 이전</button>
					</c:if>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<c:if test="${pager.startNum ne null}">
							<span class="pageNum pageBtn" data-list-pn="${i}">${i}</span>
						</c:if>
					</c:forEach>
					<c:if test="${!pager.lastCheck}">
						<button type="button" data-list-pn="${pager.lastNum+1}" style="margin-left:10px;" class="btnPage pageBtn">다음 &#9002;</button>
						<button type="button" data-list-pn="${pager.totalPage}"  class="btnPage pageBtn">맨뒤 &#9002;&#9002;</button>
					</c:if>
						
				</div><!-- pagination end --> 
				
</c:if>