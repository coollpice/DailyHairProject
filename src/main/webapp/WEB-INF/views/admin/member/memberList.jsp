<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style type="text/css">
span {
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
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
	
<script type="text/javascript">

	$(function() {
		
		$("#hidden").hide();
		
		//아이디 클릭시 상세보기 팝업창을 띄운다
		$(".detail").click(
				function() {
					var m_id = $(this).parents("tr").attr("data-num");
					window.open("/admin/member/memberDetailForm.do?m_id="
							+ m_id, "memberpop",
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
		
		//클릭할떄마다 정렬
		$(".order").click(function(){
			var order_by = $(this).attr("data-value");
			$("#order_by").val(order_by);
			
			if($("#order_sc").val()=="DESC"){
				$("#order_sc").val("ASC");
			}else{
				$("#order_sc").val("DESC");
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
			"action" : "/admin/member/memberList.do"
		});
		$("#f_search").submit();
	}
	
	function chkSubmit(item, msg) {
		if(item.val().replace(/\s/g,"")=="") {
			alert(msg+" 입력해 주세요.");
			item.val("");
			item.focus();
			return false;
		} else {
			return true;
		}
	}

</script>
</head>
<body>
	<h1>회원목록</h1>
	<form id="detailForm" name="detailForm">
		<input type="hidden" name="m_num" id="m_num" />
	</form>
	<p>
		<span>*</span>아이디를 클릭하면 상세보기
	</p>
	<div class="memberListContainer">
	<table class="table table-hover">
		<colgroup>
			<col width="15%">
			<col width="10%">
			<col width="10%">
			<col width="5%">
			<col width="15%">
			<col width="15%">
			<col width="20%">
			<col width="10%">
		</colgroup>
		<thead>
			<tr>
				<td align="center" data-value="m_num" class="order"><strong>회원번호</strong>
					<c:choose>
						<c:when test="${data.order_by == 'm_num' and data.order_sc == 'ASC'}">▲</c:when>
						<c:when test="${data.order_by == 'm_num' and data.order_sc == 'DESC'}">▼</c:when>
						<c:otherwise>▲</c:otherwise>
					</c:choose>
				</td>
				<td align="center"><strong>아이디</strong></td>
				<td align="center"><strong>이름</strong></td>
				<td align="center"><strong>성별</strong></td>
				<td align="center"><strong>이메일</strong>
				<td align="center"><strong>연락처</strong></td>
				<td align="center" data-value="m_date" class="order"><strong>등록일</strong>
						<c:choose>
						<c:when test="${data.order_by == 'm_date' and data.order_sc == 'ASC'}">▲</c:when>
						<c:when test="${data.order_by == 'm_date' and data.order_sc == 'DESC'}">▼</c:when>
						<c:otherwise>▲</c:otherwise>
					</c:choose></td>
				<td align="center"><strong>상태</strong></td>
			</tr>
		</thead>
		<tbody id="list">
			<c:choose>
				<c:when test="${not empty memberList}">
					<hr>
					<c:forEach var="member" items="${memberList}">
						<tr data-num="${member.m_id}">
							<td align="center">${member.m_num}</td>
							<td align="center" class="detail">${member.m_id}</td>
							<td align="center" class="name">${member.m_name}</td>
							<td align="center">${member.m_gender}</td>
							<td align="center">${member.m_email}</td>
							<td align="center" class="phone">${member.m_phone}</td>
							<td align="center">${member.m_date}</td>
							<c:if test="${member.m_state == 1}">
								<td align="center">활성화</td>
							</c:if>
							<c:if test="${member.m_state == 0}">
								<td align="center">비활성화</td>
							</c:if>
							<c:if test="${member.m_state == 2}">
								<td align="center">메일인증중</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="8" align="center">등록된 회원이 없습니다</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	</div>
	<br>
	<form name="f_search" id="f_search">
	<div class="optionContainer" align="center">
			<input type="hidden" id="page" name="page" value="1"/>
			<input type="hidden" id="order_by" name="order_by" value="${data.order_by}"/>
			<input type="hidden" id="order_sc" name="order_sc" value="${data.order_sc}"/>
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
						<input type="text" id="hidden">
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