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
		<c:import url="/WEB-INF/views/admin/adNavbar.jsp"></c:import>
		<div id="container" style="padding-bottom: 155px; margin-bottom: -155px;">
			
			<div id="contents">
				
				<c:choose>
					<c:when test="${not empty parameterCateCode}">	
					
						<h2 style="font-size: 28px; color: #222; width: 100%; font-weight: bold; text-align: left; padding-bottom: 20px; border-bottom: 1px solid #dbdbdb; margin-bottom: 70px;">
						PRODUCT LIST</h2>
							
						<div class="productCategory">
							<a href="/admin/list?product_categoryCode=${categoryAllCnt.code}">${categoryAllCnt.name} <span>(${categoryAllCnt.count})</span></a>
							<c:forEach var="categoryCnt" items="${categoryCnt}">
								<a href="/admin/list?product_categoryCode=${categoryCnt.code}">${categoryCnt.name} <span>(${categoryCnt.count})</span></a>
							</c:forEach>
						</div>
						
					</c:when>
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
							<a href="/product/select?product_categoryCode=${productVO.product_categoryCode}&product_id=${productVO.product_id}">
								<div class="productImgWrap">
									<img alt="" src="/upload/product/${productVO.productFileVOs[0].productFile_name}">
								</div>
								<span class="productName">${productVO.product_name}</span>
							</a>
							<div class="iconBox"></div>
							<span class="productPrice pricePattern">${productVO.product_price}</span>
							<c:choose>
								<c:when test="${categoryAllCnt.code eq 001}">
									<button class="btnDefault red" onclick="location.href='/admin/updateCoffee?product_id=${productVO.product_id}'">상품수정</button>
									<button class="btnDefault red" onclick="location.href='/admin/updateProductState?product_id=${productVO.product_id}&product_categoryCode=001'">상품삭제</button>
								</c:when>
								<c:when test="${categoryAllCnt.code eq 002}">
									<button class="btnDefault red" onclick="location.href='/admin/updateMachine?product_id=${productVO.product_id}'">상품수정</button>
									<button class="btnDefault red" onclick="location.href='/admin/updateProductState?product_id=${productVO.product_id}&product_categoryCode=002'">상품삭제</button>
								</c:when>
								<c:when test="${categoryAllCnt.code eq 003}">
									<button class="btnDefault red" onclick="location.href='/admin/updateAccessories?product_id=${productVO.product_id}'">상품수정</button>
								</c:when>
							</c:choose>
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
		<c:import url="/WEB-INF/views/admin/adFooter.jsp"></c:import>
	</div>
</body>
	<script type="text/javascript">
	
		$().ready(function(){
			$('.pricePattern').each(function(){
				$(this).html(Number($(this).html()).toLocaleString() + '원');
			})
		});
	
		$('input[type=radio]').change(function(){
			$('.sortLabel').each(function(){ $(this).removeClass('on')})
			$(this).next().addClass('on');
		}); /********** 상품 기준별 재정렬 **********/
		
		$('.productWrap').hover(function(){
			$(this).find('button').fadeIn( "fast" );
		}, function(){
			$(this).find('button').css('display', 'none');
		});
	</script>
</html>