<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/member/myPage/myPageCommon.css">
	<link rel="stylesheet" href="/css/member/myPage/myPageOrder.css">
	<link rel="stylesheet" href="/css/review/myReviewList.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<style type="text/css"></style>
<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>	
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>	
		<div id="container">
							
			<div id="contents">
			<c:import url="/WEB-INF/views/navbar/myPageLeftBar.jsp"></c:import>	
				<div id="right_content">
					<div class="board_zone_tit">
						<h2>상품후기</h2>
						<input type="hidden" id="memberID" value="${member.member_id}">
					</div>
					<div class="changetab">
						<a class="tab yet select" href="#"><h2>작성 가능한 후기</h2></a>
						<a class="tab finish" style="left:200px;" href="#"><h2>작성한 후기</h2></a>
					</div>
					
					<div class="myPage_lately_info_cont">
								
					</div><!-- myPage_lately_info_cont end --> <!-- list 출력 -->
				
				
				</div>
				<!--right_content END-->
			</div>	
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>



	<script type="text/javascript" src="/js/review/myReviewList.js"></script>





</body>
</html>


