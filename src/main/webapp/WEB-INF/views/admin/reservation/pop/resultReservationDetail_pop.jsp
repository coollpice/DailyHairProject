<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세현황</title>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		//닫기버튼 클릭시 팝업창 닫기
		$("#closeBtn").click(function(){
			window.close();
		});
		
		//수정버튼 클릭시 수정실행
		$("#updateBtn").click(function(){
			let rest_state = $("#rest_state").val();
			let rest_comment = $("#rest_comment").val();
			let rest_num = "${reservation.rest_num}";
			
	 if(confirm("저정하시겠습니까? \n※예약상태를 잘확인해주세요")){
			
		 $.ajax({
				url : "/admin/reservation/updateReservation.do" ,
				type : "post",
				data : {"rest_num" : rest_num , "rest_state" : rest_state, "rest_comment" : rest_comment},
				success : function(data){
					if(data == 1){
						alert("저장되었습니다.");
						opener.parent.location.reload();
						window.close();
					}else{
						alert("저장에 실패하였습니다");
						window.reload(true);
					}
				}
			}); //ajax 종료
		}
	 
		});
		
		
	 	//이전 시술내역 클릭시 상세보기출력
	 	$(".detailStyling").click(function(){
	 		
			var rest_num = $(this).attr("data-num");
			
			 $.ajax({
					url : "/admin/reservation/detailLastReservation.do" ,
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
</head>
<body>
 <h2 align="center">시술내역 상세보기</h2>
 <form name="stateForm" id="stateForm">
 <select id="rest_state" name="rest_state" class="form-control" style="margin-left: 20px;">
 	<option value="${reservation.rest_state}">시술완료</option>
 	<option value="0">예약취소</option>
 	<option value="1">예약중</option>
 </select>
 </form>
 <div class="infoContainer">
 <h4 align="center" style="color: gray;">회원정보</h4>
 <table class="table">
 	<colgroup>
 		<col width="25%">
 		<col width="25%">
 		<col width="25%">
 		<col width="25%">
 	</colgroup>
 	<tbody>
			<tr>
				<th>회원번호</th>
				<td class="tc">${member.m_num}</td>
				<th>휴대폰번호</th>
				<td class="tc">${member.m_phone}</td>
			</tr>
			<tr>
				<th>ID</th>
				<td class="tc">${member.m_id}</td>
				<th>이메일</th>
				<td class="tc">${member.m_email}</td>
			</tr> 		
			<tr>
				<th>이름</th>
				<td class="tc">${member.m_name}</td>
				<th>특이사항</th>
				<td class="tc">${member.m_memo}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td class="tc">${member.m_gender}</td>
				<th>가입 일자</th>
				<td class="tc">${member.m_date}</td>
			</tr>
 	</tbody>
 </table>
  </div>
  <div class="infoContainer">
   <h4 align="center" style="color: gray;">시술내역</h4>
 	<table class="table">
 		<colgroup>
 			<col width="20%">
 			<col width="10%">
 			<col width="25%">
 			<col width="15%">
 			<col width="30%">
 		</colgroup>
 	<thead>
 	<tr>
 		<th>시술 일자</th>
 		<th>디자이너</th>
 		<th>시술명</th>
 		<th>시술 가격</th>
 		<th>회원 요구사항</th>
 	</tr>
 	</thead>
 	<tbody>
 		<tr>
 			<td class="tc">${reservation.rest_hairdate} / ${reservation.rest_time}</td>
 			<td class="tc">${reservation.des_name}</td>
 			<td class="tc">
 			<c:forEach var="name" items="${nameList}">
 				${name.styling_name} <br>
 			</c:forEach>
 			</td>
 			<td class="tc">${reservation.rest_totalprice}원</td>
 			<td class="tc">${reservation.rest_memo}</td>
 		</tr>
 	</tbody>
 	</table>
 	</div>
 	<div class="infoContainer"> 
 	<table>
 		<colgroup>
 			<col width="30%">
 			<col width="70%">
 		<tr>
 			<td><strong>시술 특이사항</strong></td>
 			<td><textarea rows="2" cols="70" name="rest_comment" id="rest_comment" style="margin: 12px 0 10px 0; border-radius: 5px;" readonly="readonly">${reservation.rest_comment}</textarea> </td>
 		</tr>
 	</table>
 	</div>
 	<div class="btnContainer" style="position: absolute; right: 20px;">
 		<input type="button" name="updateBtn" id="updateBtn" value="저장" class="btn" style="background-color: white; border: 1px solid gray; margin-right: 10px;"/>
 		<input type="button" name="closeBtn" id="closeBtn" value="닫기" class="btn" style="background-color: white;  border: 1px solid gray;"/>
 	</div>
</body>
</html>