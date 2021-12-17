<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/member/myPage/myPageCommon.css">
	<link rel="stylesheet" href="/css/member/myPage/myPageOrder.css">
	<link rel="stylesheet" href="/css/order/basket.css">
	<link rel="stylesheet" href="/css/member/myPage/myWishList.css">
	
	<style type="text/css">
		#right_content{width:1000px;float:left;padding-left:40px; min-height: 500px;}
		.myPage_cont {padding-bottom: 50px;}
		.pagination .btnPage{min-width:26px; background-color:#fff;border:1px solid #e0e0e0;cursor:pointer;color:#888; font-size:11px; padding: 6px 4px 10px 4px; }
		.pageNum{cursor:pointer; display:inline-block;  font-size:11px; color:#888; height:30px; width:30px; line-height:30px; vertical-align:middle;  }	
		.pageNum.on{font-weight:bold; color:#fff; background-color:#7a7d81; border-radius:20px; }
		.pagination{text-align:center; margin-top:60px;  cursor:pointer;  }
		.emptyList{width:100%; text-align:center;position:relative; padding:13px 10px 15px; font-size:12px; color:#333;}
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
					<div class="myPage_cont">
						<div class="myPage_lately_info">						
							<div class="myPage_zone_tit">
								<h3>찜리스트</h3>
								<input type="hidden" id="memberID" value="${member.member_id}">
							</div>
							
							<div class="myPage_lately_info_cont">
								
								
							
							</div><!-- myPage_lately_info_cont end --> <!-- list 출력 -->
							
						</div><!-- myPage_lately_info end -->
					
					</div><!-- myPage_cont end -->
				</div> <!--right_content END-->
				
			</div>
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>

<script type="text/javascript">
getPage(1);

//페이지 불러오기
function getPage(pn){
	$.ajax({
		type:"GET",
		url:"./myWishListAjax",
		data: {
			pn:pn
		},
		success: function(result){
			$(".myPage_lately_info_cont").empty();
			$(".myPage_lately_info_cont").append(result.trim());	
			
		
			 $('.pageBtn').each(function() {
				 if($(this).attr("data-list-pn")!=pn){
				 	 $(this).removeClass("on");
				 }else{
					 $(this).addClass("on");
				 }
			});
		
		}
	});	
}

/* 페이지 넘기기 */
$(".myPage_lately_info_cont").on('click','.pageBtn',function(){
	const num=$(this).attr("data-list-pn");
	getPage(num);
	btnCss(num);
});


/*페이지 버튼 css*/
function btnCss(pageNum) {
	$('.pageBtn').each(function() {
		 if($(this).attr("data-list-pn")!=pageNum){
		 	 $(this).removeClass("on");
		 }else{
			 $(this).addClass("on");
		 }
	});
}

//수량변경하기
function setCnt(pn, wish_id, wish_cnt){
	$.ajax({
		type:"GET",
		url:"/wish/cntUpdate",
		data: {
			pn:pn,
			wish_id: wish_id,
			wish_cnt: wish_cnt
		},
		success: function(result){
			$(".myPage_lately_info_cont").empty();
			$(".myPage_lately_info_cont").append(result.trim());	
			
		
			 $('.pageBtn').each(function() {
				 if($(this).attr("data-list-pn")!=pn){
				 	 $(this).removeClass("on");
				 }else{
					 $(this).addClass("on");
				 }
			});
		
		}
	});
}

/* 수량변경 */
$('.myPage_lately_info_cont').on('click', '.cntUp', function(){
 	let wish_id = $(this).attr('data-wish-id');
	let wish_cnt = parseInt($(this).attr('data-wish-cnt'));
	if($(this).val() == '+') {
			wish_cnt += 1; 
	} else {
		wish_cnt -= 1; 
	}
	
	if(wish_cnt<1){
		alert('해당 상품의 찜리스트에서 담을 수 있는 최소수량은 1개 입니다.');
		wish_cnt=1;
	}
	let pn = 0;
	$('.pageBtn').each(function() {
		 if($(this).hasClass('on') == true){
		 	 pn = $(this).attr('data-list-pn');
		 }
	});
	
	console.log(wish_id, wish_cnt, pn);
	setCnt(pn, wish_id, wish_cnt);
});


 
//선택 상품 삭제 버튼 
function optionDel() {
	let delArray = new Array();
	
	$("input:checkbox[name=chkDel]:checked").each(function(){
		let wish_id = $(this).attr('data-wish-id');
		delArray.push(wish_id);
	});
	
	console.log(delArray);
	
	if(delArray == ""){
		alert('선택하신 상품이 없습니다.');
		return false;
	}else{
		if(confirm('선택하신 상품을 찜리스트에서 삭제 하시겠습니까?')){
 			$.ajax({
				type:"GET",
				url:"/wish/setDeleteMany",
				traditional : true,
				data: {
					delArray:delArray
				},
				success: function(result) {
					$(".myPage_lately_info_cont").empty();
					$(".myPage_lately_info_cont").append(result.trim());	
					
				
					 $('.pageBtn').each(function() {
						 if($(this).attr("data-list-pn")!=1){ //삭제 후 1번 페이지로 돌아가자
						 	 $(this).removeClass("on");
						 }else{
							 $(this).addClass("on");
						 }
					});
				}
			});
		}
	}
}

//선택 상품 장바구니 버튼
function optionCart() {
	let member_id = $('#memberID').val();
	
	let delArray = new Array();
	
	$("input:checkbox[name=chkDel]:checked").each(function(){
		let wish_id = $(this).attr('data-wish-id');
		let cart_cnt = $(this).attr('data-wish-cnt');
		let product_id = $(this).attr('data-product-id');
		delArray.push(member_id, cart_cnt, product_id, wish_id);
	});
	
	if(delArray == ""){
		alert('선택하신 상품이 없습니다.');
		return false;
	}else{
		if(confirm('선택하신 상품을 장바구니로 저장하시겠습니까?')){
			console.log(delArray);
 			$.ajax({
				type:"GET",
				url:"/wish/setCartOne",
				traditional : true,
				data: {
					delArray:delArray
				},
				success: function(result) {
					location.href="/cart/normalBasket";
				}	
			});
		}
	}
}


//장바구니 버튼
$('.myPage_lately_info_cont').on('click', '.btn_wish_cart', function(){
	let member_id = $('#memberID').val();
	let cart_cnt = $(this).attr('data-wish-cnt');
	let product_id = $(this).attr('data-product-id');
	let wish_id = $(this).attr('data-wish-id');
	
	let delArray = new Array();
	delArray.push(member_id, cart_cnt, product_id, wish_id);
	
	if(confirm('선택하신 1개 상품을 장바구니로 저장하시겠습니까?')){
		$.ajax({
			type:"GET",
			url:"/wish/setCartOne",
			traditional : true,
			data: {
				delArray:delArray
			},
			success: function(result) {
				location.href="/cart/normalBasket";
			}
		});
	}
});

//삭제하기 버튼
$('.myPage_lately_info_cont').on('click', '.btn_wish_del', function(){
	let wish_id = $(this).attr('data-wish-id');
	let delArray = new Array();
	
	delArray.push(wish_id);
	
	if(delArray == ""){
		alert('선택하신 상품이 없습니다.');
		return false;
	}else{
		if(confirm('선택하신 1개 상품을 찜리스트에서 삭제 하시겠습니까?')){
 			$.ajax({
				type:"GET",
				url:"/wish/setDeleteMany",
				traditional : true,
				data: {
					delArray:delArray
				},
				success: function(result) {
					$(".myPage_lately_info_cont").empty();
					$(".myPage_lately_info_cont").append(result.trim());	
					
				
					 $('.pageBtn').each(function() {
						 if($(this).attr("data-list-pn")!=1){ //삭제 후 1번 페이지로 돌아가자
						 	 $(this).removeClass("on");
						 }else{
							 $(this).addClass("on");
						 }
					});
				}
			});
		}
	}
});

</script>
</body>
</html>