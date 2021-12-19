<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/admin/insertProduct.css">
<link rel="stylesheet" href="/css/board/reviewInsert.css">
<link rel="stylesheet"href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style type="text/css"></style>


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
						<h2>상품후기</h2>
					</div>
					<div class="board_zone_cont">
						<form action="./reviewInsert" id="qnaFrm" method="post"
							enctype="multipart/form-data">
							<table class="qna_write">
								<colgroup>
									<col style="width: 143px">
									<col style="width: 808px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">작성자</th>
										<td>${member.member_name}</td>
									</tr>
									<tr>
										<th scope="row">주문상품</th>
										<td class="pickPrd">
											<div>
												<div
													style="width: 100%; margin-top: 10px; padding: 10px 0 0 6px;">
													<div style="display: inline-block;">
														<img style="width: 82px; height: 82px;"
															src="/upload/product/${productFileVOList[0].productFile_name}">
													</div>
													<div class="prd_info">
														<span>${productVO.product_name}</span> <span
															style="font-weight: bold;"><fmt:formatNumber
																value="${productVO.product_price}" pattern="#,###" />원</span>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">평가</th>
										<td class="star_wrap">
											<div class="form_element">
												<input hidden="" name="review_star" id="review_star">
												<input hidden="" name="cart_id" value="${cartVO.cart_id}">
												<ul class="rating_star_list" style="vertical-align: middle;">
													<li><label for="rating5" class="choice_s"> <span
															class="rating_star">★★★★★</span>
													</label> <input type="radio" id="rating5" class="review_star"
														value="5"></li>
													<li><label for="rating4" class="choice_s"> <span
															class="rating_star">★★★★<em>★</em></span>
													</label> <input type="radio" id="rating4" class="review_star"
														value="4"></li>
													<li><label for="rating3" class="choice_s"> <span
															class="rating_star">★★★<em>★★</em></span>
													</label> <input type="radio" id="rating3" class="review_star"
														value="3"></li>
													<li><label for="rating2" class="choice_s"> <span
															class="rating_star">★★<em>★★★</em></span>
													</label> <input type="radio" id="rating2" class="review_star"
														value="2"></li>
													<li><label for="rating1" class="choice_s"> <span
															class="rating_star">★<em>★★★★</em></span>
													</label> <input type="radio" id="rating1" class="review_star"
														value="1"></li>
												</ul>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">제목</th>
										<td><input type="text" class="review_title"
											name="review_title" value="${review_title}"></td>
									</tr>
									<tr>
										<th scope="row">본문</th>
										<td><textarea id="qna_contents" name="review_contents"></textarea>
										</td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td colspan="3" style="width: 80%;" class="inputFileWrap">
											<input type="file" name="multipartFiles" multiple="multiple" data-maximum_file_cnt="5" data-init_img_cnt="0" hidden="">
											
											<div class="imgBoxWrap" data-total_img_cnt="0" data-init_img_cnt="0">
											</div>
											
											<div class="inputBox">
												<input type="file" id="inputFile" class="inputFile" multiple="multiple" hidden="">
												<label for="inputFile" class="inputFileLable"></label>
											</div>								
										</td>
											</tr>
									<tr>
										<th scope="row">자동등록방지</th>
										<td>
											<!--구글 리캡챠v2 API-->
											<div id="google_recaptha">
												<script src='https://www.google.com/recaptcha/api.js'></script>
												<div class="g-recaptcha"
													data-sitekey="6LeN34MdAAAAAPKUbkjmd0VH2dKXKwLW1EWdZwqu"></div>
											</div>
										</td>
									</tr>

								</tbody>

							</table>
							<div class="btn_wrap">
							<button ></button>
								<button type="button" class="goback boardBtn" onClick="conf()">이전</button>
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


	<script src="/js/util/inputFileWrap.js"></script>	
	<script type="text/javascript">
		//별점 선택 
		$(".choice_s").click(function(){
			$(".choice_s").removeClass("on");
			$(this).addClass("on");
		
		});
		
		function conf(){
			if(confirm("리뷰 작성을 취소하시겠습니까?")){
				location.href="/member/myReviewList";	
			}
		}
		
		
		
		//유효성 검사
		$(".upload").click(function(){
			if($(".review_title").val()==''){
				alert("리뷰 제목은 필수 입력 사항입니다.");
				return false;
			}
			
			let flag=false;
			$(".choice_s").each(function(){
				if($(this).hasClass("on")){
					$("#review_star").val($(this).next('.review_star').val());
					flag=true;
				}
			})
			
			if(!flag){
				alert("별점을 선택해주세요");
				return false;	
			}
			
			if($("#qna_contents").val()==''){
				alert("리뷰 내용을 입력해주세요");
				return false;
			}
			
			
			if ($('.g-recaptcha-response').val() == "") {
				alert("자동등록방지를 확인해 주십시오.");
				return false;
			}
			
			if(confirm('리뷰를 업로드 하시겠습니까?')){
				$("#qnaFrm").submit();
			}else{
				return false;
			}
				
		});
		
		/********** 상품사진 START **********/ 
		$('.inputFileWrap').on('change', '.inputFile', function(){
			let multipartFiles = $('input[name=multipartFiles]');
			let imgBoxWrap = $('.imgBoxWrap');
			let dataTransfer = new DataTransfer();
			
			addFiles(multipartFiles, this); //inputFileWrap.js
			addPeviewImg(multipartFiles, imgBoxWrap, this) //inputFileWrap.js
			this.files = dataTransfer.files; //files 초기화
			
			printMultipartFiles(); //테스트용 함수
		}); /********** 파일선택 **********/
		
		$('.inputFileWrap').on('click', '.deleteFileBtn', function(){
			let multipartFiles = $('input[name=multipartFiles]');
			
			deleteFile($(this), multipartFiles); //inputFileWrap.js
			deletePeviewImg($(this), multipartFiles); //inputFileWrap.js
			let imgBox = $('.imgBox'); //setImgIndex() 호출 직전에 imgBox변수 선언
			setImgIndex(imgBox) //inputFileWrap.js
			
			printMultipartFiles(); //테스트용 함수
		}); /********** 파일 삭제버튼 **********/
		
		$('.inputFileWrap').on('mouseover', '.previewImg', function(){
			let deleteFileBtn = $(this).siblings('.deleteFileBtn');		
			deleteFileBtn.css('visibility', 'visible');
		});
		$('.inputFileWrap').on('mouseleave', '.previewImg', function(){
			let deleteFileBtn = $(this).siblings('.deleteFileBtn');		
			deleteFileBtn.css('visibility', 'hidden');
		});
		$('.inputFileWrap').on('mouseover', '.deleteFileBtn', function(){
			$(this).css('visibility', 'visible');
		});
		
		function printMultipartFiles() {
			let multipartFiles = $('input[name=multipartFiles]');
			let files = multipartFiles[0].files;
			let index = 0;
			console.log("/ ===== ===== ===== ===== ===== /");
			for (let file of files){
				console.log("[FILE INDEX "+(index++)+"] " + file.name);
			}
			console.log("[TOTAL COUNT] " + $('.imgBoxWrap').data('total_img_cnt'));
		} /********** 테스트용 함수 **********/
	/********** 상품사진 END **********/

		
		
	
	</script>

</body>
</html>


