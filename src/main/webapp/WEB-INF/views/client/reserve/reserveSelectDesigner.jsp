<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ReserveSelectDesigner</title>
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
		.reserveBtn { width: 150px; height: 50px; background: #ffb03b; border: 0;	color: #fff;
				padding: 10px 24px; transition: 0.4s; border-radius: 50px; font-size: 15px;}
		.designer { width: 280px; height: 400px }
		.designerbox { float: left; padding: 10px; 
						margin: 10px 20px 10px 20px;
						transition: all ease-in-out 0.3s;
						transform: scale(1);
						-webkit-transform: scale(1);
						-moz-transform: scale(1);
						-ms-transform: scale(1);
						-o-transform: scale(1); }
		.designerbox:hover { box-shadow: 10px 15px 30px rgba(0, 0, 0, 0.18);
							transform: scale(1.1);
							-webkit-transform: scale(1.1);
							-moz-transform: scale(1.1);
							-ms-transform: scale(1.1);
							-o-transform: scale(1.1); }
		.designerbox p { padding-top: 15px; }
	</style>
	
	<!-- 버튼 이벤트 -->
	<script type="text/javascript">
	// 이전 단계로 버튼 이벤트
	function selectDate() {
		location.replace("/reserve/backToSelectDate.do");
	}
	
	<!-- 디자이너 영역 클릭 이벤트 -->
	function clickDesigner(num) {
		
		//클릭한 디자이너 번호설정
		$("#des_num").val(num);
		
		var des_num = num;
		
		$("#desForm").attr({
			"method":"post",
			"action":"/reserve/reserveSelectSergery.do",
		});
		$("#desForm").submit();
		
		/* location.replace("/reserve/reserveSelectDate.do"); */
	}
	
	function name() {
		// 현재 프로필사진 보여주기
		let image = "<c:out value='${des.des_image}'/>";
		if(image!=""){
			$("#fileImage").attr({
				src: "/uploadStorage/designer/${des.des_image}",
				width:"280px",
				height:"400px"
			});
		}
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
				<h1 style="margin-bottom: 10px;">예약하기</h1>
				<p style="margin-bottom: 10px;">어떤 디자이너가 시술을 해주었으면 하시나요?</p>
			</div>
			
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: 1 solid black; margin-bottom: 10px;" />
			</div>
			
			<!-- 예약 정보 -->
			<div style="margin: 0 auto;">
				<div class="reserveTablehead">예약 정보　　</div>
				<div class="reserveTable">${place}</div>
				<div class="reserveTable">${data.rest_hairdate}&nbsp;&nbsp;&nbsp;${data.rest_time}</div>
				<div class="reserveTable">(디자이너)입력 대기 중</div>
				<div class="reserveTable">(시술)입력 대기 중</div>
				<div></div>
				<div class="reserveTablehead" style="float: left;">결제 금액　　</div>
				<div class="reserveTable" style="float: right;">(금액)입력 대기 중</div>
			</div>
			
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: 1 solid black; margin-top: 10px;" />
			</div>
			
			<!-- 디자이너 선택 -->
			<form id="desForm" name="desForm">
				<input type="hidden" id="rest_hairdate" name="rest_hairdate" value="${data.rest_hairdate}"/>
				<input type="hidden" id="rest_time" name="rest_time" value="${data.rest_time }"/>
				<input type="hidden" id="des_num" name="des_num" />
			</form>
			<div style="margin: 0 auto; text-align: center; max-width: 1020px">
				<div style="width: 100%; margin: 0 auto;">
					<c:choose>
						<c:when test="${not empty designerList }">
							<c:forEach var="des" items="${designerList }">
								<div class="designerbox" onclick="clickDesigner(${des.des_num})">
									<c:if test="${not empty des.des_image }">
										<!-- 로컬 저장소 사용 시 주석 해제하면 프로필 불러옴 -->
										<img class="designer" src="/uploadStorage/designer/${des.des_image}">
									</c:if>
									<c:if test="${empty des.des_image }">
										<img class="designer" src="/resources/assets/img/designerNoImg.png">
									</c:if>
									<p>${des.des_name} ${des.des_job}</p>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="designerbox">
								<p>등록된 디자이너가 존재하지 않습니다.</p>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: none; margin-top: 10px;" />
			</div>
			
			<!-- 버튼 -->
			<div style="margin: 0 auto; margin-top: 75px;">
				<button class="reserveBtn" onclick="selectDate()">이전 단계</button>
			</div>
		</div>
	</div>
	</section><!-- End Reserve Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>

</html>