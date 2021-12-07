<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	
	<style type="text/css">
		#right_content{width:1000px;float:left;padding-left:40px;}
		.board_zone_tit h2{font-size:24px; color:#333333;padding-bottom:10px; margin-bottom:9px;    }
		.board_zone_cont{border-top:1px solid #999; width:100%; }
		.qna_write tbody tr th{font-size:12px; line-height:1.5; color:#333; margin:0; border-bottom:1px solid #dbdbdb; padding:13px 0 13px 25px; font-weight:bold; background-color:#fbfbfb;text-align:left; vertical-align:top;  }
		.qna_write tbody tr td{font-size:12px; line-height:1.5; color:#333;height:32px; margin:0; padding:7px 0 11px 15px; border-bottom:1px solid #dbdbdb; background-color:#fff;  }
		.qna_write tbody tr input{width:320px; height:31px; padding:0 10px; border:1px solid #d6d6d6; color:#333; line-height:31px;  }
		#qna_type{width:127px; height:31px; color:#717171; vertical-align:top; outline:none; font-size:12px; line-height:1.5; color:#333;  }
		.pro_choice_btn{display:inline-block; width:80px; height:26px; margin-left:5px; line-height:24px; color:#fff; font-size:12px; border:1px solid #979797; background-color:#979797; text-align:center; vertical-align:center; cursor:pointer;}
		.pro_choice_btn:hover{background-color:#626262; border:1px solid #626262; }
		.qna_write tbody tr input.qna_phone{width:90%;}
		.cont_ex{color:#333; font-size:12px; }
		.cont_ex em{color:#ff0000;  font-weight:bold;}
		.btn_wrap{position:relative; text-align:center; margin-top:30px;  }
		.boardBtn{display:inline-block; font-weight:bold;  background-color:#fff; width:100px; height:42px; padding:0 5px; color:#3e3d3c; font-size:14px; border:1px solid #ccc; text-align:center; cursor:pointer; }
		.boardBtn.upload{ background-color:#000; color:#fff; min-width:90px; padding:0 10px;  border-color:1px solid #000; margin-left:6px; }
		#qna_contents{resize:none; width:90%; min-height:300px; margin-top:10px; border:1px solid #d6d6d6; outline-color:#d6d6d6; padding:10px; }
		.inputFileWrap { font-size: 0; }
		.inputFileWrap .inputBox { height: 128px; }
		.inputFileLable { width: 128px; height: 128px; background: url('/images/admin/ico_plus.svg') no-repeat; background-size:32px 32px; background-position: center; cursor: pointer; color: transparent; }
		.imgBoxWrap { display: inline-block; line-height: 0; }
		.imgBox { position: relative; display: inline-block; border: 1px solid #333; border-radius: 20px; margin-right: 10px; width: 128px; height: 128px; overflow: hidden; }
		.previewImg { position: absolute; left: 0; top: 50%; transform: translateY(-50%); border-radius: 20px; width: 128px; }
		.deleteFileBtn { position: absolute; right: 10px; top: 10px; padding: 0; border: 1px solid #333; border-radius: 20px; width: 20px; height: 20px; background: url('/images/admin/ico_x.svg') no-repeat; background-size: 12px; background-position: center ; background-color: #fff; visibility: hidden; cursor: pointer; }
		.deleteFileBtn:hover { background-image: url('/images/admin/ico_xRed.svg'); border: 1px solid #d12420; }
		.inputBox { position: relative; display: inline-block; line-height: 0; vertical-align: top; }
		label { position:absolute;  height: 40px; border: 1px solid #d6d6d6; padding: 0 20px; margin-left:-3px; }		 
	</style>
	

<title>일리카페 코리아</title>


</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>	
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>	
		<div id="container">
							
			<div id="contents">
			<c:import url="/WEB-INF/views/navbar/myPageLeftBar.jsp"></c:import>	
				<div id="right_content">
					<div class="board_zone_tit">
						<h2>1:1문의</h2>
					</div>
					<div class="board_zone_cont">
						<form action="./addQnaList" id="qnaFrm" method="post" enctype="multipart/form-data">
							<table class="qna_write">
								<colgroup>
									<col style="width:143px">
									<col style="width:808px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">말머리</th>
										<td>
											<select id="qna_type" name="qna_type">
												<option>문의내용</option>
												<option value="커피머신 문의">커피머신 문의</option>
												<option value="정품 인증">정품 인증</option>
												<option value="커피 문의">커피 문의</option>
												<option value="정기구독 주문/배송">정기구독 주문/배송</option>
												<option value="정기구독 서비스 문의">정기구독 서비스 문의</option>
												<option value="주문/배송 문의">주문/배송 문의</option>
												<option value="★ 커피머신A/S 문의">★ 커피머신A/S 문의</option>
												<option value="★ 반품 접수">★ 반품 접수</option>
												<option value="★ 교환 접수">★ 교환 접수</option>
												<option value="★ 지출증빙 접수">★ 지출증빙 접수</option>
												<option value="기타 문의">기타 문의</option>
											</select>
										
										
										</td>
									</tr>
									<tr>
										<th scope="row">작성자</th>
										<td>vncvncvncvnvcncnvc</td>
									</tr>
									<tr>
										<th scope="row">상품선택</th>
										<td>선택된 상품이 없습니다 <button type="button" class="pro_choice_btn">상품 선택</button></td>
									</tr>
									<tr>
										<th scope="row">휴대폰</th>
										<td>
											<input type="text" class="qna_phone" placeholder="- - 없이 입력하세요" >
										</td>
									</tr>
									<tr>
										<th scope="row">링크</th>
										<td>
											<input type="text" >
										</td>
									</tr>
									<tr>
										<th scope="row">제목</th>
										<td>
											<input type="text" class="qna_title" name="qna_title">
										</td>
									</tr>
									<tr>
										<th scope="row">본문</th>
										<td>
											<p class="cont_ex">
												<em>1:1 문의하기는 비밀글로만 작성되며 유선으로 연락드리지 않습니다.</em><br>
												교환이나 반품 원하시는 경우 구매처 확인 부탁드립니다.<br>
												병행 수입 또는 해외 직구 상품은 상담하지 않습니다.<br>
												상품에서 (주)큐로홀딩스 또는 일리카페코리아 스티커 확인 부탁드리며, 없을 경우 정품 보증서 확인 바랍니다.<br>
												<em>말머리 선택이 없거나 양식에 맞지 않을 경우 추가 요청으로 인해 처리 지연됩니다.</em>
											</p>
											 
											 <textarea id="qna_contents" name="qna_contents"></textarea> 
										</td>
									</tr>
									<tr>
										<th scope="row">첨부파일</th>
										<td class="inputFileWrap" data-maximum_file_cnt="5" >
											<input type="file" name="multipartFiles" multiple="multiple" data-file_cnt="0" hidden="">
											
											<div class="imgBoxWrap" data-img_cnt="0">
											</div>
											
											<div class="inputBox">
												<input type="file" id="inputFile" class="inputFile" multiple="multiple" hidden="">
												<label for="inputFile" class="inputFileLable"></label>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">자동등록방지</th>
										<td>
											 <div class="g-recaptcha" data-sitekey=6LeN34MdAAAAAPKUbkjmd0VH2dKXKwLW1EWdZwqu
></div>
										</td>
									</tr>
								
								
								
									
								</tbody>
						
							</table>
							<div class="btn_wrap">
								<button type="button" class="goback boardBtn">이전</button>
								<button type="button" class="upload boardBtn">저장</button>
							</div>
						</form>
						
					</div>
				
				</div>
				<!--right_content END-->
			</div>	
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>



	<script type="text/javascript">
	$(function() {
		$('#add_member_form').submit(function() {
				var captcha = 1;
				$.ajax({
		            url: './VerifyRecaptcha',
		            type: 'post',
		            data: {
		                recaptcha: $("#g-recaptcha-response").val()
		            },
		            success: function(data) {
		                switch (data) {
		                    case 0:
		                        console.log("자동 가입 방지 봇 통과");
		                        captcha = 0;
		                		break;
		                    case 1:
		                        alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
		                        break;
		                    default:
		                        alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
		                   		break;
		                }
		            }
		        });
				if(captcha != 0) {
					return false;
				} 
		});
		});
	
	</script>

	









</body>
</html>


