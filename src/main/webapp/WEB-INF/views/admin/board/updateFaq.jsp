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
		.faq_write tbody tr th{font-size:12px; line-height:1.5; color:#333; margin:0; border-bottom:1px solid #dbdbdb; padding:13px 0 13px 25px; font-weight:bold; background-color:#fbfbfb;text-align:left; vertical-align:top;  }
		.faq_write tbody tr td{font-size:12px; line-height:1.5; color:#333;height:32px; margin:0; padding:7px 0 11px 15px; border-bottom:1px solid #dbdbdb; background-color:#fff;  }
		.faq_write tbody tr input{width:320px; height:31px; padding:0 10px; border:1px solid #d6d6d6; color:#333; line-height:31px;  }
		#faq_type_code{width:127px; height:31px; color:#717171; vertical-align:top; outline:none; font-size:12px; line-height:1.5; border:1px solid #dbdbdb;  }
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
					<h2>UPDATE FAQ</h2>
					<form action="./updateFaq" id="faqAdFrm" method="post">
						<table class="faq_write">
							<colgroup>
								<col style="width:143px">
								<col style="width:808px">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">질문 유형</th>
									<td>
										<select id="faq_type_code" name="faq_type_code" value="${faqVO.faq_type_code}">
											<option class="pickType" value="f_1">회원가입/회원혜택</option>
											<option class="pickType" value="f_2">주문/결제/배송</option>
											<option class="pickType" value="f_3">취소/교환/반품/환불</option>
											<option class="pickType" value="f_4">상품문의</option>
											<option class="pickType" value="f_5">머신안내(Y1.1)</option>
											<option class="pickType" value="f_6">머신안내(Y3/Y3.2/Y3.3)</option>
											<option class="pickType" value="f_7">머신안내(X7/X7.1)</option>
											<option class="pickType" value="f_8">AS안내</option>
											<option class="pickType" value="f_9">자가진단</option>
										</select>	
										<input hidden="" id="faq_type" name="faq_type" value="" >									
									</td>
								</tr>
								<tr>
									<th scope="row">질문</th>
									<td>
										<input hidden="" name="faq_id" value="${faqVO.faq_id}">
										<input type="text" style="width:80%;" class="faq_title" name="faq_title" value="${faqVO.faq_title}">
									</td>
								</tr>
								<tr>
									<th scope="row">답변</th>
									<td>
										<textarea class="summernote" name="faq_contents" id="faq_contents" >
											${faqVO.faq_contents}
										</textarea>
									</td>
								</tr>
							</tbody>
					
						</table>
						<div class="btn_wrap">
							<button type="button" onclick="location.href='./adFaqList'" class="goback boardBtn">이전</button>
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
	
	//수정페이지 폼에 들어와있을때 원래 입력되어 있는 데이터 타입 선택되어있기
	const faq_type_code='${faqVO.faq_type_code}';
	$('.pickType').each(function(){
		const value=$(this).val();
		if(value==faq_type_code){
			$(this).prop("selected",true);
		}
	});	
	
	
	
	//faq_type_code에 따라서 faq_type 도 db저장 해주는 작업 해주면서 form submit 해주기  
	$(".upload").click(function(){
		var code=$("#faq_type_code").val();
		
		if(code=="f_1"){
			$("#faq_type").val("회원가입/회원혜택");
		}else if(code=="f_2"){
			$("#faq_type").val("주문/결제/배송");
		}else if(code=="f_3"){
			$("#faq_type").val("취소/교환/반품/환불");
		}else if(code=="f_4"){
			$("#faq_type").val("상품문의");
		}else if(code=="f_5"){
			$("#faq_type").val("머신안내(Y1.1)");
		}else if(code=="f_6"){
			$("#faq_type").val("머신안내(Y3/Y3.2/Y3.3)");
		}else if(code=="f_7"){
			$("#faq_type").val("머신안내(X7/X7.1)");
		}else if(code=="f_8"){
			$("#faq_type").val("AS안내");
		}else{
			$("#faq_type").val("자가진단");
		}
		
		$("#faqAdFrm").submit();
	});
	
	
	
</script>
	

	
</body>
</html>