<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<style type="text/css">
		#right_content{width:1000px;float:left;padding-left:40px;}
		.board_zone_tit h2{font-size:24px; color:#333333;padding-bottom:10px; margin-bottom:10px;   }
		.board_zone_list{position:relative; }
		.board_list_table{width:100%;margin:0 0 20px 0;border:0;border-spacing:0;border-collapse:collapse;border-top:0.5px solid #999999;text-align:left;}
		.board_list_table th{padding:10px 10px 10px 14px; font-size:12px; border-bottom:1px solid #dbdbdb; background:#fbfbfb;}
		.board_list_table td{padding:13px 10px 15px 10px; border-bottom:1px solid #dbdbdb; }
		.board_list_table thead tr td{padding:15px; border-top:1px solid #999;border-bottom:1px solig #dbdbdb; background-color:#f7f7f7;color:#111; font-size:14px; font-weight:bold;}
		.board_list_table tbody tr:first-child{padding:10px 15px; border-bottom:1px solid #dbdbdb;font-weight:bold;font-size:12px; color:#333; line-height:1.5; }
		.board_list_table tbody tr:first-child span{margin-right:5px;}
		.board_list_table tbody tr.con{width:100%; position:relative;}
		.con td .view_q{position:absolute; top:30px; left:20px; color:#333; font-size:24px; }
		.qna_contents{min-height:350px; padding:23px 15px 0 50px; display:block; line-height:1.8;}
		.qnaBtn{height:28px; line-height:26px; margin-left:5px; padding:0 12px; color:#666; border:1px solid #a3a3a3; text-align:center; float:right;background-color:#fff; cursor:pointer;font-size:12px; font-weight:bold; }
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
							
								 	<table class="board_list_table" style="width:100%;">
										
										<thead>
											<tr>
												<td>[${qnaVO.qna_type}] ${qnaVO.qna_title}</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<span class="member_id">${member.username}</span> <span>| &nbsp;${qnaVO.qna_regDate}</span>
												</td>
											</tr>
											<tr class="con">
												<td>
													<strong class="view_q">Q.</strong>
													<div class="qna_contents">${qnaVO.qna_contents}</div>
												</td>
											</tr>
										</tbody>
									</table>
									<c:if test="${qnaVO.qna_state=='접수'}">
										<button class="goback qnaBtn" onclick="location.href='./qnaList'">목록</button>
										<button class="goback qnaBtn" onclick="location.href='./qnaUpdate?qna_id='+${qnaVO.qna_id}">수정</button>
										<button class="goback qnaBtn" onclick="location.href='./qnaDelete?qna_id='+${qnaVO.qna_id}">삭제</button>	
									</c:if>
						</div>
			
				
					</div>
				
				</div>
				<!--right_content END-->
			</div>	
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>


	<script type="text/javascript">
	
	$(function(){
		const member_id=$(".member_id").text();
		$(".member_id").html(member_id.replace(member_id.slice(-3,member_id.length),'***'));
	});
	
	
	
	
	
	</script>





</body>
</html>