<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

												<div class="delivery_modal_scroll">
													<h5>배송지 목록</h5>
													<div class="delivery_add_list">
														<div class="delivery_modal_table">
															<table>
																<thead>
																	<tr>
																		<th>선택</th>
																		<th>배송지이름</th>
																		<th>받으실분</th>
																		<th>주소</th>
																		<th>연락처</th>
																		<th>수정/삭제</th>
																	</tr>
																</thead>
																<tbody>
																<c:if test="${addressList.size() eq 0}">
																	<tr>
																		<td colspan="6">
																			<div style="width: 100%;
																						text-align: center;
																						position: relative;
																						padding: 50px 30px;
																						font-size: 12px;
																						color: #333;">
																				배송지 내역이 없습니다.
																			</div>
																		</td>
																	</tr>
																</c:if>
																<c:if test="${addressList.size() ne 0}">
																	<c:forEach items="${addressList}" var="al">
																		<c:if test="${al.address_default eq 1}">
																			<tr>
																				<td>
																					<span class="delivery_btn_click delivery_myAddress_chk"><a>선택</a></span>
																				</td>
																				<td>
																					<span>(기본배송지)</span><br>
																					<strong>${al.address_name}</strong>
																				</td>
																				<td>${al.address_recipient_name}</td>
																				<td class="td_address">[${al.address_postcode}] ${al.main_address} ${al.address_reference} ${al.address_detail}</td>
																				<td class="td_phone">휴대폰 : ${al.address_recipient_phone}</td>
																				<td>
																					<span class="delivery_btn_click delivery_myAddress_up" data-address-id="${al.address_id}">
																						<span>
																							<input type="hidden" value="${al.address_name}" class="address_name_modal">
																							<input type="hidden" value="${al.address_default}" class="address_default_modal">
																							<input type="hidden" value="${al.member_id}" class="member_id_modal">
																							<input type="hidden" value="${al.address_id}" class="address_id_modal">
																							<input type="hidden" value="${al.address_recipient_name}" class="address_recipient_name_modal">
																							<input type="hidden" value="${al.address_postcode}" class="address_postcode_modal">
																							<input type="hidden" value="${al.main_address}" class="main_address_modal">
																							<input type="hidden" value="${al.address_reference}" class="address_reference_modal">
																							<input type="hidden" value="${al.address_detail}" class="address_detail_modal">
																							<input type="hidden" value="${al.address_recipient_phone}" class="address_recipient_phone_modal">
																						</span>
																						<a>수정</a>
																					</span>
																					<span class="delivery_btn_click delivery_myAddress_del" data-default-chk="${al.address_default}" data-myDelivery-del="${al.address_id}">
																						<a>
																							<input type="hidden" value="${al.address_name}" class="address_name_modal">
																							삭제
																						</a>
																					</span>
																				</td>
																			</tr>
																		</c:if>
																	</c:forEach>
																	<c:forEach items="${addressList}" var="al">
																		<c:if test="${al.address_default eq 0}">
																			<tr>
																				<td>
																					<span class="delivery_btn_click delivery_myAddress_chk"><a>선택</a></span>
																				</td>
																				<td>
																					<span></span>
																					<strong>${al.address_name}</strong>
																				</td>
																				<td>${al.address_recipient_name}</td>
																				<td class="td_address">[${al.address_postcode}] ${al.main_address} ${al.address_reference} ${al.address_detail}</td>
																				<td class="td_phone">휴대폰 : ${al.address_recipient_phone}</td>
																				<td>
																					<span class="delivery_btn_click delivery_myAddress_up" data-address-id="${al.address_id}">
																						<span>
																							<input type="hidden" value="${al.address_name}" class="address_name_modal">
																							<input type="hidden" value="${al.address_default}" class="address_default_modal">
																							<input type="hidden" value="${al.member_id}" class="member_id_modal">
																							<input type="hidden" value="${al.address_id}" class="address_id_modal">
																							<input type="hidden" value="${al.address_recipient_name}" class="address_recipient_name_modal">
																							<input type="hidden" value="${al.address_postcode}" class="address_postcode_modal">
																							<input type="hidden" value="${al.main_address}" class="main_address_modal">
																							<input type="hidden" value="${al.address_reference}" class="address_reference_modal">
																							<input type="hidden" value="${al.address_detail}" class="address_detail_modal">
																							<input type="hidden" value="${al.address_recipient_phone}" class="address_recipient_phone_modal">
																						</span>
																						<a>수정</a>
																					</span>
																					<span class="delivery_btn_click delivery_myAddress_del" data-default-chk="${al.address_default}" data-myDelivery-del="${al.address_id}">
																						<a>
																							<input type="hidden" value="${al.address_name}" class="address_name_modal">
																							삭제
																						</a>
																					</span>
																				</td>
																			</tr>
																		</c:if>
																	</c:forEach>
																</c:if>
																</tbody>
															</table>
														</div>
														<a class="new_delivery_add">+ 새 배송지 추가</a>
													</div> <!-- delivery_add_list end  -->
												</div> <!-- delivery_modal_scroll end -->
															
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="/js/cart/payment.js"></script>