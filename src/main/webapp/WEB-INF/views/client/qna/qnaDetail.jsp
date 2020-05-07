<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세보기</title>
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
	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {

		//답변이 달린글은 수정/삭제버튼이 비활성화되어있어야한다.
		if ("${detail.qna_state}" == 1) {
			$("#updateBtn").attr("disabled", true);
			$("#deleteBtn").attr("disabled", true);
		}
		//목록으로 버튼 클릭 시 실행
		$("#listBtn").click(function() {
			location.href = "/client/qna/qnaList.do";
		});

		//수정버튼 클릭 시 실행
		$("#updateBtn").click(function() {
			let qna_num = "${detail.qna_num}";
			location.href = "/client/qna/qnaUpdateForm.do?qna_num=" + qna_num;
		});
		
		//삭제버튼 클릭 시 실행
		$("#deleteBtn").click(function() {
			if (confirm("문의를 삭제하시겠습니까?")) {

				var form = $("form[id=downForm]").serialize();

				$.ajax({
					type : 'POST',
					url : 'qnaDelete.do',
					data : form,
					dataType : 'JSON',
					success : function(data) {
						if (data == 1) {
							alert("문의글을 삭제했습니다.");
							location.href = "/client/qna/qnaList.do";
						} else {
							alert(data);
							alert("문의글을 삭제하는데 실패하였습니다.");
						}
					},
					error : function() {
						alert("서버 오류");
					}

				});
			}
		});
		
		// 문의사항 첨부파일 이미지 보여주기
		let image = "<c:out value='${detail.qna_file}'/>";
		if (image != "") {
			$("#img").attr({
				src: "/uploadStorage/qna/${detail.qna_file}",
				width:"235px",
				height:"345px"
			});
		}
		
		// 답글 첨부파일 이미지 보여주기
		let imageRe = "<c:out value='${reply.rep_file}'/>";
		if (imageRe != "") {
			$("#imgR").attr({
				src: "/uploadStorage/reply/${reply.rep_file}",
				width:"235px",
				height:"345px"
			});
		}
	});
</script>
<style type="text/css">
.btnContainer { width: 90%; margin: 0 auto; }
p > span { color: red; font: bold; }
.qnaBtn { float: right; margin: 0px 5px 0px 5px;
			width: 100px; height: 35px;
			text-align: center;
			cursor: pointer;
			display: inline-block;
			font-size: 10px;
			padding: 8px 16px 10px 16px;
			font-weight: 500;
			line-height: 1;
			color: #444444;
			transition: all ease-in-out 0.3s;
			background: #fffaf3;
			border: 2px dashed #ffb03b;
			border-radius: 25px; }
.closeBtn { float: right; margin: 0px 5px 0px 5px;
			width: 100px; height: 35px;
			text-align: center;
			cursor: pointer;
			display: inline-block;
			font-size: 10px;
			padding: 8px 16px 10px 16px;
			font-weight: 500;
			line-height: 1;
			color: #444444;
			transition: all ease-in-out 0.3s;
			background: #EAEAEA;
			border: 2px dashed #BDBDBD;
			border-radius: 25px; }
