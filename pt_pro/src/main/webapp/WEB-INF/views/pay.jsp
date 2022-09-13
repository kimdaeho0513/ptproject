<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>PT 결제창</title>
</head>
<body>
	<h1>PT 종류</h1>
	<ul>
		<li><input type="checkbox" id="pt10" value="10">10회 5 만원</li>
		<li><input type="checkbox" id="pt20" value="20">20회 9 만원</li>
		<li><input type="checkbox" id="pt30" value="30">30회 13 만원</li>
		<li><input type="checkbox" id="pt50" value="50">50회 20 만원</li>
	</ul>
	<button type="button" id="btn-kakaopay">카카오페이 결제</button>
	<script>
		$("#btn-kakaopay").click(function () {
			var IMP = window.IMP;
		IMP.init('imp12720430'); //가맹점식별코드
			IMP.request_pay({
				pg: 'kakaopay',
				pay_method: 'card',
				merchant_uid: 'merchant_' + new Date().getTime(),
				name: '주문명 : pt 회원권 결제',
				amount: 5000,
				buyer_name: '테스트',
				buyer_postcode: '123-456',
				}, function (rsp) {
					console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '결제 금액 : ' + rsp.paid_amount;
					// success.submit();.
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