<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/product/list.css">

<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>	
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>						
				
		<div class="indexSlideWrap">
		
			<span class="indexSlideBtn prev"></span>
		
			<div class="indexSlideTrack" data-slide_content_cnt="2">
				<c:forEach begin="0" end="1">
					<c:forEach begin="0" end="1" varStatus="i">
						<div class="indexSlideContent">
							<img alt="" src="/images/index/indexBanner${i.count}.jpg">
						</div>
					</c:forEach>
				</c:forEach>
			</div>
			
			<span class="indexSlideBtn next"></span>
			
		</div>
		<div id="container">
				
			<div id="contents">
			
				<h3 class="productListTtle">베스트상품</h3>
				
				
				<ul class="productList">
				<c:forEach var="productVO" items="${BestlistAllProduct}">
					<li>
						<div class="productWrap">
							<a href="/product/select?product_categoryCode=${productVO.product_categoryCode}&product_id=${productVO.product_id}">
								<div class="productImgWrap">
									<img alt="" src="/upload/product/${productVO.productFileVOs[0].productFile_name}">
								</div>
								<span class="productName">${productVO.product_name}</span>
							</a>
							<div class="iconBox"></div>
							<span class="productPrice pricePattern">${productVO.product_price}</span>
							<button class="btnDefault red insertCart" data-product-id="${productVO.product_id}" data-product-name="${productVO.product_name}">장바구니</button>
							<button class="btnDefault red directPayment" data-product-id="${productVO.product_id}">구매하기</button>
						</div>
					</li>
				</c:forEach>
				
				<!-- 장바구니 구매 후 modal -->
				<div id="addCartLayer" class="modal_wrap" style="display: none;">
					<div class="add_cart_layer">
						<div class="add_cart_layerView">
				            <h2>장바구니 담기</h2>
				            <div>
				                <p id="productAddcartImages"><strong>상품이 장바구니에 담겼습니다.</strong><br>바로 확인하시겠습니까?</p>
				            </div>
				            <div class="add_cart_btn_box">
				                <button class="add_cart_btn_cancel close_a_btn"><span>취소</span></button>
				                <button class="add_cart_btn_move"><span>확인</span></button>
				            </div>
				            <a class="add_cart_top_cancel close_a_btn"><img src="/images/cart/btn_layer_close.png" alt="닫기"></a>
						</div> <!-- add_cart_layerView end -->
					</div>	<!-- add_cart_layer end -->			
				</div> <!-- addCartLayer end --> <!-- 장바구니 구매 후 modal end -->
				</ul>
				
				<img alt="" src="/images/index/indexContentBanner.jpg">
			
				<h3 class="productListTtle">MD´s PICK</h3>
				
				
				<ul class="productList" style="border-bottom: none;">
				<c:forEach var="productVO" items="${listAllProduct}">
					<li>
						<div class="productWrap">
							<a href="/product/select?product_categoryCode=${productVO.product_categoryCode}&product_id=${productVO.product_id}">
								<div class="productImgWrap">
									<img alt="" src="/upload/product/${productVO.productFileVOs[0].productFile_name}">
								</div>
								<span class="productName">${productVO.product_name}</span>
							</a>
							<div class="iconBox"></div>
							<span class="productPrice pricePattern">${productVO.product_price}</span>
							<button class="btnDefault red insertCart" data-product-id="${productVO.product_id}" data-product-name="${productVO.product_name}">장바구니</button>
							<button class="btnDefault red directPayment" data-product-id="${productVO.product_id}">구매하기</button>
						</div>
					</li>
				</c:forEach>
				
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
</body>
	<script type="text/javascript">
		
		$().ready(function(){			
			let indexSlideTrack = $('.indexSlideTrack');
			let indexSlideContent = $('.indexSlideContent');
			
			indexInterval = setInterval(function(){slide(indexSlideTrack, indexSlideContent, 1300);}, 3300);
		})
		
		$('.indexSlideBtn').click(function(){
			let indexSlideTrack = $('.indexSlideTrack');
			let indexSlideContent = $('.indexSlideContent');
			
			/* 슬라이드 작동중 일 경우 종료 */
			if(indexSlideTrack.hasClass('slideActive')) { return; }
			
			/* 슬라이드 연속 방지를 위해 clearInterval후 새롭게 setInterval */
			clearInterval(indexInterval);
			indexInterval = setInterval(function(){slide(indexSlideTrack, indexSlideContent, 1300);}, 3300);
			
			slide(indexSlideTrack, indexSlideContent, 1300, $(this));
		});
		
		
		
		$('.productWrap').hover(function(){
			$(this).find('button').fadeIn( "fast" );
		}, function(){
			$(this).find('button').css('display', 'none');
		}); /********** 상품 이미지 위 호버시, 버튼 생성 **********/
		

		
		$().ready(function(){
			setPricePattern();
		});

		function setPricePattern() {
			$('.pricePattern').each(function(){
				$(this).html(Number($(this).html()).toLocaleString() + '원');
			})			
		}
		
		
				
		/* ijy - 상품 바로구매하기 */
		$('.directPayment').click(function(){
			console.log('product_id: '+$(this).attr('data-product-id'));
			
			location.href="/payment/directPayment?cart_cnt=1&product_id="+$(this).attr('data-product-id');
		});
		
		//장바구니 담기
		$('.insertCart').click(function(){
			
			$.ajax({
				type:"GET",
				url:"/cart/setCart",
				data: {
					product_id: $(this).attr('data-product-id'),
					cart_cnt: 1
				},
				success: function(result) {
					$('#addCartLayer').css("display", "block");//modal 띄우기
					$("body").css("overflow","hidden");//body 스크롤바 없애기
				},
				error : function(xhr, status, error){
					console.log(error);				
				}
			
			});
		});
		
		$('.add_cart_btn_move').click(function(){
			location.href="/cart/normalBasket";
		}); //확인버튼 클릭 시 장바구니로 이동
		$('.close_a_btn').click(function(){
			$('#addCartLayer').css("display", "none");//modal 없애기
			$("body").css("overflow","auto");//body 스크롤바 생성
		}); //취소 또는 X 버튼 클릭 시 장바구니로 이동
		
	</script>
</html>