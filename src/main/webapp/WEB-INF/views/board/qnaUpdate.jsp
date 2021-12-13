<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<style type="text/css">
		#right_content{width:1000px;float:left;padding-left:40px;}
		.board_zone_tit h2{font-size:24px; color:#333333;padding-bottom:10px; margin-bottom:9px;    }
		.board_zone_cont{border-top:1px solid #999; width:100%; }
		.qna_write tbody tr th{font-size:12px; line-height:1.5; color:#333; margin:0; border-bottom:1px solid #dbdbdb; padding:13px 0 13px 25px; font-weight:bold; background-color:#fbfbfb;text-align:left; vertical-align:top;  }
		.qna_write tbody tr td{font-size:12px; line-height:1.5; color:#333;height:32px; margin:0; padding:7px 0 11px 15px; border-bottom:1px solid #dbdbdb; background-color:#fff;  }
		.qna_write tbody tr input{width:320px; height:31px; padding:0 10px; border:1px solid #d6d6d6; color:#333; line-height:31px;  }
		#qna_type{width:127px; height:31px; color:#717171; vertical-align:top; outline:none; font-size:12px; line-height:1.5; border:1px solid #dbdbdb;}
		.pro_choice_btn{display:inline-block; width:80px; height:26px; margin-left:5px; line-height:24px; color:#fff; font-size:12px; border:1px solid #979797; background-color:#979797; text-align:center; vertical-align:center; cursor:pointer;}
		.pro_choice_btn:hover{background-color:#626262; border:1px solid #626262; }
		.qna_write{border-collapse: collapse;}
		.qna_write tbody tr input.qna_phone{width:90%;}
		.cont_ex{color:#333; font-size:12px; }
		.cont_ex em{color:#ff0000;  font-weight:bold;}
		.btn_wrap{position:relative; text-align:center; margin-top:30px;  }
		.boardBtn{display:inline-block; font-weight:bold;  background-color:#fff; width:100px; height:42px; padding:0 5px; color:#3e3d3c; font-size:14px; border:1px solid #ccc; text-align:center; cursor:pointer; }
		.boardBtn.upload{ background-color:#000; color:#fff; min-width:90px; padding:0 10px;  border-color:1px solid #000; margin-left:6px; }
		#qna_contents{resize:none; width:90%; min-height:300px; margin-top:10px; border:1px solid #d6d6d6; outline-color:#d6d6d6; padding:10px; }
		.inputBox { position: relative; display: inline-block; line-height: 0; vertical-align: top; }	 
		.prd_info{display:inline-block;position:absolute; margin-left:5px; }
		.prd_info span{display:block; font-size:12px; color:#333; }
		.prd_info span a.deletePrd{cursor:pointer;}
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
						<form action="./addQnaList" id="qnaFrm" method="post" enctype="multipart/form-data">
							<table class="qna_write">
								<colgroup>
									<col style="width:143px">
									<col style="width:808px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">말머리</th>
										<td>
											<select id="qna_type" name="qna_type" value="${qnaVO.qna_type}">
												<option>문의내용</option>
												<option class="check" value="커피머신 문의">커피머신 문의</option>
												<option class="check" value="정품 인증">정품 인증</option>
												<option class="check" value="커피 문의">커피 문의</option>
												<option class="check" value="정기구독 주문/배송">정기구독 주문/배송</option>
												<option class="check" value="정기구독 서비스 문의">정기구독 서비스 문의</option>
												<option class="check" value="주문/배송 문의">주문/배송 문의</option>
												<option class="check" value="★ 커피머신A/S 문의">★ 커피머신A/S 문의</option>
												<option class="check" value="★ 반품 접수">★ 반품 접수</option>
												<option class="check" value="★ 교환 접수">★ 교환 접수</option>
												<option class="check" value="★ 지출증빙 접수">★ 지출증빙 접수</option>
												<option class="check" value="기타 문의">기타 문의</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row">작성자</th>
										<td><input hidden="" name="member_id" value="${member.member_name}">${member.member_name}</td>
									</tr>
									<tr>
										<th scope="row">상품선택</th>
										<td> 
											<c:if test="${qnaVO.product_id eq null}">선택된 상품이 없습니다 </c:if>
											<button type="button" class="pro_choice_btn" onclick="javascript:findProduct()">상품 선택</button>
											<c:if test="${qnaVO.product_id ne null}">
												<div style="width:100%; border-top:1px solid #ccc; margin-top:10px; padding:10px 0 0 6px;">
													<div style="display:inline-block;"><img style="width:82px; height:82px;" src=""></div>
													<div class="prd_info">
														<span>${productVO.product_name} 네임네임 <a class="deletePrd"><i class="xi-close-square-o xi-x"></i></a></span>
														<span style="font-weight:bold;">${productVO.product_price} 가격가격</span>
													</div>
												</div>
											</c:if>
										</td>
									</tr>
									<tr>
										<th scope="row">휴대폰</th>
										<td>
											<input type="text" class="qna_phone" name="qna_phone" placeholder="- - 없이 입력하세요" value="${qnaVO.qna_phone}" >
										</td>
									</tr>
									<tr>
										<th scope="row">제목</th>
										<td>
											<input type="text" class="qna_title qna_phone" name="qna_title" value="${qnaVO.qna_title}">
										</td>
									</tr>
									<tr>
										<th scope="row">본문</th>
										<td>
											<p class="cont_ex">
												<em>1:1 문의하기는 비밀글로만 작성되며 유선으로 연락드리지 않습니다.</em><br>
												교환이나 반품 원하시는 경우 구매처 확인 부탁드립니다.<br>
												병행 수입 또는 해외 직구 상품은 상담하지 않습니다.<br>
												상품에서 (주)큐로홀딩스 또는 일리카페코리아 스티커 확인 부탁드리며, 없을 경우 정품 보증서 확인 바랍니다.<br>
												<em>말머리 선택이 없거나 양식에 맞지 않을 경우 추가 요청으로 인해 처리 지연됩니다.</em>
											</p>
											 
											 <textarea id="qna_contents" name="qna_contents">${qnaVO.qna_contents}</textarea> 
										</td>
									</tr>
									<tr>
										<th scope="row">첨부파일</th>
										<td class="inputFileWrap">
											<input type="file" name="multipartFiles" multiple="multiple" data-maximum_file_cnt="5" data-file_cnt="0" hidden="">
											
											<div class="imgBoxWrap" data-img_cnt="0">
											</div>
											
											<div class="inputBox">
												<input type="file" class="addFile" name="multipartFiles" multiple="multiple"> 
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">자동등록방지</th>
										<td>
											<!--구글 리캡챠v2 API-->
											<div id="google_recaptha">
												<script src='https://www.google.com/recaptcha/api.js'></script>
												<div class="g-recaptcha" data-sitekey="6LeN34MdAAAAAPKUbkjmd0VH2dKXKwLW1EWdZwqu"></div>
											</div>
										</td>
									</tr>
								
								
								
									
								</tbody>
						
							</table>
							<div class="btn_wrap">
								<button type="button" class="goback boardBtn">이전</button>
								<button type="button" class="upload boardBtn">저장</button>
							</div>
						</form>
						
					</div>
				
				</div>
				<!--right_content END-->
			</div>	
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>


	<script type="text/javascript">
		
	//상품 조회 팝업 띄우기 
		function findProduct(){
			var url = "./findProduct";
			var name = "popup test";
			var width = 475;
			var height = 600;
			var top = (window.innerHeight - height) / 2 + screenY;
			var left = (window.innerWidth - width) / 2 + screenX;    
			var option = "width = "+width+", height = "+height+", top = "+top+", left = "+left+", location = no, scrollbars = yes";
			window.open(url, name, option);
		};
		
	
		let qna_type='${qnaVO.qna_type}';
		$(function(){
			$(".check").each(function(){
				if(qna_type==$(this).val()){
					$(this).prop("selected",true);
				}
			});
		});
		
		//리캡차 유효성 검사
		$(".upload").click(function(){
			if ($('.g-recaptcha-response').val() == "") {
				alert("자동등록방지를 확인해 주십시오.");
				return false;
			}
			$("#qnaFrm").submit();
			
		});
		
		
		
		
		
	
	</script>

</body>
</html>


