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
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
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
				<form:form modelAttribute="${type}VO" enctype="multipart/form-data">
					<h3>${fn:toUpperCase(type)}</h3>
					
					<table>
						<colgroup>
							<col width="25%">
							<col width="75%">
						</colgroup>
						<tr>
							<th>상품명</th>
							<td>
								<div class="inputBox">
									<form:input class="inputText" type="text" path="product_name"/>
									<br><form:errors path="product_name" cssClass="error"/>
								</div>
							</td>
						</tr>
						
						
						<c:choose>
							<c:when test="${type eq 'machine'}">
							<!-- ===== MACHINE INSERT FORM START ===== -->
				
								<form:hidden path="product_categoryCode" value="002"/>
								<tr>
									<th>소재</th>
									<td>
										<div class="inputBox">
											<form:input path="machine_material" class="inputText"/>
										</div>
										<div class="selectBox">
											<select class="select">
												<option>직접입력</option>
												<option>TEST</option>
											</select>
											<div class="selectArrow"></div>
										</div>
										<br><form:errors path="machine_material" cssClass="error"/>
									</td>
								</tr>
								<tr>
									<th>펌프</th>
									<td>
										<div class="inputBox">
											<form:input path="machine_pump" type="number" class="inputText numberOnly"/>
											<br><form:errors path="machine_pump" cssClass="error"/>
											<div class="unit number">bar</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>사이즈 (W * D * H)</th>
									<td>
										<div class="inputBox">
											<form:input path="machine_size" class="inputText"/>
											<br><form:errors path="machine_size" cssClass="error"/>		
											<div class="unit">mm</div>
										</div>								
									</td>
								</tr>
								<tr>
									<th>무게</th>
									<td>
										<div class="inputBox">
											<form:input path="machine_weight" type="number" step="0.1" class="inputText numberOnly"/>
											<br><form:errors path="machine_weight" cssClass="error"/>
											<div class="unit number">kg</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>물탱크 용량</th>
									<td>
										<div class="inputBox">
											<form:input path="machine_capacity" type="number" step="0.1" class="inputText numberOnly"/>
											<br><form:errors path="machine_capacity" cssClass="error"/>
											<div class="unit number">L</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>정격전압/소비전력</th>
									<td>
										<div class="inputBox">
											<form:input path="machine_powerV" class="inputText short numberOnly"/>
											<br><form:errors path="machine_powerV" cssClass="error"/>
											<div class="unit">V</div>
										</div>
										<div class="inputBox">
											<form:input path="machine_powerHz" class="inputText short numberOnly"/>
											<br><form:errors path="machine_powerHz" cssClass="error"/>
											<div class="unit">Hz</div>
										</div>
										<div class="inputBox">
											<form:input path="machine_powerConsumption" class="inputText short numberOnly"/>
											<br><form:errors path="machine_powerConsumption" cssClass="error"/>
											<div class="unit">W</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>KC안전인증 정보</th>
									<td>
										<div class="inputBox">
											<form:input path="machine_safetyInfo" class="inputText"/>
											<br><form:errors path="machine_safetyInfo" cssClass="error"/>
										</div>
									</td>
								</tr>
							<!-- ===== MACHINE INSERT FORM END ===== -->
							</c:when>
							<c:when test="${type eq 'coffee'}">							
							<!-- ===== COFFEE INSERT FORM START ===== -->
				
								<form:hidden path="product_categoryCode" value="001"/>
								<tr>								
									<th>종류</th>
									<td>
										<form:radiobutton id="cap" path="coffee_type" value="cap" hidden="true"/>
										<label for="cap">캡슐커피</label>
										<form:radiobutton  id="bean" path="coffee_type" value="bean" hidden="true"/>
										<label for="bean">원두커피</label>
										<form:radiobutton  id="grind" path="coffee_type" value="grind" hidden="true"/>
										<label for="grind">분쇄커피</label>
										<form:radiobutton  id="stick" path="coffee_type" value="stick" hidden="true"/>
										<label for="stick">스틱원두커피</label>
										<form:radiobutton  id="manual" path="coffee_type" value="manual" hidden="true"/>
										<label for="manual">직접입력</label>
										<br><form:errors path="coffee_type" cssClass="error"/>
									</td>
								</tr>
								
								<tr class="radioChangeResult"  style="display: none;">
									<th>개수</th>
									<td>
										
										<div class="inputBox">
											<form:input class="inputText numberOnly short" type="number" path="coffee_portion"/>
											<div class="unit number">P</div>
										</div>
											
										<div class="inputBox">
											<input class="inputText short" type="text" placeholder="사이즈" name="coffee_stickSize">
										</div>
															
										<div class="selectBox">
											<select class="select short">
												<option>직접입력</option>
												<option>미니</option>
												<option>레귤러</option>
											</select>
											<div class="selectArrow"></div>
										</div>
										
									</td>
								</tr>
								
								<tr>
									<th>용량</th>
									<td>
									
										<div class="inputBox">
											<form:input class="inputText numberOnly" type="text" path="coffee_capacity"/>
											<span class="unit">g</span>
										</div>
										
										<div class="selectBox">
											<select class="select">
												<option>직접입력</option>
												<option>140.7</option>
												<option>250</option>
											</select>
											<div class="selectArrow"></div>
										</div>
										
										<br><form:errors path="coffee_capacity" cssClass="error"/>
									</td>
								</tr>
								<tr>
									<th>원재료명 및 함량</th>
									<td>
										<div class="inputBox">
											<form:input class="inputText" type="text" path="coffee_material"/>
										</div>
										
										<div class="selectBox">
											<select class="select">
												<option>직접입력</option>
												<option>아라비카 원두커피 100%</option>
												<option>인스턴트커피 85% 볶은커피 15%</option>
											</select>
											<div class="selectArrow"></div>
										</div>
										<br><form:errors path="coffee_material" cssClass="error"/>
									</td>
								</tr>
								<tr>
									<th>카페인함량</th>
									<td>
