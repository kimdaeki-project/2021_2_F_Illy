/**************************************************
* addFile
**************************************************/

function addFiles(multipartFiles, inputFile){
	let maximumFileCnt = Number(multipartFiles.data('maximum_file_cnt')); //최대 파일개수
	let fileListArr = Array.from(multipartFiles[0].files); //기존 file을 배열에 대입
	let addFileListArr = Array.from(inputFile.files); //추가 file을 배열에 대입	
	let dataTransfer = new DataTransfer(); //기존 + 추가된 file을 담을 dataTransfer 변수선언
	
	let index = $('.imgBoxWrap').data('init_img_cnt');
	for(let file of fileListArr){
		if(index == maximumFileCnt) { break; }
		dataTransfer.items.add(file); //기존 file을 dataTransfer에 add
		index++;
	}		
	for(let file of addFileListArr){
		if(index == maximumFileCnt) { break; }
		dataTransfer.items.add(file); //추가 file을 dataTransfer에 add
		index++;
	}	
	multipartFiles[0].files = dataTransfer.files; //multipartFiles에 dataTransfer 대입
}	
	
function addPeviewImg(multipartFiles, imgBoxWrap, inputFile){
	let maximumFileCnt = Number(multipartFiles.data('maximum_file_cnt')); //최대 파일개수
	let total_img_cnt = imgBoxWrap.data('total_img_cnt'); //현재 이미지 개수
	
	for(let file of inputFile.files){
		if(total_img_cnt < maximumFileCnt){
			appendImgBox(imgBoxWrap, file, total_img_cnt);
			
			total_img_cnt++;
			imgBoxWrap.data('total_img_cnt', total_img_cnt);
		}
		if(total_img_cnt == maximumFileCnt){
			let inputBox = multipartFiles.siblings('.inputBox');
			inputBox.css('display', 'none');
			return;
		}
	}
}

function appendImgBox(imgBoxWrap, file, total_img_cnt){
	let html
	="<div class='imgBox'>"
	+"<img alt='' src='' class='previewImg'>"
	+"<button type='button' class='deleteFileBtn'></button>"
	+"</div>"
	imgBoxWrap.append(html);
	
	let previewImg = imgBoxWrap.find('.previewImg').last();
	let deleteFileBtn = imgBoxWrap.find('.deleteFileBtn').last();
	previewImg.data('img_index', total_img_cnt);
	deleteFileBtn.data('img_index', total_img_cnt);
	
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
	let init_img_cnt = $('.imgBoxWrap').data('init_img_cnt'); //updatePage init img cnt
	let img_index = deleteFileBtn.data('img_index'); //클릭한 버튼 index
	let dataTransfer = new DataTransfer(); //dataTransfer 변수선언	
	
	if(init_img_cnt > 0) { img_index = img_index - init_img_cnt; }
	if(img_index >= 0) {		
		fileListArr.splice(img_index, 1); //배열에서 index번째 file 1개 삭제
		for(let file of fileListArr){
			dataTransfer.items.add(file); //배열에 있는 file을 dataTransferd에 items.add
		}		
		multipartFiles[0].files = dataTransfer.files; //multipartFiles에 dataTransfer 대입
	}
}

function deletePeviewImg(deleteFileBtn, multipartFiles){
	let index = deleteFileBtn.data('img_index'); //클릭한 버튼 index	
	let imgBox = deleteFileBtn.parent();
	let imgBoxWrap = imgBox.parent();
	
	imgBox.remove(); //이미지 삭제
	imgBoxWrap.data('total_img_cnt', imgBoxWrap.data('total_img_cnt') - 1);
	
	let init_img_cnt = imgBoxWrap.data('init_img_cnt');
	if(index < init_img_cnt && init_img_cnt > 0){ imgBoxWrap.data('init_img_cnt', --init_img_cnt); }
	
	let total_img_cnt = $('.imgBoxWrap').data('total_img_cnt');	
	let maximumFileCnt = Number(multipartFiles.data('maximum_file_cnt')); //최대 파일개수
	if(total_img_cnt < maximumFileCnt){
		let inputBox = multipartFiles.siblings('.inputBox');
		inputBox.css('display', 'inline-block');
	}
}

function setImgIndex(imgBox) {
	let index = 0;
	
	imgBox.each(function(){
		previewImg = $(this).find('.previewImg')
		deleteFileBtn = $(this).find('.deleteFileBtn')
		previewImg.data('img_index', index);
		deleteFileBtn.data('img_index', index);
		index++;
	});
}