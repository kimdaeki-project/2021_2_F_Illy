<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/product/select.css">
	
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>
		<div id="container">
				
			<div id="contents">
			
				<div class="headWrap">
				
					<div class="headImgWrap">
						<div class="mainImgWrap">
							<img class="mainImg" alt="" src="/upload/product/${productFileVOList[0].productFile_name}">
						</div>
						<ul class="extraImgWrap">
							<c:forEach var="productFileVO" items="${productFileVOList}">
								<li class="extraImgBox">	
									<img class="extraImg" alt="" src="/upload/product/${productFileVO.productFile_name}">							
								</li>
							</c:forEach>
						</ul>
					</div>
					
					<div class="headInfoWrap">
						<input type="hidden" class="productId" value="${productVO.product_id}">
						<h3 class="productName" data-product_name="${productVO.product_name}">${productVO.product_name}</h3>
						<dl>
							<dt>판매가</dt>
							<dd><span class="productPrice pricePattern" data-product_price="${productVO.product_price}">${productVO.product_price}</span></dd>
						</dl>
						<dl>
							<dt>배송비</dt>
							<dd>
								3,500원 / 주문시결제(선결제)
								<p>50,000원 이상 무료배송</p>
							</dd>
						</dl>
						<div class="countBox">
							<span class="productName">${productVO.product_name}</span>
							<div class="countBtnWrap">
								<c:choose>
									<c:when test="${prefixCode eq '002'}">
										<input type="text" name="cart_cnt" class="inputCnt numberOnly" value="1" readonly="readonly">
									</c:when>
									<c:otherwise>
										<input type="text" name="cart_cnt" class="inputCnt numberOnly" value="1">
										<button type="button" class="countBtn up"></button>
										<button type="button" class="countBtn down"></button>
									</c:otherwise>
								</c:choose>
							</div>
							<span class="countPrice pricePattern">${productVO.product_price}</span>
						</div>
						<button type="button" class="btnSquare insertCart">장바구니</button>
						<button type="button" class="btnSquare wish">찜하기</button>
						<button type="button" class="btnSquare black directPayment">바로 구매</button>
						
						<div class="payBox">
							<div class="naverPay">
								<link id="NAVER_PAY_STYLE" type="text/css" rel="stylesheet" href="https://img.pay.naver.net/static/css/button/button2.css?455213">
								
								<div class="npay_text"></div>
								<div class="npay_btn_wrap">
									<input type="button" id="naverPayBtn" value="" class="npay_btn_link npay_btn_pay btn_green">
								</div>
								
								<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>								
								<script>								
								    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
								    var elNaverPayBtn = document.getElementById("naverPayBtn");
								
								    elNaverPayBtn.addEventListener("click", function() {

								    	let productId = $('.productId').val();
								    	let cnt = Number($('input[name=cart_cnt]').val());
								    	
								    	let width = 750;
								    	let heigth = 800;
								    	let top = (window.screen.height / 2) - (heigth / 2);
								    	let left = (window.screen.width  / 2) - (width / 2);
								    	
								    	let url = "/payment/naverpay?product_id="+productId+"&cnt="+cnt+"";
							            let name = "naverpay";
							            let option = "width = "+width+", height = "+heigth+", top = "+top+", left = "+left+", location = no"
							            window.open(url/* , name, option */);
								    });								
								</script>
							</div>
						</div>
					</div>					
				</div>				
				
				<ul class="productList">
				<h3>관련 상품</h3>
				<c:forEach var="productVO" items="${listAllProduct}" begin="0" end="4">
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
							<button class="btnDefault red relationInsertCart" data-product-id="${productVO.product_id}">장바구니</button>
							<button class="btnDefault relationDirectPayment red" data-product-id="${productVO.product_id}">구매하기</button>
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
				
				<div class="bodyInfoWrap">
									
					<div id="detailInfo">
						<ul class="bodyInfoTab">
							<a href="#detailInfo"><li class="on">상품상세정보</li></a>
							<a href="#deliveryInfo"><li>배송안내</li></a>
							<a href="#exchangeInfo"><li>교환 및 반품안내</li></a>
							<a href="#reviews"><li>상품후기</li></a>
						</ul>
						<h3>상품상세정보</h3>
						<div class="detailInfo">
							<p>&nbsp;
							${productVO.product_detail}
						</div>
						<h3>상품필수 정보</h3>
						<table class="essentialInfo">
							<tr>
								<th>상품명</th><td>${productVO.product_name}</td>
								<c:choose>
								<c:when test="${fn:substring(productVO.product_categoryCode,0,3) eq 001}">
								<!-- ********** 상품필수 정보 COFFEE **********	-->
								<th>식품유형</th><td>커피</td>
							</tr>
							
							<tr>
								<th>용량</th>	<td>${productVO.coffee_capacity}</td>
								<th>원재료명 및 함량</th><td>${productVO.coffee_material}</td>
							</tr>
							
							<tr>
								<th>카페인함량</th>	<td>&lt; ${productVO.coffee_caffeine} %</td>
								<th>원산지</th><td>${productVO.product_origin}</td>
							</tr>
								</c:when>
								<c:when test="${fn:substring(productVO.product_categoryCode,0,3) eq 002}">
								<!-- ********** 상품필수 정보 MACHINE ********** -->
								<th>소재</th><td>${productVO.machine_material}</td>
							</tr>
							
							<tr>
								<th>펌프</th><td>${productVO.machine_pump}bar</td>
								<th>사이즈</th><td>${productVO.machine_size}mm</td>
							</tr>
							
							<tr>
								<th>무게</th><td>${productVO.machine_weight}kg</td>
								<th>물탱크 용량</th><td>${productVO.machine_capacity}L</td>
							</tr>
							
							<tr>
								<th>정격전압</th><td>${productVO.machine_powerV}V/${productVO.machine_powerHz}Hz</td>
								<th>소비전력</th><td>${productVO.machine_powerConsumption}W</td>
							</tr>
							
							<tr>
								<th>안전인증정보(KC안전인증)</th><td>${productVO.machine_safetyInfo}</td>
								<th>제조국</th><td>${productVO.product_origin}</td>
							</tr>
								</c:when>
								</c:choose>
							
							<tr>
								<th>제조사</th><td>${productVO.product_manufacturer}</td>
								<th>수입판매원</th>	<td>${productVO.product_importer}</td>
							</tr>
							
							<tr>
								<th>품질보증기준</th><td colspan="3" style="width: 80%;">관련법 및 소비자 분쟁 해결기준에 따름</td>
							</tr>
						</table>
						
					</div>
									
					<div id="deliveryInfo">
						<ul class="bodyInfoTab">
							<a href="#detailInfo"><li>상품상세정보</li></a>
							<a href="#deliveryInfo"><li class="on">배송안내</li></a>
							<a href="#exchangeInfo"><li>교환 및 반품안내</li></a>
							<a href="#reviews"><li>상품후기</li></a>
						</ul>
						<h3>배송안내</h3>
						<div class="admin_msg">
							<p>1. 배송 <br>&nbsp;- 익일 오전 9시 일괄 출고 (결제 후 주문건 순차 배송, 공휴일/주말 제외) <br>&nbsp;- 도서산간 지역 등은 지역에 따라 3~5일 정도 더 소요될 수 있습니다. <br>&nbsp;- 천재지변, 물량 수급 변동 등 예외적인 상황 발생 시, 다소 지연될 수 있는점 양해부탁드립니다.&nbsp; <br>&nbsp;<br>2. 배송비 <br>&nbsp;- 기본 배송비: 3,500원 (50,000원 이상 구매 시 무료 배송) <br>&nbsp;- 제주 및 도서 산간 지역의 경우 배송비 옵션을 '제주/도서산간(5,500원)'으로 체크해주셔야 배송이 가능합니다.<br>&nbsp;- 배송비 옵션 미 선택 시, 추가 입금 안내 예정이며 입금기한 내 입금이 되지 않는 경우 고지 없이 자동 주문 취소처리됩니다. <br>&nbsp;<br>3. 배송사: CJ 대한통운 <br>&nbsp;- 상황에 따라 배송업체는 변경될 수 있습니다.&nbsp; <br>&nbsp;<br>4. 교환/반품비 <br>&nbsp;- 교환/반품 배송비: 7,000원<br>&nbsp;- 도서산간지역 : 11,000원<br>&nbsp;</p><p>&nbsp;</p><p><b>※ 배송일정 관련한 상세상담은 CJ대한통운 고객센터(1588-1255)로 연락부탁드립니다.</b></p><p><br><span style="color: rgb(255, 0, 0);">※ 운송장에 등록되어있는 발송지는 물류센터의 연락처이며 해당번호로 연락 시 문의 및 답변이 어렵습니다.</span><br><span style="color: rgb(255, 0, 0);">&nbsp;&nbsp;&nbsp; 일리카페에 대한 문의사항은 공식몰&nbsp;<strong> </strong><a href="https://shop.illycaffe.co.kr/member/login.php" target="_self"><strong>[1:1문의]</strong></a> 게시판에 남겨주시기 바랍니다.</span></p><p>&nbsp;</p>
						</div>
					</div>
									
					<div id="exchangeInfo">
						<ul class="bodyInfoTab">
							<a href="#detailInfo"><li>상품상세정보</li></a>
							<a href="#deliveryInfo"><li>배송안내</li></a>
							<a href="#exchangeInfo"><li class="on">교환 및 반품안내</li></a>
							<a href="#reviews"><li>상품후기</li></a>
						</ul>
						
						<h3>구매 전 유의사항</h3>
						<div class="admin_msg">
							<p><b><span style="font-size: 10pt; background-color: rgb(235, 235, 235);">1. 물/커피 자국 등의 얼룩</span></b><span style="font-size: 10pt; background-color: rgb(235, 235, 235);">&nbsp;</span></p><p>일리 캡슐 커피머신은 제조사 출고 전 품질 테스트로 인한 약간의 얼룩이 남아있을 수 있습니다.</p><p>&nbsp;</p><p>&nbsp;</p><p><b><span style="font-size: 10pt; background-color: rgb(235, 235, 235);">2. 머신 내/외부 스크래치 또는 패임</span></b></p><p>제품 공정 상 머신의 내/외부에 스크래치가 있을 수 있습니다.&nbsp;</p><p>&nbsp;- 물통, 물통과 맞닿는 부분</p><p>&nbsp;- 머신의 외관 부분</p><p>&nbsp;- 캡슐 칸 부분 등</p><p>머신의 공정상 발생되는 문제로 인한 제품의 <span style="color: rgb(255, 0, 0);">교환/반품이 불가</span>합니다.</p><p>&nbsp;</p><p>&nbsp;</p><p><b><span style="font-size: 10pt; background-color: rgb(235, 235, 235);">3. 초기 불량 제품</span></b></p><p><span style="font-size: 9pt;">1) 초기불량 제품일 경우, 상품수령 후 3일 이내 </span><a href="https://shop.illycaffe.co.kr/mypage/mypage_qa.php" target="_self"><b><span style="font-size: 9pt;">1:1문의 게시판</span></b></a><span style="font-size: 9pt;">을 통해 교환/반품 의사를 밝히셔야 가능합니다.</span></p><p><span style="font-size: 9pt;">&nbsp; &nbsp;제품의 불량 여부 확인을 위해 사진 또는 영상확인이 필요할 경우 담당자가 고객님께 요청드릴 수 있습니다.</span></p><p><strong><span style="font-size: 9pt;">&nbsp; &nbsp;</span><a href="https://shop.illycaffe.co.kr/service/faq.php?page=2&amp;category=03001008&amp;noheader=&amp;isBest=&amp;searchField=&amp;searchWord=" target="_self"><span style="font-size: 9pt;">▶ FAQ [상품문의]에서 머신불량기준 확인 가능합니다.&nbsp;</span></a></strong><span style="font-size: 9pt;">&nbsp;</span></p><p><span style="font-size: 9pt;">&nbsp;</span></p><p><span style="font-size: 9pt;">2) 제품의 외박스(택배박스), 내박스(브랜드 박스)가 없거나 훼손된 경우 </span><span style="color: rgb(255, 0, 0); font-size: 9pt;">교환/반품 불가</span><span style="font-size: 9pt;">합니다.</span></p><p><span style="font-size: 9pt;">&nbsp; &nbsp;- 박스의 훼손 또는 구성품 분실 시 AS접수로 처리 진행됩니다.</span></p><p><span style="font-size: 9pt;">&nbsp;</span></p><p><span style="font-size: 9pt;">3) 초기 불량 중 부품파손,부품불량으로 인한 교환건일 경우 제품 전체가 아닌 부품만 교환진행 됩니다.&nbsp;</span></p><p>&nbsp;</p><p>&nbsp;</p><p><b><span style="font-size: 10pt; background-color: rgb(235, 235, 235);">4. A/S 안내</span></b></p><p><b><span style="color: rgb(255, 0, 0); font-size: 9pt;">▷AS 신청 전 확인해주세요.</span></b></p><p><span style="font-size: 9pt;">- ​제품 파손/추출불량이 아닌, 제품 사용방법 또는 오작동의 경우 AS 신청 전 동봉된 제품설명서나 FAQ&gt;문제해결 및 </span><a href="https://shop.illycaffe.co.kr/mypage/mypage_qa.php" target="_self"><b><span style="font-size: 9pt;">1:1게시판 문의</span></b></a><span style="font-size: 9pt;">를 이용해 보실 것을 권장합니다.&nbsp;</span></p><p><span style="font-size: 9pt;">- AS접수는 공식몰</span><a href="https://shop.illycaffe.co.kr/mypage/mypage_qa.php" target="_self"><span style="font-size: 9pt;"> </span><b><span style="font-size: 9pt;">1:1 게시판</span></b></a><span style="font-size: 9pt;">을 통해서만 진행되며, 접수완료 후 따로 유선연락을 드리지 않고 있으니 참고부탁드립니다.&nbsp;</span></p><p><span style="font-size: 9pt;">&nbsp;</span></p><p><span style="font-size: 9pt;">1) 무상 AS&nbsp;</span></p><p><span style="font-size: 9pt;">- 공식몰의 무상수리 기간은</span><b><u><span style="font-size: 9pt;"> 구매일로부터 1년입니다.</span></u></b><span style="font-size: 9pt;"> 무상기간 이후에는 유상으로 AS를 받아보실 수 있습니다.</span></p><p><span style="font-size: 9pt;">-&nbsp;</span>부속품은 AS에 포함되지 않으며, 일리카페 공식몰에서 정품등록하시면 마이페이지에서 구매가능합니다. (등록되어있지 않은 부품은 1:1 게시판으로 문의부탁드립니다.)</p><p><span style="font-size: 9pt;">- 고객 과실인 경우, 무상AS기간에도 비용이 청구될 수 있습니다.</span></p><p><span style="font-size: 9pt;">&nbsp;</span></p><p><span style="font-size: 9pt;">2) 유상AS</span></p><p><span style="font-size: 9pt;">- 무상수리기간이 경과한 경우에는 유상AS가 가능합니다.</span></p><p><span style="font-size: 9pt;">- 유상기간에는 머신 기종별 수리비용이 발생하며, 자세한 비용은 1:1 문의 게시판으로 AS접수 해주시면 안내드리고 있습니다.</span></p><p><span style="font-size: 9pt;">&nbsp;</span></p><p><span style="font-size: 9pt;">3) 박스보관</span></p><p><span style="font-size: 9pt;">​머신 AS는 공식몰을 통한 접수와 택배를 통한 진행이 이루어지고 있습니다.&nbsp;&nbsp;</span></p><p><span style="font-size: 9pt;">안전한 제품의 이동을 위해 머신 구매 후 택배박스(외/내 박스) 보관을 권장드립니다.</span></p><p><span style="font-size: 9pt;">&nbsp;- 머신 박스가 아닌 다른 박스로 포장 시 배송 중 파손이 일어나지 않도록 꼼꼼한 포장 부탁드립니다.&nbsp;</span></p><p><span style="font-size: 9pt;">&nbsp;- AS제품 포장 시 물통, 캡슐홀더 등 부품을 제외하고 발송 요청드립니다.&nbsp;</span></p><p><span style="font-size: 9pt;">&nbsp;- 머신 박스가 아닌 다른 박스 포장으로 인한 제품의 파손 시 추가 AS비용이 발생하거나 부속품 구매를 요청드릴 수 있습니다.</span></p><p><span style="font-size: 9pt;">&nbsp;- 운송 중 충격이 가해질 수 있으므로 포장된 상태에서 바닥으로 떨어져도 이상이 없을 정도로 포장 부탁드립니다.</span></p><p><span style="font-size: 9pt;">&nbsp;- 포장상태 불량으로 인한 제품파손은 보상되지 않으니 유의 부탁드립니다.</span></p>
						</div>
						<h3>교환 및 반품안내</h3>
						<div class="admin_msg">
							<p><strong><span style="background-color: rgb(235, 235, 235);">1. 단순변심 교환/반품일 경우</span></strong><span style="background-color: rgb(235, 235, 235);">&nbsp;</span></p><p>1.외박스 (택배박스)<br>2.내박스 (브랜드박스)<br>3.사용설명서</p><p>4.웰컴캡슐<br><span style="color: rgb(255, 0, 0);">※ 위 4가지 중 한 개라도 훼손되거나 누락될 경우, 교환/반품이 불가능합니다.&nbsp; </span></p><p>&nbsp;</p><p>- 고객 단순변심에 의한 교환/반품의 경우 구매 후 14일 이내에 가능합니다. ( <a href="https://shop.illycaffe.co.kr/mypage/mypage_qa.php" target="_self"><strong>▶1:1 게시판으로 문의</strong></a>)<br>- 단순변심으로 인한 교환/반품은 왕복택배비가 부과됩니다.<br>- 추가 택배비용 결제는 가상계좌를 통해 결제됩니다.<br>- 단순변심으로 인한 교환은 맞교환이 불가능하며, 제품회수 확인 후 교환제품이 발송됩니다.<br>- 프로모션, 패키지 등 세트상품을 반품하는 경우, 또는 사은품이 함께 지급된 상품을 반품하는 경우, 주문한 상품 외에 함께 제공된 증정품을 포함하여 배송 받으신 모든 내용물이 반환되어져야 합니다.<br>- 수령하신 제품의 초기상태와 동일한 상태, 상품가치가 훼손되지 않은 상태에 한해서만 가능하며, 사용한 제품은 단순변심에 의한 교환/반품은 불가합니다.<br>- 전자제품의 특성상 제품 개봉시 단순변심으로 인한 교환/반품이 불가능하며, 별도의 연락 없이 반품할 경우 반송처리 될 수 있습니다.<br>- 제품수령 후 초기불량이 아닌 사용자 과실로 인한 제품의 파손 및 손상이 발생하였을 경우 교환/반품이 불가하며, 1:1문의를 통한 A/S로 접수로 진행됩니다.<br>- 미개봉, 미사용 상태( 내박스 실링스티커가 뜯어지지 않은 상태) 의 상품만 교환/반품이 가능하며, 제품의 박스가 없거나 제품 내박스(브랜드박스)에 송장을 붙여 발송하시면 반품처리가 불가합니다.</p><p>- 단순변심일 경우, 웰컴캡슐박스가 누락된 경우&nbsp;교환/반품 불가능합니다.&nbsp;(웰컴캡슐 사용시에도 반품불가)</p><p>&nbsp;</p><p>&nbsp;</p><p><strong><span style="background-color: rgb(235, 235, 235);">2. 불량 교환/반품일 경우</span></strong></p><p>1.외박스 (택배박스)<br>2.내박스 (브랜드박스)<br>3.사용설명서<br>&nbsp;<span style="color: rgb(255, 0, 0);">※&nbsp;</span><span style="color: rgb(255, 0, 0);">위 3가지 중 한 개라도 훼손되거나 누락될 경우</span><span style="color: rgb(255, 0, 0);">, 교환/반품이 불가능합니다.</span></p><p>&nbsp;</p><p>- 초기제품불량에 의한 교환/반품은 제품 수령일로부터 3일 이내에 공식몰의 <a href="https://shop.illycaffe.co.kr/mypage/mypage_qa.php" target="_self"><strong>1:1 게시판</strong></a>에 불량 내용을 올리시고 교환/반품 의사를 밝히셔야 가능합니다.<br>&nbsp;*사진 또는 영상확인이 필요할 경우 담당자가 고객님께 요청드릴 수 있습니다.<br>- 초기불량제품 교환은 담당자가 불량확인 후 맞교환으로 진행됩니다.<br>- 수령일로부터 3일이 지난 상품의 불량에 대해서는 교환/반품이 아닌 무상A/S 정책에 따라 A/S가 진행됩니다.<br>- 제품의 박스가 없거나 제품 내박스(브랜드박스)에 송장을 붙여 발송하시면 교환/반품 처리가 불가합니다. 단, 외박스가 없을 경우에는 다른 택배박스를 이용하여 제품포장 후 가능합니다.</p><p>&nbsp;</p><p>&nbsp;</p><p><span style="color: rgb(255, 0, 0);"><strong>※&nbsp;</strong></span><font color="#ff0000"><b>일리커피는 갓 로스팅한 원두를 일리만의 세계특허기술인&nbsp;</b></font><b style="color: rgb(255, 0, 0);">‘질소압축포장’ (캔 내부의 산소를 압축된 질소로 100% 제거한 포장기술법) 방식을 사용합니다.</b></p><p><font color="#ff0000"><b>이렇게 포장된 제품은 커피 원두의 향을 유지시켜줄 뿐 아니라 숙성작용을 일으켜 커피의 향과 맛이 더욱 좋아지며, 개봉 전까지는 2년 동안 신선하게 커피를 보관할 수 있습니다.</b></font></p><p><font color="#ff0000"><b>가끔 내부에 주입된 질소포장이 팽창하며 뚜껑이 안 닫히는 경우가 있으며, 이 경우 제품에는 이상이 없는 정상제품이며 교환 및 반품 사유에 해당하지 않습니다.</b></font></p><p><font color="#ff0000"><b><br></b></font></p><p><span style="color: rgb(255, 0, 0);"><strong>※ 캔 케이스로 제작된 커피의 경우,&nbsp;출고전 검수를 통하여 정상제품만 발송되고 있습니다. 배송중 발생한&nbsp;약간의 찌그러짐이나 스크래치 등은 불량반품 사유로 인정되지 않습니다.</strong></span></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;<a href="https://shop.illycaffe.co.kr/service/faq.php?page=2&amp;category=03001008&amp;noheader=&amp;isBest=&amp;searchField=&amp;searchWord=" target="_self"><strong>▶ FAQ [상품문의]에서 머신불량기준 확인 가능합니다.&nbsp;</strong></a></p><p>&nbsp;</p><p><br><strong><span style="background-color: rgb(235, 235, 235);">3. 교환/반품 불가한 경우</span></strong><br>1) 박스를 개봉하거나 사용한 경우<br>2) 상품이 훼손되거나 파손된 경우 <br>3) 상품 회수 시 포장 불량으로 제품이 파손된 경우 <br>4) 구매 후 14일이 경과된 경우(주말, 공휴일 포함)<br>5) 증정품 및 구성품이 누락된 경우<br>6) 세트구성 상품 중 일부만 교환/반품 요청할 경우</p><p><strong style="color: rgb(255, 0, 0);">※ 반품시 제품은 사용하지 않은 상태 즉, 캔 내부 질소 포장지가 벗겨지지 않은 상태에만 가능합니다.</strong></p><p><strong style="color: rgb(255, 0, 0);">※</strong><strong style="color: rgb(255, 0, 0);">&nbsp;제품수거 후 포장지 제거 및 사용흔적 등이 발견되면 반송될 수 있는 점 유의 부탁드립니다.</strong></p><p><strong style="color: rgb(255, 0, 0);">※ 제품 반품시 반품송장을 캔 외부에 바로 부착할 경우 제품훼손으로 반품이 불가하여, 고객님께 다시 반송될 수 있습니다.&nbsp;</strong></p><p><strong style="color: rgb(255, 0, 0);">&nbsp; &nbsp;반드시 외박스에 포장을 하고 박스에 송장을 부착해주세요.</strong></p><p>&nbsp;</p><p><strong>​<br><span style="background-color: rgb(235, 235, 235); font-size: 10pt;">4. 반품 시 확인 사항</span></strong><br>1) 반품 신청 없이 개별 배송을 통해 제품을 보내주시는 경우<br>&nbsp;- 반품 제품 확인이 불가하여 반품 진행이 어려울 수 있으니 꼭 <a href="https://shop.illycaffe.co.kr/mypage/mypage_qa.php" target="_self"><strong>1:1 게시판</strong></a>을 통해 신청 부탁드립니다. <br>2) 반품 제품 미 회수 <br>- 택배 기사님의 방문이 이루어지지 않았거나 수거되지 않았다면, <a href="https://shop.illycaffe.co.kr/mypage/mypage_qa.php" target="_self"><strong>1:1 게시판</strong></a>으로 회수 신청 부탁드립니다.</p><p>&nbsp;</p><p>&nbsp;</p><p>※교환/반품에 대한 상세한 사항은 <a href="https://shop.illycaffe.co.kr/mypage/mypage_qa.php" target="_self"><strong>1:1 게시판</strong></a>으로 문의 요청드립니다.<br>※불량 상품의 경우, 동일한 상품으로만 교환 가능하며, 타 상품으로는 교환이 불가합니다.&nbsp;</p>
						</div>
						<h3>환불안내</h3>
						<div class="admin_msg">
							<p><b><span style="font-size: 10pt; background-color: rgb(235, 235, 235);">1. 결제완료</span></b></p><p>- 주문 취소 신청 또는 1:1게시판에 신청해주시면 취소 및 환불 처리 도와드리겠습니다.&nbsp;&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p><b><span style="background-color: rgb(235, 235, 235);">2. 배송준비중, 배송중, 배송완료</span></b><span style="background-color: rgb(235, 235, 235);">&nbsp;</span></p><p>&nbsp;- '배송준비중' 상태는 상품의 출고를 위해 적재가 끝난 상황이므로 주문 취소 및 배송 정보 변경이 어려우며, 이 상태에 주문 취소 요청을 주실 경우 거절될 수 있습니다.&nbsp;&nbsp;</p><p>&nbsp;- 배송이 시작된 이후부터는 주문 취소가 아닌 반품으로 진행됩니다.&nbsp;&nbsp;</p><p>&nbsp;- 고객 변심에 의한 반품의 경우 왕복 택배비(7,000원)가 발생됩니다.&nbsp;&nbsp;</p><p>&nbsp;- 반품을 원할 경우 반드시 마이페이지&gt;주문목록/배송조회에서 [반품신청]을 해주셔야 반품 내용 확인 및 처리가 가능합니다.&nbsp;&nbsp;</p><p>&nbsp; &nbsp; &gt; 아직 제품이 도착하지 않았을 경우, 배송되는 제품을 수취거절 해주신 뒤 [반품신청]을 해주세요.&nbsp;</p><p>&nbsp; &nbsp; &nbsp; (이 때, 반품사유에 수취거절하셨음을 알려주시기 바랍니다.)</p><p>&nbsp; &nbsp; &gt; 제품을 이미 받으셨다면, [반품신청] 후 1:1 게시판에 반품 신청 글을 남겨주세요.</p><p>※별도의 반품신청 없이 수취거절만 하시는 경우, 반품 수거 및 환불이 어려울 수 있습니다.&nbsp;&nbsp;&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p><b><span style="background-color: rgb(235, 235, 235);">3. 환불</span></b></p><p>1) 신용카드 / 실시간 계좌이체 결제건<br>- 환불 승인되면 PG사 정책에 따라 3~7일 정도 소요된 후 환불이 이루어집니다.&nbsp;</p><p>2) 가상계좌(무통장) 결제건 <br>- 환불 승인 후 반품 신청 시 남겨주신 계좌를 통해 환불이 진행됩니다.&nbsp; <br>- 환불은 최대 3일 이내 고객님의 계좌로 환불됩니다.</p>
						</div>
					</div>
					
				</div>
			
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>
	</div>
