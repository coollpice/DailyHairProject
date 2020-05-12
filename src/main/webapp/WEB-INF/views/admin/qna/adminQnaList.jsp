<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#contents {
	width: 1200px;
}

span {
	color: red;
}

#search {
	width: 100px;
	float: left;
	margin-right: 5px;
}

#keyword {
	width: 200px;
	float: left;
	margin-right: 5px;
}
#searchData{
width: 70px;
}
#f_search{
margin-bottom: 10px;
float: right; 

}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("#hidden").hide();
		/* 한페이지에 보여줄 레코드 수 조회후 유지하기 위한 설정 */
		if ("<c:out value='${data.pageSize}'/>" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}
		$(".qnaDetail").click(function() {
			let qna_state = $(this).children(".state").attr("data-num");
			let qna_num = $(this).attr("data-num");
			location.href = "/admin/qna/qnaDetail.do?qna_num=" + qna_num;
		});

		//검색 대상이 변경될 때마다 처리 이벤트
		$("#search").change(function() {
			if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		//검색 후 검색 대상과 검색 단어를 출력한다
		var word = "<c:out value='${data.keyword}'/>";
		var value = "";
		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");

			if ($("#search").val() == 'm_id') {
				value = "#list tr td.name";
			}
			if ($("#search").val() == 'm_phone') {
				value = "#list tr td.name";
			}
			$(value + ":contains('" + word + "')").each(
					function() {
						var regex = new RegExp(word, 'gi');
						$(this).html(
								$(this).text().replace(
										regex,
										"<span class='required'>" + word
												+ "</span>"));
					});
		}
		//검색 버튼 클릭 시 처리 이벤트
		$("#searchData").click(function() {

			if ($("#search").val() != "all") {
				if (!chkSubmit($("#keyword"), "검색어를"))
					return;
			}
			goPage(1);
		});
	})
	/* 페이징을 위한 메소드 */
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/qna/qnaList.do"
		});
		$("#f_search").submit();
	}
	//상세보기
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="contents">

		<c:if test="${empty login }">
			<script type="text/javascript">
				alert("로그인이 필요합니다.");
				location.href = "/admin/adminLoginForm.do";
			</script>
		</c:if>

		<div>

			<div class="row">
				<!-- 최상단 구분 -->
				<!-- <div style="width: 100%; height: 100px; margin-bottom: 50px;">
			</div> -->

				<h1>1:1 문의 관리</h1>
				<!-- 페이징을 위한 form -->
				<form id="f_search">
					<input type="hidden" id="page" name="page" value="1"> <select
						id="search" name="search" class="form-control">
						<option value="all">전체</option>
						<option value="m_id">아이디</option>
						<option value="m_phone">휴대폰뒷번호</option>
					</select> <input type="text" id="hidden"> <input type="text"
						name="keyword" id="keyword" class="form-control" /> <input
						type="button" id="searchData" value="검색" class="btn" />
				</form>
				<table class="table table-condensed table-hover" style="text-align: center;">
					<colgroup>
						<col width="5%">
						<col width="20%">
						<col width="40%">
						<col width="15%">
						<col width="20%">
					</colgroup>
					<thead class="text-center">
						<tr class="active" >
							<td><b>글번호</b></td>
							<td><b>아이디</b></td>
							<td><b>제목</b></td>
							<td><b>작성일</b></td>
							<td><b>답변상태</b></td>
						</tr>
					</thead>
					<tbody id="list" >
						<c:choose>
							<c:when test="${not empty qnaList }">
								<c:forEach var="qna" items="${qnaList}">
									<tr data-num="${qna.qna_num}" class="qnaDetail">
										<td class="goDetail">${qna.qna_num}</td>
										<td class="name">${qna.m_id}</td>
										<td class="goDetail">${qna.qna_title}</td>
										<td>${qna.qna_regdate}</td>
										<c:if test="${qna.qna_state == 0}">
											<td class="state" data-num="${qna.qna_state}">답변 대기</td>
										</c:if>
										<c:if test="${qna.qna_state == 1}">
											<td class="state" data-num="${qna.qna_state}">답변 완료</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" align="center">내역이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div id="boardPage">
				<tag:paging page="${param.page}" total="${total}"
					list_size="${data.pageSize}"></tag:paging>

			</div>
		</div>
	</div>
</body>
</html>