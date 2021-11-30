<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/board/reviewAll.css">

<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>	
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>	
		<div id="container">
				
			<div id="contents">
			
				<div class="board_zone_tit">
					<h2>전체후기</h2>
				</div>
				
				<div class="review_search">
					<form id="rFrm" action="./reviewAll">
						<div class="review_search_option">
							<div class="select_box">
								<input type="hidden" name="pn" value="1" id="pn">
								<select class="search_cate" id="search_cate01" name="">
									<option class="search_kind" value="1">=카테코리 선택=</option>
									<option class="search_kind" value="2">ALL PRODUCT</option>
									<option class="search_kind" value="3">COFFEE</option>
									<option class="search_kind" value="4">MACHINES</option>
									<option class="search_kind" value="5">ILLY ART COLLECTION</option>
									<option class="search_kind" value="6">ACCESSORIES</option>
									<option class="search_kind" value="7">SPECIALLY CURATED SET</option>
								</select>
								<select class="search_cate" id="search_cate02" name="">
									<option class="search_kind" value="">=카테코리 선택=</option>
								</select>
								<select class="search_cate" id="search_cate03" name="">
									<option class="search_kind" value="">최신순</option>
									<option class="search_kind" value="">평점순</option>
									<option class="search_kind" value="">추천순</option>
								</select>	
								<input type="text" class="search_cate" style="cursor:text;" name="search" id="search" placeholder="상품명 검색">
								<button type="submit" class="btn_board_search">검색 <img src="/images/board/btn_goods_search.png"></button>
							</div>
						</div>
					</form>
				</div>
				<div class="board_zone_list">
					<div class="review_list">
						<div class="review_one">
							<div class="review_left">
								<!--구매한 제품 이미지 썸네일-->
								<div class="buy_product">
									
								</div>
								<div class="review_star">
								
								</div>
								<div class="review_info">
									<span class="buy_date">2021.11.29</span>
									<span class="buy_user_id">cingu*****</span>
								</div>							
							</div>
							<div class="review_right">
								<div class="buy_product_name">
									<strong>일리캡슈우우울</strong>
								</div>
								<div class="buy_product_detail">
								
								</div>
								<div class="review_content">
									
								</div>
								<div class="review_photo">
								
								</div>
								<div class="review_hits">
									<span>추천 : <strong>0</strong></span>
									<a href="#">추천하기</a>
								</div>
							</div>
						</div>
						<div class="review_one">
							<div class="review_left"></div>
							<div class="review_right"></div>
						</div>
						<div class="review_one">
							<div class="review_left"></div>
							<div class="review_right"></div>
						</div>
						<div class="review_one">
							<div class="review_left"></div>
							<div class="review_right"></div>
						</div>
						<div class="review_one">
							<div class="review_left"></div>
							<div class="review_right"></div>
						</div>
					</div>
					<div class="pagination">
							<c:if test="${pager.curBlock>1}">
								<button type="button" data-list-pn="${pager.curBlock=1}"  class="btnPage pageBtn">&#9001;&#9001; 맨앞</button>
								<button type="button" data-list-pn="${pager.startNum-1}" style="margin-right:10px;" class="btnPage pageBtn">&#9001; 이전</button>
							</c:if>
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
								<span class="pageNum pageBtn" data-list-pn="${i}">${i}</span>
							</c:forEach>
							<c:if test="${!pager.lastCheck}">
								<button type="button" data-list-pn="${pager.lastNum+1}" style="margin-left:10px;" class="btnPage pageBtn">다음 &#9002;</button>
								<button type="button" data-list-pn="${pager.totalPage}"  class="btnPage pageBtn">맨뒤 &#9002;&#9002;</button>
							</c:if>
						</div>
				</div>
			
			
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
</body>
</html>