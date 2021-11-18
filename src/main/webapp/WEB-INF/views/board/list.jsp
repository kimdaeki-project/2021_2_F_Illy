<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<style type="text/css">
		.right_content{float:left; width:960px; padding-left:40px; }
		.board_zone_tit{margin-bottom:10px; padding-bottom:10px;}
		.board_zone_tit h2{color:#d12420; font-size:24px;}
		.board_list_table{width:100%;margin:0 0 20px 0;border:0;border-spacing:0;border-collapse:collapse;border-top:1px solid #999999;text-align:center;}
		.board_list_table th{padding:10px 10px 10px 14px; font-size:12px; border-bottom:1px solid #dbdbdb; background:#fbfbfb;}
		.board_list_table td{padding:13px 10px 15px 10px; border-bottom:1px solid #dbdbdb;}
	</style>

<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>		
		<div id="container">
				
			<div id="contents">
			
			<c:import url="/WEB-INF/views/navbar/noticeLeftMenu.jsp"></c:import>		
			<!-- right content work start -->	
			<div class="right_content">
				<div class="board_zone_sec">
					<div class="board_zone_tit">
						<h2>공지사항</h2>
					</div>
					<div class="board_zone_cont">
						<table class="board_list_table" style="width:100%;">
							<thead>
								<tr>
									<th>번호</th><th>제목</th><th>날짜</th><th>작성자</th><th>조회</th>
								</tr>
							</thead>
							<tbody>
								<tr></tr>
							</tbody>
						</table>
						<div class="pagination"></div>
						<div class="board_search_box"></div>
					</div>	
				
				</div>
			</div>	
			<!-- right content work end  -->	
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
	
	
	
	
	<script type="text/javascript">
	

	</script>
	
	
	
	
	
</body>
</html>