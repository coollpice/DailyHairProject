<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세정보</title>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		//닫기 버튼클릭시 팝업창닫기
		$("#closeBtn").click(function() {
			window.close();
		});

		//수정 버튼 클릭시 실행
		$("#updateBtn").click(function() {
			var state = $("#m_state").val();
			var num = ${detail.m_num};
			//활성화/비활성화 선택했는지 확인후 수정하기 완료
			if (state == "#") {
				alert("상태값을 선택하세요");
				$("#m_state").focus();
				return;
			} else {
				if (confirm("수정하시겠습니까?")) {
					$.ajax({

						url : "/admin/member/memberUpdate.do",
						type : "post",
						data : {
							m_state : state,
							m_num : num
						},
						success : function(data) {
							alert("수정이 완료되었습니다");
							opener.parent.location.reload();
							window.close();
						}
					});
				}
			}

		});
		
		
		//이전 시술내역 클릭시 상세보기출력
	 	$(".detailStyling").click(function(){
	 		
			var rest_num = $(this).attr("data-num");
			
			 $.ajax({
					url : "/admin/member/detailLastReservation.do" ,
					type : "post",
					data : "rest_num="+rest_num ,
					success : function(data){
					
					let html = "이전 시술내역 \n--------------------\n";
					
					for(let i = 0; i<data.length; i++){
					
						html += data[i].styling_name + '(' + data[i].styling_price +'원)\n';						
					 }
					
					alert(html);
					
					}
				}); //ajax 종료
				
	 	});
	});
</script>
<style type="text/css">
body{
background-color: #f2f2f2;
}
.infoContainer{
background-color: white;
width: 95%;
margin: 10px auto;
border:  1px solid;
border-radius: 5px;
}
tbody tr th,td{
text-align: center;
}
thead tr th,td{
text-align: center;
}
#rest_state{
width : 110px;
}
.tc{
color: gray;
}
#m_state{
width : 110px;
}
</style>
</head>
<body>

	<h1 align="center">회원상세보기</h1>
	<select name="m_state" id="m_state" class="form-control" style="margin-left: 20px;">
		<option value="${detail.m_state}">
			<c:if test="${detail.m_state == 0}">
				<td>비활성화</td>
			</c:if>
			<c:if test="${detail.m_state == 1}">
				<td>활성화</td>
			</c:if>
			<c:if test="${detail.m_state == 2}">
				<td>인증단계</td>
			</c:if>
		</option>
		<option value="#">-----------</option>
		<option value="1">활성</option>
		<option value="0">비활성</option>
	</select>
	
	<div class="infoContainer" style="margin-top: 10px;">
	<h4 align="center" style="color: gray;">회원정보</h4>
		<form name="updateForm" id="updateForm">
				<table class="table">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tr>
						<th>회원번호</th>
						<td class="tc">${detail.m_num}</td>
						<th>휴대폰번호</th>
						<td class="tc">${detail.m_phone}</td>
					</tr>
					<tr>
						<th>ID</th>
						<td class="tc">${detail.m_id }</td>
						<th>이메일</th>
						<td class="tc">${detail.m_email}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td class="tc">${detail.m_name}</td>
						<th>특이사항</th>
						<td class="tc">${detail.m_memo}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td class="tc">${detail.m_gender}</td>
						<th>가입일자</th>
						<td class="tc">${detail.m_date}</td>
					</tr>
				</table>
		</form>
	</div>
	<div class="infoContainer" style="width: 95%; height: 350px; overflow: auto">
		<h4 align="center" style="color: gray;">이전 시술내역</h4>
		<label style="margin-left: 10px; color: gray;"><span style="color: red;">*</span>클릭하여 시술명 상세보기</label>
 	<table class="table table-hover">
 		<colgroup>
 			<col width="10%">
 			<col width="20%">
 			<col width="10%">
 			<col width="25%">
 			<col width="20%">
 			<col width="15%">
 		</colgroup>
 			<thead>
 	<tr>
 		<th>예약번호</th>
 		<th>시술 일자</th>
 		<th>디자이너</th>
 		<th>총 시술가격</th>
 		<th colspan="2">시술후 코멘트</th>
 	</tr>
 	</thead>
 	<tbody>
 	<!-- 이전시술내역 리스트 출력 -->
 	<c:choose>	
 		<c:when test="${not empty resultList}">  
 		<c:forEach var="result" items="${resultList}">
 			<tr data-num="${result.rest_num}" class="detailStyling">	
 				<td class="tc">${result.rest_num}</td>
 				<td class="tc">${result.rest_hairdate} / ${result.rest_time}</td>
 				<td class="tc">${result.des_name}</td>
 				<td class="tc">${result.rest_totalprice}원</td>
 				<td class="tc" colspan="2">${result.rest_comment}</td>
 			</tr>
 		</c:forEach> 
 		</c:when>
 		<c:otherwise>
 			<tr>
 				<td colspan="6">이전 시술내용이 없습니다</td>
 			</tr>
 		</c:otherwise>
 	</c:choose>
 	</tbody>
 	</table>
	</div>
	<div class="btnContainer" style="position: absolute; right: 20px;">
		<input type="button" name="updateBtn" id="updateBtn" value="수정" class="btn" style="background-color: white; border: 1px solid gray; margin-right: 10px;"/> <input
			type="button" name="closeBtn" id="closeBtn" value="닫기" class="btn" style="background-color: white;  border: 1px solid gray;"/>
	</div>
 	
</body>
</html>