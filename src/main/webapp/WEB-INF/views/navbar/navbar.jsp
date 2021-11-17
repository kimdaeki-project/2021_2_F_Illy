<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/navbar.css">

</head>
<body>

	<div class="gnbHeadWrap">
		
		<div class="gnbTop">	
				
			<div class="slideWrap">
			
				<span class="slideBtn prev">◀</span>
			
				<div class="slideTrack" data-slide_content_cnt="4">
					<c:forEach begin="0" end="3" varStatus="i">
						<div class="slideContent">
							<a href="javascript:;">Slider Content Index : ${i.count}</a>
						</div>
					</c:forEach>
					<c:forEach begin="0" end="1" varStatus="i">
						<div class="slideContent">
							<a href="javascript:;">Slider Content Index : ${i.count}</a>
						</div>
					</c:forEach>
				</div>
				
				<span class="slideBtn next">▶</span>
				
			</div>
			
			<a class="tempBtn">illy CAFFE</a>
						
		</div>
		
		<div class="gnbBottom">
		
			<div class="logo">
				<img alt="" src="/images/gnb/logo50.jpg">
			</div>
			
			<div class="menuWrap">
				<ul>
					<li><a href="javascript:;">ALL PRODUCT</a></li>
					<li><a href="javascript:;">COFFEE</a></li>
					<li><a href="javascript:;">MACHINES</a></li>
					<li><a href="javascript:;">ILLY ART COLLECTION</a></li>
					<li><a href="javascript:;">ACCESSORIES</a></li>
					<li><a href="javascript:;">SPECIALLY CURATED SET</a></li>
				</ul>
			</div>
			
			<div class="rightBox">
				<div class="searchWrap">
					<input type="text">
					<img class="searchImg" alt="" src="/images/gnb/new-search.png">
				</div>
				<div class="memberWrap">
					<img class="userImg" alt="" src="/images/gnb/new-user.png">
					<img class="cartImg" alt="" src="/images/gnb/new-cart.png">
				</div>
			</div>
			
		</div>
		
	</div>

</body>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
		$().ready(function(){
		})
	</script>
	
	<script type="text/javascript">
		let slideTrack = $('.slideTrack');
		let slide_content_cnt = slideTrack.data('slide_content_cnt');
		let width = $('.slideContent').width();
		let slideCheck = true;
		
		$('.slideBtn').click(function(){
			clearInterval(intervalStarter);
			intervalStarter = setInterval(slideInterval, 3300);
			let translateX = Number(slideTrack.css('transform').split(',')[4]);
			if (slideCheck && translateX % width == 0){
				slideCheck = false;
				
				if ($(this).hasClass('next')) {
					translateX -= width;
				} else {
					translateX += width;					
				}
				slideTrack.css('transition', 'transform 1300ms ease 0s');
				slideTrack.css('transform', 'translateX('+translateX+'px)')	
				
				oneRound(translateX);
			}
			
		});
		
		function oneRound(translateX){
			
			if (translateX > -width) { translateX = -width * slide_content_cnt; }
			else if (translateX < -width * slide_content_cnt) { translateX = -width; }
			
			setTimeout(function(){
				slideTrack.css( 'transition', '' );
				slideTrack.css('transform', 'translateX('+translateX+'px)')
				slideCheck = true
			}, 1300);
		}

		
		slideInterval = function(){
			let translateX = Number(slideTrack.css('transform').split(',')[4]);			
			if (slideCheck && translateX % width == 0){
				
				translateX -= width;
				slideTrack.css('transition', 'transform 1300ms ease 0s');
				slideTrack.css('transform', 'translateX('+translateX+'px)')
				
				oneRound(translateX);
			}
		}
		intervalStarter = setInterval(slideInterval, 3300);
	</script>
	
	<script type="text/javascript">
		$('.searchImg').hover(
			function(){
				$(this).attr('src', '/images/gnb/new-search-hover.png');
			}, function(){
				$(this).attr('src', '/images/gnb/new-search.png');
			}
		);
		$('.userImg').hover(
				function(){
					$(this).attr('src', '/images/gnb/new-user-hover.png');
				}, function(){
					$(this).attr('src', '/images/gnb/new-user.png');
				}
			);
		$('.cartImg').hover(
				function(){
					$(this).attr('src', '/images/gnb/new-cart-hover.png');
				}, function(){
					$(this).attr('src', '/images/gnb/new-cart.png');
				}
			);
	</script>

</html>