<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>ReserveSelectSergery</title>
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
		.reserveBtnNot { width: 150px; height: 50px; background: #BDBDBD; border: 0; color: #fff;
					padding: 10px 24px; transition: 0.4s; border-radius: 50px; font-size: 15px; }
		.stylebox { border-spacing: 10px; border-collapse: inherit; margin: 0 auto; padding: 25px 0px 35px 0px; }
		.style1 {  }
		.style2 { padding-left: 15px; text-align: right; }
		.style3 { padding-left: 15px; }
		.styleNo1 { padding: 75px 0px 0px 0px; text-align: center; }
		.styleNo2 { padding: 0px 0px 20px 0px; text-align: center; }
	</style>
	
	<!-- 이벤트 -->
	<script type="text/javascript">
		$(function(){
			//시술선택시 이벤트
			$(".check").click(function(){
			//총합 변수
			let sum = 0;
			//시술이 선택되면 선택된 시술의 가격을 더하거나 빼는 로직입니다.
			$("#stylingForm").find(':checkbox').each(function(){
					if($(this).is(':checked')){	
						let price = parseInt($(this).parents("tr").attr("data-num")); //선택한 체크박스의 가격값을 불러옴
						sum = sum+price;
					}			
			});
			$("#price").html(sum+"원");
			$("#rest_totalprice").val(sum);
			
			let total = "";
			//시술이 선택되면 선택된 시술의 시술명을 출력
			$("#stylingForm").find(':checkbox').each(function(){
				if($(this).is(':checked')){
					let name = $(this).parents("tr").attr("data-name"); //선택한 체크박스의 시술이름을 불러옴
					total = total + name + ',';
				}			
			$("#stylename").html(total);
			
		});
			//3개이상의 시술 선택못하게하기			
			if($("input:checkbox[name=styling_num]:checked").length > 3 ){
				alert("시술은 3개까지만 선택할 수 있습니다");
				return false;
			}
		});
			
			
			
		});
		// 이전 단계로 버튼 이벤트
		function selectDesigner() {
			let date = "${data.rest_hairdate}";
			let time =	"${data.rest_time}";
			
			location.href="/reserve/reserveSelectDesigner.do?rest_hairdate="+date+"&rest_time="+time;
		}
		
		// 결제하기 버튼 이벤트
		function payment() {
			
		   	if($("input:checkbox[name=styling_num]:checked").length==0){
		   		alert("시술을 하나이상 선택해주세요");
		   		return false;
		   	}
		   
		   //체크박스를 담을 배열
		   let checkArr = new Array()
			
		   $("input:checkbox[name=styling_num]:checked").each(function(){
				checkArr.push($(this).val());
		   });				
		   
		$("#array").val(checkArr);
		   
		  $("#stylingForm").attr({
				"method":"post",
				"action":"/reserve/reservePayment.do"});
			$("#stylingForm").submit();  
		   
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
				<p style="margin-bottom: 10px;">받으시기를 원하시는 시술을 선택해주세요.</p>
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
				<div class="reserveTable" id="stylename">(시술)입력 대기 중</div>
				<div></div>
				<div class="reserveTablehead" style="float: left;">결제 금액</div>
				<div  id="price" class="reserveTable" style="float: right;">(금액)입력 대기 중</div>
			</div>
			
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: 1 solid black; margin-top: 10px;" />
			</div>
			
			<!-- 시술 선택 -->
			<div style="margin : 0 auto;">
			<form id="stylingForm" name="stylingForm">
				<table class="stylebox">
				<c:choose>
					<c:when test="${not empty styleList}">
						<c:forEach var="style" items="${styleList }">
							<tr data-num="${style.styling_price}" data-name="${style.styling_name}">
								<td class="style1">${style.styling_name}</td>
								<td class="style2">${style.styling_price}원</td>
								<td class="style3"><input type="checkbox" name="styling_num"
									value="${style.styling_num}"class="check"/></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p class="styleNo1">등록된 시술이없습니다</p>
						<p class="styleNo2">다른 디자이너를 선택해주시기 바랍니다.</p>
					</c:otherwise>
				</c:choose>
				</table>
				
				<input type="hidden" id="rest_hairdate" name="rest_hairdate" value="${data.rest_hairdate}"/>
				<input type="hidden" id="rest_time" name="rest_time" value="${data.rest_time }"/>
				<input type="hidden" id="des_num" name="des_num" value="${data.des_num}"/>
				<textarea rows="5" cols="50" id="rest_memo" name="rest_memo" placeholder=" 시술 시 참고사항을 적어주세요"></textarea>
				<input type="hidden" name="array" id="array" value=""/>
				<input type="hidden" name="rest_totalprice" id="rest_totalprice" value=""/>
				</form>
			</div>
			
			<div style="width: 100%; margin: 0 auto;">
				<hr style="border: 0; margin-top: 10px;" />
			</div>
			
			<!-- 버튼 -->
			<div style="margin: 0 auto; margin-top: 75px;">
				<button class="reserveBtn" onclick="selectDesigner()">이전 단계</button>
				<c:if test="${not empty styleList}"><button class="reserveBtn" onclick="payment()">결제하기</button></c:if>
				<c:if test="${empty styleList}"><button class="reserveBtnNot" onclick="payment()" disabled="disabled">결제하기</button></c:if>
			</div>
		</div>
	</div>
	</section><!-- End Reserve Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>

</html>