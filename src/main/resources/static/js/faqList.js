/**
 * 
 */
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


 /*-- faq게시판 삭제 --*/
 $("#showFaqList").on('mouseover','.deleteBtn',function(){
	let pick = $(this).find("i");
	pick.removeClass("xi-close-square-o"); 
	pick.addClass("xi-close-square"); 
});

 $("#showFaqList").on('mouseout','.deleteBtn',function(){
	let pick = $(this).find("i");
	pick.removeClass("xi-close-square"); 
	pick.addClass("xi-close-square-o"); 
});


 /*-- faq게시판 수정 --*/
 $("#showFaqList").on('mouseover','.updateBtn',function(){
	let pick = $(this).find("i");
	pick.removeClass("xi-pen-o"); 
	pick.addClass("xi-pen"); 
});

 $("#showFaqList").on('mouseout','.updateBtn',function(){
	let pick = $(this).find("i");
	$(this).children().removeClass("xi-pen"); 
	$(this).children().addClass("xi-pen-o"); 
});


/*삭제 버튼 누르면 삭제*/
$("#showFaqList").on('click','.deleteBtn',function(){
	if(confirm("정말 삭제 하시겠습니까?")==true){
		var faq_id=$(this).parents().data("faq_id");
		$.ajax({
			url:'./faqDelete',
			type:'get',
			data:{faq_id:faq_id},
			success:function(data){
				location.href="./adFaqList";
			}
		});
	}else{
		return false;
	}
});





