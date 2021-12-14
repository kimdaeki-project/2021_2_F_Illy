<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/navbar/navbar.css">
	
<!-- include summernote css/js -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>
<body>

	<div class="gnbHeadWrap">
		
		<div class="gnbTop">
			
			<a class="tempBtn">illy CAFFE</a>
						
		</div>
		
		<div class="gnbBottom">
		
			<div class="logo">
				<a href="/"><img alt="" src="/images/gnb/logo50.jpg"></a>
			</div>
			
			<div class="menuWrap">
				<ul>
					<li class="menu">
						<a href="/admin/list?product_categoryCode=001">COFFEE</a>
						<ul class="hoverMenu">
							<li><a href="/admin/insertCoffee">상품등록</a></li>
							<br><li><a href="/admin/list?product_categoryCode=001">상품목록(수정/삭제)</a></li>
						</ul>
					</li>
					<li class="menu">
						<a href="/admin/list?product_categoryCode=002">MACHINE</a>
						<ul class="hoverMenu">
							<li><a href="/admin/insertMachine">상품등록</a></li>
							<br><li><a href="/admin/list?product_categoryCode=002">상품목록(수정/삭제)</a></li>
						</ul>
					</li>
					<li><a href="/admin/insertAccessories">ACCESSORIES</a></li>
				</ul>
			</div>
			
<!-- 			<div class="rightBox"> -->
<!-- 				<div class="searchWrap"> -->
<!-- 					<input type="text"> -->
<!-- 					<img class="searchImg" alt="" src="/images/gnb/new-search.png"> -->
<!-- 				</div> -->
<!-- 				<div class="memberWrap"> -->
<!-- 					<img class="userImg" alt="" src="/images/gnb/new-user.png"> -->
<!-- 					<img class="cartImg" alt="" src="/images/gnb/new-cart.png"> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
		</div>
		
	</div>

</body>
<!-- ===== ===== ===== jquery START ===== ===== ===== -->
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
	
	<script type="text/javascript">
		/* 우클릭 방지 */
		$("body").contextmenu(function() { return false; });
		
		$('.menu').hover(
			function(){
				let hoverMenu = $(this).find('.hoverMenu')
				if(!hoverMenu.is(':animated')) hoverMenu.slideDown('fast');
// 				hoverMenu.slideDown('fast');
			}
			,function(){
				let hoverMenu = $(this).find('.hoverMenu')
// 				if(!hoverMenu.is(':animated')) hoverMenu.slideUp('fast');
				hoverMenu.slideUp('fast');
			}
		)
	</script>
<!-- ===== ===== ===== jquery END ===== ===== ===== -->
</html>