<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	 <table class="board_list_table" style="width:100%;">
		<colgroup> <!-- table 간격 기본설정 -->
			<col width="67px">
			<col width="144px">						
		</colgroup>
		<thead>
			<tr>
				<th>번호</th><th>분류</th><th>내용</th>
			</tr>
		</thead>
		
		<tbody id="faq_list">				
			<c:forEach items="${FList}" var="faqVO">
				<tr class="toggle_faq">
					<td>${faqVO.faq_id}</td>
					<td>${faqVO.faq_type}</td>
					<td class="board_tit">
						<img class="icon_q" src="/images/board/icon_qna_q.png">
						<a href="#">
							<span>
								<strong class="btnView">${faqVO.faq_title}</strong>
							</span>
							<span><img class="icon_open" src="/images/board/icon_toggle_open.png"></span>
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
			

	<div class="pagination">
		
		<div id="page">
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

