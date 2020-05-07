<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
textarea {
	width: 700px;
	height: 100px;
	resize: none;
}

#listMenu>p {
	float: letf;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		//목록으로 버튼 클릭시 전체 페이지로 이동
		$("#faqListBtn").click(function() {
			location.href = "/admin/adminFaqList.do";
		});
		//등록완료 버튼 클릭시
		$("#faqInsertBtn").click(function() {
			if(!chkData("#faq_question","질문을")) return;
			if(!chkData("#faq_answer","답변을")) return;
			if (confirm("등록 하시겠습니까?")) {
				$("#insertForm").attr("method", "post");
				$("#insertForm").attr("action", "/admin/adminFaqInsert.do");
				$("#insertForm").submit();
				alert("등록이 완료되었습니다");
			}
		});

	});
</script>
<title>자주 묻는 질문 작성</title>
</head>
<body>
	<div>
		<div>
			<h2>자주하는 질문 관리-게시글 등록</h2>
		</div>
		<div id="listMenu">
			<p>
				<input type="button" value="목록으로" class="but btn" id="faqListBtn">
			</p>
		</div>
		<form id="insertForm" name="insertForm">
			<table>
				<tr>
					<td><span style="color: red;">*</span>질문</td>
					<td>&nbsp;&nbsp;<textarea id="faq_question" name="faq_question" cols="35"
							rows="15" placeholder="질문을 입력해주세요."></textarea></td>
				</tr>
				<tr>
					<td><span style="color: red;">*</span>답변</td>
					<td>&nbsp;&nbsp;<textarea id="faq_answer" name="faq_answer" cols="35"
							rows="15" placeholder="답변을 입력해주세요."></textarea></td>
				<tr>
			</table>
		</form>
		<!-- 글 등록 버튼 시작-->
		<div>
			<input type="button" value="등록완료" class="but btn" id="faqInsertBtn">
		</div>
		<!-- 글 등록 버튼 끝-->
	</div>
</body>
</html>