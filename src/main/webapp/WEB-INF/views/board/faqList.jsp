<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<style type="text/css">
		.right_content{float:left; width:960px; padding-left:60px; }
		.board_zone_tit{margin:35px 0 20px 0; padding-bottom:10px;}
		.board_zone_tit h2{color:#333333; font-size:18px;}
		.board_list_table{width:100%;margin:0 0 20px 0;border:0;border-spacing:0;border-collapse:collapse;border-top:1px solid #999999;text-align:center;}
		.board_list_table th{padding:10px 10px 10px 14px; font-size:12px; border-bottom:1px solid #dbdbdb; background:#fbfbfb;}
		.board_list_table td{padding:13px 10px 15px 10px; border-bottom:1px solid #dbdbdb;}
		tbody tr td{font-weight:normal; font-size:12px; color:#333;}
		.pagination{text-align:center; margin-top:60px;  }
		.test{width:20px; height:20px; background-color:#fff; border:none;   font-size:12px; line-height:12px;}
		.board_search_box{position:relative; width:100%; height:123px; padding: 20px 20px 20px 30px;border:3px solid #eeeeee;}
		.search_box_left{float:left; width:70%; height:70px;  border-right:1px solid #dbdbdb; display:inline-block;  }
		.search_box_left p{padding-bottom:12px; font-size:18px; font-weight:bold; color:#333333;}
		.search_box_right{width:30%;height:70px;display:inline-block; padding-left:50px; }
		.search_box_right strong{display:inline-block; font-size:12px; margin:10px 0;}
		.search_box_right a{display:block; text-align:center; line-height:28px; width:93px; height:28px; font-size:12px; border:1px solid #dbdbdb; }
		.search_box_right a:hover{background-color:#eee;}
		.text{width:400px; height:31px;  text-align:left; font-size:12px; border:1px solid #ccc; padding:0 10px;   }
		.btn_board_search{width:100px; height:31px;border:none;padding: 0 20px 0 20px; font-weight:bold; font-size:12px; color: #fff; border-radius: 21px;background: #d12420;line-height:1.5; cursor:pointer; }
		.btn_board_search em{padding: 0 20px 0 0;background-image: url(/images/board/btn_goods_search.png);background-position: right 3px; background-repeat: no-repeat;}
		.pickTab ul li{display:inline-block; }
		.pickTab ul li a{ line-height:15px;font-size:12px;color:#333333; display:block; position:relative; top:-10px;height:11px; padding:0 3px 0 5px; border-left:1px solid #cccccc; }
		.pickTab ul li a.on{color:#333; font-weight:bold; }
		.pickTab ul li:first-child a{border:none; }
		.pickTab ul li a:hover{text-decoration: underline; color:#d12420;font-weight:bold; }
	</style>

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
							<form name="frmList" id="frmList" action="noticeList" method="get">	
								<input type="text" class="text" name="search" value="" placeholder="검색어를 입력하세요">
								<button type="button" class="btn_board_search">검색<em></em></button>
							</form>
						</div>
						<div class="search_box_right">
							<strong>찾으시는 질문이 없다면?</strong>
							<a href="#">1:1 문의하기</a>
						</div>
					</div>
					
					<div class="board_zone_cont">
						<div class="board_zone_tit">
							<h2>FAQ</h2>
						</div>
						<div class="pickTab">
							<ul>
								<li>
									<a class="on" href="#">전체</a>
								</li>
								<li>
									<a href="#">회원가입/회원혜택</a>
								</li>
								<li>
									<a href="#">주문/결제/배송</a>
								</li>
								<li>
									<a href="#">취소/교환/반품/환불</a>
								</li>
								<li>
									<a href="#">상품문의</a>
								</li>
								<li>
									<a href="#">머신안내(Y1.1)</a>
								</li>
								<li>
									<a href="#">머신안내(Y3/Y3.2/Y3.3)</a>
								</li>
								<li>
									<a href="#">머신안내(X7,X7.1)</a>
								</li>
								<li>
									<a href="#">AS 안내</a>
								</li>
								<li>
									<a href="#">자가진단</a>
								</li>
							</ul>
						
						</div>	
						<table class="board_list_table" style="width:100%;">
							<colgroup> <!-- table 간격 기본설정 -->
								<col width="67px">
								<col width="144px">
								<col width="749px">								
							</colgroup>
							<thead>
								<tr>
									<th>번호</th><th>분류</th><th>내용</th>
								</tr>
							</thead>
							<tbody>
							<%-- <c:set var="size" value="${fn:length(List)}" />	 --%>
								<c:forEach items="${List}" var="ar">
									<tr>
									<c:choose>
									<c:when test="${ar.notice_top eq 1}">
										<td scope="row"><img src="/images/board/icon_board_notice.png"></td>
									</c:when>	
									<c:otherwise>									
										<td scope="row">${ar.notice_id}</td>
									</c:otherwise>
									</c:choose>
										<td scope="row" style="text-align:left;">
											<a href="#">
												[${ar.notice_type}] ${ar.notice_title}&nbsp;
												<c:if test="${ar.notice_hits > 100}">
													<img src="/images/board/icon_board_hot.png">
												</c:if>
											</a>
										</td>
										<td scope="row">${ar.notice_regDate}</td>
										<td scope="row">관리자</td>
										<td scope="row">${ar.notice_hits}</td>
										
									</tr>
									
								</c:forEach>
							</tbody>
						</table>
			
			
						<div class="pagination">
							<button type="button" class="test">1</button>
							<button type="button" class="test">2</button>
							<button type="button" class="test">3</button>
							<button type="button" class="nextBtn">다음></button>
							<button type="button" class="endBtn">맨뒤>></button>
						</div>
			
			
			
						
					</div>	
				
				</div>
			</div>	
			<!-- right content work end  -->	
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
	
	
	
	
	<script type="text/javascript">
	

	</script>
	
	
	
	
	
</body>
</html>