<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황</title>
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
	
	<script src="/resources/include/js/bootstrap-datepicker.js"></script>
	<script src="/resources/include/js/bootstrap-datepicker.ko.min.js"></script>
	
	<!-- Template Main JS File -->
	<script type="text/javascript" src="/resources/assets/js/main.js"></script>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	
	$("#memberUpdate").click(function() {
		location.href = "/mypage/memberUpdate.do"
	});
	
	$("#deactivation").click(function() {
		location.href = "/mypage/deactivation.do"
	});
	
	$("#reserveState").click(function() {
		location.href = "/mypage/reserveState.do"
	});
	
	//상세보기(시술내용, 시술가격)
	$(".detailreservation").click(function(){
		let rest_num = $(this).parents("tr").attr("data-num");
		
		
		window.open("reservDetail.do?rest_num="+rest_num, "mypagePop",
		"width=1400, height=570, left=100, top=100");
		
	});
	
	//예약취소
	$(".cancleBtn").click(function() {
		let rest_num = $(this).parents("tr").attr("data-num");
		
		if (confirm("예약을 취소하시겠습니까?")) {
			$.ajax({
				url : "/mypage/cancleReservation.do",
				type : "post",
				data : { rest_num : rest_num },
				success : function(data) {
						if(data == 1){
							alert("예약이 취소되었습니다.");
							window.location.reload();
						}
				}
			});
		}
		
	});
	
});

</script>
<style type="text/css">
.other_btn { width: 125px; height: 35px;
			text-align: center;
			cursor: pointer;
			display: inline-block;
			font-size: 12px;
			padding: 8px 16px 10px 16px;
			font-weight: 500;
			line-height: 1;
			color: #444444;
			margin: 0 10px 10px 10px;
			transition: all ease-in-out 0.3s;
			background: #fffaf3;
			border: 2px dashed #ffb03b;
			border-radius: 25px; }
