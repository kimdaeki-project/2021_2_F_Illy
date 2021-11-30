<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<style type="text/css">
		#right_content{width:1000px;float:left;padding-left:40px;}
		.board_zone_tit h2{font-size:24px; color:#333333;padding-bottom:10px; margin-bottom:10px;   }
		.board_zone_list{position:relative; }
		.write_qna{width:91px; cursor:pointer;color:#fff; font-size:12px; background-color:#979797;border:none; height:31px; position:absolute; display:inline-block;  top:-42px; right:0px; padding:0 10px; line-height:33px;  }
		.board_zone_list .search_box{width:960px; height:77px; padding:20px 20px 20px 30px; border:3px solid #eeeeee; margin-bottom:35px; }
		.board_zone_list .search_box h3{float:left; padding:6px 15px 0 0 ; color:#777777; font-size:13px; }
		.board_zone_list .search_box .pick_date{float:left; width:54px; height:31px; margin-left:-1px; color:#777; font-size:12px; border:1px solid #d6d6d6;background-color:#fff; }
		.board_zone_list .search_box .pick_date:hover{background-color:#aeaeae; color:#fff; }
	</style>
	

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
						<h2>1:1문의</h2>
					</div>
					<div class="board_zone_cont">
						<div class="board_zone_list">
								<button type="button" class="write_qna"><strong>1:1 문의하기</strong></button>
							<div class="search_box">
								<h3>조회기간</h3>
								<button type="button" class="pick_date">오늘</button>
								<button type="button" class="pick_date">7일</button>
								<button type="button" class="pick_date">15일</button>
								<button type="button" class="pick_date">1개월</button>
								<button type="button" class="pick_date">3개월</button>
								<button type="button" class="pick_date">1년</button>
								<input type="text">
								<span>~</span>
								<input type="text">
								<button type="button" class="search">조회</button>
							</div>
							<div class="list_zone">
							
							</div>
						
						</div>
			
			
			
			
			
					
				
				
				
				
					</div>
				
				
				
				
				</div>
				<!--right_content END-->
			</div>	
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
</body>
</html>