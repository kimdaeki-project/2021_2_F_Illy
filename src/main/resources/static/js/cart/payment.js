/**
 * 
 */

//이메일 select option함수
function optionChange(value) {
	let selectedMail = $('.selectedMail').val();
	selectedMail = selectedMail.split('@', 1);
	
	console.log(selectedMail+value);
	$('.selectedMail').val(selectedMail+value);
}


//우편번호찾기 - API
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
						/* document.getElementById("sample6_extraAddress").value = extraAddr; */

					} /* else {
						document.getElementById("sample6_extraAddress").value = '';
					} */

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr+extraAddr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_detailAddress")
						.focus();
				}
		}).open();
}

//배송지 주소 선택
$('.delivery_control').find('.dC').click(function(){
	
	
	$('.choice_s').removeClass('on');
	$(this).next().addClass('on');
});

//최근배송지 선택
$('#latest').click(function(){
	if($('.delivery_name').prev().val() == ''){
		$(this).prop('checked', false);
		alert('최근 배송지가 없습니다.');
		$(this).next().removeClass('on');
		$('#selfDelivery').next().addClass('on');
		$('.delivery_name').val('');
		$('.delivery_postcode').val('');
		$('.address_reference').val('');
		$('.delivery_phone').val('');
		
	}else {
		$('.delivery_name').val($('.delivery_name').prev().val());
		$('.delivery_postcode').val($('.delivery_postcode').prev().val());
		$('.address_reference').val($('.address_reference').next().val());
		$('.address_detail').val($('.address_detail').prev().val());
		$('.delivery_phone').val($('.delivery_phone').prev().val());
	}
});

//기본배송지 선택
$('#default').click(function(){
	if($(this).prev().val() == ''){
		$(this).prop('checked', false);
		alert('기본 배송지가 없습니다.');
		$(this).next().removeClass('on');
		$('#selfDelivery').next().addClass('on');
		$('.delivery_name').val('');
		$('.delivery_postcode').val('');
		$('.address_reference').val('');
		$('.delivery_phone').val('');
		
	}else {
		$('.delivery_name').val($(this).prev().prev().prev().prev().prev().prev().val());
		$('.delivery_postcode').val($(this).prev().prev().prev().prev().prev().val());
		$('.address_reference').val($(this).prev().prev().prev().prev().val());
		$('.address_detail').val($(this).prev().prev().prev().val());
		$('.delivery_phone').val($(this).prev().prev().val());
	}
});

//배송지 - 주문자 정보와 동일
$('#sameDelivery').click(function(){
	let address = $('.address_read').text();
	let text = address.substr(7,address.length);
	
	$('.delivery_name').val($('.order_name').val());
	$('.delivery_phone').val($('.order_phone').val());
	$('#sample6_postcode').val(address.substr(1, 5));
	$('#sample6_address').val($('#full_main_address').val());
	$('#sample6_detailAddress').val($('#full_address_detail').val());
});

//배송지 - 직접 입력
$('#selfDelivery').click(function(){
	$('.delivery_name').val('');
	$('.delivery_phone').val('');
	$('.delivery_postcode').val('');
	$('.address_input').val('');
});


//나의 배송지 추가
$('.delivery_add').find('#myDeliveryAdd').click(function(){
	if($(this).next().hasClass('on') === true){
		$('.check_s').removeClass('on');
		$('#myDeliveryAdd').val('no');
	}else {
		$('.check_s').addClass('on'); //**************************************************** */
		$('#myDeliveryAdd').val('yes');
	}
});

//결제정보
$('.payment_pay').find('.pC').click(function(){
	$('.pay_s').removeClass('on');
	$('.pay_s').prev().prop('checked', false);
	$(this).next().addClass('on');
	$(this).prop('checked', true);
	
});


//필수사항
$('#import_s').click(function(){
	if($('.import_s').hasClass('on') == true) {
		$('.import_s').removeClass('on');
		$(this).prop('checked', false);
	}else {
		$('.import_s').addClass('on');
		$(this).prop('checked', true);
	}
});


//쿠폰 적용하기
$('.coupon_use').click(function(){
	$('.coupon_modal_list').removeClass('dn'); //쿠폰 모달창 띄우기
	
	$("body").css("overflow","hidden");//body 스크롤바 없애기

});

