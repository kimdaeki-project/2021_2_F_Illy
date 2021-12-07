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
</style>

<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="../navbar/navbar.jsp"></c:import>
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>
		<div id="container">
			<div id="contents">
			<c:import url="/WEB-INF/views/navbar/myPageLeftBar.jsp"></c:import>	
				<div id="member_join_header" class="change_member_header">
				<sec:authentication property="principal" var="user"/>
					<h2>회원정보 변경</h2>
				</div>
				
					<div class="member_join_agreement_container change_member_container">
						<h3>기본정보</h3>
						<form:form modelAttribute="addressVO" enctype="multipart/form-data" method="post">
						<table class="member_join_table">
							<tbody>
								<tr>
									<th><span>아이디</span></th>
									<td>
										<form:input path="username" />
										<div class="errors_section" id="username_error">
											<form:errors path="username"></form:errors>
										</div>
									</td>
								</tr>
								<tr>
									<th><span>비밀번호</span></th>
									<td>
										<form:input type="password" path="password" />
										<div class="errors_section">
											<form:errors path="password"></form:errors>
										</div>
									</td>
								</tr>
								<tr>
									<th><span>비밀번호 확인</span></th>
									<td>
										<input type="password" id="password_check">
										<div class="errors_section" id="password_check_error">
										</div>
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
									<th><span>Email</span></th>
									<td>
										<form:input path="member_email" />
										<div class="errors_section">
											<form:errors path="member_email"></form:errors>
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
										<form:input path="address_postcode" id="sample6_postcode" placeholder="우편번호" readonly="true" />
										<input type="button" class="address_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										<br>
										<form:input path="main_address" id="sample6_address" class="address_input" placeholder="주소" readonly="true" />
										<br>
										<form:input path="address_reference" class="address_input" placeholder="참고항목" id="sample6_extraAddress" readonly="true" />
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
		</div>
		
		
		<c:import url="../navbar/footer.jsp"></c:import>
	</div>