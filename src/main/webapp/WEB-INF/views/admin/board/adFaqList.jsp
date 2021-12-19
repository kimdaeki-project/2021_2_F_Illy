<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/admin/insertBoard.css">
	<link rel="stylesheet" href="/css/board/faqList.css">
   
	<style type="text/css">
		.board_zone_tit{margin-top:0;margin-bottom:10px; padding-bottom:10px; position:relative;}
		.board_zone_tit h2{color:#d12420; font-size:24px;}
		.right_content{width:1000px;float:left;padding-left:40px;}
		.board_search_box{margin: 60px 0 30px 0;padding: 10px 10px 10px 10px;border-top: 1px solid #e8e8e8;border-bottom: 1px solid #e8e8e8; background: #f7f7f7; text-align: center;height:55px;}
		#kind{width:90px; height:31px;  vertical-align:top; text-align:left; font-size:13px; border-color:#ccc; padding-left:3px; color:#717171; }
		.text{width:162px; height:31px;  vertical-align:top; text-align:left; font-size:13px; border:1px solid #ccc; padding:0 10px;   }
		.btn_board_search{border:none; margin: 0 0 0 5px;padding: 0 20px 0 20px;color: #fff; border-radius: 21px;background: #d12420;line-height: 30px; cursor:pointer; }
		th{text-align:center; }
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/admin/adNavbar.jsp"></c:import>
		<div id="container" style="padding-bottom: 155px; margin-bottom: -155px;">
			<div id="contents">
				<div class="left_cont">
					<c:import url="/WEB-INF/views/admin/adLeftMenu.jsp"></c:import>		
				</div>
	
				<div class="right_content">
				<div class="board_zone_sec">
					<div class="board_zone_cont">
						<div class="board_zone_tit">
							<h2 style="color:#333; font-size:24px; border:none;" >FAQ</h2>
							<!--관리자용 버튼   -->
							<a class="addFaq" style="top:10px; right:0;" href="/admin/board/insertFaq">FAQ 추가하기</a>
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
			
					<div class="board_search_box">
						<input type="hidden" name="pn" value="1" id="pn">
						<input type="hidden" name="kind" value="${pager.kind}" id="kind">	
						<input type="text" class="text" name="search"  id="search" placeholder="검색어를 입력하세요">
						<button type="button" class="btn_board_search">검색<em></em></button>		
					</div>
			
				
				</div>
				
				</div>	
			<!-- right content work end  -->	
		
				
			</div>	
			
		</div>
		<c:import url="/WEB-INF/views/admin/adFooter.jsp"></c:import>
	</div>
	
	
	
	

	<script type="text/javascript" src="/js/faqList.js"></script>
	

	
</body>
</html>