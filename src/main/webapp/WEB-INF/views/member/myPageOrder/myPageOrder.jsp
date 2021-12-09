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
								<h3>주문목록/배송조회</h3>
								<input type="hidden" id="memberID" value="${member.member_id}">
							</div>
							<div class="date_check_box">
								<h3>조회기간</h3>
								<form method="get" id="qFrm">
									<!-- <input type="hidden" name="start_date" value="" id="start_date">
									<input type="hidden" name="end_date" value="" id="end_date"> -->
								</form>
								<button type="button" class="pick_date" data-term="1">오늘</button>
								<button type="button" class="pick_date sevenDay" data-term="2">7일</button>
								<button type="button" class="pick_date" data-term="3">15일</button>
								<button type="button" class="pick_date"data-term="4">1개월</button>
								<button type="button" class="pick_date" data-term="5">3개월</button>
								<button type="button"style="margin-right:10px;" class="pick_date" data-term="6">1년</button>
								<input type="date" class="date_picker start" value="">
								<span>~</span>
								<input type="date" class="date_picker end" value="">
								<button type="button" class="btn_board_search">조회<em></em></button>
							</div> <!-- date_check_box end --> <!-- 날짜 box 다영씨 -->
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
	
let firstDate = new Date();
let end_date = getToday(firstDate);
let start_date= new Date(firstDate.setDate(firstDate.getDate()-7));
start_date=getToday(start_date);


getDate(start_date, end_date, 1);

function getDate(start_date,end_date,pn){
	let member_id = $("#memberID").val();
	$.ajax({
		type:"GET",
		url:"./myPageOrderPager",
		data: {
			start_date:start_date,
			end_date:end_date,
			pn:pn,
			member_id:member_id,
			cart_state:null
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


/*페이지 업로드시 오늘 날짜 date_picker에 입력되어있기*/
$(".start").val(start_date);
$(".end").val(end_date);
$(".sevenDay").addClass("clickDay");

/* 페이지 넘기기 */
$(".myPage_lately_info_cont").on('click','.pageBtn',function(){
	const num=$(this).attr("data-list-pn");
	console.log("pn--" + $('.start').val());
	console.log("pnn--" + $('.end').val());
	console.log("num--" + num);
	getDate($('.start').val(), $('.end').val(), num);
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
	
/* 설정 날짜 받아오기 */
function getToday(date){
	var year=date.getFullYear();
	var month=date.getMonth()+1;
	var day=date.getDate();
		
	 return year+"-"+("0"+(month)).slice(-2)+"-"+("0"+day).slice(-2); 
} 

/* 오늘 / 7일 / ... 날짜 넘기기 */	
$(".pick_date").click(function(){
	var pick_term=$(this).data('term');
	var date_line = new Date();
	var today=getToday(date_line);
	/* var term=getToday(date_line); */
	if(pick_term == 1){
		$("#start_date").val(today);
		$(".end").val(today);
		$('.start').val(today);
		console.log($("#start_date").val()+1111);
		$('.pick_date').removeClass("clickDay");
		$(this).addClass("clickDay");
	}else if(pick_term == 2){
		var sevenDay=new Date(date_line.setDate(date_line.getDate()-7));
		sevenDay=getToday(sevenDay);
		$("#start_date").val(sevenDay);
		$(".end").val(today);
		$('.start').val(sevenDay);
		$('.pick_date').removeClass("clickDay");
		$(this).addClass("clickDay");
	}else if(pick_term==3){
		var fifthDay=new Date(date_line.setDate(date_line.getDate()-15));
		fifthDay=getToday(fifthDay);
		$("#start_date").val(fifthDay);
		$(".end").val(today);
		$('.start').val(fifthDay);
		$('.pick_date').removeClass("clickDay");
		$(this).addClass("clickDay");
	}else if(pick_term==4){
		var aMonth=new Date(date_line.setMonth(date_line.getMonth()-1));
		aMonth=getToday(aMonth);
		$("#start_date").val(aMonth);
		console.log($("#start_date").val());
		$(".end").val(today);
		$('.start').val(aMonth);
		$('.pick_date').removeClass("clickDay");
		$(this).addClass("clickDay");
	}else if(pick_term==5){
		var threeMonth=new Date(date_line.setMonth(date_line.getMonth()-3));
		threeMonth=getToday(threeMonth);
		$("#start_date").val(threeMonth);
		$(".end").val(today);
		$('.start').val(threeMonth);
		$('.pick_date').removeClass("clickDay");
		$(this).addClass("clickDay");
	}else if(pick_term==6){
		var aYear=new Date(date_line.setFullYear(date_line.getFullYear()-1));
		aYear=getToday(aYear);
		$("#start_date").val(aYear);
		$(".end").val(today);
		$('.start').val(aYear);
		$('.pick_date').removeClass("clickDay");
		$(this).addClass("clickDay");
	}
	
	/* getDate($('.start').val(), $(".end").val(), 1); */
	
});
	
	
/*  주문취소 */
$('.myPage_lately_info_cont').on('click', '.btn_order_cancel', function(){
	console.log($(this).attr('data-payment-id'));
	let member_id = $("#memberID").val();
	let pn = 1;
	if(confirm('주문취소 처리를 하시겠습니까?')){
		$.ajax({
			type:"GET",
			url:"/cart/setPaymentCancel",
			data: {
				start_date:start_date,
				end_date:end_date,
				pn:pn,
				member_id:member_id,
				payment_id:$(this).attr('data-payment-id'),
				payment_add_point: $(this).attr('data-payment-addPoint'),
				payment_use_point: $(this).attr('data-payment-usePoint'),
				cart_state:null
			},
			success: function(result){
				alert('주문취소가 정상처리 되었습니다.');
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
	}else{
		
	}
});

/* 환불처리 */
$('.myPage_lately_info_cont').on('click', '.btn_order_refund', function(){
	console.log($("#memberID").val());
	console.log($(this).attr('data-payment-id'));
	let member_id = $("#memberID").val();
	let pn = 1;
	if(confirm('환불 처리를 하시겠습니까?')){
 		$.ajax({
			type:"GET",
			url:"/cart/setPaymentRefund",
			data: {
				start_date:start_date,
				end_date:end_date,
				pn:pn,
				member_id:member_id,
				payment_id:$(this).attr('data-payment-id'),
				payment_add_point: $(this).attr('data-payment-addPoint'),
				payment_use_point: $(this).attr('data-payment-usePoint'),
				cart_state:null
			},
			success: function(result){
				alert('환불처리가 정상처리 되었습니다.');
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
	}else{
		
	}
});

/* 날짜조회 - ajax 활용하기 */
$(".btn_board_search").click(function(){
	console.log("--" + $(".start").val());
	console.log("--" + $(".end").val());
	getDate($('.start').val(), $('.end').val(), 1);
});
</script>
</body>
</html>