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
		tbody tr td{font-weight:normal; font-size:12px; color:#333;}
		.board_search_box{margin: 60px 0 30px 0;padding: 10px 10px 10px 10px;border-top: 1px solid #e8e8e8;border-bottom: 1px solid #e8e8e8; background: #f7f7f7; text-align: center;}
		#kind{width:90px; height:31px;  vertical-align:top; text-align:left; font-size:13px; border-color:#ccc; padding-left:3px; color:#717171; }
		.text{width:162px; height:31px;  vertical-align:top; text-align:left; font-size:13px; border:1px solid #ccc; padding:0 10px;   }
		.btn_board_search{border:none; margin: 0 0 0 5px;padding: 0 20px 0 20px;color: #fff; border-radius: 21px;background: #d12420;line-height: 30px; cursor:pointer; }
		.pagination .btnPage{min-width:26px; background-color:#fff;border:1px solid #e0e0e0;cursor:pointer;color:#888; font-size:11px; padding: 6px 4px 10px 4px; }
		.pageNum{cursor:pointer; display:inline-block;  font-size:11px; color:#888; height:30px; width:30px; line-height:30px; vertical-align:middle;  }	
		.pageNum.on{font-weight:bold; color:#fff; background-color:#7a7d81; border-radius:20px; }
		.pagination{text-align:center; margin-top:60px;  cursor:pointer;  }
		.emptyList{width:100%; text-align:center;position:relative; border-bottom:1px solid #ccc; padding:13px 10px 15px; font-size:12px; color:#333; margin:-20px 0 100px;  }
		#addNotice{float:right; margin:-30px 0 10px; }
		#addNotice a{padding:7px 7px; font-size:12px; background-color:#979797; border:none; color:#fff; cursor:pointer;  }
		#addNotice a:hover{background-color:#aaa;}	
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
					
					<div id="addNotice">
						<a href="/admin/board/insertNotice">공지사항 추가하기</a>			
					</div>
					
					
					<div class="board_zone_cont">
						<table class="board_list_table" style="width:100%;">
							<colgroup> <!-- table 간격 기본설정 -->
								<col width="6%">
								<col width="40%">
								<col width="15%">
								<col width="7%">
								<col width="10%">
								<col width="5%">								
							</colgroup>
							<thead>
								<tr>
									<th>번호</th><th>제목</th><th>날짜</th><th>작성자</th><th>조회</th><th style="color:#d12140">삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ListTop}" var="noticeVO">
								<tr class="noticeEx" data-notice_id="${noticeVO.notice_id}">
									<td scope="row"><img src="/images/board/icon_board_notice.png"></td>
									<td scope="row" style="text-align:left;">
										<a href="./adNoticeSelect?notice_id=${noticeVO.notice_id}">
											[${noticeVO.notice_type}] ${noticeVO.notice_title}&nbsp;
										</a>
									</td>
									<td scope="row">${noticeVO.notice_regDate}</td>
									<td scope="row">관리자</td>
									<td scope="row">${noticeVO.notice_hits}</td>
									<td><a class="deleteBtn" href="#"><i class="xi-close-square-o xi-x"></i></a></td>
								</tr>
								</c:forEach>
							</tbody>
								
							<tbody>
								<c:forEach items="${List}" var="noticeVO">		
								<tr class="noticeEx" data-notice_id="${noticeVO.notice_id}">													
									<td scope="row">${noticeVO.notice_id}</td>								
									<td scope="row" style="text-align:left;">
										<a href="./adNoticeSelect?notice_id=${noticeVO.notice_id}">
											[${noticeVO.notice_type}] ${noticeVO.notice_title}&nbsp;
											<c:if test="${noticeVO.notice_hits > 100}">
												<img src="/images/board/icon_board_hot.png">
											</c:if>
										</a>
									</td>
									<td scope="row">${noticeVO.notice_regDate}</td>
									<td scope="row">관리자</td>
									<td scope="row">${noticeVO.notice_hits}</td>
									<td><a class="deleteBtn"><i class="xi-close-square-o xi-x"></i></a></td>									
								</tr>
								</c:forEach>
							</tbody>
						</table>
							<c:if test="${empty List}">
								<div class="emptyList"><span>게시글이 존재하지 않습니다.</span></div>
							</c:if>
						
						
						<div class="pagination">
							<c:if test="${pager.curBlock>1}">
								<button type="button" data-list-pn="${pager.curBlock=1}"  class="btnPage pageBtn">&#9001;&#9001; 맨앞</button>
								<button type="button" data-list-pn="${pager.startNum-1}" style="margin-right:10px;" class="btnPage pageBtn">&#9001; 이전</button>
							</c:if>
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
								<c:if test="${pager.startNum ne null}">
									<span class="pageNum pageBtn" data-list-pn="${i}">${i}</span>
								</c:if>
							</c:forEach>
							<c:if test="${!pager.lastCheck}">
								<button type="button" data-list-pn="${pager.lastNum+1}" style="margin-left:10px;" class="btnPage pageBtn">다음 &#9002;</button>
								<button type="button" data-list-pn="${pager.totalPage}"  class="btnPage pageBtn">맨뒤 &#9002;&#9002;</button>
							</c:if>
						</div>
			
			
			
						<div class="board_search_box">
							<form id="frmList" action="./adNoticeList">
								<input type="hidden" name="pn" value="1" id="pn">
								<select id="kind" name="kind">
									<option class="search_kind" value="notice_title">제목</option>
									<option class="search_kind" value="notice_contents">내용</option>
								</select>	
								<input type="text" class="text" name="search" id="search">
								<button type="submit" class="btn_board_search">검색</button>
							</form>
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