<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 상세보기</title>
<style type="text/css">

.he {
	background-color: #f2f2f2;
}

.mainContainer>table, #reply {
	width: 800px;
	margin: 5px;
}

textarea {
	width: 500px;
	resize: none;
}

#reply>span {
	display: inline;
}

#reply {
	width: 800px;
}

#content {
	width: 800px;
	height: 300px;
	border: 1px dashed;
}


img {
	width: 500px;
	height: 300px;
	margin: auto;
}

#formTable td {
	text-align: center;
}

#rep_content {
	width: 700px;
}

#inputArea {
	margin: 5px;
}

.tc{
color: gray;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		//답변삭제
		$("#deleteRepBtn").click(function() {
			if (confirm("정말 답변을 삭제하시겠습니까?")) {

				var form = $("form[id=replyForm]").serialize();

				$.ajax({
					type : 'POST',
					url : 'qnaReplyDelete.do',
					data : form,
					dataType : 'JSON',
					success : function(data) {
						if (data == 1) {
							alert("답변글 삭제 완료");
							location.href = "/admin/qna/qnaList.do";
						} else {
							alert(data);
							alert("답변글 삭제 실패");

						}
					},
					error : function() {
						alert("서버 오류 ");
					}

				})
				/* $("#replyForm").attr({
					"action" : "qnaDelete.do",
					"method" : "POST"

				})
				$("#replyForm").submit(); */

			}
		})
		//답변입력
		$("#insertReply").click(function() {
			if (!chkData("#rep_name", "작성자를"))
				return;
			if (!chkData("#rep_content", "답변내용을"))
				return;
			if (confirm("답변을 등록하시겠습니까?")) {
				var form = $("#replyForm");
				var formData = new FormData(form[0]);

				$.ajax({
					cache : false,
					url : 'qnaReplyInsert.do',
					processData : false,
					contentType : false,
					type : 'POST',
					data : formData,
					success : function(data) {
						if (data == 1) {
							alert("등록 완료");
							location.href = "/admin/qna/qnaList.do";
						} else {
							alert(data);
							alert("등록 실패");

						}
					},
					error : function() {
						alert("서버 오류 ");
					}
				});
			}
		})
		//목록으로 버튼 클릭시 실행
		$("#listBtn").click(function() {
			history.go(-1);
		});

		/* 	//이미지 다운로드
			function fn_fileDown(qna_num1) {
				var formObj = $("#downForm");
				$("#qna_num1").attr("value", qna_num1);
				formObj.attr("action", "/client/qna/download.do");
				formObj.submit();
			} */
	});
</script>

</head>
<body>
	<form name="downForm" id="downForm"></form>
	<h1>1:1 문의 상세보기</h1>
	<input type="button" name="listBtn" id="listBtn" value="목록으로" class="btn"/>
	<div class="mainContainer">
		<table border="1" id="formTable">
			<colgroup>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="25%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="15%"/>
			</colgroup>
			<tr>
				<td class="he">글번호</td>
				<td class="tc">${detail.qna_num}</td>
				<td class="he">제목</td>
				<td class="tc">${detail.qna_title}</td>
				<td class="he">작성자</td>
				<td class="tc">${detail.m_id}</td>
				<td class="he">작성일</td>
				<td class="tc">${detail.qna_regdate}</td>

			</tr>
			<c:choose>
				<c:when test="${not empty detail.qna_file}">
					<tr>
						<td class="he" rowspan="2">첨부파일</td>
						<td colspan="7" class="tc"
							style="text-align: left; padding-left: 5px; border-bottom: none;">${detail.qna_file}</td>
					</tr>
					<tr id="imgRow">
						<td colspan="7"
							style="text-align: left; padding-left: 5px; border-top: none;"><img
							src="/uploadStorage/qna/${detail.qna_file}"
							alt="${detail.qna_file}" ></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td class="he">첨부파일</td>
						<td colspan="7" ></td>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
				<td id="qna_content" class="he">문의 내용</td>
				<td id="qna_content" colspan="7" style="text-align: left;" class="tc">${detail.qna_content}</td>
			</tr>
		</table>
	</div>
	<c:choose>
		<c:when test="${detail.qna_state==0}">
			<div id="reply" style="margin-top: 30px;">
				<form id="replyForm">
					<input type="hidden" id="qna_num" name="qna_num"
						value="${detail.qna_num}">

					<table>
						<tr>
							<td class="he">작성자</td>
							<td colspan="7"><input class="inputArea" type="text"
								id="rep_name" name="rep_name" placeholder="작성자"></td>
						</tr>
						<tr>
							<td class="he">내용</td>
							<td colspan="7" class="inputArea"><textarea
									class="inputArea" id="rep_content" name="rep_content" rows="3"
									cols="10" placeholder="내용을 입력해주세요"></textarea></td>
						</tr>
						<tr>
							<td class="he">첨부파일</td>
							<td colspan="7" class="inputArea"><input type="file"
								id="uploadFile" name="uploadFile"></td>
						</tr>
					</table>

				</form>
			</div>

			<div class="btnContainer">
				<input type="button" name="insertReply" id="insertReply"
					value="답변입력" class="btn"/>
			</div>
		</c:when>
		<c:otherwise>
			<div id="reply" style="margin-top: 30px;">
				<form id="replyForm">
					<input type="hidden" id="qna_num" name="qna_num"
						value="${detail.qna_num}">
					<table>
						<tr>
							<td class="he">작성자</td>
							<td class="tc" >${reply.rep_name}</td>
						</tr>
						<tr>
							<td class="he">내용</td>
							<td class="tc">${reply.rep_content}</td>
						</tr>
						<tr>


							<td class="he">첨부파일 </td>
							<c:choose>
								<c:when test="${not empty reply.rep_file}">
									<td><img src="/uploadStorage/reply/${reply.rep_file}"></td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
							<td><input type="hidden" id="rep_file" name="rep_file"
								value="${reply.rep_file}" /></td>
						</tr>
					</table>
				</form>
			</div>


			<div class="btnContainer">
				<input type="button" name="deleteRepBtn" id="deleteRepBtn"
					value="답글삭제" class="btn" />
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>