<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/member.css">
	<style type="text/css">
		#right_content{width:1000px;float:left;padding-left:40px; }
	</style>

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
					<div class = "mypage_title">
						<h1>회원정보 변경</h1>
					</div>
					
					<strong><p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해 주세요.</p></strong>
					
					<form action="/" method="get">
						<div id="change_member_check">
							<dl>
								<dt>아이디</dt>
								<dd><strong>강동욱</strong></dd>
							</dl>
							<dl>
								<dt>비밀번호</dt>
								<input type="password">
							</dl>
						</div>
						<div class="btn_center_box">
							<button class="btnDefault">취소</button>
							<button class="btnDefault red">인증하기</button>
						</div>
					</form>

				</div>
				<!--right_content END-->
			</div>
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
</body>
</html>