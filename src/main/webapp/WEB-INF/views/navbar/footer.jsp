<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/navbar/footer.css">
	
</head>
<body>
	
	<div class="footerHeadWrap">
	
		<div class="footListWrap">
			<div class="footList">
				<div class="footListCont">
					<h3>BRAND</h3>
					<ul>
						<li><a href="javascript:;">브랜드</a></li>
						<li><a href="javascript:;">일리커피이야기</a></li>
						<li><a href="javascript:;">뉴스 및 공지</a></li>
					    <li><a href="javascript:;">제휴안내</a></li>
						<li><a href="javascript:;">UDC</a></li>					
					</ul>
				</div>
				<div class="footListCont">
					<h3>CAFFE&amp;SHOP</h3>
					<ul>
						<li><a href="javascript:;">일리카페</a></li>
						<li><a href="javascript:;">일리샵</a></li>
						<li><a href="javascript:;">가맹안내</a></li>
						
					</ul>
				</div>
				<div class="footListCont">
					<h3>BTB사업</h3>
					<ul>
						<li><a href="javascript:;">BTB소개</a></li>
						<li><a href="javascript:;">공식대리점</a></li>	
					</ul>
				</div>
				<div class="footListCont">
					<h3>e-SHOP</h3>
					<ul>
						<li><a href="javascript:;">커피제품</a></li>
						<li><a href="javascript:;">캡슐머신</a></li>
						<li><a href="javascript:;">일리아트컬렉션</a></li>
						<li><a href="javascript:;">악세서리</a></li>
						<li><a href="javascript:;">리퍼비시</a></li>
						<li><a href="javascript:;">정품등록</a></lii>
					</ul>
				</div>
				<div class="footListCont">
					<h3>사이트안내</h3>
					<ul>
						<li><a href="javascript:;">1:1문의하기</a></li>
						<li><a href="javascript:;">FAQ</a></li>
						<li><a href="javascript:;">이용약관</a></li>
						<li><a href="javascript:;">개인정보처리방침</a></li>
					</ul>
				</div>
				<div class="footEtcCont">
					<div class="contact"><a href="javascript:;">CONTACT US</a></div>
					<div class="payments">
						<p>Payments :</p>
						<ul>
	<!-- 						<li><img src="/images/footer/payments-master.png"></li> -->
	<!-- 						<li><img src="/images/footer/payments-visa.png"></li> -->
	<!-- 						<li><img src="/images/footer/payments-americanexpress.png"></li> -->
							<li><img src="/images/footer/payments-kakao.png"></li>
							<li><img src="/images/footer/payments-npay.png"></li>
						</ul>
					</div>
					<div class="followus">
						<p>Follow us :</p>
						<ul>
							<li><a href="https://www.facebook.com/illykorea.official"><img class="facebookImg" src="/images/footer/follow-facebook.png"></a></li>
							<li><a href="https://www.instagram.com/illyinkorea/"><img class="instaImg" src="/images/footer/follow-insta.png"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div class="contentInfoWrap">
			<div class="contentInfo">
			
				<div class="country">
					<span><img src="/images/footer/ico_kr.png"></span>
					<span>KOREA</span>
				</div>
				
				<div class="company">
					<p>
						(주)큐로홀딩스<br>
						<span>대표자  | 조중기</span>
						<span>주소 | 서울특별시 강남구  테헤란로77길 7 (동원빌딩) </span><br>
						<span>고객센터 | 서울특별시 서초구 서초대로 117 (방배동,용전빌딩1층 101호)</span><br>
						<span>대표전화 | 1666-1282</span>
						<span>이메일 | service@illycaffe.co.kr </span><br>
	                    <span>통신판매업신고번호 : 2010-서울강남-00589</span>
	                    <span>사업자등록번호 : 129-81-19361 <a href="javascript:;">사업자번호조회</a></span>
					</p>
				</div>
				
				<div class="copyright">
					<p>
						<br>copyright (c) shop.illycaffe.co.kr all rights reserved.
						<br>© 2021 illycaffè S.p.A. | P.IVA 00055180327- Via Flavia 110, 34147 Trieste – Italy
					</p>
				</div>
				
			</div>
		</div>
	</div>

</body>
<!-- ===== ===== ===== jquery START ===== ===== ===== -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
		$('.contact').find('a').hover(
			function(){
				$(this).css('background', '#fff');
				$(this).css('color', '#333');
			}, function(){
				$(this).css('background', 'none');
				$(this).css('color', '#fff');
			}
		);
		$('.facebookImg').hover(
			function(){ $(this).attr('src', '/images/footer/follow-facebook-over.png'); }
			,function(){ $(this).attr('src', '/images/footer/follow-facebook.png'); }
		);
		$('.instaImg').hover(
			function(){ $(this).attr('src', '/images/footer/follow-insta-over.png'); }
			,function(){ $(this).attr('src', '/images/footer/follow-insta.png'); }
		);
	</script>
<!-- ===== ===== ===== jquery END ===== ===== ===== -->
</html>