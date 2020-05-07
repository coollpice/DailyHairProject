<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-
	scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Login</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

	<!-- Favicons -->
	<link href="/resources/assets/img/favicon.png" rel="icon">
	<link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
	
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
		.adminLogin_btn { 
			background: #ffb03b;
			border: 0;
			padding: 10px 24px;
			color: #fff;
			transition: 0.4s;
			border-radius: 50px; }
		.form-horizontal { width: 500px; }
	</style>
	
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]>
<script src="/resources/include/js/html5shiv.js"></script>
<![endif]-->

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#loginBtn").click(function() {
			
			if($("#ad_id").val()==''){
				alert("아이디를 입력해주세요");
				$("#ad_id").focus();
				return false;
			}else if ($("#ad_pwd").val()==''){
				alert("비밀번호를 입력해주세요");
				$("#ad_pwd").focus();
				return false;
			}
			
			
			$("#loginForm").attr("method", "post");
			$("#loginForm").attr("action", "/admin/adminLogin.do");
			$("#loginForm").submit();
		});

		var msg = "<c:out value='${msg}'/>";

		if (msg != "") {
			alert(msg);
		}
		
		$("#goClient").click(function(){
			location.href="/client/main.do";
		});
	});
</script>
</head>
<body>
	<!-- 관리자 전용 header 삽입 -->
	<jsp:include page="/WEB-INF/views/admin/login/adminHeader.jsp"></jsp:include>
	
	<!-- ======= AdminLogin ======= -->
	<section id="about" class="about">
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 125px; margin-bottom: 50px;">
			</div>
			
			<!-- 상단 -->
			<div style="margin: 0 auto; text-align: center; width: 100%;">
				<h1 style="margin-bottom: 10px;">관리자 로그인</h1>
				<p style="margin-bottom: 10px;">관리자에게 부여된 ID와 PW를 입력해주세요.</p>
			</div>
			
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: 1 solid black; margin: 55px;" />
			</div>
			
			<!-- 로그인 div -->
			<div class="container" style="text-align: center;">
				<form id="loginForm" class="form-horizontal" style="margin: 0 auto;">
					<div class="form-row">
						<div class="col-md-6 form-group">
							<input type="text" id="ad_id" name="ad_id" class="form-control" placeholder="ID">
						</div>
						<div class="col-md-6 form-group">
							<input type="password" id="ad_pwd" name="ad_pwd" class="form-control" placeholder="Password">
						</div>
					</div>
					
					<div class="form-group">
						<input type="button" value="로그인" id="loginBtn" class="adminLogin_btn" />
						<input type="button" value="사용자페이지로" id="goClient" class="adminLogin_btn" />
					</div>
				</form>
			</div>
		
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: 1 solid black; margin: 30px;" />
			</div>
		
			<!-- 최하단 구분 -->
			<div style="width: 100%; margin-top: 125px;">
			</div>
		</div>
	</div>
	</section><!-- End Reserve Section -->
	
	<!-- 일반적인 footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>