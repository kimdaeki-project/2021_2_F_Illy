<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<div class="totalPrd">상품 <strong>${pager.count}</strong> 건</div>
	 <table class="product_list_table" style="width:100%;">
		<colgroup> <!-- table 간격 기본설정 -->
			<col width="10%">
			<col>
			<col width="20%">						
		</colgroup>
		<thead>
			<tr>
				<th>선택</th><th>상품명</th><th>상품금액</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${prdList}" var="productVO">
				<tr>
					<td><input type="radio" name="product_id" class="pick_prd" value="${productVO.product_id}"></td>
					<td class="prd">
						<div><img class="prdThumb" alt="" src="/upload/product/${productVO.productFileVOs[0].productFile_name}"></div>
						<div style="height:50px; width:250px; vertical-align:top;"><span style="vertical-align:middle;">${productVO.product_name}</span></div>
					</td>
					<td class="product_price"><fmt:formatNumber value="${productVO.product_price}" pattern="#,###"/>원</td>
				</tr>
			</c:forEach>		
		</tbody>
	</table>

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
	</div>
