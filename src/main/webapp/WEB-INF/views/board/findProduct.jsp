<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style>
		.prdSearch h2{font-size:18px;padding-bottom:10px; border-bottom:1px solid #333;}
		.prdSearch{border-bottom:1px solid #ccc;}
		.prdSearch_box{ width:450px; height:80px; border:2px solid #dbdbdb; margin:0 auto; padding:20px 20px;}
		.prdSearch_box div{padding:5px 0; }
		.prdSearch_box div span{color:#777; font-size:13px; font-weight:bold; padding:6px 15px 0 0; }
		.prdSearch_box div .select_box{height:31px; font-size:13px; padding:5px; color:#717171;vertical-align:top; border:1px solid #ccc;}
		.prdSearch_box div .select_box option{height:31px; font-size:13px; }
		.prdSearch_box div input{height:27px; width:200px; font-size:13px; padding-left:5px; color:#717171; border:1px solid #ccc; }
		.searchBtn{cursor:pointer; display:block; width:100px; height:31px; font-weight:bold; margin:20px auto; text-align:center; color:#fff; background-color:#000; border:none;  }
		.searchBtn em{padding: 2px 20px 0 0;background-image: url(/images/board/btn_goods_search.png);background-position: right 3px; background-repeat: no-repeat;}
		#prdList{display:block; overflow:auto; margin-bottom:5px;height:300px;  border-top:1px solid #dbdbdb; border-bottom:1px solid #dbdbdb;}
		#prdList .totalPrd{display:block; padding: 20px 0 10px 0; font-size:14px; }
		#prdList .totalPrd strong{font-weight:bold;}
		.product_list_table{border-collapse: collapse;}
		.product_list_table th{ margin:0;font-size:12px; height:57px;padding:9px 10px 10px 10px; color:#777; border-top:1px solid #999; border-bottom:1px solid #dbdbdb;background-color:#f7f7f7; border-right:none; border-left:none;}
		.product_list_table tbody tr{border-bottom:1px solid #dbdbdb;}
		.product_list_table tbody tr td.prd{text-align:left; position:relative; vertical-align:middle;}
		.product_list_table tbody tr td.prd div{display:inline-block; }
		.product_list_table tbody tr td{padding:15px 10px 14px;text-align:center; color:#777; font-size:12px; font-weight:bold; }
		.pagination .btnPage{min-width:26px; background-color:#fff;border:1px solid #e0e0e0;cursor:pointer;color:#888; font-size:11px; padding: 6px 4px 10px 4px; }
		.pageNum{cursor:pointer; display:inline-block;  font-size:11px; color:#888; height:30px; width:30px; line-height:30px; vertical-align:middle;  }	
		.pageNum.on{font-weight:bold; color:#fff; background-color:#7a7d81; border-radius:20px; }
		.pagination{padding-top:5px;text-align:center; cursor:pointer;  }
		.prdThumb{width:40px; height:40px; vertical-align:middle; margin-right:5px; border:1px solid #dbdbdb; display:inline-block;}
		.btnWrap{display:block;text-align:center;}
		.subBtn{display:inline-block; min-width:80px; height:35px; padding: 0 10px; color:#333; font-weight:bold; font-size:14px; border-radius:21px; background-color:#fff;text-align:center; cursor:pointer; border:1px solid #ccc; margin-top:10px;}		
		.subBtn.sub{color:#fff; background-color:#d12140; border:1px solid #d12140;}
		.subBtn.sub:hover{ background: linear-gradient(90deg,#d12420,#d12420,#910d18)}
	</style>

<title>Insert title here</title>
</head>
<body>

<div class="popup_wrap">
	<div class="prdSearch">	
		<h2>상품 검색</h2>
		<div class="prdSearch_box">
			<div>
				<span>카테고리</span>
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
				</select>
				<select class="select_box sCate" id="smallCate04" style="display:none;">
					<option value="">=카테고리 선택=</option>
					<option value="001">캡슐머신</option>
					<option value="002">X7.1</option>
				</select>
				<input hidden="" id="FCode" value="">		
				<input hidden="" id="BCode" value="">
				<input hidden="" name="code" id="findPrdCode" >
			</div>
			<div>
				<span style="margin-right:13px;">검색어</span>
				<select class="select_box" id="kind" name="kind">
					<option class="search_kind" value="product_name">상품명</option>
					<option class="search_kind" value="product_id">상품코드</option>
				</select>
				<input type="hidden" name="pn" value="1" id="pn">
				<input type="text" name="search" id="search" class="">		
			</div>
		</div>	
		<button type="button" class="searchBtn">조회<em></em></button>
	</div>

	<div id="prdList">	
		
		<!--Ajax로 불러오기-->
			
	</div>
</div>

<div class="btnWrap">
	<button type="button" class="subBtn prev">취소</button>
	<button type="button" class="subBtn sub">확인</button>
</div>





<script type="text/javascript" src="/js/findProduct.js"></script>

</body>
</html>