<!-- 										<input id="classico" type="radio" name="caffeineName" value="1.5" hidden=""> -->
<!-- 										<label for="classico">클라시코: 미디엄</label> -->
<!-- 										<input id="intenso" type="radio" name="caffeineName" value="1.5" hidden=""> -->
<!-- 										<label for="intenso">인텐소: 다크</label> -->
<!-- 										<input id="decaff" type="radio" name="caffeineName" value="0.1" hidden=""> -->
<!-- 										<label for="decaff">디카프: 디카페인</label> -->
<!-- 										<input id="classicoLungo" type="radio" name="caffeineName" value="1.5" hidden=""> -->
<!-- 										<label for="classicoLungo">클라시코룽고: 룽고</label> -->
										
										<div class="inputBox">
											<form:input class="inputText numberOnly short" type="number" step="0.1" path="coffee_caffeine"/>
											<div class="unit number">% 이하</div>
										</div>
										
										<div class="selectBox">
											<select class="select" name="caffeineName">
												<option>직접입력</option>
												<option value="1.5">클라시코: 미디엄</option>
												<option value="1.5">인텐소: 다크</option>
												<option value="0.1">디카프: 디카페인</option>
												<option value="1.5">클라시코룽고: 룽고</option>
											</select>
											<div class="selectArrow"></div>
										</div>
										<br><form:errors path="coffee_caffeine" cssClass="error"/>
									</td>
								</tr>
							<!-- ===== COFFEE INSERT FORM END ===== -->
							</c:when>
						</c:choose>
						
						
						<tr>
							<th>가격</th>
							<td>
								<div class="inputBox">
									<form:input class="inputText numberOnly" type="text" path="product_price"/>
									<div class="unit">원</div>
								</div>
								<br><form:errors path="product_price" cssClass="error"/>
							</td>
						</tr>
						<tr>
							<th>제조사</th>
							<td>
								<div class="inputBox">
									<form:input class="inputText" type="text" path="product_manufacturer"/>
								</div>
								
								<div class="selectBox">
									<select class="select">
										<option>직접입력</option>
										<option>ILLY CAFFE S.P.A</option>
										<option>Magic L'Espresso S.L.</option>
									</select>
									<div class="selectArrow"></div>
								</div>
								<br><form:errors path="product_manufacturer" cssClass="error"/>
							</td>
						</tr>
						<tr>
							<c:choose>
								<c:when test="${type eq 'machines'}"><th>제조국</th></c:when>
								<c:otherwise><th>원산지</th></c:otherwise>								
							</c:choose>
							<td>
								<div class="inputBox">
									<form:input class="inputText" type="text" path="product_origin"/>
								</div>
								<div class="selectBox">
									<select class="select">
										<option>직접입력</option>
										<option>이탈리아</option>
										<option>스페인</option>
									</select>
									<div class="selectArrow"></div>
								</div>
								<br><form:errors path="product_origin" cssClass="error"/>
							</td>
						</tr>
						<tr>
							<th>수입판매원</th>
							<td>
								<div class="inputBox">
									<input class="inputText" type="text" name="product_importer" value="㈜큐로홀딩스" readonly="readonly">
								</div>
							</td>
						</tr>
						<tr>
							<th>상품사진</th>
							<td class="inputFileWrap">
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
// 									['insert', ['link', 'picture', 'video']],
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
	});
	
/* ===== submit button 이벤트 START ===== */
	function submitBtn(){
		//submit 하기 전 가격 숫자형식 변환
		$('.numberOnly').each(function(){
			$(this).val($(this).val().replace(/[^\.|^0(0)+|^0-9\.]/g, ''))
		});
		return true;
	}
