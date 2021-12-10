/**
 * 
 */

 /*-- 게시판 삭제 --*/
 $("#showFaqList").on('mouseover','.deleteBtn',function(){
	let pick = $(this).find("i");
	pick.removeClass("xi-close-square-o"); 
	pick.addClass("xi-close-square"); 
});

 $("#showFaqList").on('mouseout','.deleteBtn',function(){
	$(this).children().removeClass("xi-close-square"); 
	$(this).children().addClass("xi-close-square-o"); 
});

/* $("#showFaqList").on('click','.deleteBtn',function(){
	if(confirm("정말 삭제 하시겠습니까?")==true){
		var notice_id=$(this).parents(".noticeEx").data("notice_id");
		$.ajax({
			url:'./deleteNotice',
			type:'get',
			data:{notice_id:notice_id},
			success:function(data){
				location.href="./list";
			}
		});
	}else{
		return false;
	}
});
*/
