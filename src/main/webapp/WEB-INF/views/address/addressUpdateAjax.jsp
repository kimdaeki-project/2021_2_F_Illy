<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/css/address/addressInsert.css">

<form method="post" action="../address/myAddressInsert" name="myAddressInsert">
	<div class="ajax_scroll">
		<h5>배송지 등록</h5>
		
		<div class="ajax_scroll_table">
			<table>
				<tbody>
					<tr>
						<th scope="row">
							<span class="essential">배송지 이름</span>
						</th>
						<td>
							<input type="text" name="address_name" id="address_name" value="${addressVO.address_name}">
							<input type="hidden" id="address_id" value="${addressVO.address_id}">
						</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="essential">받으실 분</span>
						</th>
						<td>
							<input type="text" name="address_recipient_name" id="address_recipient_name" value="${addressVO.address_recipient_name}">
						</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="essential">받으실 곳</span>
						</th>
						<td>
							<div class="address_postcode">
								<input type="text" name="address_postcode" id="sample66_postcode" readonly="true" value="${addressVO.address_postcode}">
								<button class="addressPostcodeModal" type="button" onclick="postcode()">우편번호검색</button>
							</div>
							<div class="address_input">
								<input type="hidden" name="address_myAddress" id="address_myAddress" value="yes">
								<input type="hidden" name="address_default" id="address_default" value="${addressVO.address_default}">
								<input type="hidden" name="member_id" id="member_id" value="${addressVO.member_id}">
								<input type="hidden" name="main_address" id="main_address" class="mainAddressModal" value="${addressVO.main_address}">
								<input type="hidden" name="address_reference" id="address_reference" class="addressReferenceModal" value="${addressVO.address_reference}">
								<input type="text" id="sample66_address" readonly="true" value="${addressVO.main_address}&nbsp;${addressVO.address_reference}">
								<input type="text" id="sample66_detailAddress" name="address_detail" placeholder="상세주소" value="${addressVO.address_detail}">
							</div>						
						</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="essential">휴대폰 번호</span>
						</th>
						<td>
							<input type="text" name="address_recipient_phone" id="address_recipient_phone" value="${addressVO.address_recipient_phone}">
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- ajax_scroll_table end -->
		<div class="ajax_scroll_addressDefault">
			<input type="checkbox" id="ajaxDefaultAddress" value="${addressVO.address_default}">
			<label for="ajaxDefaultAddress"><b>기본 배송지로 설정 합니다.</b></label>
		</div><!-- ajax_scroll_addressDefault end -->
	</div><!-- ajax_scroll end -->
	
	<div class="btn_center_box">
		<button type="button" class="btn_cancel_box delivery_a_close">
			<strong>취소</strong>
		</button>
		<button type="button" class="btn_coupon_chk delivery_a_up">
			<strong>저장</strong>
		</button>	
	</div>
</form>







<script type="text/javascript">
defaultAddress();

function postcode() {
	new daum.Postcode(
			{
				
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수
					var eextra = '';
					
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
							eextra='(' + extraAddr + ')';
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						/* document.getElementById("sample6_extraAddress").value = extraAddr; */

					} /* else {
						document.getElementById("sample6_extraAddress").value = '';
					} */

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample66_postcode').value = data.zonecode;
					document.getElementById("sample66_address").value = addr+extraAddr;
					$('.mainAddressModal').val(addr);
					$('.addressReferenceModal').val(eextra);
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample66_detailAddress")
						.focus();
				}
		}).open();
}

//기본배송지 유무
function defaultAddress() {
	let address_default=$('#ajaxDefaultAddress').val();
	if(address_default == 1){
		$('#ajaxDefaultAddress').prop('checked', true);
		$('#ajaxDefaultAddress').next().addClass('on');
	}else {
		$('#ajaxDefaultAddress').prop('checked', false);
		$('#ajaxDefaultAddress').next().removeClass('on');
	}
}

//배송지관리 모달창 없애기
$('.delivery_a_close').click(function(){
	
	let member_id = $("#member_id").val();
	console.log(member_id);
	
	$.ajax({
		type:"GET",
		url:"../address/myAddressList",
		data: {
			member_id:member_id
		},
		success: function(result){
			result=result.trim();
			$('.delivery_modal_cont').html(result);

			location.href="http://localhost/payment/paymentList";
		},
		error:function(xhr, status, error){
			console.log('error');
		}
	});
	
	
	$('.delivery_modal_list').addClass('dn'); 
	$("body").css("overflow","auto");//body 스크롤바 생성
	
});

//기본배송지로 추가
$('#ajaxDefaultAddress').click(function(){
	let address_default=$(this).val();

	if(address_default ==1 ){
		$(this).prop('checked', true);
		$(this).next().addClass('on');
		$('#ajaxDefaultAddress').prop('diabled', true);
	}else {
		if($(this).next().hasClass('on') == true){
			$(this).prop('checked', false);
			$(this).next().removeClass('on');
			$('#address_default').val(0);
		}else {
			$(this).prop('checked', true);
			$(this).next().addClass('on');
			$('#address_default').val(1);
		}
	}
});




$('.delivery_a_up').click(function(){
	let address_name=$('#address_name').val();
	let address_recipient_name=$('#address_recipient_name').val();
	let address_recipient_phone=$('#address_recipient_phone').val();
	let address_postcode=$('#sample66_postcode').val();
	let main_address=$('#main_address').val();
	let address_reference=$('#address_reference').val();
	let address_detail=$('#sample66_detailAddress').val();
	let address_default=$('#address_default').val();
	let address_myAddress=$('#address_myAddress').val();
	let member_id=$('#member_id').val();
	
	console.log(member_id);
	if($('#ajaxDefaultAddress').next().hasClass('on') == true){
		//기본배송지 변경O
	  	$.ajax({
			type:"POST",
			url:"../address/myDefaultAddressUpdate",
			data: {
				address_id:$('#address_id').val(),
				address_name:$('#address_name').val(),
				address_recipient_name:$('#address_recipient_name').val(),
				address_postcode:$('#sample66_postcode').val(),
				main_address:$('#main_address').val(),
				address_reference:$('#address_reference').val(),
				address_detail:$('#sample66_detailAddress').val(),
				address_default:$('#address_default').val(),
				address_recipient_phone:$('#address_recipient_phone').val(),
				member_id:$('#member_id').val()
			},
			success: function(result){
				result=result.trim();
				$('.delivery_modal_cont').html(result);
			},
			error:function(xhr, status, error){
				console.log('error');
			}
		});
	}else {
		//기본배송지 변경X
 	  	$.ajax({
			type:"POST",
			url:"../address/myAddressUpdate",
			data: {
				address_id:$('#address_id').val(),
				address_name:$('#address_name').val(),
				address_recipient_name:$('#address_recipient_name').val(),
				address_postcode:$('#sample66_postcode').val(),
				main_address:$('#main_address').val(),
				address_reference:$('#address_reference').val(),
				address_detail:$('#sample66_detailAddress').val(),
				address_default:$('#address_default').val(),
				address_myAddress:$('#address_myAddress').val(),
				address_recipient_phone:$('#address_recipient_phone').val(),
				member_id:$('#member_id').val()
			},
			success: function(result){
				result=result.trim();
				$('.delivery_modal_cont').html(result);
			},
			error:function(xhr, status, error){
				console.log('error');
			}
		});
	}

});

</script>