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
		.board_zone_tit h2{font-size:24px; color:#333333;padding-bottom:10px; margin-bottom:9px;    }
		.board_zone_cont{border-top:1px solid #999; width:100%; }
		.notice_write tbody tr th{font-size:12px;  line-height:1.5; color:#333; margin:0; border-bottom:1px solid #dbdbdb; padding:13px 0 13px 25px; font-weight:bold; background-color:#fbfbfb;text-align:left; vertical-align:top;  }
		.notice_write tbody tr td{font-size:12px; line-height:1.5; color:#333;height:32px; margin:0; padding:7px 0 11px 15px; border-bottom:1px solid #dbdbdb; background-color:#fff;  }
		.notice_write tbody tr input{width:320px; height:31px; padding:0 10px; border:1px solid #d6d6d6; color:#333; line-height:31px;  }
		#notice_type{width:127px; height:31px; color:#717171; vertical-align:top; outline:none; font-size:12px; line-height:1.5; border:1px solid #dbdbdb;  }
		.notice_write tbody tr td input.notice_top{width:15px; height:15px; margin-top:5px;    }
		.btn_wrap{position:relative; text-align:center; margin-top:30px;  }
		.boardBtn{display:inline-block; font-weight:bold;  background-color:#fff; width:100px; height:42px; padding:0 5px; color:#3e3d3c; font-size:14px; border:1px solid #ccc; text-align:center; cursor:pointer; }
		.boardBtn.upload{ background-color:#000; color:#fff; min-width:90px; padding:0 10px;  border-color:1px solid #000; margin-left:6px; }
	</style>


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
	
				<div class="right_cont">			
					<h2>INSERT NOTICE</h2>
					<form action="./insertNotice" id="noticeAdFrm" method="post" enctype="multipart/form-data">
								<table class="notice_write">
									<colgroup>
										<col style="width:143px">
										<col style="width:808px">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">공지 유형</th>
											<td>
												<select id="notice_type" name="notice_type">
													<option>=선택=</option>
													<option value="안내">안내</option>
													<option value="배송">배송</option>
													<option value="정품">정품</option>
													<option value="이벤트">이벤트</option>
													<option value="공지">공지</option>
													<option value="AS">AS</option>
												</select>										
											</td>
										</tr>
										<tr>
											<th scope="row" >게시글 상단 고정</th>
											<td>
												<input hidden="" class="cnt" value="${notice}">
												<input type="checkbox" class="notice_top" name="notice_top" value="0">
											</td>
										</tr>
										<tr>
											<th scope="row" >제목</th>
											<td>
												<input type="text" style="width:80%;" class="notice_title" name="notice_title">
											</td>
										</tr>
										<tr>
											<th scope="row">본문</th>
											<td>
												<textarea class="summernote" name="notice_contents" id="notice_contents" ></textarea>
											</td>
										</tr>
										<tr>
											<th scope="row">첨부파일</th>
											<td>
												 <input type="file" class="addFile" name="multipartFiles" multiple="multiple"> 	
											</td>
										</tr>
									
									</tbody>
							
								</table>
								<div class="btn_wrap">
									<button type="button" onclick="location.href='./adNoticeList'" class="goback boardBtn">이전</button>
									<button type="button" class="upload boardBtn">저장</button>
								</div>
						
					</form>
					
				</div>
				
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
		if($(".notice_type").val()==''){
			alert("공지 유형을 선택하세요");
			return false;
		}
		if($(".notice_title").val()==''){
			alert("공지 제목은 필수 입력 사항입니다.");
			return false;
		}
		
		if($(".summernote").summernote('isEmpty')){
			alert("본문은 필수 입력 사항입니다.");
		}
		
		if(confirm('공지를 업로드 하시겠습니까?')){
			if($(".notice_top").prop('checked')){
				if($(".cnt").val()>4){
					alert("상단고정게시글은 5개 이상 불가하므로 일반게시글로 업로드됩니다.");
					$(".notice_top").val(0);				
				}else{
					$(".notice_top").val(1);			
				}
			}
			$("#noticeAdFrm").submit();
			
		}else{
			return false;
		}
			
	});
	
	
	
	
	
</script>
	

	
</body>
</html>