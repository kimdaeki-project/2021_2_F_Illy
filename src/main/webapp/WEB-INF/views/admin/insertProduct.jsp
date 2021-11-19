<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/admin/insertProduct.css">
	<style type="text/css">
		
	</style>

<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/admin/adNavbar.jsp"></c:import>
		<div id="container" style="padding-bottom: 155px; margin-bottom: -155px;">
				
			<div id="contents">
			
			
			
			
			
			
			
			
			
				<h2>INSERT PRODUCT</h2>
				<h3>${fn:toUpperCase(type)}</h3>
				<form>
				
					<input type="text" name="product_type" hidden="" value="${type}">					
					
					<table>
						<colgroup>
							<col width="25%">
							<col width="75%">
						</colgroup>
						<tr>
							<th>상품명</th>
							<td><input class="inputText" type="text" name="product_name"></td>
						</tr>
						
						
						<c:choose>
							<c:when test="${type eq 'coffee'}">
							<!-- ===== 커피 COFFEE INSERT FORM START ===== -->
								<tr>
									<th>종류</th>
									<td>
										<input id="cap" type="radio" name="coffee_type" value="cap" hidden="" checked="checked">
										<label for="cap">캡슐커피</label>
										<input id="bean" type="radio" name="coffee_type" value="bean" hidden="">
										<label for="bean">원두커피</label>
										<input id="grind" type="radio" name="coffee_type" value="grind" hidden="">
										<label for="grind">분쇄커피</label>
										<input id="stick" type="radio" name="coffee_type" value="stick" hidden="">
										<label for="stick">스틱원두커피</label>
									</td>
								</tr>
								<tr>
									<th>용량</th>
									<td>
										<div class="unit">g</div>
										<input
											class="inputText numberOnly"
											type="text"
											name="coffee_capacity"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
										>
										
										<div class="selectBox numberOnly">
											<select>
												<option>직접입력</option>
												<option>140.7</option>
												<option>250</option>
											</select>
											<div class="selectArrow"></div>
										</div>
									</td>
								</tr>
								<tr>
									<th>원재료명 및 함량</th>
									<td>
										<input class="inputText" type="text" name="coffee_material">
										
										<div class="selectBox">
											<select>
												<option>직접입력</option>
												<option>아라비카 원두커피 100%</option>
												<option>인스턴트커피 85% 볶은커피 15%</option>
											</select>
											<div class="selectArrow"></div>
										</div>
									</td>
								</tr>
								<tr>
									<th>카페인함량</th>
									<td>
										<div class="unit">% 이하</div>
										<input class="inputText" type="text" name="coffee_caffeine">
										
										<div class="selectBox">
											<select>
												<option>직접입력</option>
												<option>아라비카 원두커피 100%</option>
												<option>인스턴트커피 85% 볶은커피 15%</option>
											</select>
											<div class="selectArrow"></div>
										</div>
									</td>
								</tr>
							<!-- ===== 커피 COFFEE INSERT FORM END ===== -->
							</c:when>
						</c:choose>
						
						
						<tr>
							<th>가격</th>
							<td>
								<div class="unit">원</div>
								<input
									class="inputText numberOnly"
									type="text"
									name="product_price"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
								>
							</td>
						</tr>
						<tr>
							<th>제조사</th>
							<td>
								<input class="inputText" type="text" name="product_manufacturer">
								
								<div class="selectBox">
									<select>
										<option>직접입력</option>
										<option>ILLY CAFFE S.P.A</option>
										<option>Magic L'Espresso S.L.</option>
									</select>
									<div class="selectArrow"></div>
								</div>
							</td>
						</tr>
						<tr>
							<c:choose>
								<c:when test="${type eq 'machines'}"><th>제조국</th></c:when>
								<c:otherwise><th>원산지</th></c:otherwise>								
							</c:choose>
							<td>
								<input class="inputText" type="text" name="product_origin">
								<div class="selectBox">
									<select>
										<option>직접입력</option>
										<option>이탈리아</option>
										<option>스페인</option>
									</select>
									<div class="selectArrow"></div>
								</div>
							</td>
						</tr>
						<tr>
							<th>수입판매원</th>
							<td><input class="inputText" type="text" value="㈜큐로홀딩스" readonly="readonly"></td>
						</tr>
					</table>
					
					<textarea class="contents"></textarea>
				</form>
				
				
				
				
				
				
				
				
				
				
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/admin/adFooter.jsp"></c:import>
	</div>
</body>
	
	<script type="text/javascript">
	
	$().ready(function(){
		$('.contents').summernote();
	});
	
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
	$('select').change(function(){
		let inputBox = $(this).parent().prev()
		let selectedIndex = $(this).prop('selectedIndex');
		if (selectedIndex == 0) {
			inputBox.removeAttr('readonly', true);
			inputBox.val("");
		} else {
			inputBox.attr('readonly', "");
			inputBox.val($(this).val());
			inputBox.focus();
		}
	});
	</script>
</html>