<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <table class="board_list_table" style="width:100%;">
		<colgroup> <!-- table 간격 기본설정 -->
			<col width="10%">
			<col width="15%">
			<col>
			<col width="10%">						
		</colgroup>
		<thead>
			<tr>
				<th>문의날짜</th><th>카테고리</th><th>제목</th><th>문의상태</th>
			</tr>
		</thead>
		<tbody>			
			<c:forEach items="${QList}" var="qnaVO">
				<tr class="toggle_faq">
					<td>${qnaVO.qna_regDate}</td>
					<td>${qnaVO.qna_type}</td>
					<td style="text-align:left;" class="board_tit">
						<a href="./qnaSelect?qna_id=${qnaVO.qna_id}">
							<span style="padding-left:10px;">
								<i class="xi-lock-o"></i> <span class="btnView">${qnaVO.qna_title}</span>
								<input hidden="" name="member_id" value="${qnaVO.member_id}">
							</span>
						</a>
					</td>
					<td>
						<c:choose>
							<c:when test="${qnaVO.qna_state eq 0}">접수</c:when>
							<c:otherwise>답변완료</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>					
		</tbody>
	</table>
	<c:if test="${empty QList}">
		<div class="emptyList" style=" margin-top:60px; padding-bottom:70px;"><span>1:1문의 내역이 존재하지 않습니다.</span></div>
	</c:if>	
	
	
	
	<c:if test="${not empty QList}">
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