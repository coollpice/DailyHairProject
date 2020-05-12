<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황</title>
<style type="text/css">
#datePicker{
width : 130px;
}
#des_num{
width : 130px;
float: left;
margin-right: 15px;
}
tbody tr td,th{
text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script src="/resources/include/js/bootstrap-datepicker.js"></script>
<script src="/resources/include/js/bootstrap-datepicker.ko.min.js"></script>
<script type="text/javascript">
	$(function(){
		//오늘날짜 출력을 위한 자바스크립트
		
		let today = new Date();
		
		let year = today.getFullYear();		//년도
		let month = today.getMonth()+1; //월
		let date = today.getDate();     //날짜
		
		month = month >= 10 ? month : '0' + month;
		date = date >= 10 ? date : '0' + date;
		
		
		$("#datePicker").val(year+'-'+month+'-'+date);
		
		
		//달력
		$("#datePicker").datepicker({
			format : "yyyy-mm-dd",
			startDate : '-1y',
			autoclose : true,
			templates : {
				leftArrow : '&laquo;',
				rightArrow : '&raquo'
			},
			title : "날짜선택",
			language : "ko"
		}).on(
				"changeDate",
				function(e) {
					let rest_hairdate = $("#datePicker").val();
					let des_num = $("#des_num").val();
					 $.ajax({	
						url : "/admin/reservation/dateList.do",
						type : "post",
						data : { "rest_hairdate" : rest_hairdate , "des_num" : des_num},
						success : function(data){
						if(data.length == 0){
							$(".ajaxList").html("");
							$(".ajaxList").html("<tr><td colspan='6' align='center'>금일예약자가 없습니다</td></tr>");
						}else{
							$(".ajaxList").html("");
							let html = "";
							for (let i = 0; i < data.length; i++) {
								let rest_num = data[i].rest_num;
								let m_id = data[i].m_id;
								html += '<tr class="detail"'+'data-num='+rest_num+' data-name='+m_id+'>' + '<td>'
										+ data[i].rest_num + '</td>'
										+ '<td>' + data[i].rest_hairdate +" / "+ data[i].rest_time + '</td>'
										+ '<td>' + data[i].m_gender + '</td>'
										+ '<td>' + data[i].m_id + '</td>'
										+ '<td>' + data[i].m_name + '</td>'
										+ '<td>' + data[i].m_phone + '</td>'+'</tr>';
						}	
							$(".ajaxList").append(html);
							}
						}
					}); //ajax 종료
					
				});
		
		//로우 클릭시 상세보기 팝업 띄우기
		$(document).on("click",".detail",function(event){
			var rest_num = $(this).attr("data-num");
			var m_id = $(this).attr("data-name");
			window.open("/admin/reservation/reservationDetailForm.do?rest_num="
					+rest_num+"&m_id="+m_id, "reservationpop",
					"width=800, height=800, left=600, top=100");
		});
		
		//디자이너 셀렉트박스 바꿀때마다 날짜 초기화
		$("#des_num").change(function(){
			$("#datePicker").val("");		
			$(".ajaxList").html("<tr><td colspan='6' align='center'>날짜를 선택하세요</td></tr>");
		});
	});
	
</script>
</head>
<body>

<c:if test="${empty login }">
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
			location.href="/admin/adminLoginForm.do";
		</script>
	</c:if>

 <h1>예약 현황</h1>
 <form id="rest_search" name="rest_search">
	<c:choose>
		<c:when test="${not empty desList}">
			<select id="des_num" name="des_num" class="des_num form-control">
				<option value="-1">전체디자이너</option>
				<c:forEach var="des" items="${desList}">
					<option value="${des.des_num}">${des.des_name}</option>
				</c:forEach>
			</select>
		</c:when>
	</c:choose> 
 <input type="text" id="datePicker" class="form-control" value="">
 <p style="margin-top: 10px;"><span style="color: red;">*</span>&nbsp;클릭하여 상세보기</p>
 	<table class="table table-hover">
 		<colgroup>
 			<col width="15%">
 			<col width="15%">
 			<col width="15%">
 			<col width="15%">
 			<col width="20%">
 			<col width="20%">
 		</colgroup>
 		<thead>
 			<tr>
 				<th>예약 번호</th>
 				<th>방문 시간</th>
 				<th>성별</th>
 				<th>아이디</th>
 				<th>회원 이름</th>
 				<th>전화번호</th>
 			</tr>
 		</thead>
 		<tbody class="ajaxList">
 			<c:choose>
 				<c:when test="${not empty restList}">
 					<c:forEach var="res" items="${restList}">
 						<tr data-num="${res.rest_num}" data-name="${res.m_id}" class="detail">
 							<td>${res.rest_num}</td>
 							<td>${res.rest_hairdate} / ${res.rest_time}</td>
 							<td>${res.m_gender }</td>
 							<td>${res.m_id}</td>
 							<td>${res.m_name }</td>
 							<td>${res.m_phone}</td>
 					</c:forEach>
 				</c:when>
 				<c:otherwise>
 					<tr>
 						<td colspan="7" align="center">금일 예약자가 없습니다</td>
 					</tr>
 				</c:otherwise>
 			</c:choose>
 		</tbody>
 	</table>
 </form>
</body>
</html>