<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:if test="${empty list}">
	<span class="pick_list_num" style="text-align:right;">*구매 후 50일이 지나지 않은 상품만 리뷰 작성이 가능합니다</span>
	<div class="myPage_type_table">
		<table>
		<colgroup>
			<col style="width:20%"> <!-- 날짜/주문번호 -->
			<col> <!-- 상품명/옵션 -->
			<col style="width:20%"> <!-- 상품금액/수량 -->
			<col style="width:20%"> <!-- 확인/리뷰 -->
		</colgroup>
			<thead>
				<tr>
					<th>구매 날짜</th>
					<th>상품명/옵션</th>
					<th>상품금액/수량</th>
					<th>확인/리뷰</th>
				</tr>
			</thead>
			<tbody>
				<tr><td colspan="5"><div class="emptyList"><span>조회내역이 없습니다.</span></div></td></tr>
			</tbody>
		</table>	
	</div>
</c:if>		
<c:if test="${not empty list}">												
 		<span class="pick_list_num" style="text-align:right;">*구매 후 50일이 지나지 않은 상품만 리뷰 작성이 가능합니다</span>
		<div class="myPage_type_table">
			<table>
			<colgroup>
				<col style="width:20%"> <!-- 날짜/주문번호 -->
				<col> <!-- 상품명/옵션 -->
				<col style="width:20%"> <!-- 상품금액/수량 -->
				<col style="width:20%"> <!-- 확인/리뷰 -->
			</colgroup>
				<thead>
					<tr>
						<th>구매 날짜</th>
						<th>상품명/옵션</th>
						<th>상품금액/수량</th>
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
										<c:if test="${carts.cart_state eq 'done'}">
											<c:if test="${carts.cart_review_state eq 0}">
												<a class="reviewBtn" href="./reviewInsert?cart_id=${carts.cart_id}">리뷰쓰기</a>
											</c:if>
											<c:if test="${carts.cart_review_state eq 1}">
												<span class="checkReview">"리뷰쓰기완료"</span></br>
												<button class="reviewBtn goReview" type="button" onClick="location.href='/reviewSelect?cart_id='${carts.cart_id}">보러가기</button>
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
										<c:if test="${carts.cart_state eq 'done'}">
											<c:if test="${carts.cart_review_state eq 0}">
												<a class="reviewBtn"href="./reviewInsert?cart_id=${carts.cart_id}">리뷰쓰기</a>
											</c:if>
											<c:if test="${carts.cart_review_state eq 1}">
												<span class="checkReview">"리뷰쓰기완료"</span></br>
												<button class="reviewBtn goReview" type="button" onClick="location.href='./reviewSelect?cart_id='${carts.cart_id}">보러가기</button>
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