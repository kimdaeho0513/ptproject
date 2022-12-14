<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/pt/static/base/css/styles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.form-center {
 	color: white;
 	width: 300px;
  	margin-left: auto;
  	margin-right: auto;
	text-align:center;
  	padding-top: 10%;
}
.text {
	font-size:25px;
	font-weight:bold;
}


</style>
<title>PT 결제창</title>
<body class="body">
<div class="form-center">
	<h1 class="form-subject">회원권</h1><br>
	<div class="text">
		<input type="radio" id="10" name="pt" value="50000"> 10회 5 만원<br><br>
		<input type="radio" id="20" name="pt" value="90000"> 20회 9 만원<br><br>
		<input type="radio" id="30" name="pt" value="130000"> 30회 13 만원<br><br>
		<input type="radio" id="50" name="pt" value="200000"> 50회 20 만원<br><br>
	</div>
	<button class="btn btn-warning" type="button" id="btn-kakaopay">카카오페이 결제</button>
</div>
	<script>
		$("#btn-kakaopay").click(function () {
			var IMP = window.IMP;
			IMP.init('imp12720430'); //가맹점식별코드
			var money = $('input[name="pt"]:checked').val();
			IMP.request_pay({
				pg: 'kakaopay',
				pay_method: 'kakaopay',
				merchant_uid: 'merchant_' + new Date().getTime(),
				name: '주문명 : pt 회원권 결제',
				amount: money,
				buyer_name: '테스트',
				buyer_postcode: '123-456',
				}, function (rsp) {
					console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '결제 금액 : ' + rsp.paid_amount;
					 $.ajax({
		                    type: "GET", 
		                    url: "./chargept", //충전 금액값을 보낼 url 설정
		                    data: {
		                        "amount" : money
		                        
		                    },
					 });
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
	</script>
</body>
</html>