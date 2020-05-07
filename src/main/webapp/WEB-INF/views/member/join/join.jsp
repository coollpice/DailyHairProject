<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>회원가입</title>
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
<!-- 정규식 적용 -->
<script type="text/javascript">
	//아이디 정규식
	var idJ = /^[a-z0-9]{6,13}$/;
	//비밀번호 정규식
	var pwJ = /^[a-z0-9]{10,18}$/;
	//이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	//이메일 검사 정규식
	var mailJ = /^[A-Za-z0-9]{0,20}$/;
	//휴대폰 번호 정규식
	var phoneJ = /^[0-9]{11,11}$/;

	$(function() {
		//아이디 중복체크를 하기 전까지는 가입 버튼을 잠금
		$("#insertBtn").attr("disabled", true);

		//아이디 정규식
		$("#m_id").blur(function() {
			if (idJ.test($("#m_id").val())) {
				$("#id_check").text("");
			} else {
				$("#id_check").text("6~13자리 영문 소문자와 숫자만 입력 해주시길 바랍니다.")
				$("#id_check").css("color", "red");
				return false;
			}
		});

		//비밀번호 정규식
		$("#m_pwd").blur(function() {
			if (pwJ.test($("#m_pwd").val())) {
				$("#pwd_check").text("");
			} else {
				$("#pwd_check").text("10~18자리 영문 소문자와 숫자만 입력 해주시길 바랍니다.")
				$("#pwd_check").css("color", "red");
				return false;
			}
		});

		//이름 정규식
		$("#m_name").blur(function() {
			if (nameJ.test($("#m_name").val())) {
				$("#name_check").text("");
			} else {
				$("#name_check").text("2~6자리 완전한 이름만 입력 해주시길 바랍니다.")
				$("#name_check").css("color", "red");
				return false;
			}
		});

		//전화번호 정규식
		$("#m_phone").blur(function() {
			if (phoneJ.test($("#m_phone").val())) {
				$("#phone_check").text("");
			} else {
				$("#phone_check").text("11자리까지 번호만 입력 해주시길 바랍니다.")
				$("#phone_check").css("color", "red");
				return false;
			}
		});

		//이메일 정규식
		$("#m_email").blur(function() {
			if (mailJ.test($("#m_email").val())) {
				$("#email_check").text("");
			} else {
				$("#email_check").text("20자리 영문 대소문자와 숫자만 입력 해주시길 바랍니다.")
				$("#email_check").css("color", "red");
				return false;
			}
		});
		
		//이메일 중복확인
		 $("#emailChk").click(function() {
			
			if($("#m_email").val()==''){
				alert("이메일을 입력해주세요");
				return;
			}
			 
			 
			if (mailJ.test($("#m_email").val())) {
				$("#email_check").text("");
			} else {
				$("#email_check").text("20자리 영문 대소문자와 숫자만 입력 해주시길 바랍니다.")
				$("#email_check").css("color", "red");
				return false;
			} 
			
		 let email = $("#m_email").val()+"@"+$("#emailDomain").val();
		 
		$.ajax({
				url : "/member/mailChk.do",
				type : "post",
				data : { "m_email" : email },
				success : function(data) {
					if (data == 1) {
						alert("사용 불가능한 이메일입니다.");
					} else if (data == 0) {
						alert("사용 가능한 이메일입니다.");
						$("#insertBtn").attr("disabled",false);
					}
				}
			}); 
		
		
		}); 

		$("#insertBtn").click(function() {
					//필수 입력 요소들을 입력하지 않고 가입 버튼을 눌렀을 때 못넘어가게 함
					if ($("#m_id").val() == "") {
						alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");		//아이디
						$("#m_id").focus();
						return false;
					}
					if ($("#m_pwd").val() == "") {
						alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");		//패스워드
						$("#m_pwd").focus();
						return false;
					}
					if ($("#m_pwd2").val() == "") {
						alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");		//패스워드 확인
						$("#m_pwd2").focus();
						return false;
					}
					if ($("#m_pwd").val() != $("#m_pwd2").val()) {	//비밀번호와 비밀번호 확인이 일치하는지 확인
						alert("비밀번호가 일치하지 않습니다.");
						return false;
					}
					if ($("#m_name").val() == "") {
						alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");		//이름
						$("#m_name").focus();
						return false;
					}
					if ($("#m_phone").val() == "") {
						alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");		//전화번호
						$("#m_phone").focus();
						return false;
					}
					if ($("#m_email").val() == "") {
						alert("필수 입력 요소들을 모두 입력해주시기 바랍니다.");		//이메일
						$("#m_email").focus();
						return false;
					}
					//아이디 중복체크를 하면 가입 버튼 잠금이 풀림
					var idChkVal = $("#idChk").val();
					if (idChkVal == "N") {
						alert("중복체크를 해주시길 바랍니다.");
						return false;
					} else if (idChkVal == "Y") {
						$("#insertForm").submit();
					}

					//이메일의 앞 부분 텍스트와 뒷부분 주소를 합침
					$("#m_email").val($("#m_email").val() + "@" + $("#emailDomain").val());
					//null 대신에 '없음'을 넣는다.
					if($("#m_memo").val()==''){
						$("#m_memo").val("-");	
					}

					//가입 버튼을 눌렀을 때 post형식으로 보냄시킴
					$("#insertForm").attr("method", "post");
					$("#insertForm").attr("action", "/member/join.do");
					$("#insertForm").submit();
					
					
				
				});

	});

	function fn_idChk() {

		var id = $("#m_id").val();

		//아이디 정규식
		if (idJ.test($("#m_id").val())) {
			$("#id_check").text("");
		} else {
			$("#id_check").text("6~13자리 영문 소문자와 숫자만 입력 해주시길 바랍니다.")
			$("#id_check").css("color", "red");
			return false;
		}

		$.ajax({
			url : "/member/idChk.do",
			type : "post",
			data : { "m_id" : id },
			success : function(data) {
				if (data == 1) {
					alert("사용 불가능한 아이디입니다.");
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용 가능한 아이디입니다.");
				}
			}
		});
	}
	
	// 회원가입 취소 버튼 이벤트
	function joinCancle() {
		alert("회원가입을 취소합니다.");
		location.replace("/client/main.do");
	}
