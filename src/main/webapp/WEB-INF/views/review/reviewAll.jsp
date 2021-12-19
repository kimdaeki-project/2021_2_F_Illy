<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/board/reviewAll.css">

<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>	
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>	
		<div id="container">
				
			<div id="contents">
			
				<div class="board_zone_tit">
					<h2>전체후기</h2>
				</div>
				
				<div class="review_search">
					<form id="rFrm" action="./reviewAll">
						<div class="review_search_option">
							<div class="select_box_wrap">
								<input type="hidden" name="pn" value="1" id="pn">
								<select class="select_box" id="bigCate">
									<option value="">=카테고리 선택=</option>
									<option value="000">ALL PRODUCT</option>
									<option value="001">COFFEE</option>
									<option value="002">MACHINE</option>
								</select>
								<select class="select_box sCate" id="smallCate01">
									<option value="">=카테고리 선택=</option>
								</select>
								<select class="select_box sCate" id="smallCate02" style="display:none;">
									<option value="">=카테고리 선택=</option>
									<option value="000">모든제품</option>
								</select>
								<select class="select_box sCate" id="smallCate03" style="display:none;">
									<option value="">=카테고리 선택=</option>
									<option value="001">캡슐커피</option>
									<option value="002">원두커피</option>
									<option value="003">분쇄커피</option>
									<option value="004">스틱커피</option>
								</select>
								<select class="select_box sCate" id="smallCate04" style="display:none;">
									<option value="">=카테고리 선택=</option>
									<option value="001">X1 Anniversary</option>
									<option value="002">X7.1</option>
									<option value="003">Y3.3</option>
								</select>
								<input hidden="" id="FCode" value="">		
								<input hidden="" id="BCode" value="">
								<input hidden="" name="code" id="findPrdCode" >
								<select class="search_cate" id="search_cate03" name="kind">
									<option class="search_kind" value="review_id">최신순</option>
									<option class="search_kind" value="review_star">평점순</option>
								</select>	
								<input type="text" class="search_cate" style="cursor:text; height:31px;" name="search" id="search" placeholder="상품명 검색">
								<button type="button" class="btn_board_search">검색<img style="width:15px; height:15px; margin-left:3px;" src="/images/board/btn_goods_search.png"></button>
							</div>
						</div>
					</form>
				</div>
				<div id="reviewList">
				
				
				</div>
				
			
			
			</div>
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
	
	
	
	
	
	<script type="text/javascript">
		
	
		let star='';
		let kind='';
		let search='';
		let code='';
		getReviewList(1,kind,search,code);
		
		/*검색입력했을때 실행*/
		 $('.btn_board_search').click(function(){	
			var result=''.concat($("#FCode").val(),$("#BCode").val());
			$("#findPrdCode").val(result);
			/*무조건 첫페이지 뿌려줘서 pn=1*/
			search=$("#search").val();
			kind=$("#search_cate03").val();
			code=$("#findPrdCode").val();
			getReviewList(1,kind,search,code);
		}); 

		/*이벤트 위임 : 페이지 번호 클릭했을때 실행*/
		$("#reviewList").on('click','.pageBtn',function(){
			const num=$(this).attr("data-list-pn");
			kind=$("#search_cate03").val();
			getReviewList(num,kind,search,code);
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
		
		/*다중 셀렉트문 관련 스크립트*/
		//큰 카테고리 먼저 선택
		 $("#bigCate").on('change',function(){
			 var pickCate= $("#bigCate").val();
			 if(pickCate==''){
				 $(".select_box.sCate").css('display','none');
				 $("#smallCate01").css('display','inline-block'); 
			 }else if(pickCate=='000'){
				 $(".select_box.sCate").css('display','none');
				 $("#smallCate02").css('display','inline-block');
				 pickCate='';
			 }else if(pickCate=='001'){
				 $(".select_box.sCate").css('display','none');
				 $("#smallCate03").css('display','inline-block');
			 }else{
				 $(".select_box.sCate").css('display','none');
				 $("#smallCate04").css('display','inline-block');
			 }  
			 $("#FCode").val(pickCate);
		});

		//작은 카테고리 선택  
		$("#smallCate01").on('change',function(){
			$("#BCode").val($(this).val());
		});
		$("#smallCate02").on('change',function(){
			$("#BCode").val('');
		});
		$("#smallCate03").on('change',function(){
			$("#BCode").val($(this).val());
		});
		$("#smallCate04").on('change',function(){
			$("#BCode").val($(this).val());
		});

		
		
		
		
		function getReviewList(pn,kind,search,code){
			$.ajax({
				url:'./reviewAllAj',
				type:'get',
				data:{pn:pn,kind:kind,search:search,code:code},
				success:function(data){
					$("#reviewList").empty();
					//------ 검색하던 중이던 내용 계속 유지 시키기(페이지 넘겨도)
					 $(".search_kind").each(function(){
						 if($(this).val()==kind){
							$(this).prop("selected",true);
						}
					}); 
					$("#search").val(search);
					$("#findPrdCode").val(code);
					 $("#reviewList").append(data.trim());
						
					 $('.pageBtn').each(function() {
						 if($(this).attr("data-list-pn")!=pn){
						 	 $(this).removeClass("on");
						 }else{
							 $(this).addClass("on");
						 }
					});
					 
					 $(".review_img").each(function(){
							$(this).hover(
								function(){
								$(this).siblings('.show').css("display","block");		
								},
								
								function(){
									$(this).siblings('.show').css("display","none");		
								}
							);
						}); 
					 
					 $(".star_rate").each(function(){
							star=$(this).val();	
							let html='';
							if(star==5){
								html="<span class='rating_star'>★★★★★</span>"
								$(this).next('.review_star').append(html);
							}else if(star==4){
								html="<span class='rating_star'>★★★★<em>★</em></span>"
								$(this).next('.review_star').append(html);
							}else if(star==3){
								html="<span class='rating_star'>★★★<em>★★</em></span>"
								$(this).next('.review_star').append(html);
							}else if(star==2){
								html="<span class='rating_star'>★★<em>★★★</em></span>"
								$(this).next('.review_star').append(html);
							}else{
								html="<span class='rating_star'>★<em>★★★★</em></span>"
								$(this).next('.review_star').append(html);
							}
						});
					 
					 
					 
				}
		
			});
			
		}
		
		
		
		
		
		
		
		
	
	</script>
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>