/**
 * 
 */
 

changeDate(null,null,1);
 
function changeDate(start_date,end_date,pn){
	$.ajax({
		url:'./qnaListDate',
		type:'get',
		data:{start_date:start_date,end_date:end_date,pn:pn},
		success:function(data){
			$("#empty").empty();
			$("#empty").append(data.trim());	
			
		
			 $('.pageBtn').each(function() {
				 if($(this).attr("data-list-pn")!=pn){
				 	 $(this).removeClass("on");
				 }else{
					 $(this).addClass("on");
				 }
			});
		
		}
	});	
	
		
};

$("#empty").on('click','.pageBtn',function(){
	const num=$(this).attr("data-list-pn");
	changeDate(null,null,num);
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





/*날짜 정렬 선언*/
let date_line = new Date();
let today=getToday(date_line);
	
/*페이지 업로드시 오늘 날짜 date_picker에 입력되어있기*/
$("#start_date").val(today);
$("#end_date").val(today);

/*날짜 정렬 함수 선언*/
function getToday(date){
	var year=date.getFullYear();
	var month=date.getMonth()+1;
	var day=date.getDate();
	return year+"-"+("0"+(month)).slice(-2)+"-"+("0"+day).slice(-2); 
} 

/*기간 검색 버튼 누를때 선언*/
$(".pick_date").click(function(){
	var pick_term=$(this).data('term');	
	if(pick_term == 1){
		$("#start_date").val(today);
		$("#end_date").val(today);
		console.log($("#start_date").val());
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
	
	
	
	changeDate($("#start_date").val(),$("#end_date").val(),1);
	
	
	
	
	
	
	
});