.qnaBtn:hover { background: #FFE08C; }
.qnaHeadBox { width: 95%; max-width: 1600px; margin: 0 auto; }
.qnaHeadBox > h4 { padding-left: 20px; padding-top: 50px; }


.tableBox2 { margin-bottom: 50px; padding: 15px 15px 5px 15px;
			box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
			background-color: #FFFAFA;
			min-width: 1220px; min-height: 375px; height: auto; }
.tableBox2 > div > label { margin-bottom: 25px; }
.redSpan { color: red; }
.miniDetail { font-size: 12px; display: inline; }


.replyBigBox { margin: 0 auto; padding-bottom: 100px; }
.replyBigBox > h4 { padding-left: 20px; }
.replyBox { width: 95%; margin: 0 auto; padding: 15px;
			box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
			background-color: #FFFAFA; height: 375px; }
.replyBox > div > label { margin-bottom: 25px; }
.replyBox > div > div > label > span { color: red; }

.contentBox { border: 0px; resize: none; width: 100%;
			background-color: #fffafa; }
.ctBoxL { width: 80%; min-width: 940px; height: 350px; float: left; }
.ctBoxR { width: 20%; min-width: 235px; height: 350px; float: right; }
</style>
</head>
<body>
	<!-- header 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/header.jsp"></jsp:include>
	
	<!-- ======= 1:1 QnA Detail Section ======= -->
	<section id="about" class="about">
	<div class="container-fluid" >
		<div class="row">
			<!-- 최상단 구분 -->
			<div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div>
			
			<!-- 상단 -->
			<div style="margin: 0 auto; text-align: center; width: 100%;">
				<h1 style="margin-bottom: 20px;">1：1 문의 상세보기</h1>
				<p style="margin-bottom: 60px;"><span>*</span> 답변이 달린 경우에는 수정 및 삭제가 불가능합니다. <span>*</span></p>
			</div>
			
			<!-- 버튼 -->
			<div class="btnContainer">
				<input class="qnaBtn" type="button" name="listBtn" id="listBtn" value="목록으로"/>
				<c:if test="${detail.qna_state eq 0}">
					<input class="qnaBtn" type="button" name="deleteBtn" id="deleteBtn" value="삭제"/>
					<input class="qnaBtn" type="button" name="updateBtn" id="updateBtn" value="수정"/>
				</c:if>
				<c:if test="${detail.qna_state eq 1}">
					<input class="closeBtn" type="button" name="deleteBtn" id="deleteBtn" value="삭제" disabled="disabled"/>
					<input class="closeBtn" type="button" name="updateBtn" id="updateBtn" value="수정" disabled="disabled"/>
				</c:if>
				
			</div>
			
			<!-- 문의 답변 -->
			<form name="downForm" id="downForm">
				<input type="hidden" name="qna_num" id="qna_num" value="${detail.qna_num}">
			</form>
			
			<div class="qnaHeadBox">
				<h4>문의 제목 ： “ ${detail.qna_title} ”</h4>
				<hr style="width: 100%">
				
				<div style="width: 95%; margin: 0 auto;">
					<div class="tableBox2">
						<c:if test="${empty detail.qna_file }">
							<div class="ctBoxL">
								<div style="width: 100%; margin-bottom: 15px;">
									<label><span class="redSpan">*</span> 첨부파일 ： </label>
									<p class="miniDetail">( 첨부파일이 존재하지 않습니다. )</p>
								</div>
								<textarea rows="12" class="contentBox" disabled="disabled"><c:out value="${detail.qna_content}"/></textarea>
							</div>
							<div class="ctBoxR">
								<img style="float: right;" src="/resources/assets/img/qnaNoImg.png">
							</div>
						</c:if> 
						<c:if test="${not empty detail.qna_file }">
							<div class="ctBoxL">
								<div style="width: 100%; margin-bottom: 15px;">
									<label><span class="redSpan">*</span> 첨부파일 ： </label>
									<label>${detail.qna_file}</label>
								</div>
								<textarea rows="12" class="contentBox" disabled="disabled"><c:out value="${detail.qna_content}"/></textarea>
							</div>
							<div class="ctBoxR">
								<img style="float: right;" id="img">
							</div>
						</c:if>
					</div>
					
					<!-- 답변 존재 유무에 따른 view 적용 -->
					<c:choose>
						<c:when test="${detail.qna_state eq 1}">
							<div class="replyBigBox">
								<h4>답글 제목 ： “ ${reply.rep_name} ”</h4>
								<hr style="width: 100%">
								
								<div class="replyBox">
									<c:if test="${empty reply.rep_file }">
										<div style="width: 80%; height: 350px; float: left;">
											<div style="width: 100%; margin-bottom: 15px;">
												<label><span class="redSpan">*</span> 첨부파일 ： </label>
												<p class="miniDetail">( 첨부파일이 존재하지 않습니다. )</p>
											</div>
											<textarea rows="12" cols="110" class="contentBox" disabled="disabled"><c:out value="${reply.rep_content}"/></textarea>
										</div>
										<div style="width: 20%; height: 350px; float: right;">
											<img style="float: right;" src="/resources/assets/img/qnaNoImg.png">
										</div>
									</c:if> 
									<c:if test="${not empty reply.rep_file }">
										<div style="width: 77%; height: 350px; float: left;">
											<div style="width: 100%; margin-bottom: 15px;">
												<label><span class="redSpan">*</span> 첨부파일 ： </label>
												<label>${reply.rep_file}</label>
											</div>
											<textarea rows="12" cols="110" class="contentBox" disabled="disabled"><c:out value="${reply.rep_content}"/></textarea>
										</div>
										<div style="width: 23%; height: 350px; float: right;">
											<img style="float: right;" id="imgR">
										</div>
									</c:if>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div style="height: 150px;"></div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	</section><!-- End 1:1 QnA Detail Section -->
	
	<!-- footer 삽입 -->
	<jsp:include page="/WEB-INF/views/client/main/footer.jsp"></jsp:include>
</body>
</html>