</script>

<style type="text/css">
.msgbox {
	width: 115px;
	padding: 10px;
}

.checkbtn {
	margin-left: 15px;
	width: 100px;
	height: 30px;
	font-size: 13px;
	border: 1px solid silver;
	border-radius: 15px;
	background-color: rgba(255, 250, 243, 1);
	transition: all ease-in-out 0.3s;
}
.checkbtn:hover { 
	border: 1px solid #FFE08C;
	border-radius: 15px;
	background-color: #FFE08C; }

.join_input {
	text-align: inherit;
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

	<!-- ======= Join Section ======= -->
	<section id="about" class="about">
		<div class="container-fluid">
			<div class="row">
				<!-- 최상단 구분 -->
				<div style="width: 100%; height: 100px; margin-bottom: 50px;">
				</div>

				<div style="margin: 0 auto; padding: 10px;">
					<div style="margin-bottom: 30px; text-align: center;">
						<h1 style="font-size: 50px;">DailyHairShop</h1>
						<h3>Sign up as member</h3>
					</div>
					<br>

					<form role="form" id="insertForm" name="insertForm">
						<div class="join_input">
							<label for="m_Id" class="msgbox"><span style="color: red;">* </span>ID</label> 
							<input type="text" id="m_id" name="m_id" placeholder=" ID" />
							<button type="button" class="checkbtn" id="idChk" name="idChk" onclick="fn_idChk();" value="N">중복체크</button>
							<br>
							<div id="id_check" style="font-size: 11px;"></div>
						</div>
						<div class="join_input">
							<label for="m_Pwd" class="msgbox"><span style="color: red;">* </span>PW</label> 
							<input type="password" id="m_pwd" name="m_pwd" placeholder=" PassWord" /><br>
							<div id="pwd_check" style="font-size: 11px;"></div>
							
							<label for="m_Pwd" class="msgbox"><span style="color: red;">* </span>PW 재입력</label> 
							<input type="password" id="m_pwd2" placeholder=" PassWord" />
						</div>
						<div class="join_input">
							<label for="m_Name" class="msgbox"><span style="color: red;">* </span>이 름</label>
							<input type="text" id="m_name" name="m_name" placeholder=" 이름" />
							<div id="name_check" style="font-size: 11px;"></div>
						</div>
						<div class="join_input">
							<label class="msgbox"><span style="color: red;">* </span>성 별</label>
							<input type="radio" id="m_gender1" name="m_gender" value="남" checked="checked"/>
							<label for="m_Gender1">남</label> 
							<input type="radio" id="m_gender2" name="m_gender" value="여" />
							<label for="m_Gender2">여</label>
						</div>
						<div class="join_input">
							<label for="m_Phone" class="msgbox"><span style="color: red;">* </span>Phone</label>
							<input type="text" id="m_phone" name="m_phone" placeholder=" 전화번호" maxlength="11"/>
							<div id="phone_check" style="font-size: 11px;"></div>
						</div>
						<div class="join_input">
							<label for="m_Email" class="msgbox"><span style="color: red;">* </span>Email</label> 
								<input type="text" id="m_email" name="m_email" placeholder=" Email" />
								<span style="margin: 0px 10px 0px 10px;">@</span>
							<select id="emailDomain" style="">
								<option value="gmail.com">Google</option>
								<option value="naver.com">Naver</option>
								<option value="daum.com">Daum</option>
								<option value="nate.com">Nate</option>
							</select>
							<button type="button" class="checkbtn" id="emailChk" name="emailChk" >중복체크</button>
							<br>
							<div id="email_check" style="font-size: 11px;"></div>
						</div>
						<div>
							<label for="m_Memo" class="msgbox">추가사항</label><br>
							<textarea rows="6" cols="55" id="m_memo" name="m_memo" style="resize: none;"
								placeholder=" DailyHair에 알리고 싶은 개인사항"></textarea>
						</div>
						<div style="margin-top: 50px;">
							<center>
								<input type="button" class="other_btn" id="insertBtn" name="insertBtn" value="가입"/>
								<input type="button" class="other_btn" onclick="joinCancle()" value="취소" />
							</center>
						</div>
					</form>
				</div>

				<!-- 하단 여백 -->
				<div style="width: 100%; height: 50px; margin-bottom: 50px;">
				</div>
			</div>
		</div>
	</section>
	<!-- End Join Section -->

	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>