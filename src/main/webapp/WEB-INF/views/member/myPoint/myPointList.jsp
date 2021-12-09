<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/member/myPage/myPageCommon.css">
	<link rel="stylesheet" href="/css/member/myPage/myPageOrder.css">
	<link rel="stylesheet" href="/css/member/myPage/myPageCancel.css">
	<link rel="stylesheet" href="/css/member/myPage/myPageCoupon.css"> <!-- 마이페이지 회원 요약정보 css 들어있는 곳 -->
	<style type="text/css">
		#right_content{width:1000px;float:left;padding-left:40px; min-height: 500px;}
		.myPage_cont {padding-bottom: 50px;}
		.pagination .btnPage{min-width:26px; background-color:#fff;border:1px solid #e0e0e0;cursor:pointer;color:#888; font-size:11px; padding: 6px 4px 10px 4px; }
		.pageNum{cursor:pointer; display:inline-block;  font-size:11px; color:#888; height:30px; width:30px; line-height:30px; vertical-align:middle;  }	
		.pageNum.on{font-weight:bold; color:#fff; background-color:#7a7d81; border-radius:20px; }
		.pagination{text-align:center; margin-top:60px;  cursor:pointer;  }
		.emptyList{width:100%; text-align:center;position:relative; padding:50px 30px; font-size:12px; color:#333;}
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
						
						<!-- 마이페이지 회원 요약정보 -->
						<div class="myPage_top_info">
							<div class="myPage_top_text">
								<div class="grade_text">
									<p>${member.member_name}님의</p>
									<p>회원등급은 <span>[일반회원등급]</span>입니다.</p>
									<div class="grade_btn">
										<span class="grade_btn_btn">
											<a>
												<em>등급혜택보기</em>
											</a>
										</span>
										
										<!-- 등급혜택 창 start -->
										<div id="lyGrade" class="layer_area" style="display: none;">
						                    <div class="ly_wrap grade_layer">
						                        <div class="ly_tit">
						                            <strong>등급혜택 안내</strong>
						                        </div>
						                        <div class="ly_cont">
						                            <div class="grade_list">
						                                <dl>
						                                    <dt>회원 등급</dt>
						                                    <dd>일반회원등급</dd>
						                                </dl>
						                                <dl>
						                                    <dt>추가 할인</dt>
						                                    <dd><strong>0원이상 구매시 상품 판매금액의 0.0% 추가 할인</strong></dd>
						                                </dl>
						                                <dl>
						                                    <dt>중복 할인</dt>
						                                    <dd><strong>0원이상 구매시 상품 판매금액의 0.0% 추가 할인</strong></dd>
						                                </dl>
						                                <dl>
						                                    <dt>추가  적립</dt>
						                                    <dd>0원이상 구매 시 구매금액당 0.0% 추가 적립</dd>
						                                </dl>
						                            </div>
						                        </div>
						                        <!-- //ly_cont -->
						                        <a class="ly_close closeModal"><img src="/images/cart/btn_layer_close.png" alt="닫기"></a>
						                    </div>
						                </div> <!-- lyGrade end --><!-- 등급혜택 창 end -->
						                
									</div> <!-- grade_btn end -->
									
								</div> <!-- grade_text end -->
							</div> <!-- myPage_top_text end -->
							<div class="myPage_top_wallet">
								<ul>
									<li>
										<span><img alt="" src="/images/coupon/icon_coupon.png"></span>
										<span>
											<em>쿠폰</em>
											<a href="/member/myPage/myPageCoupon"><strong>${couponSize}</strong>장</a>
										</span>
									</li>
									<li>
										<span><img alt="" src="/images/coupon/icon_mileage.png"></span>
										<span>
											<em>일리 포인트</em>
											<a href="/member/myPage/myPagePoint"><strong>${member.member_point}</strong>콩</a>
										</span>
									</li>
								</ul>
							</div> <!-- myPage_top_wallet end -->
							
						</div> <!-- myPage_top_info --> <!-- 마이페이지 회원 요약정보 end -->
						
						<div class="myPage_lately_info">	
												
							<div class="myPage_zone_tit">
								<h3>일리 포인트</h3>
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
								<!-- ajax List 출력 -->
								
							</div><!-- myPage_lately_info_cont end --> <!-- list 출력 -->
							
						</div><!-- myPage_lately_info end -->
					</div><!-- myPage_cont end -->
				</div> <!--right_content END-->
				
			</div>
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>

<script type="text/javascript">

/* 등급혜택보기 */
$('.grade_btn_btn').click(function(){
	$('#lyGrade').css({"display": "block"});
	
});

$('.ly_close').click(function(){
	$('#lyGrade').css({"display": "none"});
}); /* 창닫기 */


/* 자세히보기 */

$('.myPage_lately_info_cont').on('click', '.coupon_layer_layer', function(){
	$('#lyUseCase3100063').css({"display": "block"});
});
$('.myPage_lately_info_cont').on('click', '.ly_close', function(){
	$('#lyUseCase3100063').css({"display": "none"});
});/* 창닫기 */

let firstDate = new Date();
let end_date = getToday(firstDate);
let start_date= new Date(firstDate.setDate(firstDate.getDate()-7));
start_date=getToday(start_date);

/*페이지 업로드시 오늘 날짜 date_picker에 입력되어있기*/
$(".start").val(start_date);
$(".end").val(end_date);
$(".sevenDay").addClass("clickDay");
getUse(start_date, end_date, 1);


function getUse(start_date,end_date,pn){
	let startendDate = $(".start").val() + ' ~ ' + $(".end").val();
	$.ajax({
		type:"GET",
		url:"./myPagePointUse",
		data: {
			member_id : $('#memberID').val(),
			coupon_state : 'unUse',
			start_date : start_date,
			end_date : end_date,
			pn : pn
		},
		success: function(result){
			$(".myPage_lately_info_cont").empty();
			$(".myPage_lately_info_cont").append(result.trim());	
			$('#startendDate').html(startendDate);
			
			$('.pageBtn').each(function() {
				 if($(this).attr("data-list-pn")!=pn){
				 	 $(this).removeClass("on");
				 }else{
					 $(this).addClass("on");
				 }
			});
		}
	});	
} /* 사용 list */


function getAdd(start_date,end_date,pn){
	let member_id = $("#memberID").val();
	let startendDate = $(".start").val() + '~' + $(".end").val();
	$.ajax({
		type:"GET",
		url:"./myPagePointAdd",
		data: {
			member_id:$('#memberID').val(),
			coupon_state:'deadline',
			start_date:start_date,
			end_date:end_date,
			pn:pn
		},
		success: function(result){
			$(".myPage_lately_info_cont").empty();
			$(".myPage_lately_info_cont").append(result.trim());
			$('#startendDate').html(startendDate);
			
		
			 $('.pageBtn').each(function() {
				 if($(this).attr("data-list-pn")!=pn){
				 	 $(this).removeClass("on");
				 }else{
					 $(this).addClass("on");
				 }
			});
		
		}
	});	
} /* 적립 list */

/* 페이지 넘기기 */
$(".myPage_lately_info_cont").on('click','.pageBtn',function(){
	const num=$(this).attr("data-list-pn");
	console.log("pn--" + $('.start').val());
	console.log("pnn--" + $('.end').val());
	console.log("num--" + num);
	
	if($('.setStart').hasClass('on') == true ){
		getUse($('.start').val(), $('.end').val(), num); 
	}else{
		getAdd($('.start').val(), $('.end').val(), num); 
	}
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
	
});
	

/* 날짜조회 - ajax 활용하기 */
$(".btn_board_search").click(function(){
	console.log("--" + $(".start").val());
	console.log("--" + $(".end").val());
	
	if($('.setStart').hasClass('on') == true){
		getUse($('.start').val(), $('.end').val(), 1);		
	}
	if($('.getCancel').hasClass('on') == true){
		getAdd($('.start').val(), $('.end').val(), 1);		
	}

});

/* 포인트 사용내역 tab */
$(".myPage_lately_info_cont").on('click','.setStart',function(){
	getUse($('.start').val(), $('.end').val(), 1);
});
/* 포인트 적립내역 tab */
$(".myPage_lately_info_cont").on('click','.getCancel',function(){
	getAdd($('.start').val(), $(".end").val(), 1);
});
</script>
</body>
</html>