<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>content</title>
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
	
	<!-- 코로나 예방 팝업 -->
	<script type="text/javascript">
		function corona() {
			var url = "/client/corona.do";
			var name = "코로나 19 예방";
			var option = "width=500px, height=800px, toolbars=no, scrollbars=no";
			
			window.open(url, name, option);
		}
	</script>
</head>

<body>
	<!-- ======= Hero Section ======= -->
	<section id="hero">
	<div class="hero-container">
		<div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">
		
		<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>
		
		<!-- Slide Image List -->
		<div class="carousel-inner" role="listbox">
			<!-- Slide 1 -->
			<!-- <div class="carousel-item active" style="background: url(/resources/assets/img/slide/ShopImage_002.jpg);"> -->
			<div class="carousel-item active" style="background: url(/resources/assets/img/slide/ShopImage_002.jpg);">
				<div class="carousel-container">
					<div class="carousel-content">
						<h2 class="animated fadeInDown"><span>DailyHair</span>Shop</h2>
						<p class="animated fadeInUp">A Newest Trendy Hair Style</p>
						<!-- 사진 가운데 링크걸려있는 둥근 노란 테두리 버튼 -->
						<div>
							<a href="/client/hairStyleList.do" class="btn-menu animated fadeIn">상세보기</a>
							<!-- <a href="#" class="btn-book animated fadeIn">입력</a> -->
						</div>
					</div>
				</div>
			</div>
			
			<!-- Slide 2 -->
			<div class="carousel-item" style="background: url(/resources/assets/img/slide/ShopImage_005.jpg);">
				<div class="carousel-container">
					<div class="carousel-content">
						<h2 class="animated fadeInDown"><span>DailyHair</span>Shop</h2>
						<p class="animated fadeInUp">A Newest Trendy Hair Style</p>
						<!-- 사진 가운데 링크걸려있는 둥근 노란 테두리 버튼 -->
						<div>
							<a href="/client/hairStyleList.do" class="btn-menu animated fadeIn">상세보기</a>
							<!-- <a href="#" class="btn-book animated fadeIn">입력</a> -->
						</div>
					</div>
				</div>
			</div>
			
			<!-- Slide 3 -->
			<div class="carousel-item" style="background: url(/resources/assets/img/slide/ShopImage_004.jpg);">
				<div class="carousel-container">
					<div class="carousel-content">
						<h2 class="animated fadeInDown"><span>DailyHair</span>Shop</h2>
						<p class="animated fadeInUp">The Best Of Best Premium Goods</p>
						<!-- 사진 가운데 링크걸려있는 둥근 노란 테두리 버튼 -->
						<div>
							<a href="/client/hairGoodsList.do" class="btn-menu animated fadeIn">상세보기</a>
							<!-- <a href="#" class="btn-book animated fadeIn">입력</a> -->
						</div>
					</div>
				</div>
			</div>
			
			<!-- Slide 4 -->
			<div class="carousel-item" style="background: url(/resources/assets/img/slide/corona2.jpg);">
				<div class="carousel-container">
					<div class="carousel-content">
						<h2 class="animated fadeInDown"><span>코로나 </span> 예방 수칙</h2>
						<p class="animated fadeInUp"></p>
						<!-- 사진 가운데 링크걸려있는 둥근 노란 테두리 버튼 -->
						<div>
							<a href="javascript:corona()" class="btn-menu animated fadeIn">예방 수칙 보기</a>
							<!-- <a href="#" class="btn-book animated fadeIn">입력</a> -->
						</div>
					</div>
				</div>
			</div>
			
		</div>
			
		<!-- 왼쪽 이미지 선택 버튼 -->
		<a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon icofont-simple-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
			</a>
			
		<!-- 오른쪽 이미지 선택 버튼 -->
		<a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
			<span class="carousel-control-next-icon icofont-simple-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
			</a>
		
		</div>
	</div>
	</section><!-- End Hero -->
</body>

</html>