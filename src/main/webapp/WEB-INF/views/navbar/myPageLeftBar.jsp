<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<style type="text/css">
		.left_cont{margin-top:-1px;width:200px;  float:left; display:block;   }
		.left_cont h2{padding:0 0 5px 25px; font-size:18px; color:#D12420; border-bottom:0;  }
		.left_cont_box{border-radius:21px; padding:13px 25px; margin-bottom:57px; border:1px solid #d12420; margin-top:7px; display:block; box-sizing:border-box; }
		.left_cont_box li{margin:15px 0; }
		.left_cont_box > li{padding:8px 0 17px; margin-bottom:4px;}
		.left_cont_box li span{font-weight:bold; padding-top:8px;  color:#D12420;font-size:14px;}
		.left_cont_box li ul{padding-left:10px; margin-top:-2px;}
		.left_cont_box li ul li a{font-weight:normal; font-size:12px; line-height:14px; margin-bottom:10px;   }
	</style>

</head>
<body>
			
	<div class="left_cont">
		<h2>마이페이지</h2>		
		<ul class="left_cont_box">	
			<li>
				<span style="border-top:1px solid #aaa;">쇼핑</span><span>정보</span>
				<ul>
					<li><a href="/member/myPage/myPageOrder">- 주문목록/배송조회</a></li>
					<li><a href="/member/myPage/myPageCancel?cart_state=cancel">- 취소/반품/교환 내역</a></li>
					<li><a href="/member/myPage/myPageRefund?cart_sate=refund">- 환불/입금 내역</a></li>
					<li><a href="#">- 찜리스트</a></li>
					<li><a href="http://localhost/cart/normalBasket">- 장바구니</a></li>
				</ul>
			</li>
			<li>
				<span style="border-top:1px solid #aaa;">리뷰</span><span>/Q&A</span>
				<ul>
					<li><a href="/member/myReviewList">- 나의 상품후기</a></li>
					<li><a href="/member/qnaList">- 나의 1:1문의</a></li>
				</ul>
			</li>
			<li>
				<span style="border-top:1px solid #aaa;">혜택</span><span>관리</span>
				<ul>
					<li><a href="/member/myPage/myPageCoupon">- 쿠폰</a></li>
					<li><a href="#">- 콩포인트</a></li>
				</ul>
			</li>
			<li>
				<span style="border-top:1px solid #aaa;">회원</span><span>정보</span>
				<ul>
					<li><a href="./changeMemberPassword">- 회원정보 변경</a></li>
					<li><a href="#">- 배송지 관리</a></li>
					<li><a href="#">- 회원 탈퇴</a></li>
				</ul>
			</li>
			<li>
				<span style="border-top:1px solid #aaa;">고객</span><span>지원</span>
				<ul>
					<li><a href="#">- 정품 등록</a></li>
					<li><a href="#">- AS 접수</a></li>
					<li><a href="#">- 부품 구매</a></li>
				</ul>
			</li>
			<li>
				<span style="border-top:1px solid #aaa;">정기</span><span>배송관리</span>
				<ul>
					<li><a href="#">- 결제카드 관리</a></li>
					<li><a href="#">- 정기배송 신청목록</a></li>
				</ul>
			</li>
			<li>
				<span style="border-top:1px solid #aaa;">나의 </span><span>플러스리뷰</span>
				<ul>
					<li><a href="#">- 나의 플러스리뷰</a></li>
				</ul>
			</li>
		</ul>	
		
	</div>
			
			
			
			
				
				
				
				
</body>
</html>