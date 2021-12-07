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
				
				</div><!-- naver_pay_box end --> <!-- 네이버페이 API -->
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
		let member_id=$('#memberIdHidden').val();
		
		$("input:checkbox[name=chkDel]:checked").each(function(){
			let cartId = $(this).prev().val();
			delArray.push(cartId);
		});
		
		console.log(delArray);
		
		if(delArray == ""){
			alert('선택하신 상품이 없습니다.');
			return false;
		}else{
			if(confirm('선택하신 상품을 장바구니에서 삭제 하시겠습니까?')){
				$.ajax({
					type:"GET",
					url:"./setDelete",
					traditional : true,
					data: {
						delArray:delArray,
						member_id:member_id
					},
					success: function(result) {
						result=result.trim();
						$('#cart_ajax').empty();
						$('#cart_ajax').html(result);
					}
				});
			}else {
				
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
		
		console.log(orderArray);
		
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
 	
</script>	
</body>
</html>