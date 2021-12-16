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
		<c:import url="/WEB-INF/views/admin/adNavbar.jsp"></c:import>
		<div id="container" style="padding-bottom: 155px; margin-bottom: -155px;">
			
			<div id="contents">
				
				<div id="ajaxList">
				</div>
				
			</div>
			
		</div>
		<c:import url="/WEB-INF/views/admin/adFooter.jsp"></c:import>
	</div>
</body>
	<script type="text/javascript">
	
		$().ready(function(){
			getAjaxList(1);
			$('.pricePattern').each(function(){
				$(this).html(Number($(this).html()).toLocaleString() + '원');
			})
		});
	
		function getAjaxList(pn) {
			$.ajax({
				async : false,
				type : 'GET',
				url : '/product/getAjaxList',
				data : {
					product_categoryCode	:	"${product_categoryCode}"
					,requestor				:	"admin"
					,pn						:	pn
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