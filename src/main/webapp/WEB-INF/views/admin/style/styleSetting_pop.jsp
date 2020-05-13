<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시술등록</title>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
//숫자만 입력하게하는 정규식.
function numberChk(input) {
	if($(input).val()!=""){
		var num_regExp = new RegExp("[0-9]$","i");	//only number
		var match = num_regExp.exec($(input).val());
		if(match==null){
			alert("숫자를 입력해주세요");
			$(input).val("");
		}else{
			return true;
		}
	}
} 

//자식팝업창이 닫히는지 1초마다검사하고 닫힐시 콜백함수 실행하는 메소드
var openDialog = function(uri, name, options, closeCallback) {
    var win = window.open(uri, name, options);
    var interval = window.setInterval(function() {
        try {
            if (win == null || win.closed) {
                window.clearInterval(interval);
                closeCallback(win);
            }
        }
        catch (e) {
        }
    }, 1000);
    return win;
};



	$(function() {
		
		//닫기 버튼 클릭시 닫기
		$("#closeBtn").click(function(){
			window.close();	
		});
		
		//등록버튼 클릭시 실행
		$("#insertBtn").click(function() {

			var des_num = $(".num").val();
			var styling_option = $("#styling_option").val();
			var styling_name = $("#styling_name").val();
			var styling_price = $("#styling_price").val();

			if (!chkSubmit($("#styling_name"), "시술명을")) {
				return;
			}else if($(".num").val()== '#'){ 
				alert("디자이너를 선택하세요");
				return;
			}else if (!chkSubmit($("#styling_price"), "시술가격을")) {
				return;
			} else if (!numberChk($("#styling_price"))) {
				return;
			} else {
				if (confirm("등록하시겠습니까?")) {
					$.ajax({
						url : "/admin/style/insertStyling.do",
						type : "post",
						data : {
							"des_num" : des_num,
							"styling_option" : styling_option,
							"styling_name" : styling_name,
							"styling_price" : styling_price
						},
						success : function(data) {
							if (data == 1) {
								alert("시술 등록에 성공하였습니다.");
								$("#styling_name").val("");
								$("#styling_price").val("");
							
							//성공시 적용된 화면을 보여주기위해 비동기로 적용된 리스트 출력하기
							$.ajax({
							url : "/admin/style/styleAjax.do",
							type : "post",
							data : {
								"des_num" : des_num
							},
							
							success : function(data){
							$(".ajax").html("");
							let html = "";
							if(data.length == 0){
								html += '<tr>'+'<td>'+'등록된 시술이 없습니다'+'</td>'+'</tr>'
							}else{
							for(let i =0; i<data.length; i++){
								html += '<tr class='+'tac data-num='+data[i].styling_num+'>'
								+'<th style="vertical-align : middle;">' + '시술구분 :'+ '</th>'
								+'<td> <label style="margin-top : 6px; color : gray;">'+data[i].styling_option+'</label>'
								+'<th style="vertical-align : middle;">' + '시술명 :' + '</th>'
								+'<td> <label style="margin-top : 6px; color : gray;">'+ data[i].styling_name +'</label>'+'</td>'
								+'<th style="vertical-align : middle;">' + '시술가격 :' + '</th>'
								+'<td> <label style="margin-top : 6px; color : gray;">'+  data[i].styling_price +'원</label>'+'</td>'
								+'<td> <input type='+'"button"'+'name="updateBtn" id="updateBtn" value="수정" class="updateBtn" style="background-color: white; border: 1px solid gray; padding: 5px; border-radius: 5px;">'+'</td>'
								+'<td> <input type='+'"button"'+'name="deleteBtn" id="deleteBtn" value="삭제" class="deleteBtn" style="background-color: white; border: 1px solid gray; padding: 5px; border-radius: 5px;">'+'</td>'
								+'</tr>'
								} 
							}
							$(".ajax").append(html);
							}
						}); //ajax 끝
							} else {
								alert("시술 등록에 실패하였습니다.");
							}
						}
					});// ajax종료												
				}
			}
		});
		
		//디자이너 선택시마다 선택된 디자이너의 시술목록을 불러옴
		$(".num").change(
				function() {
						var des_num = $(".num").val();
						
						$.ajax({
							url : "/admin/style/styleAjax.do",
							type : "post",
							data : {
								"des_num" : des_num
							},
							success : function(data){
							$(".ajax").html("");
							let html = "";
							if(data.length == 0){
								html += '<tr>'+'<td>'+'등록된 시술이 없습니다'+'</td>'+'</tr>'
							}else{
							for(let i =0; i<data.length; i++){
								html += '<tr class='+'tac data-num='+data[i].styling_num+'>'
								+'<th style="vertical-align : middle;">' + '시술구분 :'+ '</th>'
								+'<td> <label style="margin-top : 6px; color : gray;">'+data[i].styling_option+'</label>'
								+'<th style="vertical-align : middle;">' + '시술명 :' + '</th>'
								+'<td> <label style="margin-top : 6px; color : gray;">'+ data[i].styling_name +'</label>'+'</td>'
								+'<th style="vertical-align : middle;">' + '시술가격 :' + '</th>'
								+'<td> <label style="margin-top : 6px; color : gray;">'+  data[i].styling_price +'원</label>'+'</td>'
								+'<td> <input type='+'"button"'+'name="updateBtn" id="updateBtn" value="수정" class="updateBtn" style="background-color: white; border: 1px solid gray; padding: 5px; border-radius: 5px;">'+'</td>'
								+'<td> <input type='+'"button"'+'name="deleteBtn" id="deleteBtn" value="삭제" class="deleteBtn" style="background-color: white; border: 1px solid gray; padding: 5px; border-radius: 5px;">'+'</td>'
								+'</tr>'
								} 
							}
							$(".ajax").append(html);
							}
						}); //ajax 끝
				});
		
		//수정버튼 클릭시 팝업창띄움
		$(document).on("click",".updateBtn",function(event){
			var styling_num = $(this).parents("tr").attr("data-num");
			alert(styling_num);
			
			//자식 팝업창이 닫히면 콜백함수실행됨
			openDialog("/admin/style/styleUpdateForm.do?styling_num="+styling_num, "pop1", "width=900, height=350, left=600, top=200",function(win){
				
				var des_num = $(".num").val();
				
				//동적으로  시술 리스트를 출력함
				$.ajax({
					url : "/admin/style/styleAjax.do",
					type : "post",
					data : {
						"des_num" : des_num
					},
					success : function(data){
					$(".ajax").html("");
					let html = "";
					if(data.length == 0){
						html += '<tr>'+'<td>'+'등록된 시술이 없습니다'+'</td>'+'</tr>'
					}else{
					for(let i =0; i<data.length; i++){
						html += '<tr class='+'tac data-num='+data[i].styling_num+'>'
						+'<th style="vertical-align : middle;">' + '시술구분 :'+ '</th>'
						+'<td> <label style="margin-top : 6px; color : gray;">'+data[i].styling_option+'</label>'
						+'<th style="vertical-align : middle;">' + '시술명 :' + '</th>'
						+'<td> <label style="margin-top : 6px; color : gray;">'+ data[i].styling_name +'</label>'+'</td>'
						+'<th style="vertical-align : middle;">' + '시술가격 :' + '</th>'
						+'<td> <label style="margin-top : 6px; color : gray;">'+  data[i].styling_price +'원</label>'+'</td>'
						+'<td> <input type='+'"button"'+'name="updateBtn" id="updateBtn" value="수정" class="updateBtn" style="background-color: white; border: 1px solid gray; padding: 5px; border-radius: 5px;">'+'</td>'
						+'<td> <input type='+'"button"'+'name="deleteBtn" id="deleteBtn" value="삭제" class="deleteBtn" style="background-color: white; border: 1px solid gray; padding: 5px; border-radius: 5px;">'+'</td>'
						+'</tr>'
						} 
					}
					$(".ajax").append(html);
					}
				}); //ajax 끝
				
			});
			
		});
		
		//삭제 버튼 클릭시 실행 deleteBtn
			$(document).on("click",".deleteBtn",function(event){
			var styling_num = $(this).parents("tr").attr("data-num");
			var des_num = $(".num").val();
			
			if(confirm("삭제하시겠습니까?")){
			
			$.ajax({
				url : "/admin/style/deleteStyling.do",
				type : "post",
				data : {
					"styling_num" : styling_num
				},
				success : function(data){
					if (data == 1) {
							//성공시 적용된 화면을 보여주기위해 비동기로 적용된 리스트 출력하기
							$.ajax({
								url : "/admin/style/styleAjax.do",
								type : "post",
								data : {
									"des_num" : des_num
								},
								success : function(data){
									alert("삭제되었습니다");
								$(".ajax").html("");
								let html = "";
								if(data.length == 0){
									html += '<tr>'+'<td>'+'등록된 시술이 없습니다'+'</td>'+'</tr>'
								}else{
								for(let i =0; i<data.length; i++){
									html += '<tr class='+'tac data-num='+data[i].styling_num+'>'
									+'<th style="vertical-align : middle;">' + '시술구분 :'+ '</th>'
									+'<td> <label style="margin-top : 6px; color : gray;">'+data[i].styling_option+'</label>'
									+'<th style="vertical-align : middle;">' + '시술명 :' + '</th>'
									+'<td> <label style="margin-top : 6px; color : gray;">'+ data[i].styling_name +'</label>'+'</td>'
									+'<th style="vertical-align : middle;">' + '시술가격 :' + '</th>'
									+'<td> <label style="margin-top : 6px; color : gray;">'+  data[i].styling_price +'원</label>'+'</td>'
									+'<td> <input type='+'"button"'+'name="updateBtn" id="updateBtn" value="수정" class="updateBtn" style="background-color: white; border: 1px solid gray; padding: 5px; border-radius: 5px;">'+'</td>'
									+'<td> <input type='+'"button"'+'name="deleteBtn" id="deleteBtn" value="삭제" class="deleteBtn" style="background-color: white; border: 1px solid gray; padding: 5px; border-radius: 5px;">'+'</td>'
									+'</tr>'
									} 
 								}
								$(".ajax").append(html);
								}
							}); //ajax 끝
							
					} else {
						alert("예약중인 시술은 삭제할 수 없습니다.");
					}
				}
			}); // ajax종료
			
			}
			
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
.insertContainer{
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
.num{
width : 150px;
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


	<h1 align="center">시술 관리</h1>
	<div class="infoContainer">
		<form id="insertStyle" name="insertStyle">
				<h4 align="center" class="tc">시술 추가</h4>
				<c:choose>
					<c:when test="${not empty desList}">
						<select id="des_num" name="des_num" class="num form-control" style="margin-left: 20px;">
								<option value="#">디자이너선택</option>
							<c:forEach var="des" items="${desList}">
								<option value="${des.des_num}">${des.des_name}</option>
							</c:forEach>
						</select>
					</c:when>
					<c:otherwise>
						<p>등록된 디자이너가없습니다</p>
					</c:otherwise>
				</c:choose>

				<table class="table" style="margin-top: 10px;">
					<tr>
						<th style="vertical-align: middle;  border-top: 0px; padding: 15px;"><span>&nbsp;*</span>시술구분</th>
						<td  style="border-top: 0px;">
						<select id="styling_option" name="styling_option" class="form-control">
								<option value="기본시술">기본시술</option>
								<option value="펌시술">펌 시술</option>
								<option value="기타1시술">기타 1시술</option>
								<option value="기타2시술">기타 2시술</option>
						</select></td>
						<th style="vertical-align: middle; border-top: 0px;"><span>&nbsp;*</span>시술명</th>
						<td style="border-top: 0px;"><input type="text" name="styling_name" id="styling_name"/></td>
						<th style="vertical-align: middle;  border-top: 0px;" ><span>&nbsp;*</span>시술가격</th>
						<td style="border-top: 0px;"><input type="text" name="styling_price"
							id="styling_price" /></td>
						<td style="border-top: 0px; "><input type="button" name="insertBtn" id="insertBtn"
							value="등록" class="btn" style="background-color: white; border: 1px solid gray; padding: 5px; "/></td>
					</tr>
				</table>
		</form>
	</div>
	<div class="infoContainer">
		<form id="updateStyle" name="updateStyle">
				<h4 align="center" class="tc">시술 목록</h4>
				<table class="table">
					<tbody class="ajax">
						<tr>
							<td>디자이너를 선택하세요</td>
						</tr>
					</tbody>
				</table>
		</form>
	</div>
	<div class="btnContainer" style="position: absolute; right: 10px;">
		<input type="button" name="closeBtn" id="closeBtn" value="닫기" class="btn" style="background-color: white; border: 1px solid gray; margin-right: 10px; height: 30px;"/>
	</div>
</body>
</html>