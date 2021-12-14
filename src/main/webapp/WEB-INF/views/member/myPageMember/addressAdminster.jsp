<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/member/myPage/myPageCommon.css">
<link rel="stylesheet" href="/css/member/myPage/myPageOrder.css">
<link rel="stylesheet" href="/css/member/myPage/myPageCancel.css">
<link rel="stylesheet" href="/css/member/myPage/myPageCoupon.css">
<link rel="stylesheet" href="/css/member/myPage/myPageIcon.css">
<link rel="stylesheet" href="/css/member.css">
<!-- 마이페이지 회원 요약정보 css 들어있는 곳 -->
<style type="text/css">
#right_content {
	width: 1000px;
	float: left;
	padding-left: 40px;
	min-height: 500px;
}

.myPage_cont {
	padding-bottom: 50px;
}

.pagination .btnPage {
	min-width: 26px;
	background-color: #fff;
	border: 1px solid #e0e0e0;
	cursor: pointer;
	color: #888;
	font-size: 11px;
	padding: 6px 4px 10px 4px;
}

.pageNum {
	cursor: pointer;
	display: inline-block;
	font-size: 11px;
	color: #888;
	height: 30px;
	width: 30px;
	line-height: 30px;
	vertical-align: middle;
}

.pageNum.on {
	font-weight: bold;
	color: #fff;
	background-color: #7a7d81;
	border-radius: 20px;
}

.pagination {
	text-align: center;
	margin-top: 60px;
	cursor: pointer;
}

.emptyList {
	width: 100%;
	text-align: center;
	position: relative;
	padding: 50px 30px;
	font-size: 12px;
	color: #333;
}
</style>

<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>
		<div id="container">
			<sec:authentication property="principal" var="member" />
			<div id="contents">
				<c:import url="/WEB-INF/views/navbar/myPageLeftBar.jsp"></c:import>
				<div id="right_content">
					<div class="myPage_cont">
						<div class="myPageTitle">
							<h3>배송지 관리</h3>
							<span>배송지 관리 내역 총 0건</span>
						</div>
						<div id="addAddressBtnSection">
							<a id="addressAddBtn">+새 배송지 추가</a>
						</div>
						<div id="addressTable">
							<table>
								<colgroup>
									<col style="width: 12%">
									<col style="width: 12%">
									<col>
									<col style="width: 20%">
									<col style="width: 12%">
								</colgroup>
								<thead>
									<tr>
										<th>배송지이름</th>
										<th>받으실 분</th>
										<th>주소</th>
										<th>연락처</th>
										<th>수정/삭제</th>
									</tr>
								</thead>
								<tbody>
									<tr>
			
										<td>
											<span>(기본배송지)</span>
											<strong>집</strong>
										</td>
										<td>강도욱</td>
										<td>서울시 동대문구 용두동</td>
										<td>
										<span>휴대폰 : ㅁㄴㅇ</span>
										<span>전화번호 : ㅁㄴㅇ</span>
										</td>
										<td>
                                		<span class="btn_gray_list"><a href="#" class="" ><span>수정</span></a></span>
                                		<span class="btn_gray_list"><a href="#" class="" ><span>삭제</span></a></span>
                            			</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>