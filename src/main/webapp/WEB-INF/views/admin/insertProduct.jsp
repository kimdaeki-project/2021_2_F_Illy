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
	<link rel="stylesheet" href="/css/admin/insertProduct.css">
	
<!-- include summernote css/js -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/admin/adNavbar.jsp"></c:import>
		<div id="container" style="padding-bottom: 155px; margin-bottom: -155px;">
				
			<div id="contents">
			
			
			
			
			
			
			
			
			
				<h2>INSERT PRODUCT</h2>
				<div class="formWrap">
				<form:form modelAttribute="${category}VO" enctype="multipart/form-data">
					<h3>${fn:toUpperCase(category)}</h3>
					
					<table class="essentialInfo">
							<tr>
								<th>가격</th>
								<td>
									<div class="inputBox">
										<form:input class="inputUnit numberOnly" type="text" path="product_price"/>
										<div class="unit">원</div>
									</div>
									<form:errors path="product_price" cssClass="error"/>
								</td>
								<th>카테고리 코드</th>
								<td>
									<div class="selectBox">
										<select class="select">
											<option>직접입력</option>
											<c:forEach var="categoryCnt" items="${categoryCnt}">
												<option>${categoryCnt.code}-${categoryCnt.name}</option>
											</c:forEach>
										</select>
									</div>
									<div class="inputBox">
										<form:input path="product_categoryCode" class="inputText"/>
									</div>
									<form:errors path="product_categoryCode" cssClass="error"/>
								</td>
							</tr>
							<tr>
								<th>상품명</th>
								<td>
									<div class="inputBox">
										<form:input class="inputText" type="text" path="product_name"/>
									</div>
									<form:errors path="product_name" cssClass="error"/>
								</td>
								<c:choose>
								<c:when test="${category eq 'coffee'}">
								<!-- ********** 상품필수 정보 COFFEE ********** -->
								<th>식품유형</th><td>커피</td>
							</tr>
							<tr>
								<th>용량</th>
								<td>
									<div class="inputBox">
										<form:input class="inputText" type="text" path="coffee_capacity"/>
									</div>
									<form:errors path="coffee_capacity" cssClass="error"/>
								</td>
								
								<th>원재료명 및 함량</th>
								<td>
									<div class="inputBox">
										<form:input class="inputText" type="text" path="coffee_material"/>
									</div>
									<form:errors path="coffee_material" cssClass="error"/>
								</td>
							</tr>
							<tr>
								<th>카페인함량</th>
								<td>
									<div class="inputBox">
										<form:input class="inputNumber numberOnly" type="number" step="0.1" min="0" path="coffee_caffeine"/>
										<div class="unit number">&lt;N%</div>
									</div>
									<form:errors path="coffee_caffeine" cssClass="error"/>
								</td>
								
								<th>원산지</th>
							</c:when>
							<c:when test="${category eq 'machine'}">
							<!-- ********** 상품필수 정보 MACHINE ********** -->
								<th>소재</th>
								<td>
									<div class="inputBox">
										<form:input class="inputText" type="text" path="machine_material"/>
									</div>
									<form:errors path="machine_material" cssClass="error"/>
								</td>
							</tr>
							<tr>
								<th>펌프</th>
								<td>
									<div class="inputBox">
										<form:input class="inputUnit numberOnly" type="text" path="machine_pump"/>
										<div class="unit">bar</div>
									</div>
									<form:errors path="machine_pump" cssClass="error"/>
								</td>
								<th>사이즈</th>
								<td>
									<div class="inputBox">
										<form:input class="inputUnit" type="text" path="machine_size"/>
										<div class="unit">mm</div>
									</div>
									<form:errors path="machine_size" cssClass="error"/>
								</td>
							</tr>
							<tr>
								<th>무게</th>
								<td>
									<div class="inputBox">
										<form:input class="inputUnit numberOnly" type="text" path="machine_weight"/>
										<div class="unit">kg</div>
									</div>
									<form:errors path="machine_weight" cssClass="error"/>
								</td>
								<th>물탱크 용량</th>
								<td>
									<div class="inputBox">
										<form:input class="inputUnit numberOnly" type="text" path="machine_capacity"/>
										<div class="unit">L</div>
									</div>
									<form:errors path="machine_capacity" cssClass="error"/>
								</td>
							</tr>
							<tr>
								<th>정격전압</th>
								<td>
									<div class="inputBox short">
										<form:input class="inputUnit short numberOnly" type="text" path="machine_powerV"/>
										<div class="unit">V</div>
										<form:errors path="machine_powerV" cssClass="error"/>
									</div>
									<div class="inputBox short">
										<form:input class="inputUnit short numberOnly" type="text" path="machine_powerHz"/>
										<div class="unit">Hz</div>
										<form:errors path="machine_powerHz" cssClass="error"/>
									</div>
								</td>
								<th>소비전력</th>
								<td>
									<div class="inputBox">
										<form:input class="inputUnit numberOnly" type="text" path="machine_powerConsumption"/>
										<div class="unit">W</div>
									</div>
									<form:errors path="machine_powerConsumption" cssClass="error"/>
								</td>
							</tr>
							<tr>
								<th>안전인증정보(KC안전인증)</th>
								<td>
									<div class="inputBox">
										<form:input class="inputText" type="text" path="machine_safetyInfo"/>
									</div>
									<form:errors path="machine_safetyInfo" cssClass="error"/>
								</td>
								<th>제조국</th>
							</c:when>
							</c:choose>
								<td>
									<div class="inputBox">
										<form:input class="inputText" type="text" path="product_origin"/>
									</div>
									<form:errors path="product_origin" cssClass="error"/>
								</td>
							</tr>
							<tr>
								<th>제조사</th>
								<td>
									<div class="inputBox">
										<form:input class="inputText" type="text" path="product_manufacturer"/>
									</div>
									<form:errors path="product_manufacturer" cssClass="error"/>
								</td>
								
								<th>수입판매원</th>
								<td>
									<div class="inputBox">
										<form:input class="inputText" type="text" path="product_importer" value="㈜큐로홀딩스" readonly="true"/>
										<form:errors path="product_importer" cssClass="error"/>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>품질보증기준</th><td colspan="3" style="width: 80%;">관련법 및 소비자 분쟁 해결기준에 따름</td>
							</tr>
							
							<tr>
								<th>상품사진</th>
								<td colspan="3" style="width: 80%;" class="inputFileWrap">
									<input type="file" name="multipartFiles" multiple="multiple" data-maximum_file_cnt="5" data-file_cnt="0" hidden="">
									
									<div class="imgBoxWrap" data-img_cnt="0">
									</div>
									
									<div class="inputBox">
										<input type="file" id="inputFile" class="inputFile" multiple="multiple" hidden="">
										<label for="inputFile" class="inputFileLable"></label>
									</div>								
								</td>
							</tr>
					</table>
					
					<div class="summernote">
						<form:textarea id="summernote" path="product_detail"/>
						<script>
							$('#summernote').summernote({
								placeholder: '상품상세정보',
								tabsize: 2,
								height: 500,
								toolbar: [
// 									['style', ['style']],
// 									['font', ['bold', 'underline', 'clear']],
// 									['color', ['color']],
// 									['para', ['ul', 'ol', 'paragraph']],
// 									['table', ['table']],
									['insert', [/* 'link',  */'picture'/* , 'video' */]],
// 									['view', ['fullscreen', 'codeview', 'help']]
									['view', ['codeview']]
								]
							});
						</script>
					</div>
					
					<form:button type="submit" onclick="return submitBtn()" class="btnDefault red insertBtn">상품등록</form:button>
					
				</form:form>
				</div>
				
				
				
				
				
				
				
				
				
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/admin/adFooter.jsp"></c:import>
	</div>
