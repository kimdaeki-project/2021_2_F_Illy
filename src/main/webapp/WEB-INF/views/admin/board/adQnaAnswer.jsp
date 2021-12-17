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
	<!-- include summernote css/js -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
   
	<style type="text/css">
		#right_content{width:1000px;float:left;padding-left:40px;}
		.board_zone_tit{margin-bottom:10px; padding-bottom:10px;}
		.board_zone_tit h2{color:#333; font-size:24px; border:none;padding:0;}
		.board_list_table{width:100%;margin:0 0 20px 0;border-spacing:0;border-collapse:collapse;text-align:center;}
		.board_list_table th{padding:10px 10px 10px 14px;  vertical-align: top;font-size:12px;background:#fbfbfb;  text-align:left;}
		.board_list_table td{padding:13px 10px 15px 10px; border-bottom:1px solid #dbdbdb;  text-align:left;}
		thead tr td{font-weight:bold;}
		tbody tr td{font-weight:normal; font-size:12px; color:#333; text-align:left;}
		.board_list_table tbody tr.con{width:100%; position:relative;}
		.con td{position:relative;}
		.con td .view_q{position:absolute; top:30px; left:20px; color:#333; font-size:24px; }
		.qna_contents{height:100%;padding:23px 15px 23px 50px; display:block; line-height:1.8;}
		.qnaBtn{height:28px; line-height:26px; margin-left:5px; padding:0 12px; color:#666; border:1px solid #a3a3a3; text-align:center; float:right;background-color:#fff; cursor:pointer;font-size:12px; font-weight:bold; }
		.prd_title{display:inline-block;vertical-align:top; font-size:13px; font-weight:bold; color:#333; }
		.prd_info{display:inline-block;position:absolute; margin-left:20px; }
		.prd_info span{display:block; font-size:13px; color:#333; margin-bottom:5px; }
		.pickPrd{border-bottom:1px solig #dbdbdb;}
		.btn_wrap{position:relative; text-align:center; margin-top:30px;  }
		.boardBtn{display:inline-block; font-weight:bold;  background-color:#fff; width:100px; height:42px; padding:0 5px; color:#3e3d3c; font-size:14px; border:1px solid #ccc; text-align:center; cursor:pointer; }
		.boardBtn.upload{ background-color:#000; color:#fff; min-width:90px; padding:0 10px;  border-color:1px solid #000; margin-left:6px; }
		.prevAnswer{margin-left:8px;}
	</style>
	
<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/admin/adNavbar.jsp"></c:import>
		<div id="container" style="padding-bottom: 155px; margin-bottom:-155px;">
			<div id="contents">
				<div class="left_cont">
					<c:import url="/WEB-INF/views/admin/adLeftMenu.jsp"></c:import>		
				</div>
				<div id="right_content">
					<div class="board_zone_tit">
						<h2>고객 문의</h2>
					</div>
					<form action="./adQnaAnswer" id="qnaAdFrm" method="post" enctype="multipart/form-data">
					<div class="board_zone_cont">
						<div class="board_zone_list">
								 	<table class="board_list_table" style="width:100%;">
										<colgroup>
											<col style="width:143px">
											<col style="width:808px">
										</colgroup>
										<thead>
											<tr>
												<th>문의 제목</th>
												<td>[${qnaVO.qna_type}] ${qnaVO.qna_title}</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>고객정보</th>
												<td>
													<span class="member_id">${username.username} (<strong>${member.member_name}</strong> 님) &nbsp;|&nbsp; 연락처 : <strong>${qnaVO.qna_phone}</strong></span>
												</td>
											</tr>
											<tr>
												<th>작성날짜</th>
												<td>
													<span>${qnaVO.qna_regDate}</span>
												</td>
											</tr>
											<tr>
												<th>문의 상품</th>
												<td class="pickPrd">
												<div>
													<c:if test="${qnaVO.product_id ne null}">
														<div style="width:100%; margin-top:10px; padding:10px 0 0 6px;">
															<div style="display:inline-block;"><img style="width:82px; height:82px;" src="/upload/product/${productFileVOList[0].productFile_name}"></div>
															<div class="prd_info">
																<span>${productVO.product_name}</span>
																<span style="font-weight:bold;"><fmt:formatNumber pattern="#,###">${productVO.product_price}</fmt:formatNumber> 원</span>
															</div> 
														</div>
													</c:if>
												</div>
												</td>
											</tr>	
											<tr class="con">
												<th>문의 내용</th>
												<td>
													<strong class="view_q">Q.</strong>
													<div class="qna_contents">${qnaVO.qna_contents}</div>
												</td>
											</tr>
											<tr>
												<th scope="row">답변</th>
												<td>
													<textarea class="summernote" name="qna_answer" id="qna_answer" >${qnaVO.qna_answer}</textarea>
													<!--숨김 데이터-->
													<input hidden="" name="qna_id" value="${qnaVO.qna_id}">
													<input hidden="" name="qna_state" class="qna_state">
												</td>
											</tr>
										</tbody>
									</table>
								<div class="btn_wrap">
									<button type="button" onclick="location.href='./adQnaList'" class="goback boardBtn">이전</button>
									<c:if test="${qnaVO.qna_state eq 1}">
										<button type="submit" class="prevAnswer boardBtn" onClick="javascript:form.action='./prevAnswer';">답변 취소</button>
									</c:if>
									<button type="button" class="upload boardBtn">저장</button>
								</div>
						</div>
					</div>
					</form>
					
					
				</div>	
				
			<!-- right content work end  -->	
		
				
			</div>	
			
		</div>
		<c:import url="/WEB-INF/views/admin/adFooter.jsp"></c:import>
	</div>
	
	
	
	
	<script type="text/javascript">
		$('.summernote').summernote({
			tabsize: 2,
			height: 500,
			toolbar: [
					['style', ['style']],
					['font', ['bold', 'underline', 'clear']],
					['color', ['color']],
					['para', ['ul', 'ol', 'paragraph']],
					['table', ['table']],
					['insert', ['link', 'picture', 'video']],
					['view', ['fullscreen', 'codeview', 'help']]
				['view', ['codeview']]
			]
		});
		
		//유효성 검사
		$(".upload").click(function(){
		
			if($(".summernote").summernote('isEmpty')){
				alert("답변은 필수 입력 사항입니다.");
				return false;
			}
			
			if(confirm('이대로 답변을 남기시겠습니까?')){
				$("#qnaAdFrm").submit();
			}else{
				return false;
			}
				
		});
		
		function prevAnswer(){
			$("#qnaAdFrm").action="./prevAnswer";
			$("#qnaAdFrm").submit();
		}
		
		
		
		
	</script>
	

	
</body>
</html>