//쿠폰 체크 - delivery
$('.coupon_element').on('click', '.delivery_one', function(){
	let coupon_delivery_sale = parseInt($(this).val());
	coupon_delivery_sale = coupon_delivery_sale.toLocaleString();
	
	
	let sum = $('.total_sum').html();
	sum = sum.replace(/,/g, "");
	sum = parseInt(sum);
   	
	
	if ($(this).is(':checked') == true) { //쿠폰선택
		$('.couponCheck_delivery').removeClass('on');
		$('.couponCheck_cart').removeClass('on');
		$(this).next().addClass('on');
		if(sum>0 && sum<50000) {
			$('.coupon_delivery_sale').html(coupon_delivery_sale);
			$('.coupon_product_sale').html(0);
   		} else {
   			$('.coupon_delivery_sale').html(0);
   			$('.coupon_product_sale').html(0);
	
		}
		
	}
	else { //쿠폰선택해제
		$(this).next().removeClass('on');
		$('.coupon_delivery_sale').html(0);
	}
});

//쿠폰 체크 - cart
$('.coupon_element').on('click', '.cart_one', function(){
	let coupon_product_sale = parseInt($(this).val());
	coupon_product_sale = coupon_product_sale.toLocaleString();
	
	if ($(this).is(':checked') == true) { //쿠폰선택
		$('.couponCheck_delivery').removeClass('on');
		$('.couponCheck_cart').removeClass('on');
		$(this).next().addClass('on');
		$('.coupon_product_sale').html(coupon_product_sale);
		$('.coupon_delivery_sale').html(0);
	}
	else { //쿠폰선택해제
		$(this).next().removeClass('on');
		$('.coupon_product_sale').html(0);
	}
});


//쿠폰 모달창 없애기 - 취소
$('.close_a_btn').click(function(){
	$('.coupon_modal_list').addClass('dn'); 
	$("body").css("overflow","auto");//body 스크롤바 생성
});

//쿠폰 모달창 없애기 - 쿠폰적용
$('.close_a_btn_coupon').click(function(){
	let deliverySale;
	let produdctSale;
	let ttPrice = $('.total_sum').html();
	ttPrice = ttPrice.replace(/,/g, "");
	
	$('.coupon_modal_list').addClass('dn');
	
	$('.coupon_element').each(function(){
		if($(this).find('.coupon_s').is(':checked') == true) {
			$('.coupon_use_ul').removeClass('dn');
			
			deliverySale=$('.coupon_delivery_sale').html();
			productSale=$('.coupon_product_sale').html();
			
			$('.productSale').html(productSale);
			$('.deliverySale').html(deliverySale);
			
			productSale= productSale.replace(/,/g, "");			
			deliverySale = deliverySale.replace(/,/g, "");
			
			ttPrice = parseInt(ttPrice)-parseInt(productSale)-parseInt(deliverySale)-$('.read_bean').val();
			$('.total_total_sum').html(ttPrice.toLocaleString());
			
			return false; 
			
		} else {
			$('.coupon_use_ul').addClass('dn');
			$('.productSale').html(0);
			$('.deliverySale').html(0);
			
			ttPrice = parseInt(ttPrice)-$('.read_bean').val();
			$('.total_total_sum').html(ttPrice.toLocaleString());
		}
	
	});
	
	$("body").css("overflow","auto");//body 스크롤바 생성
});


//포인트 전액 사용하기
$('#allBeanUse').click(function(){
	let allBean = parseInt($('.all_beanUse').attr('data-member-point'));
   let ttPrice = $('.total_sum').html();
	ttPrice = ttPrice.replace(/,/g, "");
	ttPrice = parseInt(ttPrice);
	let productSale = $('.productSale').html();
	productSale = productSale.replace(/,/g, "");
	productSale = parseInt(productSale);
	let deliverySale = $('.deliverySale').html();
	deliverySale = deliverySale.replace(/,/g, "");
	deliverySale = parseInt(deliverySale);
	
	//포인트 사용하기 - 보유 포인트가 0일 경우
	if($('.all_beanUse').attr('data-member-point') == 0) {
		$('.read_bean').attr('readonly', true);
		$('#allBeanUse').attr('disabled', true);
	}else {
		if($(this).next().hasClass('on') == true){
			$(this).next().removeClass('on');
			$(this).prop('checked', false);
			$('.read_bean').val('');
			ttPrice = ttPrice-productSale-deliverySale;
			ttPrice=ttPrice.toLocaleString();
			$('.total_total_sum').html(ttPrice);
		}else {
			$(this).next().addClass('on');
			$(this).prop('checked', true);
			$('.read_bean').val(allBean);
			ttPrice -= allBean;
			ttPrice = ttPrice-productSale-deliverySale;
			ttPrice=ttPrice.toLocaleString();
			$('.total_total_sum').html(ttPrice);
		}
	}
	
	

});

