<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/member/myPage/myPageCommon.css">
	<link rel="stylesheet" href="/css/member/myPage/myPageOrder.css">
	<style type="text/css">
		#right_content{width:1000px;float:left;padding-left:40px; min-height: 500px;}
		.myPage_cont {padding-bottom: 50px;}
		.pagination .btnPage{min-width:26px; background-color:#fff;border:1px solid #e0e0e0;cursor:pointer;color:#888; font-size:11px; padding: 6px 4px 10px 4px; }
		.pageNum{cursor:pointer; display:inline-block;  font-size:11px; color:#888; height:30px; width:30px; line-height:30px; vertical-align:middle;  }	
		.pageNum.on{font-weight:bold; color:#fff; background-color:#7a7d81; border-radius:20px; }
		.pagination{text-align:center; margin-top:60px;  cursor:pointer;  }
		.emptyList{width:100%; text-align:center;position:relative; padding:13px 10px 15px; font-size:12px; color:#333;}
	</style>

<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>	
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>	
		<div id="container">
				
			<div id="contents">
			<c:import url="/WEB-INF/views/navbar/myPageLeftBar.jsp"></c:import>	
				<div id="right_content">
					<div class="myPage_cont">
						<div class="myPage_lately_info">						
							<div class="myPage_zone_tit">
								<h3>주문목록/배송조회</h3>
							</div>
							<div class="date_check_box">
								<h3>조회기간</h3>
								<button type="button" class="pick_date">오늘</button>
								<button type="button" class="pick_date">7일</button>
								<button type="button" class="pick_date">15일</button>
								<button type="button" class="pick_date">1개월</button>
								<button type="button" class="pick_date">3개월</button>
								<button type="button"style="margin-right:10px; " class="pick_date">1년</button>
								<input type="text" class="date_picker">
								<span>~</span>
								<input type="text" class="date_picker">
								<button type="button" class="btn_board_search">조회<em></em></button>
							</div> <!-- date_check_box end --> <!-- 날짜 box 다영씨 -->
							
							<div class="myPage_lately_info_cont">
								<span class="pick_list_num">주문목록 / 배송조회 목록 총 <strong>5</strong> 건</span>
								<div class="myPage_type_table">
									<table>
									<colgroup></colgroup>
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
											<tr>
												<td rowspan="1" class="order_day_num">
												</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div> <!-- myPage_type_table end -->
							</div><!-- myPage_lately_info_cont end --> <!-- list 출력 -->
							
						</div><!-- myPage_lately_info end -->
						<div class="pagination">
						</div><!-- pagination end -->
					</div><!-- myPage_cont end -->
				</div> <!--right_content END-->
				
			</div>
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
</body>
</html>