</body>
	
 	
<script src="/js/util/inputFileWrap.js"></script>
<script type="text/javascript">
	
	$().ready(function(){
		$('input[type="radio"]').change(); //input 실패 시 라디오 버튼 체크
		$('.numberOnly').blur(); //가격 숫자형식 변환 (1,000)
		$('.numberOnly').attr('oninput', "this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\\..*)\\./g, '$1');") //숫자 정규식
		$('input[name=machine_size]').attr('oninput', "this.value = this.value.replace(/[^0-9*]/g, '');") //사이즈(W*D*H) 입력제한
		$('.error').siblings('.selectBox').css('top', '0');
		$('.error').siblings('.selectBox').css('transform', 'none');
	});
	
	function submitBtn(){
		//submit 하기 전 가격 숫자형식 변환
		$('.numberOnly').each(function(){
			$(this).val($(this).val().replace(/[^\.|^0(0)+|^0-9\.]/g, ''))
		});
		return true;
	} /********** submit button **********/	

	$('.numberOnly').focus(function() {
		$(this).val($(this).val().replace(/[^\.|^0(0)+|^0-9\.]/g, ''));
	}); /********** .focus 숫자만 표시 **********/	
	$('.numberOnly').blur(function() {
		$(this).val(Number($(this).val()).toLocaleString());
		if($(this).val() == 0 || $(this).val() == "NaN") {
			$(this).val(null);
		} /********** .blur 단위 표시 **********/
	}); /********** numberOnly **********/	

	$('select').change(function(){
		let inputText = $(this).parent().siblings('.inputBox').find('input');
		let selectedIndex = $(this).prop('selectedIndex');
		if (selectedIndex == 0) {
			inputText.removeAttr('readonly', "");
			inputText.val("");
			inputText.change();
			inputText.focus();
		} else {
			inputText.attr('readonly', "");
			inputText.val($(this).val());
			inputText.change();
		}
	}); /********** selectBox **********/
	
/********** 상품사진 START **********/ 	
	$('.inputFileWrap').on('change', '.inputFile', function(){
		let multipartFiles = $('input[name=multipartFiles]');
		let imgBoxWrap = $('.imgBoxWrap');
		let dataTransfer = new DataTransfer();
		
		addFiles(multipartFiles, this);	//inputFileWrap.js
		addPeviewImg(multipartFiles, imgBoxWrap, this) //inputFileWrap.js
		this.files = dataTransfer.files; //files 초기화
		
		printMultipartFiles(); //테스트용 함수
	}); /********** 파일선택 **********/
	
	$('.inputFileWrap').on('click', '.deleteFileBtn', function(){
		let multipartFiles = $('input[name=multipartFiles]');
		
		deleteFile($(this), multipartFiles); //inputFileWrap.js
		deletePeviewImg($(this)); //inputFileWrap.js
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
		console.log("[TOTAL COUNT] " + multipartFiles.data('file_cnt'));
	} /********** 테스트용 함수 **********/
/********** 상품사진 END **********/

</script>
</html>