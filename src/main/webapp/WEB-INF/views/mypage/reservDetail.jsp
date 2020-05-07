<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>예약현황 상세</title>
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
<!--[if lt IE 9]>
<script src="/resources/include/js/html5shiv.js"></script>
<![endif]-->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	$("#closeBtn").click(function() {
		window.close();
	});
	
});
</script>
<style type="text/css">
section { padding-bottom: 14px; }

.qnaHeadBox { width: 95%; max-width: 1600px; margin: 0 auto; }
.tableBox1 { width: 95%; margin: 0 auto; }
.tableBox1 > table { width: 100%; text-align: center; }
.qnaThead { box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
			transition: all ease-in-out 0.3s;
			background-color: #FFFAFA; }
.thBottom { padding: 15px 0px 15px 0px;
			font-size: 13px; }
.thBottom2 { padding: 15px 0px 15px 0px; color: #BDBDBD; }
.tableBox2 { margin-bottom: 35px; padding: 15px;
			box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
			transition: all ease-in-out 0.3s;
			background-color: #FFFAFA; 
			font-size: 11px; }
.tableBox2 > table { width: 100%; text-align: center; }
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


.detailBox { margin: 0 auto; min-width: 1020px; width: 90%;
			box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
			padding: 15px 5px 5px 5px;
			background-color: snow; }
.detail { text-align: center; }
.detailStyle { display: inline-block; width: 150px; font-size: 12px; }
.detailStyleHead { display: inline-block; width: 150px;
					font-weight: 600; font-size: 13px; }


.closeBox { padding-top: 50px; }
.closeBtn { margin: 0 auto; border: 0; padding: 15px 35px 5px 35px;
			background-color: #fffaf3; }
</style>

</head>

<body>
	<!-- ======= reserveDetail Section ======= -->
	<section id="about" class="about">
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; margin-bottom: 50px;">
			</div>
			
			<div style="margin: 0 auto; padding: 10px; min-width: 1020px; width: 95%">
				<!-- 상단 -->
				<div style="margin-bottom: 30px; text-align: center;">
					<h1 style="margin-bottom: 10px; font-size: 35px;">예약현황 상세보기</h1>
				</div><br>
				
				<!-- 구분선 -->
				<div style="width: 100%; margin: 0 auto;">
					<br>
				</div>
				
				<!-- 예약현황 상세보기 -->
				<div class="qnaHeadBox">
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
								<col width= "9%"> <!--	매장위치		-->
								<col width= "1%">
								<col width="12%"> <!--	예약한 날짜		-->
								<col width= "1%">
								<col width="13%"> <!--	시술 일자		-->
								<col width= "1%">
								<col width="10%"> <!--	디자이너		-->
								<col width= "1%">
								<col width="11%"> <!--	총 결제금액		-->
								<col width= "1%">
								<col width="26%"> <!--	요구사항		-->
								<col width= "1%">
								<col width="13%"> <!--	예약 상태		-->
							</colgroup>
							<tbody>
								<tr data-num = "${detail.rest_num}" class="qnaDetail">
									<td class="detailreservation">왕십리점</td>
									<td></td>
									<td class="detailreservation">${detail.rest_regdate}</td>
									<td></td>
									<td class="detailreservation">${detail.rest_hairdate} / ${detail.rest_time}</td>
									<td></td>
									<td class="detailreservation">${detail.des_name}</td>
									<td></td>
									<td class="detailreservation">${detail.rest_totalprice}</td>
									<td></td>
									<td class="detailreservation">${detail.rest_memo}</td>
									<td></td>
									<td><c:if test="${detail.rest_state == 1 }">예약 중</c:if>
										<c:if test="${detail.rest_state == 2 }">시술 완료</c:if>
										<c:if test="${detail.rest_state == 0}">예약 취소</c:if>
									</td>
								</tr>
							</tbody>
						</table>
						</div>
					</div>
				</div>
				
				<!-- 예약 세부내용 -->
				<div class="detailBox">
					<div class="detail">
						<p class="detailStyleHead">시술 종류</p>
						<c:choose>
							<c:when test="${not empty styleList}">
								<c:forEach var="style" items="${styleList}">
									<p class="detailStyle">${style.styling_name}</p>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
					
					<div class="detail">
						<p class="detailStyleHead">시술 가격</p>
						<c:choose>
							<c:when test="${not empty styleList}">
								<c:forEach var="style" items="${styleList}">
									<p class="detailStyle">${style.styling_price}</p>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
				
				<!-- 닫기 버튼 -->
				<div class="closeBox" align="center">
					<input type="button" class="closeBtn" id="closeBtn" name="closeBtn" value="닫기"/>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- End reserveDetail Section -->
</body>
</html>