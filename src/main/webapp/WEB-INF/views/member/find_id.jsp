<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
 <meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
 <meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
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
					<h2>아이디찾기</h2>
					<div class="member_con" id="find_member_con">
					<form action="find_id" method="get">
						<div class="find_section">
							<h3>회원 아이디찾기</h3>
							<div class="find_label_sectoin">
								<input type="radio" class="find_email" name="check" value="email" checked="checked">
								<label class="choice" for="find_email">이메일</label>
								<input type="radio" class="find_phone" name="check" value="phone">
								<label class="choice" for="find_phone">휴대폰번호</label>
							</div> <!-- find_label_section end -->
							<div class="find_con">
								<div class="find_account_input_section">
									<input id="find_input_member_name" placeholder="이름">
									<input id="find_input_member_email" placeholder="이메일">
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
									<input id="find_input_member_phone" placeholder="휴대폰번호">
								</div> <!-- find_account_input_section end -->
								<button type="button"class="find_account">
									아이디 찾기
								</button>
							</div>
							<div class="find_id_error_msg_section"></div>
						</div> <!-- find_section end-->
						</form>
						<div class="btn_center_box">
							<button class="btnDefault" id="find_password">비밀번호 찾기</button>
							<button class="btnDefault red" id="join">회원가입</button>
						</div> <!-- button_section end -->
					</div> <!-- member_con end -->
				</div><!-- member_wrap end -->
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#find_input_member_phone").attr("style","display:none !important")
		$("#find_input_member_phone").attr("disabled", true)
		$('#find_input_member_email').show()
		$('#find_input_member_email').attr("disabled", false)
		$(".select_email").show()
	})
	
		$(".find_email").click(function(){
			$("#find_input_member_phone").attr("style","display:none !important")
			$("#find_input_member_phone").attr("disabled", true)
			$('#find_input_member_email').show()
			$('#find_input_member_email').attr("disabled", false)
			$(".select_email").show()
		})
		
		$(".find_phone").click(function(){
			$("#find_input_member_email").attr("style", "display:none !important")
			$("#find_input_member_email").attr("disabled", true)
			$(".select_email").attr("style", "display:none !important")			
			$("#find_input_member_phone").attr("disabled", false)
			
			$("#find_input_member_phone").show()
		})
		
		$(".find_account").click(function(){
			if($(".find_email").is(":checked")){
				$.ajax({
					url : "./find_id",
					method : "get",
					data: {
						member_name : $("#find_input_member_name").val(),
						member_email : $("#find_input_member_email").val()
					},
					success: function(data) {
						if(data.trim() == '회원 정보를 찾을 수 없습니다.') {
							$(".find_id_error_msg_section").html(data.trim())
						}
						else if(data.trim() != '회원 정보를 찾을 수 없습니다.') {
							$(".find_section").html('<p class = "find_id_success_msg">'+$("#find_input_member_name").val() +' 회원님의 아이디는'+'<br>'+'<strong>'+data.trim()+'</strong>'+' 입니다'+'</p>')
						}
					}
				})
			}
			else if($(".find_phone").is(":checked")) {
				$.ajax({
					url : "./find_id",
					method : "get",
					data : {
						member_name : $("#find_input_member_name").val(),
						member_phone : $("#find_input_member_phone").val()
					},
					success : function(data) {
						console.log()
						if(data.trim() == '회원 정보를 찾을 수 없습니다.') {
							$(".find_id_error_msg_section").html(data.trim())
						}
						else if(data.trim() != '회원 정보를 찾을 수 없습니다.') {
							$(".find_section").html('<p class = "find_id_success_msg">'+$("#find_input_member_name").val() +' 회원님의 아이디는'+'<br>'+'<strong>'+data.trim()+'</strong>'+' 입니다'+'</p>')
						}
					}
				})
			}
		})
			
		$("#find_password").click(function(){
			location.href="./findPw"
		}) 
		
		$("#join").click(function(){
			location.href="./join"
		}) 
	</script>
</body>
</html>