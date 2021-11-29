<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/member.css">
	<style type="text/css">
		
	</style>

<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>	
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>	
		<div id="container">
				
			<div id="contents">
			
				<div class="member_wrap">
					<h2>아이디 찾기</h2>
					<div class="member_con">
						<div class="find_section">
							<h3>회원 아이디찾기</h3>
							<div class="find_label_sectoin">
								<input type="checkbox" class="find_email">
								<label class="choice" for>이메일</label>
								<input type="checkbox" for="find_phone">
								<label class="choice">이메일</label>
							</div> <!-- find_label_section end -->
							<div class="find_account_input_section">
								<input id="find_input_member_name">
								<input id="find_input_member_email">
								<select class="select_email">
									<option value="self">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="icloud.com">icloud.com</option>
								</select>
							</div> <!-- find_account_input_section end -->
							<button class="find_account">
								아이디 찾기
							</button>
						</div> <!-- find_section end-->
						<div class="button_section">
							<button>비밀번호 찾기</button>
							<button>회원가입 찾기</button>
						</div> <!-- button_section end -->
					</div> <!-- member_con end -->
				</div><!-- member_wrap end -->
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
</body>
</html>