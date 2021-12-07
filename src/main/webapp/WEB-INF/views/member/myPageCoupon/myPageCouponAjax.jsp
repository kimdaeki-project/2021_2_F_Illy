<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="myPage_breakdown_tab">
	<ul>
		<li class="on setStart same">
			<a>
				<span>사용가능</span>
			</a>
		</li>
		<li class="getCancel same">
			<a>
				<span>사용불가</span>
			</a>
		</li>
	</ul>

</div>
<c:if test="${empty list}">
	<span class="pick_list_num"><strong id="startendDate"></strong> 까지의 쿠폰 내역</span>
	<div class="myPage_type_table">
		<table>
		<colgroup>
				<col> 
				<col style="width:17%"> 
				<col style="width:13%"> 
				<col style="width:13%"> 
				<col style="width:20%"> 
				<col style="width:10%"> 
			</colgroup>
				<thead>
					<tr>
						<th>쿠폰명</th>
						<th>혜택</th>
						<th>사용조건</th>
						<th>제한조건</th>
						<th>유효기간</th>
						<th>발급일</th>
					</tr>
				</thead>
			<tbody>
				<tr><td colspan="6"><div class="emptyList"><span>조회내역이 없습니다.</span></div></td></tr>
			</tbody>
		</table>	
	</div>
</c:if>		
<c:if test="${!empty list}">												
 		<span class="pick_list_num"><strong id="startendDate"></strong> 까지의 쿠폰 내역</span>
		<div class="myPage_type_table">
			<table>
			<colgroup>
				<col> 
				<col style="width:17%"> 
				<col style="width:13%"> 
				<col style="width:13%"> 
				<col style="width:20%"> 
				<col style="width:10%"> 
			</colgroup>
				<thead>
					<tr>
						<th>쿠폰명</th>
						<th>혜택</th>
						<th>사용조건</th>
						<th>제한조건</th>
						<th>유효기간</th>
						<th>발급일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>
							<div class="mypage_coupon_name">
								<img alt="" src="/images/coupon/coupon.png">
								<strong>${list.coupon_name}</strong>
							</div>
						</td>
						<td>
							<strong>
								${list.coupon_discount}원
								<c:if test="${list.coupon_type=='cart'}">상품</c:if>
								<c:if test="${list.coupon_type=='delivery'}">배송비</c:if>
								할인
							</strong>
						</td>
						<td>
							<div class="coupon_layer">
								<span class="coupon_layer_layer">
									<a><em>자세히보기</em></a>
								</span>
								
								<div id="lyUseCase3100063" class="layer_area" style="display: none;">
                                        <div class="ly_wrap use_case_layer">
                                            <div class="ly_tit">
                                                <strong>사용가능조건 보기</strong>
                                            </div>
                                            <div class="ly_cont paddingTop">
                                                <div class="use_case_list">
                                                    <dl>
                                                        <dt>[사용범위]</dt>
                                                        <dd>PC+모바일</dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>[쿠폰 중복사용 여부]</dt>
                                                        <dd>중복 사용불가</dd>
                                                    </dl>
                                                </div>
                                            </div>
                                            <!-- //ly_cont -->
                                            <a class="ly_close"><img src="/images/cart/btn_layer_close.png" alt="닫기"></a>
                                        </div>
                                        <!-- //ly_wrap -->
                                    </div>
							</div>
						</td>
						<td></td>
						<td>
							<em class="coupon_date_day">${list.coupon_get}<br>~ ${list.coupon_validity}까지</em>
							<span class="coupon_before_use">사용가능</span>
						</td>
						<td>${list.coupon_get}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
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
				
</c:if>