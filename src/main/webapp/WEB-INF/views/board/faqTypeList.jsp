<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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




