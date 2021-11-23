<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/join_agreement.css">
<style type="text/css">
</style>

<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="../navbar/navbar.jsp"></c:import>
		<div id="container">
			<div id="contents">
				<div id="member_join_header">
					<h2>회원가입</h2>
					<ol>
						<li class="page_on">01 약관동의></li>
						<li>02 정보입력></li>
						<li>03 가입완료</li>
					</ol>
				</div>
				<form:form modelAttribute="memberVO" enctype="multipart/form-data" method="post">
					<div class="member_join_agreement_container">
						<h3>기본정보</h3>

						<table class="member_join_table">
							<tbody>
								<tr>
									<th><span>아이디</span></th>
									<td>
										<form:input path="username" />
										<div class="errors_section">
											<form:errors path="username"></form:errors>
										</div>
									</td>
								</tr>
								<tr>
									<th><span>비밀번호</span></th>
									<td>
										<form:input path="password" />
										<div class="errors_section">
											<form:errors path="password"></form:errors>
										</div>
									</td>
								</tr>
								<tr>
									<th><span>비밀번호 확인</span></th>
									<td>
										<input type="text">
									</td>
								</tr>
								<tr>
									<th><span>이름</span></th>
									<td>
										<form:input path="member_name" />
										<div class="errors_section">
											<form:errors path="member_name"></form:errors>
										</div>
									</td>
								</tr>
								<tr>
									<th><span>휴대폰번호</span></th>
									<td>
										<form:input path="member_phone" />
										<div class="errors_section">
											<form:errors path="member_phone"></form:errors>
										</div>
									</td>
								</tr>
								<tr>
									<th><span>생일</span></th>
									<td>
										<form:input type="date" path="member_birth" cssClass="birth_input" />
										<form:errors path="member_birth"></form:errors>
									</td>
								</tr>
								<tr>
									<th><span>주소</span></th>
									<td>
										<form:input path="address_num" id="sample6_postcode" placeholder="우편번호" readonly="true" />
										<input type="button" class="address_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										<br>
										<form:input path="main_address" id="sample6_address" class="address_input" placeholder="주소" readonly="true" />
										<br>
										<form:input path="address_reference" class="address_input" placeholder="참고항목" id="sample6_extraAddress" readonly="true" />
										<form:input path="address_detail" class="address_input" placeholder="상세주소" id="sample6_detailAddress" />
										<form:errors path="main_address"></form:errors>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_center_box">
						<button id="btn_cancel" class="submit_btn">취소</button>
						<button id="btn_submit" class="submit_btn" type="button" class="submit_btn">회원가입</button>
					</div>
				</form:form>
			</div>
		</div>
		<c:import url="../navbar/footer.jsp"></c:import>
	</div>
	<script>
		$(document).ready(function() {
			$(".birth_input").val(getToday())
		});
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}

		// 현재 년도, 월, 일 구하는 함수 (생일 value 값에 들어감)
		function getToday() {
			let date = new Date();
			return date.getFullYear() + "-" + (date.getMonth() + 1) + "-"
					+ date.getDate();
		}

		$(".submit_btn").click(function() {
			$("#memberVO").submit();
		})
	</script>
</body>
</html>