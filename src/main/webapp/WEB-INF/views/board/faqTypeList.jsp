<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
						<a class="pickList">
							<span data-faq_id="${faqVO.faq_id}">
								<strong class="btnView">${faqVO.faq_title}</strong>	
								
							<!--관리자용 삭제 수정 버튼-->
							<sec:authorize access="hasRole('ADMIN')">
								<button type="button" class="updateBtn adminBtn" onclick="location.href='/admin/board/updateFaq?faq_id=${faqVO.faq_id}'"><i class="xi-pen-o xi-x"></i></button>								
								<button type="button" class="deleteBtn adminBtn"><i class="xi-close-square-o xi-x"></i></button>
							</sec:authorize>
							<!--관리자용 삭제 수정 버튼-->
							
							</span>
							<span><img class="icon_open" src="/images/board/icon_toggle_open.png"></span>
						</a>
					</td>
				</tr>
				<tr class="faq_answer hide">
					<td colspan="2" style="padding-left:200px; padding-right:0; vertical-align:top;">
						<img style="margin-top:2px; " class="icon_q icon_a" src="/images/board/icon_qna_a.png">
					</td>
					<td colspan="2" class="cont_right">
						<span>${faqVO.faq_contents}</span>						
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<c:if test="${empty FList}">
			<div class="emptyList"><span>게시글이 존재하지 않습니다.</span></div>
		</c:if>	

	<c:if test="${not empty FList}">
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
	</c:if>
