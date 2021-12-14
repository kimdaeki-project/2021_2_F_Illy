<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

								<div class="myPage_type_table">
									<table>
									<colgroup>
			                            <col style="width:8%">	<!-- 선택 -->
			                            <col>					<!-- 상품명/옵션 -->
			                            <col style="width:15%">	<!-- 상품금액/수량 -->
			                            <col style="width:15%">	<!-- 혜택 -->
			                            <col style="width:10%">	<!-- 합계 -->
			                        </colgroup>
										<thead>
											<tr>
												<th>
													<div class="tableCheck">
													<c:if test="${empty list}">
														<input type="checkbox" id="allCheck" class="allCheck" disabled="disabled">
														<label for="allCheck" class="check_s allCheck_s"></label>
													</c:if>
													<c:if test="${!empty list}">
														<input type="checkbox" id="allCheck" class="allCheck">
														<label for="allCheck" class="check_s allCheck_s"></label>
													</c:if>
													</div>
												</th>
												<th>상품명/옵션</th>
												<th>상품금액/수량</th>
												<th>혜택</th>
												<th>합계</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${empty list}">
											<tr><td colspan="5"><div class="emptyList"><span>조회내역이 없습니다.</span></div></td></tr>
										</c:if>
										<c:if test="${!empty list}">
											<c:forEach items="${list}" var="wish" varStatus="status">
												<tr>
													<td>
														<div class="tableCheck">
																<input type="checkbox" id="wishCheckBox${wish.wish_id}" data-product-name="${wish.productVO.product_name}" 
																data-wish-id="${wish.wish_id}" data-wish-cnt="${wish.wish_cnt}" data-product-id="${wish.productVO.product_id}" data-wish-id="${wish.wish_id}" name="chkDel" class="checkOn chkBox">
															<label for="wishCheckBox${wish.wish_id}" class="check_s"></label>
														</div>
													</td>
													<td class="tb_product">
														<div class="product_name_file">
															<span class="product_name_file_fileAdd">
																<a href="/product/select?product_categoryCode=${wish.productVO.product_categoryCode}&product_id=${wish.productVO.product_id}">
																	<img alt="${wish.productVO.product_name}" src="/upload/product/${wish.productFileVO.productFile_name}">
																</a>
															</span>
															<div class="product_name_file_nameAdd">
																<a href="/product/select?product_categoryCode=${wish.productVO.product_categoryCode}&product_id=${wish.productVO.product_id}">${wish.productVO.product_name}</a>
															</div>
														</div>
													</td>
													<td style="font-size: 12px; font-weight: normal;">
														<strong><fmt:formatNumber value="${wish.productVO.product_price}" pattern="###,###,###"/>원</strong> / ${wish.wish_cnt}개
														<div style="padding-top: 10px;">
															<input type ="button" data-wish-id="${wish.wish_id}" data-wish-cnt="${wish.wish_cnt}" class="cnt_minus cntUp" value="-">
			        										<input type="text" name="cart_cnt" class="cnt_cart" value="${wish.wish_cnt}" readonly="readonly"/>
			       											<input type="button" data-wish-id="${wish.wish_id}" data-wish-cnt="${wish.wish_cnt}" class="cnt_plus cntUp" value="+">
		       											</div>
													</td>
													<td class="productPrice"></td>
													<td>
														<div>
															<a class="btn_wish_cart" data-wish-cnt="${wish.wish_cnt}" data-product-id="${wish.productVO.product_id}" data-wish-id="${wish.wish_id}"><em>장바구니</em></a>
															<a class="btn_wish_del" data-wish-id="${wish.wish_id}"><em>삭제하기</em></a>
														</div>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										</tbody>
									</table>
									<button onclick="optionDel()" class="btn_choice_wish_del"><em>선택 상품 삭제</em></button>
									<button onclick="optionCart()" class="btn_choice_wish_cart"><em>선택 상품 장바구니</em></button>
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

<script type="text/javascript">
// 전체 체크
$('#allCheck').click(function(){
	
	if($(this).is(':checked') == true) {
		$('input').prop('checked', true);	
		$('.check_s').addClass('on');
	}
	else {
		$('input').prop('checked', false);	
		$('.check_s').removeClass('on');
	}
	
});

// 상품 선택체크
$('.tableCheck').find('.chkBox').click(function(){
	if ($(this).is(':checked') == true) {
		$(this).next().addClass('on');
	}
	else {
		$(this).next().removeClass('on');
	}
	
	$('.allCheck').prop('checked', true);
	$('.check_s').addClass('on');
	
	$('.tableCheck').each(function(){
		
		$(this).find('.chkBox').each(function(){
			if($(this).is(':checked') == false) { // 상품 unChecked 일 경우
				$(this).next().removeClass('on');
				$('.allCheck').prop('checked', false);
				$('.allCheck').next().removeClass('on');
				
			}
		});
		
	});
});
</script>					