</body>
<script type="text/javascript">

	$().ready(function(){
		setNumberPattern();
		$('.numberOnly').attr('oninput', "this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\\..*)\\./g, '$1');") //숫자 정규식
	});
	
	function setNumberPattern() {
		$('.numberPattern').each(function(){
			$(this).html(Number($(this).html()).toLocaleString());
		})		
		$('.pricePattern').each(function(){
			$(this).html($(this).html().replace(/[^\.|^0(0)+|^0-9\.]/g, ''));
			$(this).html(Number($(this).html()).toLocaleString() + '원');
		})		
	} /********** n.nnn원 형식병환 **********/
	
	$('.extraImg').click(function(){
		let mainImg = $('.mainImg');
		let extraImgSrc = $(this).attr('src');
		mainImg.attr('src', extraImgSrc);
	}); /********** 상품 이미지 클릭 **********/
	
	$('.countBtn').click(function(){
		let inputCnt = $(this).siblings('.inputCnt')
		let val = Number(inputCnt.val());
		
		if($(this).hasClass('up')) {
			inputCnt.val(val + 1);
		} else if ($(this).hasClass('down') && val > 1) {
			inputCnt.val(val - 1);
		}
		
		setCountPrice();
		setNumberPattern();
	}); /********** 상품개수 버튼 클릭 **********/
	
	$('.')
	
	function setCountPrice() {
		let countPrice = $('.countPrice')
		let productPrice = Number($('.productPrice').data('product_price'));
		let cnt = Number($('input[name=cart_cnt]').val());
		
		countPrice.html(productPrice * cnt);
		countPrice.data('total_price', productPrice * cnt);
	} /********** 상품개수별 가격 조정 **********/
	
	$('.productWrap').hover(function(){
		$(this).find('button').fadeIn( "fast" );
	}, function(){
		$(this).find('button').css('display', 'none');
	});
	