.other_btn:hover { background: #FFE08C; }


.qnaHeadBox { width: 95%; max-width: 1600px; margin: 0 auto; }
.resBox { text-align: left; margin-bottom: 75px; }
.p_ori { margin-bottom: 20px; text-align: center; }
.p_set { margin-bottom: 0px; }


.tableBox1 { width: 95%; margin: 0 auto; }
.tableBox1 > table { width: 100%; text-align: center; }
.tableBox2 > table { width: 100%; text-align: center; }
.qnaThead { box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
			transition: all ease-in-out 0.3s;
			background-color: #FFFAFA; }
.thBottom { padding: 15px 0px 15px 0px; }
.thBottom2 { padding: 15px 0px 15px 0px; color: #BDBDBD; }
.tdBottom { padding: 50px 0px 50px 0px; }


.tableBox2 { margin-bottom: 150px; padding: 15px;
			box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
			transition: all ease-in-out 0.3s;
			background-color: #FFFAFA; 
			font-size: 13px; }
.tableBox2 > table { width: 100%; text-align: center; }
.qnaDetail:hover { transition: all ease-in-out 0.3s; 
					background-color: #D4F4FA; }
.cancleBtn {
	width: 100px;
	height: 30px;
	font-size: 13px;
	border: 1px solid silver;
	border-radius: 15px;
	background-color: #EAEAEA;
	transition: all ease-in-out 0.3s; }
.cancleBtn:hover { 
	border: 1px solid #FFE08C;
	border-radius: 15px;
	background-color: #FFE08C; }
</style>
</head>

<body>
	<c:if test="${empty login }">
		<script type="text/javascript">
			alert("로그인해주세요");
			location.href="/";
		</script>
	</c:if>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>

	<!-- ======= MyPage Section ======= -->
	<section id="about" class="about">
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 75px; margin-bottom: 50px;">
			</div>
			
			<div style="margin: 0 auto; padding: 10px; min-width: 1020px; width: 95%">
				<!-- 상단 -->
				<div style="margin-bottom: 30px; text-align: center;">
					<h1 style="margin-bottom: 10px; font-size: 50px;">My Page</h1>
					<p style="margin-bottom: 10px;">회원님의 예약현황입니다. 클릭하여 상세정보를 확인하세요.</p>
				</div><br>
				
				<!-- 버튼 -->
				<div>
					<center>
					<input type="button" class="other_btn" id="memberUpdate" name="memberUpdate" value="회원정보 수정">
					<input type="button" class="other_btn" id="reserveState" name="reserveState" value="예약현황">
					<input type="button" class="other_btn" id="deactivation" name="deactivation" value="계정 비활성화">
					</center>
				</div>
			
				<!-- 구분선 -->
				<div style="width: 100%; margin: 0 auto; margin-bottom: 50px;">
					<br>
				</div>
		
				<!-- 예약 현황 -->
				<div class="qnaHeadBox">
					<div class="resBox">
						<p class="p_ori"><span style="color: red;"> * </span>예약 관련 주의 사항<span style="color: red;"> * </span></p>
						<div style="width: 520px; margin: 0 auto;">
							<div>
								<div style="display: inline-block; width: 15px;"><p style="display: inline;">1.</p></div>
								<div style="display: inline-block; width: 500px;"><p style="display: inline;">시술 전 날까지는 100% 환불 및 예약 취소가 가능합니다.</p></div>
							</div>
							<div>
								<div style="display: inline-block; width: 15px;"><p style="display: inline;">2.</p></div>
								<div style="display: inline-block; width: 500px;"><p style="display: inline;">시술 당일에는 예약 취소는 가능하나 예약금 환불이 불가능합니다.</p></div>
							</div>
						</div>
						<p class="p_set"></p>
					</div>
					
					<div class="tableBox1">
					<table>
						<thead class="qnaThead">
							<tr>
								<th class="thBottom"	width= "9%" style="padding-left: 15px;">매장위치</th>
								<th class="thBottom2"	width= "2%" >│</th>
								<th class="thBottom"	width="11%" >예약한 날짜</th>
								<th class="thBottom2"	width= "2%" >│</th>
								<th class="thBottom"	width="12%" >시술 일자</th>
								<th class="thBottom2"	width= "2%" >│</th>
								<th class="thBottom"	width="8%" >디자이너</th>
								<th class="thBottom2"	width= "2%" >│</th>
								<th class="thBottom"	width="10%" >총 결제금액</th>
								<th class="thBottom2"	width= "2%" >│</th>
								<th class="thBottom"	width="25%" >요구사항</th>
								<th class="thBottom2"	width= "2%" >│</th>
								<th class="thBottom"	width="13%"  style="padding-right: 15px;">예약 상태</th>
							</tr>
						</thead>
						<tbody>
							<tr><!-- 여백 -->
								<td colspan="7" class="blickSpace" style="height: 30px;"></td>
							</tr>
						</tbody>
					</table>
					
						<div class="tableBox2">
						<table cellpadding="5px">
							<colgroup>
								<col width= "8%">
								<col width= "1%">
								<col width="11%">
								<col width= "1%">
								<col width="15%">
								<col width= "1%">
								<col width= "8%">
								<col width= "1%">
								<col width="12%">
								<col width= "1%">
								<col width="27%">
								<col width= "1%">
								<col width="13%">
							</colgroup>
							<tbody>
								<c:choose>
									<c:when test="${not empty myList}">
										<c:forEach var="list" items="${myList}">
											<tr data-num = "${list.rest_num}" class="qnaDetail">
												<td class="detailreservation">왕십리점</td>
												<td></td>
												<td class="detailreservation">${list.rest_regdate}</td>
												<td></td>
												<td class="detailreservation">${list.rest_hairdate} / ${list.rest_time}</td>
												<td></td>
												<td class="detailreservation">${list.des_name}</td>
												<td></td>
												<td class="detailreservation">${list.rest_totalprice}</td>
												<td></td>
												<td class="detailreservation">${list.rest_memo}</td>
												<td></td>
												<td><c:if test="${list.rest_state == 1 }">예약 중<br>
														<input type="button" name="cancleBtn" class="cancleBtn"
															id="cancleBtn" value="예약취소"/>
													</c:if>
													<c:if test="${list.rest_state == 2 }">시술 완료</c:if>
													<c:if test="${list.rest_state == 0}">예약 취소</c:if>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									
									<c:otherwise>
										<tr class="qnaTbody">
											<td colspan="13" align="center" class="tdBottom">예약 내역이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						</div>
					</div>
				<!-- 하단 여백 -->
				<div style="width: 100%; height: 50px; margin-bottom: 50px;">
				</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- End MyPage Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>