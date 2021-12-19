<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/member/myPage/myPageCommon.css">
<link rel="stylesheet" href="/css/member/myPage/myPageOrder.css">
<link rel="stylesheet" href="/css/member/myPage/myPageCancel.css">
<link rel="stylesheet" href="/css/member/myPage/myPageCoupon.css">
<link rel="stylesheet" href="/css/member/myPage/myPageIcon.css">
<!-- 마이페이지 회원 요약정보 css 들어있는 곳 -->
<style type="text/css">
#right_content {
	width: 1000px;
	float: left;
	padding-left: 40px;
	min-height: 500px;
}

.myPage_cont {
	padding-bottom: 50px;
}

.pagination .btnPage {
	min-width: 26px;
	background-color: #fff;
	border: 1px solid #e0e0e0;
	cursor: pointer;
	color: #888;
	font-size: 11px;
	padding: 6px 4px 10px 4px;
}

.pageNum {
	cursor: pointer;
	display: inline-block;
	font-size: 11px;
	color: #888;
	height: 30px;
	width: 30px;
	line-height: 30px;
	vertical-align: middle;
}

.pageNum.on {
	font-weight: bold;
	color: #fff;
	background-color: #7a7d81;
	border-radius: 20px;
}

.pagination {
	text-align: center;
	margin-top: 60px;
	cursor: pointer;
}

.emptyList {
	width: 100%;
	text-align: center;
	position: relative;
	padding: 50px 30px;
	font-size: 12px;
	color: #333;
}
</style>

<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>
		<div id="container">
			<sec:authentication property="principal" var="member" />
			<div id="contents">
				<c:import url="/WEB-INF/views/navbar/myPageLeftBar.jsp"></c:import>
				<div id="right_content">
					<div class="myPage_cont">
						<!-- 마이페이지 회원 요약정보 -->
						<div class="myPage_top_info">
							<div class="myPage_top_text">
								<div class="grade_text">
									<p>${member.member_name}님의</p>
									<p>
										회원등급은
										<span>[일반회원등급]</span>
										입니다.
									</p>
									<div class="grade_btn">
										<span class="grade_btn_btn">
											<a>
												<em>등급혜택보기</em>
											</a>
										</span>

										<!-- 등급혜택 창 start -->
										<div id="lyGrade" class="layer_area" style="display: none;">
											<div class="ly_wrap grade_layer">
												<div class="ly_tit">
													<strong>등급혜택 안내</strong>
												</div>
												<div class="ly_cont">
													<div class="grade_list">
														<dl>
															<dt>회원 등급</dt>
															<dd>일반회원등급</dd>
														</dl>
														<dl>
															<dt>추가 할인</dt>
															<dd>
																<strong>0원이상 구매시 상품 판매금액의 0.0% 추가 할인</strong>
															</dd>
														</dl>
														<dl>
															<dt>중복 할인</dt>
															<dd>
																<strong>0원이상 구매시 상품 판매금액의 0.0% 추가 할인</strong>
															</dd>
														</dl>
														<dl>
															<dt>추가 적립</dt>
															<dd>0원이상 구매 시 구매금액당 0.0% 추가 적립</dd>
														</dl>
													</div>
												</div>
												<!-- //ly_cont -->
												<a class="ly_close closeModal">
													<img src="/images/cart/btn_layer_close.png" alt="닫기">
												</a>
											</div>
										</div>
										<!-- lyGrade end -->
										<!-- 등급혜택 창 end -->

									</div>
									<!-- grade_btn end -->

								</div>
								<!-- grade_text end -->
							</div>
							<!-- myPage_top_text end -->
							<div class="myPage_top_wallet">
								<ul>
									<li><span>
											<img alt="" src="/images/coupon/icon_coupon.png">
										</span> <span>
											<em>쿠폰</em>
											<a href="/member/myPage/myPageCoupon">
												<strong>${couponSize}</strong>장
											</a>
										</span></li>
									<li><span>
											<img alt="" src="/images/coupon/icon_mileage.png">
										</span> <span>
											<em>일리 포인트</em>
											<a>
												<strong>${member.member_point}</strong>콩
											</a>
										</span></li>
								</ul>
							</div>
							<!-- myPage_top_wallet end -->

						</div>
						<!-- myPage_top_info -->
						<!-- 마이페이지 회원 요약정보 end -->
						<div class="mypageMemberService">
							<div class="icon icon_section" id="">
								<a href="./myPage/changeMemberPassword">
									<div class="icon_image">
										<img alt="asd" src="/images/myPageIcons/mypage_icon_member.png">
									</div>
									<p>회원정보</p>
								</a>
							</div>
							<div class="icon icon_section" id="">
								<a href="./myPage/myPageOrder">
									<div class="icon_image">
										<img alt="asd" src="/images/myPageIcons/mypage_icon_order.png">
									</div>
									<p>쇼핑정보</p>
								</a>
							</div>
							<div class="icon icon_section" id="">
								<a href="./myPage/myPageCancel">
									<div class="icon_image">
										<img alt="asd" src="/images/myPageIcons/mypage_icon_wish.png">
									</div>
									<p>취소/반품/교환</p>
								</a>
							</div>
				<!-- 			<div class="icon icon_section" id="">
								<a href="#">
									<div class="icon_image">
										<img alt="asd" src="/images/myPageIcons/mypage_icon_cancel.png">
									</div>
									<p>정품등록</p>
								</a>
							</div> -->				
							
																								
						</div>
					</div>
					<!-- myPage_cont end -->

				</div>
				<!--right_content END-->
			</div>
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>
	</div>
</body>
</html>