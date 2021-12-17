<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/admin/insertBoard.css">
	
   
	<style type="text/css">
		.right_content{width:1000px;float:left;padding-left:40px;}
		.board_zone_tit{margin-bottom:10px; padding-bottom:10px;}
		.board_zone_tit h2{color:#d12420; font-size:24px;}
		.board_list_table{width:100%;margin:0 0 20px 0;border-spacing:0;border-collapse:collapse;border-top:1px solid #999999;text-align:center;}
		.board_list_table th{padding:10px 10px 10px 14px; font-size:12px;background:#fbfbfb;}
		.board_list_table td{padding:13px 10px 15px 10px; border-bottom:1px solid #dbdbdb;}
		.noticeEx{text-align:left; }
		tbody tr td{font-weight:normal; font-size:12px; color:#333;}
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
		<c:import url="/WEB-INF/views/admin/adNavbar.jsp"></c:import>
		<div id="container" style="padding-bottom: 155px; margin-bottom: -155px;">
			<div id="contents">
				<div class="left_cont">
					<c:import url="/WEB-INF/views/admin/adLeftMenu.jsp"></c:import>		
				</div>
	
				<div class="right_content">
	
				<div class="board_zone_sec">
					<div class="board_zone_tit">
						<h2 style="border:none;margin-bottom:-10px; color:#333;">공지사항</h2>
					</div>
					
					<!-- 관리자만 보이는 버튼  -->
					<div id="updateNotice">
						<a href="/admin/board/deleteNotice2?notice_id=${noticeVO.notice_id}" onclick="return confirm('게시글을 삭제하시겠습니까?');">삭제</a>
						<a href="/admin/board/updateNotice?notice_id=${noticeVO.notice_id}">수정</a>			
					</div>
					<!-- 관리자만 보이는 버튼  -->
					
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
							<a href="/admin/board/adNoticeList">목록</a>
						</div>
			
					</div>	
				
				</div>
			</div>	
				
			<!-- right content work end  -->	
		
				
			</div>	
			
		</div>
		<c:import url="/WEB-INF/views/admin/adFooter.jsp"></c:import>
	</div>
	
	
	
	
	<script type="text/javascript">

	let kind='${pager.kind}';
	let search='${pager.search}';
	let pn =${pager.pn};		
	//------ 검색하던 중이던 내용 계속 유지 시키기(페이지 넘겨도)
	$(".search_kind").each(function(){
		if($(this).val()==kind){
			$(this).prop("selected",true);
		}
	});
	$("#search").val(search);
	
	//-------페이지가 업로드 되었을때 해당되는 페이지 번호에  색상을 주는 class 생성 되어 있기 
	$('.pageBtn').each(function() {
		 if($(this).attr("data-list-pn")!=pn){
		 	 $(this).removeClass("on");
		 }else{
			 $(this).addClass("on");
		 }
	});
	 
	
	
	//-------원하는 페이지 버튼을 눌렀을때 실행되는 함수들 
	$(".pageBtn").click(function(){
		const num=$(this).attr("data-list-pn");
		$("#pn").val(num);
		$("#search").val(search);
		console.log(search);
		$("#kind").val(kind);
		$("#frmList").submit();	
	});

	/*-- 게시판 삭제 --*/
	
	$(".deleteBtn").hover(  //삭제 버튼에 마우스 올렸을때 디자인
		function(){ 
			$(this).children().removeClass("xi-close-square-o"); 
			$(this).children().addClass("xi-close-square"); 
		}
	);
	$(".deleteBtn").mouseout(	//삭제 버튼에서 마우스 내렸을때 디자인 
		function(){ 
			$(this).children().removeClass("xi-close-square"); 
			$(this).children().addClass("xi-close-square-o"); 
		} 	
	);
	
	$(".deleteBtn").click(function(){
		var notice_id=$(this).parents(".noticeEx").data("notice_id");
		if(confirm(notice_id+"번 글을 정말 삭제 하시겠습니까?")==true){
			$.ajax({
				url:'./deleteNotice',
				type:'get',
				data:{notice_id:notice_id},
				success:function(data){
					location.href="./adNoticeList";
				}
			});
		}else{
			return false;
		}
		
		
	});
	
	
</script>
	

	
</body>
</html>