//포인트 사용하기
$('.read_bean').mouseleave(function(){
	let allBean = parseInt($('.all_beanUse').attr('data-member-point'));
   let ttPrice = $('.total_sum').html();
	ttPrice = ttPrice.replace(/,/g, "");
	ttPrice = parseInt(ttPrice);
	let productSale = $('.productSale').html();
	productSale = productSale.replace(/,/g, "");
	productSale = parseInt(productSale);
	let deliverySale = $('.deliverySale').html();
	deliverySale = deliverySale.replace(/,/g, "");
	deliverySale = parseInt(deliverySale);
	
	console.log($('.read_bean').val());
	
	//- 보유 포인트보다 많은 포인트를 적었을 때
	if($('.read_bean').val()>allBean){
		alert('보유 일리 포인트는 '+allBean+'콩 입니다.');
		$('.read_bean').val(allBean);
		ttPrice -= allBean;
		ttPrice = ttPrice-productSale-deliverySale;
		ttPrice=ttPrice.toLocaleString();
		$('.total_total_sum').html(ttPrice);
	} else{
		ttPrice -= $('.read_bean').val();
		ttPrice = ttPrice-productSale-deliverySale;
		console.log(ttPrice);
		ttPrice=ttPrice.toLocaleString();
		$('.total_total_sum').html(ttPrice);
	}
	
});


//배송지 관리
$('.delivery_myAddress').click(function(){
	$('.delivery_modal_list').removeClass('dn'); //모달창 띄우기
	
	$("body").css("overflow","hidden");//body 스크롤바 없애기

});

//배송지관리 모달창 없애기
$('.delivery_a_close').click(function(){
	$('.delivery_modal_list').addClass('dn'); 
	$("body").css("overflow","auto");//body 스크롤바 생성
});


