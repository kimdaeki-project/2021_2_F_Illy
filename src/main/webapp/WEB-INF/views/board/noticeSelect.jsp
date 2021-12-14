<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" href="/css/common.css">
	<style type="text/css">
		.right_content{float:left; width:960px; padding-left:60px; }
		.board_zone_tit{margin-bottom:10px; padding-bottom:10px;}
		.board_zone_tit h2{color:#d12420; font-size:24px;}
		.board_list_table{width:100%;margin:0 0 20px 0;border:0;border-spacing:0;border-collapse:collapse;border-top:1px solid #999999;text-align:center;}
		.board_list_table th{padding:10px 10px 10px 14px; font-size:12px; border-bottom:1px solid #dbdbdb; background:#fbfbfb;}
		.board_list_table td{padding:13px 10px 15px 15px; border-bottom:1px solid #dbdbdb;}
		tbody tr td{font-weight:normal; font-size:12px; color:#333; text-align:left; }
		#updateNotice{float:right; margin:-30px 0 10px; }
		#updateNotice a{padding:7px 7px; font-size:12px; background-color:#979797; border:none; color:#fff; cursor:pointer;  }
		.goList{float:right; width:50px; height:28px; padding:0 10px; line-height:26px;border:1px solid #a3a3a3; }
		.goList a{text-align:center;color:#666; }
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
							<tbody>
								<tr class="noticeEx">
									<td scope="row" style="background-color:#F7F7F7; font-weight:bold; font-size:14px; padding:15px; color:#333;" >
										<strong>[${noticeVO.notice_type}]${noticeVO.notice_title}</strong>
									</td>
								</tr>
								<tr class="noticeEx">
									<td scope="row">
										<strong style="font-size:12px;">관리자</strong> 
										<span style="font-size:11px; margin-left:5px;">| &nbsp;${noticeVO.notice_regDate}</span>
										<span style="float:right; font-size:12px; ">조회수 ${noticeVO.notice_hits}</span>
									</td>
								</tr>
								<tr class="noticeEx">
									<td scope="row">
										<strong style="font-size:12px;">첨부파일</strong> 
										<span style="font-size:11px; margin-left:5px;">|&nbsp;</span>
										<c:forEach var="fileList" items="${noticeVO.fileList}">
											 <i class="xi-paperclip xi-flip-horizontal"></i>
											 <a href="/notice/fileDown?noticeFile_id=${fileList.noticeFile_id}" style="text-decoration: underline;">${fileList.noticeFile_oriName}</a>
											 <span>&nbsp;&nbsp;&nbsp;</span>
										</c:forEach>
									</td>
								</tr>
								<tr class="noticeEx">
									<td scope="row" >
										<div style="min-height:350px; padding-top:20px; padding-bottom:20px; ">
											${noticeVO.notice_contents}
										</div>	
									</td>
								</tr>
							
							</tbody>
						
						</table>
							
						<div class="goList">
							<a href="/notice/list">목록</a>
						</div>
			
					</div>	
				
				</div>
			</div>	
			<!-- right content work end  -->	
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>	
	
	
	
	
</body>
</html>