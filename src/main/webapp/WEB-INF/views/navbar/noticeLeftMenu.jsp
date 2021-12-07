<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<style type="text/css">
		.left_cont{width:200px;  float:left; display:block;   }
		.left_cont h2{padding:0 0 5px 25px; font-size:18px; color:#333333; border-bottom:0;  }
		.left_cont_box{border-radius:21px; padding:10px 25px 11px 25px; margin-bottom:57px; border:1px solid #d12420; margin-top:9px; display:block; box-sizing:border-box; }
		.left_cont_box li{ margin:15px 0; }
		.left_cont_box li a{font-weight:normal; font-size:14px; padding:7px 0; line-height:14px; margin-bottom:10px;   }
		
		.cs_center{float:left;  padding-left:10px; }
		.cs_center .cs_f span{font-size:14px; font-weight:bold; padding:8px 0 10px; line-height:14px; }
		.cs_center .cs_f span:first-child{ border-top:0.1px solid #bbb; }
		.cs_center .cs_mail > span > a{font-size:12px; margin-top:12px;  display:block;  }
		.cs_center .cs_mail > span > a:hover{text-decoration:underline;}
	</style>

</head>
<body>
			
	<div class="left_cont">
		<h2>고객센터</h2>		
		<ul class="left_cont_box">	
			<li>
				<a href="/notice/list">공지사항</a>
			</li>
			<li>
				<a href="/notice/faqList">FAQ</a>
			</li>
			<li>
				<a href="/member/qnaList">1:1문의</a>
			</li>
			<li>
				<a href="/review/bestReview">상품후기</a>
			</li>
			<li>
				<a href="#">이벤트</a>
			</li>
			<li>
				<a href="#">고객지원</a>
			</li>
		</ul>	
		<div class="cs_center">		
			<div class="cs_f"><span>고객</span><span>상담센터</span></div>
			<div class="cs_mail"><span><a href="mailto:service@illycaffe.co.kr" class="info_mail_link">service@illycaffe.co.kr</a></span></div>		
		</div>		
	
	</div>
			
			
			
			
				
				
				
				
</body>
</html>