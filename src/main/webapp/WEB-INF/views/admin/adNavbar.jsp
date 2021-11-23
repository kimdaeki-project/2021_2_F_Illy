<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/navbar/navbar.css">

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
<!-- 					<li><a href="/product/list">ALL PRODUCT</a></li> -->
					<li><a href="/admin/insertCoffee">COFFEE</a></li>
					<li><a href="/admin/insertMachines">MACHINES</a></li>
<!-- 					<li><a href="javascript:;">ILLY ART COLLECTION</a></li> -->
					<li><a href="/admin/insertAccessories">ACCESSORIES</a></li>
<!-- 					<li><a href="javascript:;">SPECIALLY CURATED SET</a></li> -->
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
	</script>
<!-- ===== ===== ===== jquery END ===== ===== ===== -->
</html>