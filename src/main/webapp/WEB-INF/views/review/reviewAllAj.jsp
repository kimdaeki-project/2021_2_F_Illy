<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

				<div class="board_zone_list">
					<div class="review_list">
						<c:forEach items="${rList}" var="reviewVO" varStatus="i">
						<div class="review_one">
							<div class="review_left">
								<!--구매한 제품 이미지 썸네일-->
								<div class="buy_product">
									<img style="width:100px; height:100px;" src="/upload/product/${pfList[i.index].productFile_name}">
								</div>
								<input hidden="" class="review_id" name="review_id" value="${reviewVO.review_id}">
								<input hidden="" class="star_rate" value="${reviewVO.review_star}" />
								<div class="review_star">
									
								</div>
								<div class="review_info">
									<span class="buy_date">${reviewVO.review_regDate}</span>
									<span class="buy_user_id">${reviewVO.memberVO.username}</span>
								</div>							
							</div>
							
							
							<div class="review_right">
								<div class="buy_product_name">
									<strong>${reviewVO.productVO.product_name}</strong>
								</div>
								<%-- <div class="buy_product_detail">
									<strong>" ${reviewVO.review_title} "</strong>
								</div> --%>
								<div class="review_content">
									<span>${reviewVO.review_contents}</span>
								</div>
								
								
								<c:forEach items="${reviewVO.fileList}" var="reviewFileVO" begin="0" end="2">
									<div style="display:inline-block; position:relative; ">
										<div class="review_img" style=" cursor:pointer;display:inline-block; margin-right:20px;  width:102px; height:102px; overflow:hidden; position:relative;" class="review_photo">
											<img style="position:absolute; width:100%; top:50%; transform: translateY(-50%);" src="/upload/review/${reviewFileVO.reviewFile_name}"> 
										</div>
										<div class="show" style="display:none; width:500px; overflow:hidden; height:500px; background-color:#fff; border:1px solid #dbdbdb; position:absolute; ">
											<img style="position:absolute; width:100%;top:50%; transform: translateY(-50%); z-index: 99;" src="/upload/review/${reviewFileVO.reviewFile_name}">	
										</div>
									</div>
								</c:forEach> 
								
								
								
								<!-- <div class="review_hits">
									<span>추천 : <strong>0</strong></span>
									<a href="#">추천하기</a>
								</div> -->
							</div>	
							
						</div>	
						</c:forEach>	
							
								
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
			
			
	
</body>
</html>