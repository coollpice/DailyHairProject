	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디자이너 리스트</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<style type="text/css">
	span{
	color: red;
	}
#state{
width : 130px;
float: left;
}
</style>
<script type="text/javascript">

	$(function() {
		//디자이너 등록 버튼 클릭시 팝업창을 띄운다
		$("#insertDesigner").click(
				function() {
					window.open("designerJoinForm.do", "pop",
							"width=800, height=600, left=600, top=100");
				});


		//선택된 디자이너 상태에 따라서 동적으로 리스트가 변경
		$(".order").change(
				function() {

					let des_state = $(".order").val();

					$.ajax({
						url : "/admin/designer/desAjaxList.do",
						type : "post",
						data : {
							"des_state" : des_state
						},
						success : function(data) {
							$(".deslist").html("");
							let html = "";
							for (let i = 0; i < data.length; i++) {
								let des_num = data[i].des_num;
								html += '<tr class='+'tac data-num='+des_num+'>' + '<td>'
										+ data[i].des_regdate + '</td>'
										+ '<td>' + data[i].des_job + '</td>'
										+ '<td>' + data[i].des_name + '</td>'
										+ '<td>' + data[i].des_phone + '</td>'
										+ '<td class='+'holyshit'+'>'
										+ data[i].des_state + '</td>'
										+ '<td>'+'<input type='+'button id='+'modify name='+'modify class="btn modify" value='+'[상세보기/수정]'+'>'+'</td>'
										+'</tr>'
										
									
							} 					
							
							$(".deslist").append(html);
							
							if ($(".holyshit").html() == 1) {
								$(".holyshit").html("활성화");
							} else {
								$(".holyshit").html("비활성화");
							}
							
						}
					});
				});
		
		//시술등록 버튼을 클릭시 시술등록 폼을 띄운다
		$("#insertStyle").click(
				function() {
					window.open("/admin/style/styleSetting.do", "pop",
							"width=900, height=700, left=600, top=100");
				});
		
		
		//수정버튼과 동적으로 생성된 수정버튼을 클릭시 디자이너 수정폼을 띄운다
		$(document).on("click",".modify",function(event){
			var des_num = $(this).parents("tr").attr("data-num");
			$("#des_num").val(des_num);
			window.open("designerUpdateForm.do?des_num=" + des_num,
					"pop", "width=800, height=700, left=600, top=100");
		});
				
	});
</script>
</head>
<body>
	<div class="designerContainer">
		<div class="desHeader">
			<h1>디자이너 관리</h1>
			<select class="order form-control" id="state">
				<option value="1">활성화</option>
				<option value="0">비활성화</option>
			</select>&nbsp; <input type="button" id="insertStyle" name="intsetStyle"
				class="btn" value="시술 관리" />
		</div>
		<div class="desList">
			<form name="detailForm" id="detailForm">
				<input type="hidden" name="des_num" id="des_num">
			</form>
			<table class="table table-hover">
				<colgroup>
					<col width="15%">
					<col width="20%">
					<col width="10%">
					<col width="15%">
					<col width="20%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<td align="center"><strong>디자이너번호</strong>
						<td align="center"><strong>등록일</strong></td>
						<td align="center"><strong>직급</strong></td>
						<td align="center"><strong>이름</strong></td>
						<td align="center"><strong>연락처</strong></td>
						<td align="center"><strong>디자이너상태</strong>
						<td align="center"></td>
					</tr>
				</thead>
				<tbody id="list" class="deslist">
					<c:choose>
						<c:when test="${not empty designerList }">
							<hr>
							<c:forEach var="des" items="${designerList}">
								<tr class="tac" data-num="${des.des_num}">
									<td>${des.des_num}</td>
									<td>${des.des_regdate}</td>
									<td>${des.des_job}</td>
									<td>${des.des_name}</td>
									<td>${des.des_phone}</td>
									<c:if test="${des.des_state == 0}">
										<td>비활성화</td>
									</c:if>
									<c:if test="${des.des_state == 1}">
										<td>활성화</td>
									</c:if>
									<td><input type="button" id="modify" name="modify" class="modify btn" value="[상세보기 / 수정]" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" class="tac">등록된 디자이너가 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div class="buttonContainer">
			<input type="button" value="디자이너 등록" id="insertDesigner" class="btn" />
		</div>
	</div>
</body>
</html>