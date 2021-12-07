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
						 	<a href="https://www.instagram.com/illyinkorea/" target="_blank">
						 		<img class="slideImg" alt="" src="/images/right_sideBar/3691b74e6afacbfe39ad92fc29c8b124_62308.jpg">
						 	</a>
						</div>
						<div class="slideContentR">
						 	<a href="#">
						 		<img class="slideImg" alt="" src="/images/right_sideBar/27a3a381b3f5a7ea08d8c8e3b17ea3eb_57343.jpg">
						 	</a>
						</div>
						<div class="slideContentR">
						 	<a href="#">
						 		<img class="slideImg" alt="" src="/images/right_sideBar/dc49231efec2d60e072ca89f6a525f47_60621.jpg">
						 	</a>
						</div>
						<div class="slideContentR">
						 	<a href="https://www.instagram.com/illyinkorea/" target="_blank">
						 		<img class="slideImg"  alt="" src="/images/right_sideBar/3691b74e6afacbfe39ad92fc29c8b124_62308.jpg">
						 	</a>
						</div>
						<div class="slideContentR">
						 	<a href="#">
						 		<img class="slideImg" alt="" src="/images/right_sideBar/27a3a381b3f5a7ea08d8c8e3b17ea3eb_57343.jpg">
						 	</a>
						</div>
					</div>
					<div class="testBtns" >
						<ul class="slick_dots" data-slide_content_cnt="3">
							<li class="dot_li">
								<button type="button"  class="rightSlideBtn active" data-index="1" ></button>					
							</li>
							<li class="dot_li">
								<button type="button"  class="rightSlideBtn" data-index="2" ></button>					
							</li>
							<li class="dot_li">
								<button type="button"  class="rightSlideBtn" data-index="3" ></button>					
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
							<a href="/cart/normalBasket">
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
							<a href="/notice/faqList">
								<i class="xi-message"></i>
								<span>FAQ</span>
							</a>
						</li>
						<li>
							<a href="/member/qnaList">
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
							<a href="/review/reviewAll">
								<i class="xi-camera"></i>
								<span>상품후기</span>
							</a>
						</li>
						<li>
							<a href="/member/myPage">
								<i class="xi-user"></i>
								<span>내 정보</span>
							</a>
						</li>
					</ul>
				</div>
				<div class="scroll_right_cont">
					<h4 style="font-size:12px; ">
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
		let slideContentR = $('.slideContentR');
		let rightSlideBtn = $('.rightSlideBtn');
		
		//슬라이드 이미지의 가로값 선언
		let imgDiv=slideContentR.width();
		
		//슬라이드 내부 인자로 사용될 함수 선언 	
		function slideDef(){
			let transX = slide(slick_list, slideContentR, 1300);
			//슬라이드 버튼 반복문
			$(rightSlideBtn).each(function(){
				//버튼의 css 색상 정의 클래스 지워주기
				$(this).removeClass('active');
				//지금 보여주고 있는 이미지의 width값으로 순서를 알아내어 짝꿍 버튼의 css 색상 정의 클래스 생성해주기
				if(transX == -imgDiv * $(this).data('index')) {
					$(this).addClass('active');					
				}
			});
		}
		
		//페이지 업로드시 슬라이드 자동 실행 
		sideInterval = setInterval(function(){slideDef();}, 3300);
		
		//슬라이드의 dot 버튼 눌렀을때 실행되는 함수
		rightSlideBtn.click(function(){
			//슬라이드가 돌아가고 있다면 버튼을 눌러도 움직이지 마라 
			if(slick_list.hasClass('slideActive')) { return; }
			//해당하는 버튼의 색상만 변경되도록 클래스 정의해주는 반복문
			$(rightSlideBtn).each(function(){
				$(this).removeClass('active');
			}); $(this).addClass('active');
			
			//돌아가고 있던 슬라이드 해제 해주기 
			clearInterval (sideInterval);
			//원하는 버튼이 눌린 위치부터 다시 슬라이드 생성해주기 
			sideInterval = setInterval(function(){slideDef();}, 3300);
			slide(slick_list, slideContentR, 1300, $(this));
		});
<!-- 여기까지 -->
	</script>
</body>
</html>