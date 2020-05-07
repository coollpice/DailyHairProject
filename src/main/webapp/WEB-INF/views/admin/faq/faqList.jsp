<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#faqList{
	width: 1000px;
	height: auto;
}
#faqList > table{
	width: 700px;
	height: 200px;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("#faqInsertFormBtn").click(function() {
			location.href = "adminFaqWriteForm.do";
		});

		$(".goDetail").click(function() {
			var faq_num = $(this).parents("tr").attr("data-num");
			$("#faq_num").val(faq_num);
			console.log("글번호 : " + faq_num);
			//상세 페이지로 이동하기 위해 form추가 (id:detailForm)
			$("#detailForm").attr({
				"method" : "post",
				"action" : "adminUpdateForm.do"
			});
			$("#detailForm").submit();
		});
	});
</script>
<title>글보기</title>
</head>
<body>

<div>
<h2>자주하는 질문 관리</h2>
</div>
 <p><span style="color: red;">*</span>게시글 클릭시 상세보기/수정</p>
	<div>
		<%--====================상세 페이지 이동을 위한 Form =============== --%>
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="faq_num" id="faq_num">
		</form>
		<%--====================상세 페이지 이동을 위한 Form =============== --%>

		<div id="faqList">
			<table id="List" summary="게시판 리스트" class="table table-hover">
				<colgroup>
					<col />
				</colgroup>
				<thead>
					<tr>
						<th>글제목</th>
					</tr>
				</thead>
				<tbody id="list">
					<!-- 데이터 출력 시작-->
					<c:choose>
						<c:when test="${not empty faqList }">
							<c:forEach var="faq" items="${faqList}" varStatus="status">
								<tr class="tac" data-num="${faq.faq_num}">
									<td class="goDetail tal">${faq.faq_question}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="2" class="tac">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
					<!-- 데이터 출력 끝-->
				</tbody>
			</table>
		</div>
		<!-- 글 등록 버튼 시작-->
		<div class="Btn">
			<p><input type="button" id="faqInsertFormBtn" value="글등록" class="btn"></p>
		</div>
		<!-- 글 등록 버튼 끝 -->
	</div>
</body>
</html>