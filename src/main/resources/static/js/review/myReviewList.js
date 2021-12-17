/**
 * 
 */
 
let firstDate = new Date();
let end_date = getToday(firstDate);
let start_date= new Date(firstDate.setMonth(firstDate.getMonth()-2));
start_date=getToday(start_date);

getDate(start_date, end_date, 1,0);
 
$(".tab").click(function(){

		if($(this).hasClass("select")){
			$(this).removeClass("select");
		}else{
			$(".tab").removeClass("select");			
			$(this).addClass("select");
		}
		
		if($(this).hasClass("yet")){
			getDate(start_date, end_date, 1,0);
		}else{
			getDate(start_date, end_date, 1,1);
		}	

});




function getToday(date){
	var year=date.getFullYear();
	var month=date.getMonth()+1;
	var day=date.getDate();
		
	 return year+"-"+("0"+(month)).slice(-2)+"-"+("0"+day).slice(-2); 
} 

function getDate(start_date,end_date,pn,cart_review_state){
	let member_id = $("#memberID").val();
	$.ajax({
		type:"GET",
		url:"./myReviewListAj",
		data: {	
			start_date:start_date,
			end_date:end_date,
			pn:pn,
			member_id:member_id,
			cart_review_state:cart_review_state
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