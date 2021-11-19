<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<style type="text/css">
		.right_content{float:left; width:960px; padding-left:60px; }
		.board_zone_tit{margin-bottom:10px; padding-bottom:10px;}
		.board_zone_tit h2{color:#d12420; font-size:24px;}
		.board_list_table{width:100%;margin:0 0 20px 0;border:0;border-spacing:0;border-collapse:collapse;border-top:1px solid #999999;text-align:center;}
		.board_list_table th{padding:10px 10px 10px 14px; font-size:12px; border-bottom:1px solid #dbdbdb; background:#fbfbfb;}
		.board_list_table td{padding:13px 10px 15px 10px; border-bottom:1px solid #dbdbdb;}
		tbody tr td{font-weight:normal; font-size:12px; color:#333;}
		.pagination{text-align:center; margin-top:60px;  }
		.test{width:20px; height:20px; background-color:#fff; border:none;   font-size:12px; line-height:12px;    }
		.board_search_box{margin: 60px 0 30px 0;padding: 10px 10px 10px 10px;border-top: 1px solid #e8e8e8;border-bottom: 1px solid #e8e8e8; background: #f7f7f7; text-align: center;}
		.kind{width:90px; height:31px;  vertical-align:top; text-align:left; font-size:13px; border-color:#ccc; padding-left:8px;  }
		.text{width:162px; height:31px;  vertical-align:top; text-align:left; font-size:13px; border:1px solid #ccc; padding:0 10px;   }
		.btn_board_search{border:none; margin: 0 0 0 5px;padding: 0 20px 0 20px;color: #fff; border-radius: 21px;background: #d12420;line-height: 30px; cursor:pointer; }
	</style>

<title>일리카페 코리아</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>		
		<div id="container">
				
			<div id="contents">
			
			<c:import url="/WEB-INF/views/navbar/noticeLeftMenu.jsp"></c:import>		
			<!-- right content work start -->	
			<div class="right_content">
				<div class="board_zone_sec">
					<div class="board_zone_tit">
						<h2>공지사항</h2>
					</div>
					<div class="board_zone_cont">
						<table class="board_list_table" style="width:100%;">
							<colgroup> <!-- table 간격 기본설정 -->
								<col width="6%">
								<col width="40%">
								<col width="15%">
								<col width="7%">
								<col width="15%">								
							</colgroup>
							<thead>
								<tr>
									<th>번호</th><th>제목</th><th>날짜</th><th>작성자</th><th>조회</th>
								</tr>
							</thead>
							<tbody>
							<%-- <c:set var="size" value="${fn:length(List)}" />	 --%>
								<c:forEach items="${List}" var="ar">
									<tr>
									<c:choose>
									<c:when test="${ar.notice_top eq 1}">
										<td scope="row"><img src="/images/board/icon_board_notice.png"></td>
									</c:when>	
									<c:otherwise>									
										<td scope="row">${ar.notice_id}</td>
									</c:otherwise>
									</c:choose>
										<td scope="row" style="text-align:left;">
											<a href="#">
												[${ar.notice_type}] ${ar.notice_title}&nbsp;
												<c:if test="${ar.notice_hits > 100}">
													<img src="/images/board/icon_board_hot.png">
												</c:if>
											</a>
										</td>
										<td scope="row">${ar.notice_regDate}</td>
										<td scope="row">관리자</td>
										<td scope="row">${ar.notice_hits}</td>
										
									</tr>
									
								</c:forEach>
							</tbody>
						</table>
			
			
						<div class="pagination">
							<button type="button" class="test">1</button>
							<button type="button" class="test">2</button>
							<button type="button" class="test">3</button>
						</div>
			
			
			
						<div class="board_search_box">
							<form name="frmList" id="frmList" action="noticeList" method="get">
								<select class="kind" name="kind">
									<option value="title">제목</option>
									<option value="contents">내용</option>
									<option value="writer">작성자</option>
								</select>	
								<input type="text" class="text" name="search" value="">
								<button type="button" class="btn_board_search">검색</button>
							</form>
						</div>
					</div>	
				
				</div>
			</div>	
			<!-- right content work end  -->	
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>		
	</div>
	
	
	
	
	<script type="text/javascript">
	

	</script>
	
	
	
	
	
</body>
</html>