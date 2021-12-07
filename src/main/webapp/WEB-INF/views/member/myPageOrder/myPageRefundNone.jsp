<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="myPage_breakdown_tab">
	<ul>
		<li class="on setStart same">
			<a>
				<span>환불 신청 내역</span>
			</a>
		</li>
		<li class="getCancel same">
			<a>
				<span>환불/입금 처리 현황</span>
			</a>
		</li>
	</ul>

</div>

	<span class="pick_list_num">환불/입금 내역 총 <strong>0</strong> 건</span>
	<div class="myPage_type_table">
		<table>
		<colgroup>
			<col style="width:15%"> <!-- 날짜/주문번호 -->
			<col> <!-- 상품명/옵션 -->
			<col style="width:15%"> <!-- 상품금액/수량 -->
			<col style="width:15%"> <!-- 주문상태 -->
			<col style="width:15%"> <!-- 확인/리뷰 -->
		</colgroup>
			<thead>
				<tr>
					<th>날짜/주문번호</th>
					<th>상품명/옵션</th>
					<th>상품금액/수량</th>
					<th>주문상태</th>
					<th>확인/리뷰</th>
				</tr>
			</thead>
			<tbody>
				<tr><td colspan="5"><div class="emptyList"><span>조회내역이 없습니다.</span></div></td></tr>
			</tbody>
		</table>	
	</div>