//나의 배송지 삭제하기 - ajax
$('.delivery_myAddress_del').click(function(){
	let address_id = $(this).attr('data-myDelivery-del');
	let address_default = $(this).attr('data-default-chk');
	let address_name=$(this).prev().find('.address_name_modal').val();
	let member_id=$(this).prev().find('.member_id_modal').val();
	
	if(address_default == 1){
		alert('기본 배송지는 삭제할 수 없습니다. 변경 후 삭제해주세요.');
	}else{
	
		if(confirm('나의 배송지 ['+address_name+']을(를) 정말로 삭제하시겠습니까?')){
			$.ajax({
				type:"GET",
				url:"../address/myAddressDel",
				data: {
					address_id:address_id,
					member_id:member_id
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
			console.log('no');
		}
	}

});

//나의 배송지 수정하기
$('.delivery_myAddress_up').click(function(){
	console.log($(this).attr('data-address-id'));
	$.ajax({
		type:"GET",
		url:"../address/myAddressUpdate",
		data: {
			address_id:$(this).attr('data-address-id'),
			address_name:$(this).find('.address_name_modal').val(),
			address_recipient_name:$(this).find('.address_recipient_name_modal').val(),
			address_postcode:$(this).find('.address_postcode_modal').val(),
			main_address:$(this).find('.main_address_modal').val(),
			address_reference:$(this).find('.address_reference_modal').val(),
			address_detail:$(this).find('.address_detail_modal').val(),
			address_recipient_phone:$(this).find('.address_recipient_phone_modal').val(),
			address_default:$(this).find('.address_default_modal').val(),
			member_id:$(this).find('.member_id_modal').val()
		},
		success: function(result) {
			result = result.trim();
			$('.delivery_modal_cont').html(result);
		},
		error:function(xhr, status, error){
			console.log('error');
		}
	});
});

//나의 배송지 선택하기
$('.delivery_myAddress_chk').click(function(){
	console.log($(this).parent().next().next().next().next().next().find('.address_recipient_phone_modal').val());
	$('.delivery_name').val($(this).parent().next().next().next().next().next().find('.address_recipient_name_modal').val());
	$('.delivery_postcode').val($('.delivery_myAddress_up').find('.address_postcode_modal').val());
	$('.address_reference').val(
								$(this).parent().next().next().next().next().next().find('.main_address_modal').val() + ' ' +
								$(this).parent().next().next().next().next().next().find('.address_reference_modal').val()
								);
	$('.address_detail').val($(this).parent().next().next().next().next().next().find('.address_detail_modal').val());
	$('.delivery_phone').val($(this).parent().next().next().next().next().next().find('.address_recipient_phone_modal').val());
	
	$('.delivery_modal_list').addClass('dn'); //모달창 지우기
	$("body").css("overflow","auto");//body 스크롤바 생성
});


//새 배송지 추가하기
$('.new_delivery_add').click(function(){
	let member_id= $('.member_id').val();
	$.ajax({
		type:"GET",
		url:"../address/myAddressInsert",
		data: {
			member_id:member_id
		},
		success: function(result){
			result = result.trim();
			$('.delivery_modal_cont').html(result);
		},
		error:function(xhr, status, error){
			console.log('error');
		}
	});
});

//주문완료 insert 넣기
function paymentEnd(){
	let payment_comment=$('.long_cont').children().val();
	let allBean = $('.all_beanUse').attr('data-member-point');
	let payment_use_point=$('.read_bean').val();
	if(payment_use_point == '') {
		payment_use_point=0;
	}
	
	let payment_add_point=parseInt($('.add_bean').html());
	let payment_type;
	$('.payment_pay').each(function(){
		
		$(this).find('.pC').each(function(){
			if($(this).is(':checked') == true) {
				payment_type = $(this).val();
				
			};
		});
		
	});
	let payment_product_total=$(".ttPrice").html();
	let payment_total=$('.total_total_sum').html();
	let payment_name=$('.order_name').val();
	let payment_email=$('.selectedMail').val();
	let payment_delivery=$('.deliveryPrice').html();
	let payment_phone=$('.order_phone').val();
	let member_id = $('.member_id').val();
	let member_point = allBean - payment_use_point + payment_add_point;
	let coupon_id = 0;
	
	$('.coupon_element').each(function(){
		if($(this).find('.coupon_s').is(':checked') == true) {
			coupon_id=$(this).find('.couponID').val();
			
			return false; 
			
		}
	});
	
	let coupon_delivery_sale = parseInt($('.coupon_delivery_sale').html().replace(/,/g, ""));
	let coupon_product_sale = parseInt($('.coupon_product_sale').html().replace(/,/g, ""));
	
	let discount = coupon_delivery_sale+coupon_product_sale;
	let total_discount = discount+parseInt(payment_use_point);
	
	discount = discount.toLocaleString();
	total_discount = total_discount.toLocaleString();
	
	
	//배송지
	let address_name=$('.delivery_name').val();
	let address_recipient_name=$('.delivery_name').val();
	let address_recipient_phone=$('.delivery_phone').val();
	let address_postcode=$('.delivery_postcode').val().toString();
	let address_input=$('.address_reference').val();
	
	let main_address;
	let address_reference;
	if(address_input.indexOf('(')>-1){
	main_address=address_input.substring(0, address_input.lastIndexOf('(')-1);
	address_reference=address_input.substring(address_input.lastIndexOf('('));
		
	}else {
		main_address=address_input;
		address_reference='';
	}
	let address_detail=$('.address_detail').val();
	let address_myAddress=$('#myDeliveryAdd').val();
	
	$.ajax({
							async : false,
							type: "GET",
							url: "./insertPayment",
							data: {
								//결제 insert parameter
								payment_comment:payment_comment,
								payment_use_point:payment_use_point,
								payment_type:payment_type,
								payment_total:payment_total,
								payment_name:payment_name,
								payment_email:payment_email,
								payment_delivery:payment_delivery,
								payment_phone:payment_phone,
								payment_product_total:payment_product_total,
								payment_use_coupon:discount,
								payment_total_discount:total_discount,
								payment_add_point:payment_add_point,
								member_id:member_id,
								member_point:member_point,
								coupon_id:coupon_id,
								//배송 insert parameter
								address_name:address_name,
								address_recipient_name:address_recipient_name,
								address_recipient_phone:address_recipient_phone,
								address_postcode:address_postcode,
								main_address:main_address,
								address_reference:address_reference,
								address_detail:address_detail,
								address_myAddress:address_myAddress,
								address_default:0
							},
							success: function(result) {
								result
								location.href='./paymentEnd?payment_id=' + result;
							}
						});
}

$('.btn_center_order').click(function(){
	let patternPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;  //핸드폰 번호 올바른 패턴 확인하기

	//필수 동의 체크 여부
	if($('.import_s').hasClass('on') == true){
		if($('.order_name').val() == ''){
			alert('주문하시는 분 정보를 입력해 주세요.');
			$('.order_name').focus();
		}else if($('.order_phone').val() == '') {
			alert('주문하시는 분 휴대폰 번호 정보를 입력해 주세요.');
			$('.order_phone').focus();
		}else if($('.order_email').val() == '') {
			alert('주문하시는 분 이메일 정보를 입력해 주세요.');
			$('.order_email').focus();
		}else if($('.delivery_name').val() == '') {
			alert('받으실 분 정보를 입력해 주세요.');
			$('.delivery_name').focus();
		}else if($('.delivery_postcode').val() == '') {
			alert('받으실 곳 우편번호 정보를 입력해 주세요.');
			$('.delivery_postcode').focus();
		}else if($('.delivery_phone').val() == '') {
			alert('받으실 분 휴대폰 번호 정보를 입력해 주세요.');
			$('.delivery_phone').focus();
		}else if(!patternPhone.test($('.delivery_phone').val())) {
			alert('[수취인]휴대폰 번호은(는) 전화번호형식에 맞지 않습니다.');
			$('.delivery_phone').focus();
		}else if (!patternPhone.test($('.order_phone').val())) {
			alert('[주문자]휴대폰 번호은(는) 전화번호형식에 맞지 않습니다.');
			$('.order_phone').focus();
		}else {
			
			/* 카카오페이 API */
			if($('#kakao').next().hasClass('on') == true){
				let name = $('#full_cartProduct').val();
				let cartSize = parseInt($('#full_cartSize').val()) + 1;
				
				if(cartSize == 1) {
					name = name;
				} else {
					name = name+' 외 '+cartSize+'개';
				}
				
				var IMP = window.IMP; // 생략가능
		        IMP.init('imp77452768'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		        var msg;
		        
		        IMP.request_pay({
		            pg : 'kakaopay',
		            pay_method : 'card',
		            merchant_uid : 'merchant_' + new Date().getTime(),
		            name : name,
		            amount : $('.total_total_sum').html(),
		            buyer_email : $('.selectedMail').val(),
		            buyer_name : $('.order_name').val(),
		            buyer_tel : $('.order_phone').val(),
		            buyer_addr : $('#full_address').val(),
		            buyer_postcode : $('#full_postcode').val()
		        },  function(rsp) {
		            if ( rsp.success ) {
		                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		                jQuery.ajax({
		                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
		                    type: 'POST',
		                    dataType: 'json',
		                    data: {
		                        imp_uid : rsp.imp_uid
		                        //기타 필요한 데이터가 있으면 추가 전달
		                    }
		                }).done(function(data) {
		                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		                    if ( everythings_fine ) {
		                        msg = '결제가 완료되었습니다.';
		                        msg += '\n고유ID : ' + rsp.imp_uid;
		                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                        msg += '\결제 금액 : ' + rsp.paid_amount;
		                        msg += '카드 승인번호 : ' + rsp.apply_num;
		                        
		                        alert(msg);
		                    } else {
		                        //[3] 아직 제대로 결제가 되지 않았습니다.
		                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		                    }
		                });
		                //성공시 이동할 페이지
						paymentEnd();
		            } else {
		                msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		                //실패할 경우
		                alert(msg);
		            }
		        });
			} else {
				paymentEnd();			
			}
	
		}

		
	}else {
		if($('.order_name').val() == ''){
			alert('주문하시는 분 정보를 입력해 주세요.');
			$('.order_name').focus();
		}else if($('.order_phone').val() == '') {
			alert('주문하시는 분 휴대폰 번호 정보를 입력해 주세요.');
			$('.order_phone').focus();
		}else if($('.order_email').val() == '') {
			alert('주문하시는 분 이메일 정보를 입력해 주세요.');
			$('.order_email').focus();
		}else if($('.delivery_name').val() == '') {
			alert('받으실 분 정보를 입력해 주세요.');
			$('.delivery_name').focus();
		}else if($('.delivery_postcode').val() == '') {
			alert('받으실 곳 우편번호 정보를 입력해 주세요.');
			$('.delivery_postcode').focus();
		}else if($('.delivery_phone').val() == '') {
			alert('받으실 분 휴대폰 번호 정보를 입력해 주세요.');
			$('.delivery_phone').focus();
		}else if(!patternPhone.test($('.delivery_phone').val())){
			alert('[수취인]휴대폰 번호은(는) 전화번호형식에 맞지 않습니다.');
			$('.delivery_phone').focus();
		}else if (!patternPhone.test($('.order_phone').val())){
			alert('[주문자]휴대폰 번호은(는) 전화번호형식에 맞지 않습니다.');
			$('.order_phone').focus();
		}else {		
			alert('청약의사 재확인을 동의해 주셔야 주문을 진행하실 수 있습니다.');
		}

	}
});
