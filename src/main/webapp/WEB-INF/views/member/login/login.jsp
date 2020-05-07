<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Login</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/resources/assets/img/favicon.png" rel="icon">
<link href="/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/icofont/icofont.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/boxicons/css/boxicons.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/animate.css/animate.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/venobox/venobox.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css">

<!-- Template Main CSS File -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/style.css">

<!-- =======================================================
=======
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
>>>>>>> master
   * Template Name: Delicious - v2.0.0
   * Template URL: https://bootstrapmade.com/delicious-free-restaurant-bootstrap-theme/
   * Author: BootstrapMade.com
   * License: https://bootstrapmade.com/license/
   ======================================================== -->

<!-- Vendor JS Files -->
<script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
<script
	src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
	src="/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="/resources/assets/vendor/php-email-form/validate.js"></script>
<script src="/resources/assets/vendor/jquery-sticky/jquery.sticky.js"></script>
<script
	src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/resources/assets/vendor/venobox/venobox.min.js"></script>
<script src="/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>

<!-- Template Main JS File -->
<script type="text/javascript" src="/resources/assets/js/main_main.js"></script>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->
<!--[if lt IE 9]>
   <script src="/resources/include/js/html5shiv.js"></script>
   <![endif]-->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("#loginBtn").click(function() {
			//필수 입력 요소들을 입력하지 않고 가입 버튼을 눌렀을 때 못넘어가게 함
			if ($("#m_id").val() == "") {
				alert("ID를 정확하게 입력해주세요.");		//아이디
				$("#m_id").focus();
				return false;
			}
			if ($("#m_pwd").val() == "") {
				alert("PW가 일치하지 않습니다. ");		//패스워드
				$("#m_pwd").focus();
				return false;
			}
			
			$("#loginForm").attr("method", "post");
			$("#loginForm").attr("action", "/member/login/login.do");
			$("#loginForm").submit();
		});

		var msg = "<c:out value='${msg}'/>";
		let msz = "<c:out value='${msz}'/>";
		
		if (msg != "") {
			alert(msg+"\n"+msz);
		}
	});
	
	function enterkey() {
        if (window.event.keyCode == 13) {
 
             // 엔터키가 눌렸을 때 실행할 내용
    		$("#loginForm").attr("method", "post");
    		$("#loginForm").attr("action", "/member/login/login.do");
    		$("#loginForm").submit();
    		
        }
	}
	
	// 회원가입 버튼 이벤트
	function join() {
		location.replace("/member/clause.do");
	}

	// ID 찾기 버튼 이벤트
	function IDfind() {
		location.replace("/member/login/idFind.do");
	}

	// PW 찾기 버튼 이벤트
	function PWfind() {
		location.replace("/member/login/pwFind.do");
	}
</script>

<style type="text/css">
.msgbox {
	width: 40px;
}

.login_box {
	margin: 0 auto;
	text-align: center;
	width: 850px;
	height: 300px;
}

.login_main {
	margin: 0 auto;
	margin-top: 15px;
	float: right;
	width: 500px;
}

.login_form {
	width: 450px;
}

.login_idpw1 {
	float: left;
	width: 300px;
	height: 100px;
}

.login_idpw2 {
	float: right;
	width: 150px;
	height: 100px;
}

.login_logo {
	margin: 0 auto;
	margin-top: 25px;
	width: 275px;
	height: 150px;
	float: left;
}

.login_btn {
	margin-top: 5px;
	width: 125px;
	height: 65px;
	background: #ffb03b;
	color: #fff;
	border: 0;
	border-radius: 25px;
	text-align: center;
	font-size: 15px;
}

.other_btn {
	width: 100px;
	height: 35px;
	text-align: center;
	cursor: pointer;
	display: inline-block;
	font-size: 10px;
	padding: 8px 16px 10px 16px;
	font-weight: 500;
	line-height: 1;
	color: #444444;
	margin: 0 3px 10px 3px;
	transition: all ease-in-out 0.3s;
	background: #fffaf3;
	border: 2px dashed #ffb03b;
	border-radius: 25px;
}
.other_btn:hover { background: #FFE08C; }
</style>
</head>

<body>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>

	<!-- ======= Login Section ======= -->
	<section id="about" class="about">
		<div class="container-fluid">
			<div class="row">
				<!-- 최상단 구분 -->
				<div style="width: 100%; height: 200px; margin-bottom: 50px;">
				</div>

				<!-- 로그인 -->
				<div class="login_box" style="">
					<div class="login_logo">
						<h1 style="font-size: 50px;">DailyHairShop</h1>
						<h4>Login Page</h4>
					</div>

					<div class="login_main">
						<form role="form" id="loginForm" name="loginForm">
							<!-- ID, PW 입력 및 로그인 버튼 -->
							<div class="login_form">
								<div class="login_idpw1">
									<label for="m_id" class="msgbox">ID </label> 
									<input type="text" id="m_id" name="m_id" placeholder=" ID" style="width: 200px; height: 35px;"> <br>
									<!-- 줄 바꿈 효과 -->
									<label for="m_pwd" class="msgbox">PW </label> 
									<input type="password" id="m_pwd" name="m_pwd" placeholder=" PassWord" 
											style="width: 200px; height: 35px;" onkeyup="enterkey();">
								</div>
								<div class="login_idpw2">
									<input type="button" class="login_btn" id="loginBtn" name="loginBtn" value="Login">
								</div>
							</div>
							<br>
							<!-- 줄 바꿈 효과 -->

							<!-- 회원가입, ID 찾기, PW 찾기 버튼 -->
							<div>
								<input type="button" class="other_btn" onclick="join()" value="회원가입">
								<input type="button" class="other_btn" onclick="IDfind()" value="ID 찾기"> 
								<input type="button" class="other_btn" onclick="PWfind()" value="PW 찾기">
							</div>
						</form>
					</div>
				</div>

				<!-- 하단 여백 -->
				<div style="width: 100%; height: 100px; margin-bottom: 50px;">
				</div>
			</div>
		</div>
	</section>
	<!-- End Login Section -->

	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>