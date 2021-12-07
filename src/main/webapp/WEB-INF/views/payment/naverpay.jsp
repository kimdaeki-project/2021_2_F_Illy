<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<input type="hidden" id="productName" value="${productVO.product_name}">
<input type="hidden" id="productPrice" value="${productVO.product_price}">
<input type="hidden" id="cnt" value="${cnt}">

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>								
<script>
	$('').ready(function() {
		
	    var oPay = Naver.Pay.create({
	          "mode" : "production", // development or production
	          "clientId": "u86j4ripEt8LRfPGzQ8" // clientId
	    });
    	
    	let productName = $('#productName').val();
    	let productPrice = $('#productPrice').val();
    	let cnt = $('#cnt').val();
    	let totalPrice = productPrice * cnt;
    	
        oPay.open({
          "merchantUserKey": "가맹점_사용자_식별키",
          "merchantPayKey": "가맹점_주문_번호",
          "productName": productName,
          "totalPayAmount": totalPrice,
          "taxScopeAmount": totalPrice,
          "taxExScopeAmount": "0",
          "returnUrl": "http://localhost/payment/paymentEnd"
        });
    });    						
</script>

</html>