<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty list}">
	<span class="pick_list_num"><strong id="startendDate"></strong> 까지의 일리 포인트 사용내역 총<strong> 0 </strong>건</span>
	<div class="myPage_type_table">
		<table>
			<colgroup>
            	<col style="width:15%">	<!-- 날짜 -->
           		<col style="width:12%"> <!-- 유형 -->
            	<col>					<!-- 내용 -->
             	<col style="width:20%"> <!-- 마일리지 내역 -->
             	<col style="width:20%"> <!-- 잔여 마일리지 -->
          	</colgroup>
				<thead>
					<tr>
						<th>날짜</th>
						<th>유형</th>
						<th>내용</th>
						<th>콩포인트 내역</th>
						<th>잔여포인트 내역</th>
					</tr>
				</thead>
			<tbody>
				<tr><td colspan="5"><div class="emptyList"><span>조회내역이 없습니다.</span></div></td></tr>
			</tbody>
		</table>	
	</div>
</c:if>		
<c:if test="${!empty list}">												
 		<span class="pick_list_num"><strong id="startendDate"></strong> 까지의 일리 포인트 사용내역 총<strong> ${count} </strong>건</span>
		<div class="myPage_type_table">
			<table>
			<colgroup>
            	<col style="width:15%">	<!-- 날짜 -->
           		<col style="width:12%"> <!-- 유형 -->
            	<col>					<!-- 내용 -->
             	<col style="width:20%"> <!-- 마일리지 내역 -->
             	<col style="width:20%"> <!-- 잔여 마일리지 -->
          	</colgroup>
				<thead>
					<tr>
						<th>날짜</th>
						<th>유형</th>
						<th>내용</th>
						<th>콩포인트 내역</th>
						<th>잔여포인트 내역</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>
							<strong style="color: #333333;">${list.point_date}</strong>
						</td>
						<td>
							<strong style="color: #333333;">
								<c:if test="${list.point_type eq 'use' }">차감</c:if>
								<c:if test="${list.point_type eq 'add' }">적립</c:if>
							</strong>
						</td>
						<td>
							<strong>
								${list.point_history}
							</strong>
						</td>
						<td>
							<strong>
								<c:if test="${list.point_type eq 'use'}">(-)</c:if>
								<c:if test="${list.point_type eq 'add'}">(+)</c:if>
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.point_addOrUse}"/>콩
							</strong>
						</td>
						<td>
							<strong>
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.point_totalPoint}"/>콩
							</strong>
						</td>
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
						
				</div> <!-- pagination end --> 
				
</c:if>