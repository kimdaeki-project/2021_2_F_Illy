<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 					<ul id="cart_top">
						<li class="on">
							<a href="http://localhost/cart/normalBasket">일반구매(${count})</a>
						</li>
						<li>
							<a href="http://localhost/cart/regularBasket">정기배송(0)</a>
						</li>
					</ul>
					
					<div id="cart_main">
						<div id="cart_list">
						<c:if test="${count eq 0}">
							<div>
								<p id="cart_null">장바구니에 담겨있는 상품이 없습니다.</p>
							</div>
						</c:if>
						<c:if test="${count ne 0}">
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
													<input type="checkbox" id="allCheck" value="${member.member_id}" class="allCheck">
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
 										<c:forEach items="${carts}" var="carts" varStatus="status">
											<tr>
												<c:if test="${carts.cart_state eq 'checked' or carts.cart_state eq 'unChecked'}">
												<td>
													<div class="tableCheck">
														<input type="hidden" value="${carts.cart_id}">
														<c:if test="${carts.cart_state eq 'checked'}">
															<input type="checkbox" id="cartCheckBox${carts.cart_id}" value="${carts.product_price * carts.cart_cnt}" 
															data-cart-id="${carst.cart_id}" name="chkDel" class="checkOn chkBox" checked="checked">
														</c:if>
														<c:if test="${carts.cart_state eq 'unChecked'}">
															<input type="checkbox" id="cartCheckBox${carts.cart_id}" value="${carts.product_price * carts.cart_cnt}" 
															data-cart-id="${carst.cart_id}" name="chkDel" class="checkOn chkBox">
														</c:if>
														<label for="cartCheckBox${carts.cart_id}" class="check_s"></label>
													</div>
												</td>
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
													<input type ="button" data-cart-id="${carts.cart_id}" class="cnt_minus" value="-">
	        										<input type="text" name="cart_cnt" class="cnt_cart" value="${carts.cart_cnt}" readonly="readonly"/>
	       											<input type="button" data-cart-id="${carts.cart_id}" class="cnt_plus" value="+">
												</td>
												<td class="tb_border productPrice" data-price="${carts.product_price}">
													<fmt:formatNumber value="${carts.product_price}" pattern="###,###,###"/>원
												</td>
												<td class="tb_border"></td>
												<td class="tb_border checkTotal">
													<fmt:formatNumber value="${carts.product_price * carts.cart_cnt}" pattern="###,###,###"/>원
												</td>
												<c:if test="${status.first}">
													<td class="delivery tb_border" rowspan="${count}">
														배송비 기본정책<br> <span class="deliveryPrice"></span>원<br>(택배-선결제)
													</td>
												</c:if>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div> <!-- cart_table end -->
						</c:if>
						</div> <!-- cart_list end -->
						
						<div id="btn_leftBox">
							<a href="http://localhost/product/list">&lt; 쇼핑 계속하기</a>
						</div>
						<div id="totalPrice">
							<div id="totalPrice_rg">
								<div id="totalPrice_rg_list">
									<dl>
										<dt>총 <strong class="ttCount"></strong>개의 상품</dt>
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
										<dd><strong id="total_sum"></strong>원</dd>
									</dl>
								</div>
								<em>적립예정 일리 포인트 : 0콩</em>
							</div>
						</div><!-- totalPrice end -->
						
						<div id="cart_bottom">
							<span id="cart_btn_left">
								<button class="cart_btn_left_del" onclick="optionDel()">선택 상품 삭제</button>
								<button class="cart_btn_left_ch">선택 상품 찜</button>
								<button class="cart_btn_left_ch">견적서 출력</button>
							</span>
							
							<span id="cart_btn_right">
								<button class="cart_btn_right_choice" onclick="optionOrder()">선택 상품 주문</button>
								<button class="cart_btn_right_whole" onclick="allOrder()">전체 상품 주문</button>
							</span>
							
						</div><!-- cart_bottom end -->
						
						
					</div> <!-- cart_main end -->

						
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	allChecked();
	price();
	count();
	
	function count() {	
		
		let count = 0;
		$('.tableCheck').each(function(){
			
			$(this).find('.chkBox').each(function(){
				if($(this).is(':checked') == true) {
					count++;
				};
			});
			
		});
		
		$('.ttCount').html(count);		
	}
	
	function price() {
		
		let sum = 0;
	    let count = $(".checkOn").length;
	    let delivery = 0;
	    let ttCount = 0;
	    
	    
        for (let i = 0; i < count; i++) {
            if ($(".checkOn")[i].checked == true) {
                sum += parseInt($(".checkOn")[i].value);
                ttCount++;
            }
        }
        
        if(sum>0 && sum<50000) {
        	delivery=3500;
        }
        
        let sd = sum+delivery;
        
        count=Number(count).toLocaleString();
 		sum=Number(sum).toLocaleString();
 		delivery=Number(delivery).toLocaleString();
 		sd=Number(sd).toLocaleString();
        $('.ttCount').html(ttCount);
        $(".ttPrice").html(sum);
        $('.deliveryPrice').html(delivery);
        $('#total_sum').html(sd);
	}
	
	function allChecked() {
//		전체선택 checked
		$('.allCheck').prop('checked', true);
		$('.check_s').addClass('on');
		
		
		
		$('.tableCheck').each(function(){
			
			$(this).find('.chkBox').each(function(){
				if($(this).is(':checked') == false) { // 상품 unChecked 일 경우
					$(this).next().removeClass('on');
					$('.allCheck').prop('checked', false);
					$('.allCheck').next().removeClass('on');
					
				};
			});
			
		});
	}
	
	// 전체 체크
	$('#allCheck').click(function(){
		
		let boolean;
		let cart_state;
		let member_id = $(this).val();
		
		if($(this).is(':checked') == true) {
			boolean = true;
			cart_state = "checked"
			$('.check_s').addClass('on');
		}
		else {
			boolean = false;
			cart_state = "unChecked";
			$('.check_s').removeClass('on');
		}
		
 		$.ajax({
			async : false,
			type : 'GET',
			url : './setCheckAll',
			data : {
				cart_state : cart_state,
				member_id : member_id
			},
			success : function(){	
				$('input').prop('checked', boolean);			
				allChecked();
				count();
				price();
				ajaxBasket();
				
			},
			error : function(xhr, status, error){
				console.log("error");				
			}			
		});	
		
	});

	// 상품 선택체크
 	$('.tableCheck').find('.chkBox').click(function(){
		
		let cart_id = $(this).prev().val();
		let cart_state;
		if ($(this).is(':checked') == true) {
			cart_state = "checked";
			$(this).next().addClass('on');
		}
		else {
			cart_state = "unChecked";
			$(this).next().removeClass('on');
		}	
		
 		$.ajax({
			async : false,
			type : 'GET',
			url : './setCheckOne',
			data : {
				cart_state : cart_state,
				cart_id : cart_id
			},
			success : function(){
				allChecked();
				count();
				price();
				ajaxBasket();

			},
			error : function(xhr, status, error){
				console.log("error");				
			}			
		});
		
	});
	
 	// 수량변경 마이너스
	$(".cnt_minus").click(function(){
		let cart_id = $(this).attr('data-cart-id');
		let cart_cnt = $(this).next().val();
		cart_cnt -= 1;
		let member_id=$('#memberIdHidden').val();
		if(cart_cnt<1){
			alert('해당 상품의 구매 가능한 최소수량은 1개 입니다.');
			cart_cnt=1;
		}
		$(this).next().val(cart_cnt);
		
		$.ajax({
			type: "GET",
			url: "./updateCount",
			data: {
				cart_id:cart_id,
				cart_cnt:cart_cnt,
				member_id:member_id
			},
			success: function(result){
				result=result.trim();
				$('#cart_ajax').html(result);
			}
		});
	});
 	
	//수량변경 플러스
	$(".cnt_plus").click(function(){
		let cart_id = $(this).attr('data-cart-id');
		let cart_cnt = $(this).prev().val();
		cart_cnt=Number(cart_cnt)+1;
		$(this).prev().val(cart_cnt);
		
		let member_id=$('#memberIdHidden').val();
		
		$.ajax({
			type: "GET",
			url: "./updateCount",
			data: {
				cart_id:cart_id,
				cart_cnt:cart_cnt,
				member_id:member_id
			},
			success: function(result){
				result=result.trim();
				$('#cart_ajax').html(result);
			}
		});
	});	
	
</script>	