/* ===== submit button 이벤트 END ===== */

/* ===== 상품이름 자동 생성 START ===== */
	function setProduct_name(){
		let product_name = $('input[name=product_name]');
		let coffee_type = $('input[name=coffee_type]:checked').next().html(); //(캡슐, 원두, 분쇄, 스틱)
		let coffee_typeVal = $('input[name=coffee_type]:checked').val(); //(cap, bean, grind, stick, manual)
		let coffee_stickSizeVal = $('input[name=coffee_stickSize]').val(); //(미니, 레귤러)
		let coffee_portionVal = $('input[name=coffee_portion]').val(); //(단위 : P)
		let coffee_capacityVal = $('input[name=coffee_capacity]').val(); //(단위 : g)
		let caffeineName = $('select[name=caffeineName]').find(':selected').text(); //(클라시코, 인텐소, 디카페인, 클라시코 룽고)

		if(coffee_portionVal != "") { coffee_portionVal = coffee_portionVal+"P " }
		if(coffee_capacityVal != "") { coffee_capacityVal = coffee_capacityVal+"g " }
		if(coffee_stickSizeVal != "") { coffee_stickSizeVal = "("+coffee_stickSizeVal+") "}
		if(caffeineName == "직접입력") { caffeineName = "" } else { caffeineName = " ["+caffeineName+"]"}

		if(coffee_typeVal == "cap"){
			product_name.val(coffee_portionVal+coffee_type+caffeineName);
		}
		if(coffee_typeVal == "bean"){
			product_name.val(coffee_capacityVal+coffee_type+caffeineName);
		}
		if(coffee_typeVal == "grind"){
			product_name.val(coffee_capacityVal+coffee_type+caffeineName);
		}
		if(coffee_typeVal == "stick"){
			product_name.val(coffee_stickSizeVal+coffee_portionVal+coffee_type+caffeineName);
		}
		if(coffee_typeVal == "manual"){
		}
	}

	/* 타이핑 마다 자동갱신 */
	$('input').keyup(function(){
		setProduct_name();
	});
/* ===== 상품이름 자동 생성 END ===== */

/* ===== 커피종류 선택 시, 입력창 추가/삭제 START ===== */
	$('input[name="coffee_type"]').change(function(){
		let inputProductName = $('input[name=product_name]');
		let checkedRadio = $('input[name="coffee_type"]:checked').val(); //선택된 라디오 값
		let radioChangeResult = $('.radioChangeResult'); //<tr>
		let selectBox = radioChangeResult.find('.selectBox'); //스틱커피 선택 시 활성화
		let inputBox = selectBox.prev(); //스틱커피 선택 시 활성화
		let coffee_stickSize = radioChangeResult.find('input[name=coffee_stickSize]');
		let coffee_portion = radioChangeResult.find('input[name=coffee_portion]');

		//inputText 값 초기화
		coffee_stickSize.val('');
		coffee_portion.val('');

		inputProductName.attr('readonly', '');
		radioChangeResult.css('display', 'none');
		selectBox.css('display', 'none');
		inputBox.css('display', 'none');
		
		if (checkedRadio == "cap" || checkedRadio == "stick"){
			radioChangeResult.css('display', 'table-row');
		}
		if (checkedRadio == "stick"){
			selectBox.css('display', 'inline-block');
			inputBox.css('display', 'inline-block');
		}
		if (checkedRadio == "manual"){
			inputProductName.removeAttr('readonly');
			inputProductName.val("");
			inputProductName.focus();
		}
		
		setProduct_name();
	});
/* ===== 커피종류 선택 시, 입력창 추가/삭제 END ===== */
	
/* ===== numberOnly START ===== */
	/* 포커스를 올렸을 경우 숫자만 표시 */
	$('.numberOnly').focus(function() {
		$(this).val($(this).val().replace(/[^\.|^0(0)+|^0-9\.]/g, ''));
	});
	/* 포커스가 사라질 경우 단위 표시 */
	$('.numberOnly').blur(function() {
		$(this).val(Number($(this).val()).toLocaleString());
		if($(this).val() == 0 || $(this).val() == "NaN") {
			$(this).val(null);
		}
	});
/* ===== numberOnly END ===== */

/* ===== selectBox START ===== */
	$('select').change(function(){
		let inputText = $(this).parent().prev().find('input');
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
		setProduct_name();
	});
/* ===== selectBox END ===== */
	
/* ===== 상품사진 START ===== */ 
 	
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
	
/* ===== 상품사진 END ===== */
	
/* ===== 카페인함량 선택 시 % 자동입력 START ===== */
	$('input[name="caffeineName"]').change(function(){
		$('input[name="coffee_caffeine"]').val($(this).val());
	});
/* ===== 카페인함량 선택 시 % 자동입력 END ===== */

</script>
</html>