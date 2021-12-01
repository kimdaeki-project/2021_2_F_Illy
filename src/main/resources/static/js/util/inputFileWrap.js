/**************************************************
* addFile
**************************************************/

function addFiles(multipartFiles, inputFile){
	let maximumFileCnt = Number(multipartFiles.data('maximum_file_cnt')); //최대 파일개수
	let fileListArr = Array.from(multipartFiles[0].files); //기존 file을 배열에 대입
	let addFileListArr = Array.from(inputFile.files); //추가 file을 배열에 대입
	
	let dataTransfer = new DataTransfer(); //기존 + 추가된 file을 담을 dataTransfer 변수선언
	let file_cnt = 0;
	for(let file of fileListArr){
		if(file_cnt == maximumFileCnt) { break; }
		dataTransfer.items.add(file); //기존 file을 dataTransfer에 add
		file_cnt++;
	}		
	for(let file of addFileListArr){
		if(file_cnt == maximumFileCnt) { break; }
		dataTransfer.items.add(file); //추가 file을 dataTransfer에 add
		file_cnt++;
	}	
	multipartFiles[0].files = dataTransfer.files; //multipartFiles에 dataTransfer 대입
	
	multipartFiles.data('file_cnt', file_cnt);	
	
	if(file_cnt == 5){
		let inputBox = multipartFiles.siblings('.inputBox');
		inputBox.css('display', 'none');
	}
}	
	
function addPeviewImg(multipartFiles, imgBoxWrap, inputFile){
	let maximumFileCnt = Number(multipartFiles.data('maximum_file_cnt')); //최대 파일개수
	let img_cnt = imgBoxWrap.data('img_cnt'); //현재 이미지 개수
	
	for(let file of inputFile.files){
		if(img_cnt < maximumFileCnt){
			appendImgBox(imgBoxWrap, file);
			
			img_cnt++;
			imgBoxWrap.data('img_cnt', img_cnt);
		}
	}
	
}

function appendImgBox(imgBoxWrap, file){
	let img_cnt = imgBoxWrap.data('img_cnt');
	let html
	="<div class='imgBox'>"
	+"<img alt='' src='' class='previewImg'>"
	+"<button type='button' class='deleteFileBtn'></button>"
	+"</div>"
	imgBoxWrap.append(html);
	
	let previewImg = imgBoxWrap.find('.previewImg').last();
	let deleteFileBtn = imgBoxWrap.find('.deleteFileBtn').last();
	previewImg.data('index', img_cnt);
	deleteFileBtn.data('index', img_cnt);
	
	setPeviewImg(file, previewImg);
}

function setPeviewImg(file, imgTag) {
	let reader  = new FileReader();
	
	reader.onload = function(e) {
		imgTag.attr('src', e.target.result);
	}
	
	if(file) {
		reader.readAsDataURL(file);
	}
}

/**************************************************
* deleteFile
**************************************************/

	
function deleteFile(deleteFileBtn, multipartFiles) {
	let fileListArr = Array.from(multipartFiles[0].files); //files를 배열에 대입
	let index = deleteFileBtn.data('index') //클릭한 버튼 index
	let dataTransfer = new DataTransfer(); //dataTransfer 변수선언		
	let maximumFileCnt = Number(multipartFiles.data('maximum_file_cnt')); //최대 파일개수
	let file_cnt = multipartFiles.data('file_cnt'); //현재 파일개수
	
	fileListArr.splice(index, 1); //배열에서 index번째 file 1개 삭제
	for(let file of fileListArr){
		dataTransfer.items.add(file); //배열에 있는 file을 dataTransferd에 items.add
	}		
	multipartFiles[0].files = dataTransfer.files; //multipartFiles에 dataTransfer 대입
	
	file_cnt--;
	multipartFiles.data('file_cnt', file_cnt);
	
	if(file_cnt < maximumFileCnt){
		let inputBox = multipartFiles.siblings('.inputBox');
		inputBox.css('display', 'inline-block');
	}
}

function deletePeviewImg(deleteFileBtn){		
	let imgBox = deleteFileBtn.parent();
	let imgBoxWrap = imgBox.parent();
	
	imgBox.remove(); //이미지 삭제
	imgBoxWrap.data('img_cnt', imgBoxWrap.data('img_cnt') - 1);		
}

function setImgIndex(imgBox) {
	let index = 0;
	
	imgBox.each(function(){
		previewImg = $(this).find('.previewImg')
		deleteFileBtn = $(this).find('.deleteFileBtn')
		previewImg.data('index', index);
		deleteFileBtn.data('index', index);
		index++;
	});
}