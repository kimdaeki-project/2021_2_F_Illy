<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<div class="slider-wrap slider-banner-759793874 slick-initialized slick-slider slick-dotted" role="toolbar">
					<div class="slick-list draggable">
					<!-- 슬라이더 작업 일단 보류  -->
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
							<a href="#">
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
						<img src="./images/right_sideBar/btn_scroll_top.png">
					</a>
				</span>
			</div>
		</div>
	
	
	
	
	
	</div>




	<script type="text/javascript">
	
	$("#right_quick_btn").click(function(){
		if(	$("#scroll_right").css('right')=='0px'){
			$("#scroll_right").css('right','-187px');
			$(".xi-angle-right").attr('class','xi-angle-left');
		}else{
			$("#scroll_right").css('right','0');
			$(".xi-angle-left").attr('class','xi-angle-right');
		}
	});
	
	
	
	</script>

</body>
</html>