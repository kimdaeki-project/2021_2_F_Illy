/**
 * 
 */ 
		
/*
track		: content의 부모 div (data-slide_content_cnt='INTEGER') 를 포함
content		: img의 부모 div
speed		: 슬라이드 이동에 걸리는 시간(ms)
slideBtn	: class로 "next" 또는 "prev" 를 포함하는 button
*/

/* ===== slide 함수 START ===== */
function slide(track, content, speed, slideBtn){
	/* 슬라이드 작동중 일 경우 종료 */
	if(track.hasClass('slideActive')) { return; }
	
	let translateX = Number(track.css('transform').split(',')[4]); // 현재 track X좌표
	let width = content.width(); //content 가로 사이즈	
	
	track.addClass('slideActive'); //트랙 활성화
		
	//방향 확인 및 좌표 설정
	if(slideBtn == null || slideBtn.hasClass('next')) {
		translateX -= width;
	} else if (slideBtn.hasClass('prev')) {
		translateX += width;					
	} else {
		translateX = -width * slideBtn.data('index');	
	}
	
	track.css('transition', 'transform '+speed+'ms ease 0s'); //속도 설정				
	track.css('transform', 'translateX('+translateX+'px)') //좌표 대입
	
	return oneRound(track, translateX, width, track.data('slide_content_cnt'), speed);
	
}
/* ===== slide 함수 END ===== */

/* ===== oneRound 함수 START ===== */
function oneRound(track, translateX, width, contentCnt, speed){
	if (translateX < -width * contentCnt) { translateX = -width; } //오른쪽 끝에 도달
	else if (translateX > -width) { translateX = -width * contentCnt; } //왼쪽 끝에 도달
	
	setTimeout(function(){
		track.css( 'transition', '' ); //속도 설정 *0
		track.css('transform', 'translateX('+translateX+'px)') //좌표 대입
		track.removeClass('slideActive'); //트랙 비활성화
	}, speed);
	
	return translateX;
}
/* ===== oneRound 함수 END ===== */