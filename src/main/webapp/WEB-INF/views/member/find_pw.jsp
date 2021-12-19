<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<h2>비밀번호 찾기</h2>
					<div class="member_con" id="find_member_con">
						<form action="find_pw" method="get">
							<div class="find_section">
								<h3 id="find_pw_title">아이디 입력</h3>
								<p id="find_pw_info">비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
								<div class="find_pw_con">
									<div class="member_warning">
										<div class="find_id_error_msg_section">
											<input type="text" placeholder="아이디" id="find_pw_input">
											<p>
												아이디를 모르시나요?
												<a href="./findId">아이디찾기</a>
											</p>
										</div>

										<div class="btn_center_box">
											<button class="btnDefault red" id="findEmail" type="button">확인</button>
										</div>
									</div>
									<!-- member_warning end -->
								</div>
							</div>
							<!-- find_section end-->
						</form>
					</div>
					<!-- member_con end -->
				</div>
				<!-- member_wrap end -->
			</div>

		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>
	</div>
	<script type="text/javascript">
		$("#findEmail").click(function(){
			$.ajax({
				url : "findEmail",
				method : "POST",
				data : {
					username : $("#find_pw_input").val()
				},
				success: function(data) {
					console.log(data.trim())
					if($("#find_pw_input").val()==""){
						alert("아이디를 입력해주세요.")
						return;
					}
					if(data.trim() == "false") {
						alert("일치하지 않는 계정입니다.")
					}
					if(data.trim()=="success") {
						alert("임시 비밀번호가 발급되었습니다.")
					}
				}
			})
		})
	</script>
</body>
</html>