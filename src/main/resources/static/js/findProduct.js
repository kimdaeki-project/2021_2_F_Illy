/**
 * 
 */
 
 
 /*전역변수 선언 */
let kind='';
let search='';
let code='';

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

 
/*검색입력했을때 실행*/
 $('.searchBtn').click(function(){	
	var result=''.concat($("#FCode").val(),$("#BCode").val());
	$("#findPrdCode").val(result);
	/*무조건 첫페이지 뿌려줘서 pn=1*/
	search=$("#search").val();
	kind=$("#kind").val();
	getList(1,kind,search,$("#findPrdCode").val());
}); 

/*이벤트 위임 : 페이지 번호 클릭했을때 실행*/
$("#prdList").on('click','.pageBtn',function(){
	const num=$(this).attr("data-list-pn");
	getList(num,kind,search,code);
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
 
 function getList(pn,kind,search,code){
	$.ajax({
		url:'./findProductAj',
		type:'get',
		data:{pn:pn,kind:kind,search:search,code:code},
		success:function(data){
			 $("#prdList").empty();	 
			//------ 검색하던 중이던 내용 계속 유지 시키기(페이지 넘겨도)
			 $(".search_kind").each(function(){
				 if($(this).val()==kind){
					$(this).prop("selected",true);
				}
			}); 
			$("#search").val(search);
		
			 $("#prdList").append(data.trim()); 
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
 
var product_id='';
$('.pick_prd').each(function() {
	 if($(this).prop("selected",true)){
		product_id=$(this).val();
	}
});

 
 
$(".subBtn.sub").click(function(){
	$.ajax({
		url:'./addQna',
		type:'get',
		data:{product_id:product_id},
		success:function(data){
			console.log(data);
			opener.location.reload();
			window.close();
		}
	});	
});
 
 
 
 
 
 
 