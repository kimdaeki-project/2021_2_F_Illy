<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		<input type="hidden" value="${member.member_id}" id="memberIdHidden">		
			<div id="contents">
			
				<div id="order_main">
					<div id="order_tit">
						<h2>장바구니</h2>
						
						<ol>
							<li class="order_tit_black">
								<span>01</span>
								장바구니
								<span>
									<img src="https://shop.illycaffe.co.kr/data/skin/front/udweb_200529/img/member/icon_join_step_on.png">
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
						
					</div> <!-- cart_ajax end -->
					
				</div> <!-- order_main end -->
				<div id="order_bottom"><p>주문서 작성단계에서 할인/일리 포인트 적용을 하실 수 있습니다.</p></div>	
 				<div class="naver_pay_box">
					<div class="payBox">
							<div class="naverPay">
								<link id="NAVER_PAY_STYLE" type="text/css" rel="stylesheet" href="https://img.pay.naver.net/static/css/button/button2.css?455213">
								
								<div class="npay_text"></div>
								<div class="npay_btn_wrap">
									<input type="button" id="naverPayBtn" value="" class="npay_btn_link npay_btn_pay btn_green">
								</div>
								
								<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>								
								<!-- <script>								
								    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
								    var elNaverPayBtn = document.getElementById("naverPayBtn");
								
								    elNaverPayBtn.addEventListener("click", function() {
										
								    	let productId = 1; /* 수정하기 */
								    	let cnt = 1;
								    	
								    	let width = 750;
								    	let heigth = 800;
								    	let top = (window.screen.height / 2) - (heigth / 2);
								    	let left = (window.screen.width  / 2) - (width / 2);
								    	
								    	let url = "/payment/naverpay?product_id="+productId+"&cnt="+cnt+"";
							            let name = "naverpay";
							            let option = "width = "+width+", height = "+heigth+", top = "+top+", left = "+left+", location = no"
							            window.open(url/* , name, option */);
								    });								
								</script> -->
							</div>
						</div><!-- payBox end -->
				</div><!-- naver_pay_box end 네이버페이 API -->
			</div> <!-- contetns end -->
			
		</div> <!-- container end -->
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<script type="text/javascript">
 	
 	//장바구니 리스트 불러오기
 	ajaxBasket();
 	function ajaxBasket() {
 		let member_id=$('#memberIdHidden').val();
 		console.log("member_id: "+member_id);
 		$.ajax({
 			type:"GET",
 			url:"./cartMain",
 			data: {
 				member_id:member_id
 			},
 			success: function(result){
 				result=result.trim();
 				
				$('#cart_ajax').html(result);
 			}
 		});
 	}
 	
 	//선택상품 삭제
	function optionDel() {
		let delArray = new Array();
		let member_id = $('#memberIdHidden').val();
		$("input:checkbox[name=chkDel]:checked").each(function(){
			let cartId = $(this).prev().val();
			delArray.push(cartId);
		});
		
		if(delArray == ""){ alert('선택하신 상품이 없습니다.'); return false; }
		else{
			if(confirm('선택하신 상품을 장바구니에서 삭제 하시겠습니까?')){
				$.ajax({
					type:"GET",
					url:"./setDelete",
					traditional : true,
					data: { delArray:delArray, member_id:member_id },
					success: function(result) {
						result=result.trim();
						$('#cart_ajax').empty();
						$('#cart_ajax').html(result);
					}
				});
			}
		}
	}
	
 	//선택상품 주문
 	function optionOrder() {
		let orderArray = new Array();
		
		$("input:checkbox[name=chkDel]:checked").each(function(){
			let cartId = $(this).prev().val();
			orderArray.push(cartId);
		});
		
		if(orderArray == ""){
			alert("선택하신 상품이 없습니다.");
			return false;
		}else{
			if(confirm('선택하신 상품만 주문합니다.')){
				location.href="../payment/paymentList";
			}else{
				
			}
				
		} 		
 	}
 	
 	//전체상품 주문
 	function allOrder() {
		let orderArray = new Array();
		let member_id=$('#memberIdHidden').val();
		$("input:checkbox[name=chkDel]").each(function(){
			let cartId = $(this).prev().val();
			orderArray.push(cartId);
		});
		
		$.ajax({
			async : false,
			type : 'GET',
			url : './setCheckAll',
			data : {
				cart_state : "checked",
				member_id:member_id
			},
			success : function(){		
				ajaxBasket();
				allChecked();
				count();
				price();
				if (orderArray != ""){
					location.href="../payment/paymentList";		
				} else {
					alert("선택하신 상품이 없습니다.");
				}
			},
			error : function(xhr, status, error){
				console.log("error");				
			}			
		});	
			
 	}
 	
 	//선택상품 찜
 	function optionWish() {
 		let delArray = new Array();
		
		$("input:checkbox[name=chkDel]:checked").each(function(){
			let product_id = $(this).attr('data-product-id');
			let wish_cnt = $(this).attr('data-wish-cnt');
			delArray.push(product_id, wish_cnt);
		});
		
		if(delArray == ""){
			alert('선택하신 상품이 없습니다.');
			return false;
		}else{
			if(confirm('선택하신 상품을 찜리스트에 담으시겠습니까?')){
				$.ajax({
					type:"GET",
					url:"/wish/wishInsert",
					traditional : true,
					data: {
						delArray:delArray
					},
					success: function() {
						alert('상품이 찜리스트에 저장되었습니다.');
						location.reload();
					}
				});
			}else {
				
			}
			

		}
 	}
 	
</script>	
</body>
</html>