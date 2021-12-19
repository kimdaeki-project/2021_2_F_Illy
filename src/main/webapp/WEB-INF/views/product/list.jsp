<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/product/list.css">

<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<input type="hidden" value="${member.member_id}" id="member_id">
		<c:import url="/WEB-INF/views/navbar/navbar.jsp"></c:import>
		<c:import url="/WEB-INF/views/navbar/sideBar.jsp"></c:import>
		<div id="container">
			
			<div id="contents">
			
				<div id="ajaxList">
				</div>
				
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/navbar/footer.jsp"></c:import>
	</div>
</body>
	<script type="text/javascript">
	
		$().ready(function(){
			getAjaxList(1, "product_id DESC");
		});
	
		function getAjaxList(pn, sort) {			
			$.ajax({
				async : false,
				type : 'GET',
				url : '/product/getAjaxList',
				data : {
					product_categoryCode	:	"${product_categoryCode}"
					,requestor				:	"product"
					,pn						:	pn
					,sort					:	sort
				},
				success: function(result){
					result = result.trim();
					$("#ajaxList").html(result);
				},
				error:function(xhr, status, error){
					console.log("error : getAjaxList");
				}		
			});
		}
		
	</script>
</html>