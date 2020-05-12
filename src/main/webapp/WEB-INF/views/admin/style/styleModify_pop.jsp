<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시술수정</title>
<style type="text/css">
span {
	color: red;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">


	$(function(){
		
		
		//닫기버튼 클릭시 닫기
		$("#closeBtn").click(function(){
			window.close();
		});
		
		//수정버튼 클릭시 실행
		$("#updateBtn").click(function(){
			
			var styling_num = $("#styling_num").val();
			var styling_option = $("#styling_option").val();
			var styling_name = $("#styling_name").val();
			var styling_price = $("#styling_price").val();
			
			if (!chkSubmit($("#styling_name"), "시술명을")) {
				return;
			}else if(styling_option == '#'){ 
				alert(" 시술구분을 선택하세요");
				return;
			}else if (!chkSubmit($("#styling_price"), "시술가격을")) {
				return;
			} else if (!numberChk($("#styling_price"))) {
				return;
			} else {
				if (confirm("수정하시겠습니까?")) {
					$.ajax({
						url : "/admin/style/updateStyling.do",
						type : "post",
						data : {
							"styling_num" : styling_num,
							"styling_option" : styling_option,
							"styling_name" : styling_name,
							"styling_price" : styling_price
						},
						success : function(data) {
							if (data == 1) {
								alert("시술 수정에 성공하였습니다.");
								window.close();
							} else {
								alert("시술 수정에 실패하였습니다.");
							}
						}
					});
				}
			}
		});
	});
</script>
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
vertical-align: middle;
}
thead tr th,td{
text-align: center;
vertical-align: middle;
}
.tc{
color: gray;
}
span {
	color: red;
}
input[type=text]{
border-radius: 3px;
margin-top: 5px;
}
</style>
</head>
<body>


<h1 align="center">시술정보 수정</h1>
	<form id="updateForm" name="updateForm">	
		<input type="hidden" name="styling_num" id="styling_num" value="${style.styling_num }"/>
		<div class="infoContainer">
		<h4 align="center" class="tc">시술 수정</h4>
		<table class="table" style="margin-top: 10px;">
			<tr>
				<th style="vertical-align: middle;  border-top: 0px; padding: 15px;"><span>&nbsp;*</span>시술구분</th>
				<td style="border-top: 0px;">
				<select id="styling_option" name="styling_option" class="form-control">
						<option value="${style.styling_option}">${style.styling_option}</option>
						<option value="#">----------------</option>
						<option value="기본시술">기본시술</option>
						<option value="펌시술">펌 시술</option>
						<option value="기타1시술">기타1시술</option>
						<option value="기타2시술">기타2시술</option>
					</select></td>
				
				<th style="vertical-align: middle; border-top: 0px;"><span>&nbsp;*</span>시술명</th>
						<td style="border-top: 0px;"><input type="text" name="styling_name" id="styling_name" value="${style.styling_name}"/></td>
						<th style="vertical-align: middle;  border-top: 0px;" ><span>&nbsp;*</span>시술가격</th>
						<td style="border-top: 0px;"><input type="text" name="styling_price"
							id="styling_price"  value="${style.styling_price}" /></td>
				<td style="border-top: 0px; "><input type="button" name="updateBtn" id="updateBtn" value="수정" class="btn" style="background-color: white; border: 1px solid gray; padding: 5px; "/></td>
		</table>
		<div class="btnContainer"  style = "position: absolute; right: 20px; margin-top: 10px;">
	 	<input type="button" name="closeBtn" id="closeBtn" value="닫기" style="background-color: white; border: 1px solid gray; padding: 5px;" class="btn"/>
		</div>
		</div>
	</form>
</body>
</html>