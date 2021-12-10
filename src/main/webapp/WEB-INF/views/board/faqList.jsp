<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/board/faqList.css">
	
<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>		
		<div id="container">
				
			<div id="contents">
			
			<c:import url="/WEB-INF/views/navbar/noticeLeftMenu.jsp"></c:import>		
			<!-- right content work start -->	
			<div class="right_content">
				<div class="board_zone_sec">
					<div class="board_search_box">
						<div class="search_box_left">	
							<p>자주묻는 질문 검색</p>
							
							<input type="hidden" name="pn" value="1" id="pn">	
							<input type="hidden" name="kind" value="${pager.kind}" id="kind">	
								<input type="text" class="text" name="search"  id="search" placeholder="검색어를 입력하세요">
								<button type="button" class="btn_board_search">검색<em></em></button>
							
						</div>
						<div class="search_box_right">
							<strong>찾으시는 질문이 없다면?</strong>
							<a href="/member/qnaList">1:1 문의하기</a>
						</div>
					</div>
					
					<div class="board_zone_cont">
						<div class="board_zone_tit">
							<h2>FAQ</h2>
						</div>
						<div class="pickTab">
							<ul>
								<li>
									<button type="button" name="kind" class="pickFaq_type pick" value="">전체</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_1">회원가입/회원혜택</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_2">주문/결제/배송</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_3">취소/교환/반품/환불</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_4">상품문의</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_5">머신안내(Y1.1)</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_6">머신안내(Y3/Y3.2/Y3.3)</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_7">머신안내(X7,X7.1)</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_8">AS안내</button>
								</li>
								<li>
									<button type="button" name="kind" class="pickFaq_type" value="f_9">자가진단</button>
								</li>
							</ul>
						
						</div>	
						
						
						<div id="showFaqList">
						
								<!-- faqList 출력 -->
						
						
						</div> <!-- ajax end -->
			
			
						
					</div>	
				
				</div>
			</div>	
			<!-- right content work end  -->	
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
	
	
<script type="text/javascript">
	 /*전역변수 선언 */
 let kind='';
 let search='';
 getList(1,'','');
 
 /*검색입력했을때 실행*/
 $('.btn_board_search').click(function(){
	/*무조건 첫페이지 뿌려줘서 pn=1*/
	search=$("#search").val();
	getList(1,'',search);	
	
}); 
/*faq_type tab 선택했을때 실행*/ 
$('.pickFaq_type').click(function(){
	kind=$(this).val();
	getList(1,kind,search);	
}); 

/*이벤트 위임 : 페이지 번호 클릭했을때 실행*/
$("#showFaqList").on('click','.pageBtn',function(){
	const num=$(this).attr("data-list-pn");
	getList(num, kind,search);
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

/*아코디언 기능*/
$(function(){
	var article=(".board_list_table .show");
	/*이벤트 위임*/
	$("#showFaqList").on('click','.pickList',function(){
		var myArticle = $(this).parents().next("tr");	
		var icon=$(this).find("img");
		
		$(".icon_open").attr("src","/images/board/icon_toggle_open.png");
		
		if($(myArticle).hasClass('hide')){
			$(article).removeClass('show').addClass('hide');
			$(myArticle).removeClass('hide').addClass('show');
			icon.attr("src","/images/board/icon_toggle_close.png");
		}else{
			$(myArticle).addClass('hide').removeClass('show');	
			icon.attr("src","/images/board/icon_toggle_open.png");
		}
		
	});

});

 
function getList(pn,kind,search){
	$.ajax({
		url:'./faqTypeList',
		type:'get',
		data:{pn:pn,kind:kind,search:search},
		success:function(data){
			/*  $("#faq_list").empty(); */	 
			 $("#showFaqList").empty();	 
			//------ 검색하던 중이던 내용 계속 유지 시키기(페이지 넘겨도)
			 $(".pickFaq_type").each(function(){
				 $(this).addClass("pick");
				 if($(this).val()!=kind){
					$(this).removeClass("pick");
				}
			}); 
			$("#kind").val(kind);
			/*  $("#faq_list").append(data.trim());  */
			 $("#showFaqList").append(data.trim()); 
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

</script>		
	
</body>
</html>