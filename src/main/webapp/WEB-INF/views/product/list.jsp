<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/product/list.css">

<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>
		<div id="container">
			
			<div id="contents">
				
				<h2>ALL PRODUCT</h2>
				<c:choose>
					<c:when test="${not empty cateCd}">						
						<img class="mainImg" alt="" src="/images/product/list/productList_${cateCd}.jpg">
										
						<div class="productCategory">
							<a href="javascript:;">제품1 <span>(50)</span></a>
							<a href="javascript:;">제품1 <span>(50)</span></a>
							<a href="javascript:;">제품1 <span>(50)</span></a>
							<a href="javascript:;">제품1 <span>(50)</span></a>
							<a href="javascript:;">제품1 <span>(50)</span></a>
							<a href="javascript:;">제품1 <span>(50)</span></a>
							<a href="javascript:;">제품1 <span>(50)</span></a>
							<a href="javascript:;">제품1 <span>(50)</span></a>
							<a href="javascript:;">제품1 <span>(50)</span></a>
						</div>
					</c:when>
					<c:otherwise>
						<img class="mainImg" alt="" src="/images/product/list/ALL_PRODUCT.jpg">
					</c:otherwise>
				</c:choose>
				
				<div class="productPickList">
					<span class="pickListNum">상품 <strong>${listAllProduct.size()}</strong> 개</span>
					<ul class="pickListBox">
						<li>
							<input type="radio" id="sort1" name="sort" checked="checked">
							<label for="sort1" class="sortLabel on">낮은가격순</label>
						</li>
						<li>
							<input type="radio" id="sort2" name="sort">
							<label for="sort2" class="sortLabel">높은가격순</label>
						</li>
						<li>
							<input type="radio" id="sort3" name="sort">
							<label for="sort3" class="sortLabel">상품평순</label>
						</li>
						<li>
							<input type="radio" id="sort4" name="sort">
							<label for="sort4" class="sortLabel">등록일순</label>
						</li>
					</ul>
				</div>
				
				<ul class="productList">
				<c:forEach var="productVO" items="${listAllProduct}">
					<li>
						<div class="productWrap">
							<a href="javascript:;">
								<div class="productImgWrap">
									<img alt="" src="/upload/product/${productVO.productFileVOs[0].productFile_name}">
								</div>
								<span class="productName">${productVO.product_name}</span>
							</a>
							<div class="iconBox"></div>
							<span class="productPrice">${productVO.product_price}</span>
							<button class="btnDefault red">장바구니</button>
							<button class="btnDefault red">구매하기</button>
						</div>
					</li>
				</c:forEach>
				</ul>
				
				<div class="pagination">
					<ul>
						<li><span>1</span></li>
					<c:forEach begin="0" end="3" varStatus="i">
						<li><a href="javascript:;">${i.count+1}</a></li>
					</c:forEach>
					</ul>
				</div>
				
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
</body>
	<script type="text/javascript">
	
		$().ready(function(){
			$('.productPrice').each(function(){
				$(this).html(Number($(this).html()).toLocaleString() + '원');
			})
		});
	
		$('input[type=radio]').change(function(){
			$('.sortLabel').each(function(){ $(this).removeClass('on')})
			$(this).next().addClass('on');
		});
		
		$('.productWrap').hover(function(){
			$(this).find('button').fadeIn( "fast" );
		}, function(){
			$(this).find('button').css('display', 'none');
		});
	</script>
</html>