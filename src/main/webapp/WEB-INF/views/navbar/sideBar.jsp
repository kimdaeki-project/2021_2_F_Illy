<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/sideBar.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="jquery.cookie.js"></script> -->

<meta charset="UTF-8">
<title>Insert title here</title>  
</head>
<body>

	<div id="scroll_right">
		<div class="right_quick_btn">
			<ul>
				<li class="right_quick_btn_open">
					<a id="right_quick_btn"><i class="xi-angle-left"></i></a>
				</li>
			</ul>
		</div>
		<div class="scroll_right_overflow">
			<div class="right_slideBanner">
				<div class="slider-wrap slider-banner slick-initialized slick-slider slick-dotted" role="toolbar">
					<div class="slick_list draggable" data-slide_content_cnt="3">
						<div class="slideContentR">
						 	<a href="#">
						 		<img alt="" src="/images/right_sideBar/3691b74e6afacbfe39ad92fc29c8b124_62308.jpg">
						 	</a>
						</div>
						<div class="slideContentR">
						 	<a href="#">
						 		<img alt="" src="/images/right_sideBar/27a3a381b3f5a7ea08d8c8e3b17ea3eb_57343.jpg">
						 	</a>
						</div>
						<div class="slideContentR">
						 	<a href="#">
						 		<img alt="" src="/images/right_sideBar/dc49231efec2d60e072ca89f6a525f47_60621.jpg">
						 	</a>
						</div>
						<div class="slideContentR">
						 	<a href="https://www.instagram.com/illyinkorea/" target="_blank">
						 		<img alt="" src="/images/right_sideBar/3691b74e6afacbfe39ad92fc29c8b124_62308.jpg">
						 	</a>
						</div>
						<div class="slideContentR">
						 	<a href="#">
						 		<img alt="" src="/images/right_sideBar/27a3a381b3f5a7ea08d8c8e3b17ea3eb_57343.jpg">
						 	</a>
						</div>
					</div>
					<div class="testBtns slick-dots">
						<ul>
							<li>
								<button type="button" class="testBtn" data-index="1" ></button>					
							</li>
							<li>
								<button type="button" class="testBtn" data-index="2" ></button>					
							</li>
							<li>
								<button type="button" class="testBtn" data-index="3" ></button>					
							</li>
						</ul>
					</div>
					
				</div>
				<div class="right_banner"></div>
				<div class="right_link2">
					<ul>
						<li>
							<a href="#">
								<i class="xi-heart"></i>
								<span>WISH LIST</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="xi-cart"></i>
								<span>CART</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="xi-truck"></i>
								<span>ORDER</span>
							</a>
						</li>
					</ul>
				</div>
				<div class="right_link">
					<ul>
						<li>
							<a href="/notice/list">
								<i class="xi-volume-down"></i>
								<span>공지사항</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="xi-message"></i>
								<span>FAQ</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="xi-pen"></i>
								<span>1:1 문의</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="xi-key"></i>
								<span>정품등록</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="xi-camera"></i>
								<span>상품후기</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="xi-user"></i>
								<span>내 정보</span>
							</a>
						</li>
					</ul>
				</div>
				<div class="scroll_right_cont">
					<h4>
					TODAY VIEW
					<br>
					<i class="xi-caret-down-min"></i>
					</h4>				
				</div>
				<span class="btn_scroll_top">
					<a href="#TOP">
						<img src="/images/right_sideBar/btn_scroll_top.png">
					</a>
				</span>
			</div>
		

		</div>
	
	
	
	
	
	</div>




	<script type="text/javascript">
	
	$(function(){
		var sideBar = '${cookie.sideBar.value}';

	    if(sideBar=="on"){
			$("#scroll_right").css('right','0px');
			$("#scroll_right").css('transition','none');
			$(".xi-angle-left").attr('class','xi-angle-right');
	    }else{
			$("#scroll_right").css('right','-187px');
			$(".xi-angle-right").attr('class','xi-angle-left');
	    }
   
	    $("#right_quick_btn").click(function(){
	    	
	    	if(sideBar != "on"){
	    		//열어 주는것
				$("#scroll_right").css('right','0px');
				$(".xi-angle-left").attr('class','xi-angle-right');
				$.get("/sideBar?sideBar=on",function(){
					sideBar="on";
				});
			}else{
				$("#scroll_right").css('right','-187px');
				$(".xi-angle-right").attr('class','xi-angle-left');
				console.log("off")
				$.get("/sideBar",function(){
					sideBar="off";
				});
			}
	    })
	    
	})
	
<!-- 여기부터 -->
		let slick_list = $('.slick_list');
		let slideContentR = $('.slideContentR')
		
		sideInterval = setInterval(function(){slide(slick_list, slideContentR, 1300);}, 3300);

		$('.testBtn').click(function(){
			if(slick_list.hasClass('slideActive')) { return; }

			clearInterval (sideInterval);
			sideInterval = setInterval(function(){slide(slick_list, slideContentR, 1300);}, 3300);
			
			slide(slick_list, slideContentR, 1300, $(this));
		});
<!-- 여기까지 -->
	</script>
</body>
</html>