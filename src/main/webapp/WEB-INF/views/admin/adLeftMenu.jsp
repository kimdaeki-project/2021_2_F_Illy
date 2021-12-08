<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<style type="text/css">
		.left_cont{width:180px; margin-top:5px;   float:left; display:block;   }
		.left_cont h2{padding:0 0 5px 25px; font-size:18px; color:#333333; border-bottom:0;  }
		.left_cont_box{border-radius:21px; padding:10px 25px 11px 25px; margin-bottom:57px; border:1px solid #aaa; margin-top:9px; display:block; box-sizing:border-box; }
		.left_cont_box li{ margin:15px 0; }
		.left_cont_box li a{font-weight:normal; font-size:14px; padding:7px 0; line-height:14px; margin-bottom:10px;   }

	</style>

</head>
<body>
			
	<div class="left_cont">
		<h2>게시판 글쓰기</h2>		
		<ul class="left_cont_box">	
			<li>
				<a href="/admin/board/insertNotice">공지사항</a>
			</li>
			<li>
				<a href="/admin/board/insertFaq">FAQ</a>
			</li>
			<li>
				<a href="/admin/board/answerQna">1:1문의</a>
			</li>
			<li>
				<a href="/admin/board/insertEvent">이벤트</a>
			</li>
		</ul>	
	</div>
			
			
			
			
				
				
				
				
</body>
</html>