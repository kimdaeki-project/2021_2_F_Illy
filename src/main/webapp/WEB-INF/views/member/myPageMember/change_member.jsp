<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/member.css">
	<style type="text/css">
		#right_content{width:1000px;float:left;padding-left:40px; }
	</style>

<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>	
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>	
		<div id="container">
				
			<div id="contents">
			<c:import url="/WEB-INF/views/navbar/myPageLeftBar.jsp"></c:import>	
				<div id="right_content">

			
					<div id="member_join_header" class="change_member_header">
				<sec:authentication property="principal" var="user"/>
					<h2>회원정보 변경</h2>
				</div>
					<div class="member_join_agreement_container change_member_container">
						<h3>기본정보</h3>
						<form:form modelAttribute="addressVO" enctype="multipart/form-data" method="post">
						<table class="member_join_table member_change_table">
							<tbody>
								<tr>
									<th><span>아이디</span></th>
									<td>
										<span id="username">${member.username}</span>
									</td>
								</tr>
								<tr>
									<th><span>비밀번호</span></th>
									<td class="change_password">
									<div id="btn_common_box">
										<a href="#"><em>비밀번호 변경</em></a>
										<a href="#"><em>비밀번호 도움말</em></a>
									</div>
									<div class="modal_rayout">
										
									</div>
									<div class="modal">
										<div class="modal_title">
											<strong>비밀번호 도움말</strong> 
										</div>
										<div class="modal_body">
											<ul>
												<li>영문대소문자는 구분이 되며, 한가지 문자로만 입력은 위험합니다.</li>
												<li>사용가능 특수문자 : !@#$%^&*()_+-=`~</li>
												<li>ID/주민번호/생일/전화번호 등의 개인정보와 통상 사용 순서대로의 3자 이상 연속 사용은 피해주세요. 비밀번호는 주시적으로 바꾸어 사용하시는 것이 안전합니다.</li>
											</ul>
										</div>
									</div>
									<div class="change_password_input">
										<dl><dt>현재 비밀번호</dt> <dd><input type="password" id="check_password"></dd></dl>
										<div id="password_check_message_section" id="nowPassword"></div>
										<dl><dt>새 비밀번호</dt> <dd><form:password path="password"/></dd></dl>
										<div id="password_new_message_section"></div>
										<dl><dt>새 비밀번호 확인</dt> <dd><input type="password" id="checkNewPassword"> <button type="button" class="btnDefault red" id="change_password_btn">비밀번호 변경</button></dd></dl>
										<div id="password_overlap_message_section"></div>	
					
									</div>
									</td>
								</tr>
								<tr>
									<th><span>이름</span></th>
									<td>
										<span>${member.member_name}</span>
										<div class="errors_section">
											
										</div>
									</td>
								</tr>
								
								<tr>
									<th><span>이메일</span></th>
									<td>
										<form:input path="member_email" value="${member.member_email}" />
										<div class="errors_section">
											<form:errors path="member_email"></form:errors>
										</div>
									</td>
								</tr>
								
								<tr>
									<th><span>휴대폰번호</span></th>
									<td>
										<form:input path="member_phone" value="${member.member_phone}" />
										<div class="errors_section">
											<form:errors path="member_phone"></form:errors>
										</div>
									</td>
								</tr>
								<tr>
									<th><span>주소</span></th>
									<td>
										<form:input path="address_postcode" id="sample6_postcode" placeholder="우편번호" readonly="true" />
										<input type="button" class="address_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										<br>
										<form:input path="main_address" id="sample6_address" class="address_input" placeholder="주소" readonly="true" value="${address.main_address}${address.address_reference}"/>
										<form:input path="address_reference" class="address_input" placeholder="참고항목" id="sample6_extraAddress" readonly="true" />
										<br>
										<form:input path="address_detail" class="address_input" placeholder="상세주소" id="sample6_detailAddress" />
										<div class="error_section">
											<form:errors path="main_address"></form:errors>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						</form:form>
					</div>
					<div class="btn_center_box">
						<button id="btn_cancel" class="submit_btn">취소</button>
						<button id="btn_submit" class="submit_btn" type="button" class="submit_btn">회원변경</button>
					</div>
				</div>
				<!--right_content END-->
			</div>
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>	
		
		
	</div>
	<script type="text/javascript">
	$("document").ready(function(){
		$(".change_password_input").hide();
		$(".modal").hide();
	})
	
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ""; // 주소 변수
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
								extraAddr = '(' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;
						} 
						else {
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
	$("a:first-child").click(function() {
		if ($(".change_password_input").is(':visible')){
			$(".change_password_input").hide();
		}
		else if ($(".change_password_input").is(':visible') == false) {
			$(".change_password_input").show();
		}
	})
	
	$("a:last-child").click(function() {
		if($(".modal").is(":visible")) {
			$(".modal").hide();
		}
		
		else if ($(".modal").is(":visible") == false ) {
			$(".modal").show();
		}
	})
	
	// 현재 비밀번호와 동일한지 확인하는 함수
	let passwordCheck = function() {
		$.ajax({
			url : "./myPage/checkPassword",
			method : "POST",
			data : {
				username : $('#username').html(),
				password : $('#check_password').val()
			},
			success : function(data) {
				if(data.trim() == "false") {
					alert("오류!")
				}
			}
		})
	}
	
	$("#btn_submit").click(function(){
		$.ajax({
			url : "./myPage/updateMember",
			method : "post",
			data : {
				password : $("#password").val(),
				member_email : $("#member_email").val(),
				member_phone : $("#member_phone").val(),
				address_reference : $("#sample6_extraAddress").val(),
				address_detail : $("#sample6_detailAddress").val(),
				address_postcode : $("#sample6_postcode").val(),
			}
		})
	})
	
	$("#change_password_btn").click(function(){
		$.ajax({
			url : "./changePassword",
			method : "POST",
			data : {
				nowPassword : $("#check_password").val(),
				password : $("#password").val(),
				checkNewPassword : $("#checkNewPassword").val()
			},
			success: function(data) {
				if(data.trim()=="false") {
					alert("현재 비밀번호와 같지 않습니다. 비밀번호가 변경되지 않았습니다.")
				}
				else if(data.trim()=="changeFale"){
					alert("변경에 실패하였습니다.");
				}
				else if(data.trim()=="passwordNotSame") {
					alert("비밀번호가 같지 않습니다.")
				}
				else if(data.trim()=="changeSuccess") {
					alert("비밀번호 변경에 성공하였습니다.")
				}
			}
		})
	})
	
	
	</script>
</body>
</html>