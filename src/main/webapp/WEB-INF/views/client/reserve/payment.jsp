<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>paymentCard</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

	<!-- Favicons -->
	<link href="/resources/assets/img/DHS-icon.png" rel="icon">
	<link href="/resources/assets/img/DHS-icon.png" rel="apple-touch-icon">
	
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i" rel="stylesheet">
	
	<!-- Vendor CSS Files -->
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" >
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/icofont/icofont.min.css" >
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/boxicons/css/boxicons.min.css" >
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/animate.css/animate.min.css" >
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/venobox/venobox.css" >
	<link rel="stylesheet" type="text/css" href="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" >
	
	<!-- Template Main CSS File -->
	<link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css" >
	
	<!-- =======================================================
	* Template Name: Delicious - v2.0.0
	* Template URL: https://bootstrapmade.com/delicious-free-restaurant-bootstrap-theme/
	* Author: BootstrapMade.com
	* License: https://bootstrapmade.com/license/
	======================================================== -->

	<!-- Vendor JS Files -->
	<script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="/resources/assets/vendor/php-email-form/validate.js"></script>
	<script src="/resources/assets/vendor/jquery-sticky/jquery.sticky.js"></script>
	<script src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="/resources/assets/vendor/venobox/venobox.min.js"></script>
	<script src="/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>

	<!-- Template Main JS File -->
	<script type="text/javascript" src="/resources/assets/js/main_main.js"></script>
	
	<style type="text/css">
		.reserveTable { display: inline; padding: 10px; font-size: 12px;}
		.reserveTablehead { display: inline; padding: 10px; font: 15pt bold; color: #670000;}
		.reserveBtn { width: 150px; height: 50px; background: #ffb03b; border: 0; color: #fff;
				padding: 10px 24px; transition: 0.4s; border-radius: 50px; font-size: 15px;
				margin: 5px; }
		.paymentMini { display: inline; }
		.paymentTable { margin-top: 50px; }
		.paymentBtn { font-size: 15px; letter-spacing: 1px; padding: 12px 30px;
					text-transform: uppercase; display: inline-block; margin: 0 10px;
					border-radius: 50px; transition: 0.5s; line-height: 1; color: black;
					border: 2px solid #ffb03b; background-color: #fffaf3; }
		.paymentBtn:hover { font-size: 15px; letter-spacing: 1px; padding: 12px 30px;
					text-transform: uppercase; display: inline-block; margin: 0 10px;
					border-radius: 50px; transition: 0.5s; line-height: 1; color: #fff;
					border: 2px solid #ffb03b; background-color: #ffb03b;}
		.paymentHidden { display: none; }
	</style>
	<script src="https://cdn.bootpay.co.kr/js/bootpay-3.2.3.min.js" type="application/javascript"></script>
	<script type="text/javascript">
	 $(function(){
		//결제API 사용 << 추후에추가
		/* 	$(".kakao").click(function(){
				BootPay.request({
					price: '5000', //실제 결제되는 가격
					application_id: "5e9f876c02f57e001f1ed53d",
					name: 'dailyhair 예약금', //결제창에서 보여질 이름
					pg: 'kakao',
					method: 'easy', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
					show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
					items: [
						{
							item_name: 'dailyhair 예약금', //상품명
							qty: 1, //수량
							unique: '123', //해당 상품을 구분짓는 primary key
							price: 5000, //상품 단가
							cat1: '예약금', // 대표 상품의 카테고리 상, 50글자 이내
							cat2: '예약금', // 대표 상품의 카테고리 중, 50글자 이내
							cat3: '예약금', // 대표상품의 카테고리 하, 50글자 이내
						}
					],
					user_info: {
						username: '사용자 이름',
						email: '사용자 이메일',
						addr: '사용자 주소',
						phone: '010-1234-4567'
					},
					order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
					params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
					account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
					extra: {
					    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
						end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
				        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
				        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
					}
				}).error(function (data) {
					//결제 진행시 에러가 발생하면 수행됩니다.
					console.log(data);
				}).cancel(function (data) {
					//결제가 취소되면 수행됩니다.
					console.log(data);
				}).ready(function (data) {
					// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
					console.log(data);
				}).confirm(function (data) {
					//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
					//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
					console.log(data);
					var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
					if (enable) {
						BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
					} else {
						BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
					}
				}).close(function (data) {
				    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
				    console.log(data);
				}).done(function (data) {
					$("#insertForm").attr({
						"method":"post",
						"action":"/reserve/reserveInsert.do"
					});
					
					$("#insertForm").submit();
					//결제가 정상적으로 완료되면 수행됩니다
					//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
					console.log(data);
				});
			});
			 */
			
		}); 
	</script>
	<!-- 결제 라디오 버튼 클릭 이벤트 -->
	<script type="text/javascript">
	
	function paymentFinalKaKao(){
		
		
		$("input:radio[id='kakao']:radio[value='카카오페이']").prop('checked', true);
		
		BootPay.request({
			price: "${data.rest_totalprice }", //실제 결제되는 가격
			application_id: "5e9f876c02f57e001f1ed53d",
			name: 'dailyhair', //결제창에서 보여질 이름
			pg: 'kakao',
			method: 'easy', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			items: [
				{
					item_name: 'dailyhair 예약금', //상품명
					qty: 1, //수량
					unique: '123', //해당 상품을 구분짓는 primary key
					price: 5000, //상품 단가
					cat1: '예약금', // 대표 상품의 카테고리 상, 50글자 이내
					cat2: '예약금', // 대표 상품의 카테고리 중, 50글자 이내
					cat3: '예약금', // 대표상품의 카테고리 하, 50글자 이내
				}
			],
			user_info: {
				username: '사용자 이름',
				email: '사용자 이메일',
				addr: '사용자 주소',
				phone: '010-1234-4567'
			},
			order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
			account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
			extra: {
			    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
				end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
		        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
		        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
			}
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).ready(function (data) {
			// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
			console.log(data);
		}).confirm(function (data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			console.log(data);
			var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
			if (enable) {
				BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
			} else {
				BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
			}
		}).close(function (data) {
		    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
		    console.log(data);
		}).done(function (data) {
			
			//결제가 정상적으로 완료되면 수행됩니다
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
			$("#insertForm").attr({
				"method":"post",
				"action":"/reserve/reserveInsert.do"
			});
			
			$("#insertForm").submit();
			
			console.log(data);
		});
		
	}
	// 카드 결제 버튼 클릭 시
	function paymentFinalCard() {
		alert("카드 결제를 진행하겠습니다.");
		
		$("input:radio[id='card']:radio[value='카드결제']").prop('checked', true);
		
		$("#insertForm").attr({
			"method":"post",
			"action":"/reserve/reserveInsert.do"
		});
		
		$("#insertForm").submit();
	}
	
	// 계좌 이체 버튼 클릭 시
	function paymentFinalAccount() {
		alert("계좌 이체를 진행하겠습니다.");
		
		$("input:radio[id='account']:radio[value='계좌이체']").prop('checked', true);
		
		$("#insertForm").attr({
			"method":"post",
			"action":"/reserve/reserveInsert.do"
		});
		
		$("#insertForm").submit();
	}
	
	// 이전 단계로 버튼 이벤트
	function selectDesigner() {
		
		let date = "${data.rest_hairdate}";
		let time =	"${data.rest_time}";
		
		location.href="/reserve/reserveSelectDesigner.do?rest_hairdate="+date+"&rest_time="+time;
	}
	
	// 예약 취소 버튼
	function cancle() {
		alert("예약을 취소합니다.\n메인페이지로 이동합니다.");
		
		location.href="/client/main.do"
	}
	</script>
	
</head>

<body>
	<c:if test="${empty login }">
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
			location.href="/member/login/login.do";
		</script>
	</c:if>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>
	
	<!-- ======= Reserve Section ======= -->
	<section id="about" class="about">
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div>
			
			<!-- 상단 -->
			<div style="margin: 0 auto; text-align: center; width: 100%;">
				<h1 style="margin-bottom: 10px;">결제하기</h1>
				<p style="margin-bottom: 10px;">결제 수단을 선택해주세요.</p>
			</div>
			
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: 1 solid black; margin-bottom: 10px;" />
			</div>
			
			<!-- 예약 정보 -->
			<div style="margin: 0 auto;">
				<div class="reserveTablehead">예약 정보　　</div>
				<div class="reserveTable">${place}</div>
				<div class="reserveTable">${data.rest_hairdate}&nbsp;&nbsp;&nbsp;${data.rest_time}</div>
				<div class="reserveTable">${desname.des_name }(${desname.des_job })</div>
				<div></div>
				<div class="reserveTablehead" style="float: left;">결제 금액  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${data.rest_totalprice }원　</div>
			</div>
			
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: 1 solid black; margin-top: 10px;" />
			</div>
			
			<!-- 결제 수단 선택 -->
			<div style="margin: 0 auto;">
				<div class="paymentTable">
				<form id="insertForm" name="insertForm">
				<input type="hidden" id="rest_hairdate" name="rest_hairdate" value="${data.rest_hairdate}"/>
				<input type="hidden" id="rest_time" name="rest_time" value="${data.rest_time }"/>
				<input type="hidden" id="des_num" name="des_num" value="${data.des_num}"/>
				<input type="hidden" id="rest_memo" name="rest_memo" value="${data.rest_memo}"/>
				<input type="hidden" id="m_id" name="m_id" value="${login.m_id}"/>
				<input type="hidden" id="style_number" name="style_number" value="${number}"/>
				<input type="hidden" id="rest_totalprice" name="rest_totalprice" value="${data.rest_totalprice }"/>
					<div class="paymentMini">
						<input class="paymentBtn" type="button" value="카드결제" onclick="paymentFinalCard()">
						<input class="paymentHidden" type="radio" id="card" name="rest_payoption" value="카드결제" >
					</div>
					<div class="paymentMini">
						<input class="paymentBtn" type="button" value="계좌이체" onclick="paymentFinalAccount()">
						<input class="paymentHidden" type="radio" id="account" name="rest_payoption" value="계좌이체" >
					</div>
						<input class="paymentBtn" type="button" value="카카오페이" onclick="paymentFinalKaKao()">
						<input class="paymentHidden" type="radio" id="kakao" name="rest_payoption" value="카카오페이" >
					<input type="hidden" id="styling_num" name="styling_num" value="${data.styling_num}"/>
				</form>
				</div>
			</div>
			
			<!-- 최하단 구분 -->
			<div style="width: 100%; margin-top: 400px;">
			</div>
			
			<!-- 버튼 -->
			<div style="margin: 0 auto; margin-top: 75px;">
				<button class="reserveBtn" onclick="selectDesigner()">이전 단계</button>
				<button class="reserveBtn" onclick="cancle()">예약 취소</button>
			</div>
		</div>
	</div>
	</section><!-- End Reserve Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>

</html>