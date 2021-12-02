<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<style type="text/css">
		#right_content{width:1000px;float:left;padding-left:40px;}
		.board_zone_tit h2{font-size:24px; color:#333333;padding-bottom:10px; margin-bottom:10px;   }
		.board_zone_list{position:relative; }
		.write_qna{width:91px; cursor:pointer;color:#fff; font-size:12px; background-color:#979797;border:none; height:31px; position:absolute; display:inline-block;  top:-42px; right:0px; padding:0 10px; line-height:33px;  }
		.board_zone_list .search_box{width:960px; height:77px; padding:20px 20px 20px 30px; border:3px solid #eeeeee; margin-bottom:35px; }
		.board_zone_list .search_box h3{float:left; padding:6px 15px 0 0 ; color:#777777; font-size:13px; }
		.board_zone_list .search_box .pick_date{float:left; width:54px; height:31px; margin-left:-1px; color:#777; font-size:12px; border:1px solid #d6d6d6;background-color:#fff; }
		.board_zone_list .search_box .pick_date:hover{background-color:#aeaeae; color:#fff; }
		.date_picker{width:154px; height:31px; padding:0 10px; color:#333; border:1px solid #d6d6d6; line-height:31px; }
		.btn_board_search{width:100px; height:31px;border:none;padding: 0 20px 0 20px; font-weight:bold; font-size:12px; color: #fff; border-radius: 21px;background: #d12420;line-height:1.5; cursor:pointer; margin-left:10px;  }
		.btn_board_search:hover{background:linear-gradient(90deg,#d12420,#d12420,#910d18);border:0;background-size:100%;background-position-x:0;color:#fff;}
		.btn_board_search em{padding: 0 20px 0 0;background-image: url(/images/board/btn_goods_search.png);background-position: right 3px; background-repeat: no-repeat;}
		.board_list_table{width:100%;margin:0 0 20px 0;border:0;border-spacing:0;border-collapse:collapse;border-top:0.5px solid #999999;text-align:center;}
		.board_list_table th{padding:10px 10px 10px 14px; font-size:12px; border-bottom:1px solid #dbdbdb; background:#fbfbfb;}
		.board_list_table td{padding:13px 10px 15px 10px; border-bottom:1px solid #dbdbdb; }
		.emptyList{width:100%; text-align:center;position:relative; border-bottom:1px solid #ccc; padding:13px 10px 15px; font-size:12px; color:#333; margin:-20px 0 100px;  }
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
					<div class="board_zone_tit">
						<h2>1:1문의</h2>
					</div>
					<div class="board_zone_cont">
						<div class="board_zone_list">
								<button type="button" class="write_qna"><strong>1:1 문의하기</strong></button>
							<div class="search_box">
								<h3>조회기간</h3>
								<form action="./qnaList" method="get" id="qFrm">
									<input type="hidden" name="start_date" value="" id="start_date">
									<input type="hidden" name="end_date" value="" id="end_date">
								</form>
								<button type="button" class="pick_date" data-term="1">오늘</button>
								<button type="button" class="pick_date" data-term="2">7일</button>
								<button type="button" class="pick_date" data-term="3">15일</button>
								<button type="button" class="pick_date"data-term="4">1개월</button>
								<button type="button" class="pick_date" data-term="5">3개월</button>
								<button type="button"style="margin-right:10px;" class="pick_date" data-term="6">1년</button>
								<input type="date" class="date_picker start" value="2021-12-02">
								<span>~</span>
								<input type="date" class="date_picker end" value="">
								<button type="button" class="btn_board_search">조회<em></em></button>
							</div>
							<div class="list_zone">
								<table class="board_list_table" style="width:100%;">
							<colgroup> <!-- table 간격 기본설정 -->
								<col width="10%">
								<col width="15%">
								<col>
								<col width="10%">						
							</colgroup>
							<thead>
								<tr>
									<th>문의날짜</th><th>카테고리</th><th>제목</th><th>문의상태</th>
								</tr>
							</thead>
							<tbody>			
								<c:forEach items="${QList}" var="qnaVO">
									<tr class="toggle_faq">
										<td>${qnaVO.qna_regDate}</td>
										<td>${qnaVO.qna_type}</td>
										<td class="board_tit">
											<a href="#">
												<span>
													<strong class="btnView">${qnaVO.qna_title}</strong>
												</span>
											</a>
										</td>
										<td>${qnaVO.qna_state}</td>
									</tr>
								</c:forEach>					
							</tbody>
						</table>
							<c:if test="${empty QList}">
								<div class="emptyList"><span>게시글이 존재하지 않습니다.</span></div>
							</c:if>
			
							</div>
						
						</div>
			
				
					</div>
				
				</div>
				<!--right_content END-->
			</div>	
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>

	<script type="text/javascript">

	
	
	
 	function getToday(date){
		var year=date.getFullYear();
		var month=date.getMonth()+1;
		var day=date.getDate();
		
	  	return year+"-"+("0"+(month)).slice(-2)+"-"+("0"+day).slice(-2); 
	} 
	
	$(".btn_board_search").click(function(){
		$("#start_date").val($(".start").val());
		$("#end_date").val($(".end").val());
		$("#qFrm").submit(); 
	});
	
	$(".pick_date").click(function(){
		var pick_term=$(this).data('term');
		var date_line = new Date();
		var today=getToday(date_line);
		/* var term=getToday(date_line); */
		if(pick_term == 1){
			$("#start_date").val(today);
			$("#end_date").val(today);
			console.log($("#start_date").val()+1111);
		}else if(pick_term == 2){
			var sevenDay=new Date(date_line.setDate(date_line.getDate()-7));
			sevenDay=getToday(sevenDay);
			console.log(sevenDay);
			$("#start_date").val(sevenDay);
			$("#end_date").val(today);
		}else if(pick_term==3){
			var fifthDay=new Date(date_line.setDate(date_line.getDate()-15));
			fifthDay=getToday(fifthDay);
			console.log(fifthDay);
			$("#start_date").val(fifthDay);
			$("#end_date").val(today);
		}else if(pick_term==4){
			var aMonth=new Date(date_line.setMonth(date_line.getMonth()-1));
			aMonth=getToday(aMonth);
			$("#start_date").val(aMonth);
			console.log($("#start_date").val());
			$("#end_date").val(today);
		}else if(pick_term==5){
			var threeMonth=new Date(date_line.setMonth(date_line.getMonth()-3));
			threeMonth=getToday(threeMonth);
			$("#start_date").val(threeMonth);
			console.log($("#start_date").val());
			$("#end_date").val(today);
		}else if(pick_term==6){
			var aYear=new Date(date_line.setFullYear(date_line.getFullYear()-1));
			aYear=getToday(aYear);
			$("#start_date").val(aYear);
			console.log($("#start_date").val());
			$("#end_date").val(today);
		}
			 $("#qFrm").submit(); 
	});
	

	</script>

	









</body>
</html>


