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
		.board_zone_tit{margin:10px 0; padding-bottom:10px;}
		.board_zone_tit h2{color:#d12420; font-size:24px;}
		.board_list_table{width:100%;margin:0 0 20px 0;border:0;border-spacing:0;border-collapse:collapse;border-top:1px solid #999999;text-align:center;}
		.board_list_table th{padding:10px 10px 10px 14px; font-size:12px; border-bottom:1px solid #dbdbdb; background:#fbfbfb;}
		.board_list_table td{padding:13px 10px 15px 10px; border-bottom:1px solid #dbdbdb;}
		tbody tr td{font-weight:normal; font-size:12px; color:#333;}
		.board_search_box{margin: 60px 0 30px 0;padding: 10px 10px 10px 10px;border-top: 1px solid #e8e8e8;border-bottom: 1px solid #e8e8e8; background: #f7f7f7; text-align: center;}
		.kind{width:90px; height:31px;  vertical-align:top; text-align:left; font-size:13px; border-color:#ccc; padding-left:8px;  }
		.text{width:162px; height:31px;  vertical-align:top; text-align:left; font-size:13px; border:1px solid #ccc; padding:0 10px;   }
		.btn_board_search{border:none; margin: 0 0 0 5px;padding: 0 20px 0 20px;color: #fff; border-radius: 21px;background: #d12420;line-height: 30px; cursor:pointer; }
		.review_list{width:900px; position:relative; overflow:hidden;}
		.review_list ul{float:left; width:100%; position:relative;   }
		.review_list ul li{margin:0 0 40px 0; font-size:12px; overflow:hidden;  position:relative;  display:inline-block;  }
		.review_list ul li .li_wrap{padding:0 10px;}
		.review_list ul li .review_img{width:275px; min-height:200px; border:1px solid #ebebeb; }
		.review_list ul li .review_star{width:88px; height:15px; background-color:#eee; margin:10px 0; }
		.review_list ul li .review_contents strong{display:block;}
		.pagination .btnPage{min-width:26px; background-color:#fff;border:1px solid #e0e0e0;cursor:pointer;color:#888; font-size:11px; padding: 6px 4px 10px 4px; }
		.pageNum{cursor:pointer; display:inline-block;  font-size:11px; color:#888; height:30px; width:30px; line-height:30px; vertical-align:middle;  }	
		.pageNum.on{font-weight:bold; color:#fff; background-color:#7a7d81; border-radius:20px; }
		.pagination{text-align:center; margin-top:60px;  cursor:pointer;  }
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
					<div style="padding-bottom:20px; ">
						<img style="width:100%;" src="/images/board/556675a65d0cf3db93a71fc75f82c0ca_143357.jpg">
					</div>
					<div class="board_zone_tit">
						<h2>상품후기</h2>
					</div>
					<div class="board_zone_cont">
						<div class="review_list">
							<ul>
								<li>
									<div class="li_wrap">
										<div class="review_img"><!--원래는 구매한 제품 이미지--></div>
										<div class="review_star"></div>
										<div class="review_contents">
											<strong>title01</strong>
											<span style=" padding-right:10px;border-right:1px solid #ccc;">cingu*****</span>
											<span style=" padding-left:5px;">2021.11.29</span>
										</div>
									</div>
								</li>
								<li>
									<div class="li_wrap">
										<div class="review_img"><!--원래는 구매한 제품 이미지--></div>
										<div class="review_star"></div>
										<div class="review_contents">
											<strong>title01</strong>
											<span style=" padding-right:10px;border-right:1px solid #ccc;">cingu*****</span>
											<span style=" padding-left:5px;">2021.11.29</span>
										</div>
									</div>
								</li>
								<li>
									<div class="li_wrap">
										<div class="review_img"><!--원래는 구매한 제품 이미지--></div>
										<div class="review_star"></div>
										<div class="review_contents">
											<strong>title01</strong>
											<span style=" padding-right:10px;border-right:1px solid #ccc;">cingu*****</span>
											<span style=" padding-left:5px;">2021.11.29</span>
										</div>
									</div>
								</li>
								<li>
									<div class="li_wrap">
										<div class="review_img"><!--원래는 구매한 제품 이미지--></div>
										<div class="review_star"></div>
										<div class="review_contents">
											<strong>title01</strong>
											<span style=" padding-right:10px;border-right:1px solid #ccc;">cingu*****</span>
											<span style=" padding-left:5px;">2021.11.29</span>
										</div>
									</div>
								</li>
								<li>
									<div class="li_wrap">
										<div class="review_img"><!--원래는 구매한 제품 이미지--></div>
										<div class="review_star"></div>
										<div class="review_contents">
											<strong>title01</strong>
											<span style=" padding-right:10px;border-right:1px solid #ccc;">cingu*****</span>
											<span style=" padding-left:5px;">2021.11.29</span>
										</div>
									</div>
								</li>
								<li>
									<div class="li_wrap">
										<div class="review_img"><!--원래는 구매한 제품 이미지--></div>
										<div class="review_star"></div>
										<div class="review_contents">
											<strong>title01</strong>
											<span style=" padding-right:10px;border-right:1px solid #ccc;">cingu*****</span>
											<span style=" padding-left:5px;">2021.11.29</span>
										</div>
									</div>
								</li>
							</ul>
						
						</div>
			
						<div class="pagination">
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
			
			
			
						<div class="board_search_box">
							<form name="frmList" id="frmList" action="noticeList" method="get">
								<select class="kind" name="kind">
									<option value="title">제목</option>
									<option value="contents">내용</option>
									<option value="writer">작성자</option>
								</select>	
								<input type="text" class="text" name="search" value="">
								<button type="button" class="btn_board_search">검색</button>
							</form>
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