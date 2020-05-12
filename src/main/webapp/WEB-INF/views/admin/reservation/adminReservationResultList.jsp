<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시술 완료 목록</title>
<style type="text/css">
span{
color: red;
}
#search{
width : 130px;
float: left;
margin-right: 5px;
}
#keyword{
width : 200px;
float: left;
margin-right: 5px;
}
</style>
<script type="text/javascript">
 $(function(){
	
	 
	//상세보기 페이지 띄우기
	$(".resultDetail").click(function(){
	 let rest_num =	$(this).attr("data-num");
	 let m_id = $(this).attr("data-name");
	 window.open("/admin/reservation/resultReservationDetail.do?rest_num="
				+ rest_num+"&m_id="+m_id,"resultDetail",
				"width=800, height=700, left=600, top=100");
	 
	});
	 
	//검색 후 검색 대상과 검색 단어를 출력한다
		var word = "<c:out value='${data.keyword}'/>";
		var value="";
		if(word!=""){
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");
			
			if($("#search").val() =='m_name'){
				value = "#list tr td.name";
			}else if($("#search").val() == 'm_phone'){
				value = "#list tr td.phone";
			}
			
			$(value+":contains('"+word+"')").each(function(){
				var regex = new RegExp(word,'gi');
				$(this).html($(this).text().replace(regex,"<span class='required'>"+word+"</span>"));
			});
		} 	
		 
		//검색 대상이 변경될 때마다 처리 이벤트
		$("#search").change(function(){
			if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		//검색 버튼 클릭 시 처리 이벤트
		$("#searchData").click(function(){
			
			if($("#search").val()!="all"){
				if(!chkSubmit($("#keyword"),"검색어를")) return;				
			}
			goPage(1);
		});
 });
 
	//검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수
	function goPage(page){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/reservation/resultReservationList.do"
		});
		$("#f_search").submit();
	}
</script>
</head>
<body>

<c:if test="${empty login }">
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
			location.href="/admin/adminLoginForm.do";
		</script>
	</c:if>

	<h1>시술완료 목록</h1>
	<p><span>*</span>클릭하여 상세보기</p>
	<div class="resultContainer">
		<table class="table table-hover">
			<colgroup>
				<col width="20%">
				<col width="15%">
				<col width="15%">
				<col width="20%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<th>방문시간</th>
					<th>아이디</th>
					<th>회원이름</th>
					<th>연락처</th>
					<th>디자이너</th>
					<th>시술가격</th>
				</tr>
			</thead>
			<tbody id="list">
				<c:choose>
					<c:when test="${not empty resultList}">
						<c:forEach var="result" items="${resultList}">
							<tr data-num="${result.rest_num}" data-name="${result.m_id}" class="resultDetail">
								<td>${result.rest_hairdate} / ${result.rest_time}</td>
								<td>${result.m_id}</td>
								<td class="name">${result.m_name}</td>
								<td class="phone">${result.m_phone}</td>
								<td>${result.des_name}</td>
								<td>${result.rest_totalprice}원</td>
							</tr>
						</c:forEach>
					</c:when>	
					<c:otherwise>
						<tr>
							<td colspan="7" align="center">완료된 시술이 없습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>	
			</tbody>
		</table>
	</div>
	<form name="f_search" id="f_search">
	<div class="optionContainer" align="center">
			<input type="hidden" id="page" name="page" value="1"/>
				<table>
					<colgroup>
						<col width="70%">
						<col width="30%">
					</colgroup>
					<tr>
					<td><select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="m_name">이름</option>
							<option value="m_phone">휴대폰뒷번호</option>
						</select>
						<input type="text" id="hidden" style="display: none;">
						<input type="text" name="keyword" id="keyword" class="form-control"/>
						<input type="button" id="searchData" value="검색" class="btn"/>
						</td>
					</tr>	
				</table>
				</div>
		</form>
		<div id="boardPage">
			<tag:paging page="${param.page}" total="${total}" list_size="${data.pageSize}"/>
		</div>
</body>
</html>