// ijy --------------------------------------------------

	// 상품 바로구매하기 ------------
	$('.directPayment').click(function(){
		console.log('cart_cnt: '+$('.inputCnt').val());
		
		location.href="/payment/directPayment?cart_cnt="+$('.inputCnt').val()+"&product_id="+$('.productId').val();
	});	
	// 관련상품 - 바로구매하기 ------------- ----------
	$('.relationDirectPayment').click(function(){
		console.log('product_id: '+$(this).attr('data-product-id'));
		
		location.href="/payment/directPayment?cart_cnt=1"+"&product_id="+$(this).attr('data-product-id');
	});	
	
	//상품 장바구니 담기
	$('.insertCart').click(function(){
		console.log('product_id: '+$(this).attr('data-product-id'));
		
		$.ajax({
			type:"GET",
			url:"/cart/setCart",
			data: {
				product_id: $('.productId').val(),
				cart_cnt: $('.inputCnt').val()
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
	
	//관련상품 장바구니 담기
	$('.relationInsertCart').click(function(){
		console.log('product_id: '+$(this).attr('data-product-id'));
		
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
	
	
	//찜하기
	$('.wish').click(function(){
		let product_id = $('.productId').val();
		let wish_cnt = $('.inputCnt').val();
		
		let delArray = new Array();
		delArray.push(product_id, wish_cnt);
		
		$.ajax({
			type:"GET",
			url:"/wish/wishInsert",
			traditional : true,
			data: {
				delArray:delArray
			},
			success: function(result) {
				location.href=result;
			}
		});
	});
	
</script>
</html>