<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/member.css">
<style type="text/css">
#right_content {
	width: 1000px;
	float: left;
	padding-left: 40px;
}
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
					<div class="secessionHead">
						<h2>회원탈퇴</h2>
					</div>
					<div class="infoHead">
						<h3>01.회원탈퇴 안내</h3>
					</div>
					<div class="infoBody">
						일리카페 코리아 탈퇴안내<br> <br>일리카페 공식몰을 이용하는데 불편함이 있으셨나요?<br>불편하셨던 점이나 불만사항응을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.<br> <br>일리카페 공식몰 이용약관 동의 철회 시 고객님께서 보유하셨던 쿠폰과 포인트는 모두 삭제되며, 재가입 시 복원이 불가능합니다. <br>일리카페 공식몰 이용약관 동의 철회 후 전자상거래등에서의 소비자보호에 관한 법률에 의거하여 회원님의 정보는 일정기간 관리된 후 파기됩니다. <br>진행 중인 전자상거래 이용내역(결제/배송/교환/반품 중인 상태)이 있거나 고객상담 및 이용 서비스가 완료되지 않은 경우 처리 과정에서의 불이익을 받을 수 있습니다.<br> <br>회원 탈퇴 후 60일간 재가입이 불가합니다.
					</div>

					<div class="infoHead">
						<h3>02. 정기배송 회원탈퇴</h3>
					</div>
					<div class="infoBody">
						정기배송 주문 고객 1:1 문의를 통해서 <br> 정산을 마무리 하신 후에 탈퇴가 가능합니다 <br> <br>
						<a href="/mypage/mypage_qa.php"> ■ 1:1 문의 바로가기 </a>
					</div>

					<div class="infoHead">
						<h3>03. 회원탈퇴 하기</h3>
					</div>
					<div class="infoTableBody">
						<table class="secessionTable">
							<colgroup>
								<col style="width: 15%">
								<col style="width: 85%">
							</colgroup>
							<tr>
								<th>비밀번호</th>
								<td>
									<input type="password" id="secessionPassword">
								</td>
							</tr>
							<tr>
								<th>탈퇴사유</th>
								<td>
									<div id="Reason">
										<ul class="hack_out_list">
											<li><input type="checkbox" id="reason1" name="" class="checkbox" value="1"><label for="reason1" class="">고객서비스(상담,포장 등) 불만</label></li>
											<li><input type="checkbox" id="reason2" name="" class="checkbox" value="2"><label for="reason2" class="">배송불만</label></li>
											<li><input type="checkbox" id="reason3" name="" class="checkbox" value="3"><label for="reason3" class="">교환/환불/반품 불만</label></li>
											<li><input type="checkbox" id="reason4" name="" class="checkbox" value="4"><label for="reason4" class="">방문 빈도가 낮음</label></li>
											<li><input type="checkbox" id="reason5" name="" class="checkbox" value="5"><label for="reason5" class="">상품가격 불만</label></li>
											<li><input type="checkbox" id="reason6" name="" class="checkbox" value="6"><label for="reason6" class="">개인 정보유출 우려</label></li>
											<li><input type="checkbox" id="reason7" name="" class="checkbox" value="7"><label for="reason7" class="">쇼핑몰의 신뢰도 불만</label></li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th>남기실 말씀</th>
								<td>
									<textarea rows="5" cols="30" id="comment"></textarea>
								</td>
							</tr>
						</table>
					</div>
					<div class="btn_center_box" style="gap: 10px">
						<button class="btnDefault" style="width: 100px">취소</button>
						<button class="btnDefault red" style="width: 100px" type="button" id="secession_btn">전송</button>
					</div>
				</div>
				<!--right_content END-->
			</div>
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>
	</div>
	<script type="text/javascript">
	let checkbox = function() {
		if($("input:checkbox:checked").length < 1) {
			return false;
		}
		else if($("input:checkbox:checked").length > 0) {
			return true;
		}
	}
	
	$("#secession_btn").click(function(){
		let check = checkbox();
		if($("#secessionPassword").val()=="") {
			alert("비밀번호를 입력해주세요.");
		}
		else if(check == false) {
			alert("하나 이상의 탈퇴 사유를 입력하세요.");
		}
		else if($("#secessionPassword").val()!='' && check == true) {
			$.ajax({
				url : "./memberOut",
				method : "POST",
				data : {
					password : $("#secessionPassword").val()
				},
				success : function(result) {
					if(result.trim() == "false") {
						alert("잘못된 비밀번호 입니다.")
					}
					else if(result.trim() == "true") {
						alert("계정이 삭제 되었습니다.")
						location.href = "/member/logout"
					}
				}
			})
		  }
	})
	</script>
</body>
</html>