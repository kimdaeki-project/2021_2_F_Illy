<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/board/faqList.css">
	
<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>		
		<div id="container">
				
			<div id="contents">
			
			<c:import url="/WEB-INF/views/navbar/noticeLeftMenu.jsp"></c:import>		
			<!-- right content work start -->	
			<div class="right_content">
				<div class="board_zone_sec">
					<div class="board_search_box">
						<div class="search_box_left">	
							<p>자주묻는 질문 검색</p>
							
							<input type="hidden" name="pn" value="1" id="pn">	
							<input type="hidden" name="kind" value="${pager.kind}" id="kind">	
								<input type="text" class="text" name="search"  id="search" placeholder="검색어를 입력하세요">
								<button type="button" class="btn_board_search">검색<em></em></button>
							
						</div>
						<div class="search_box_right">
							<strong>찾으시는 질문이 없다면?</strong>
							<a href="/member/qnaList">1:1 문의하기</a>
						</div>
					</div>
					
					<div class="board_zone_cont">
						<div class="board_zone_tit">
							<h2>FAQ</h2>
						</div>
						<div class="pickTab">
							<ul>
								<li>
									<button type="button" name="kind" class="pickFaq_type pick" value="">전체</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_1">회원가입/회원혜택</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_2">주문/결제/배송</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_3">취소/교환/반품/환불</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_4">상품문의</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_5">머신안내(Y1.1)</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_6">머신안내(Y3/Y3.2/Y3.3)</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_7">머신안내(X7,X7.1)</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_8">AS안내</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_9">자가진단</button>
								</li>
							</ul>
						
						</div>	
						
						
						<div id="showFaqList">
						
								<!-- faqList 출력 -->
						
						
						</div> <!-- ajax end -->
			
			
						
					</div>	
				
				</div>
			</div>	
			<!-- right content work end  -->	
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
	
	<script type="text/javascript" src="/js/faqList.js"></script>
	
	
	
</body>
</html>