<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<div class="dropdown">
 <ul class="nav nav-sidebar dropdown">
            <li class="active"><a href="/admin/reservation/adminReservationList.do">메인 페이지<span class="sr-only">(current)</span></a></li>
            <li><a href="/admin/member/memberList.do" style="color: black;">회원 관리</a></li>
            <li><a href="/admin/reservation/adminReservationList.do" style="color: black;">예약 관리</a>
            <ul>
            	<li><a href="/admin/reservation/adminReservationList.do">예약현황</a></li>
            	<li><a href="/admin/reservation/resultReservationList.do">시술완료내역</a></li>
            	<li><a href="/admin/reservation/reservationCancleList.do">예약취소내역</a></li>
            </ul></li>
            <li class="dropdown" ><a href="/admin/qna/qnaList.do" style="color: black;" >고객센터 관리</a>
           		<ul>
            		<li><a href="/admin/qna/qnaList.do">1:1문의 관리</a></li>
            		<li><a href="/admin/adminFaqList.do">FAQ</a></li>
            	</ul>
            	</li>
            <li class="dropdown"><a href="/admin/board/HairStyleList.do" style="color: black;" >갤러리 관리</a>
            	<ul>
            		<li><a href="/admin/board/HairStyleList.do">HairStyle게시판</a></li>
            		<li><a href="/admin/board/HairGoodsList.do">HairGoods게시판</a></li>
            	</ul>
            </li>
            <li><a href="/admin/designer/designerList.do" style="color: black;">매장 관리</a></li>
            <li><a href="/admin/bi/main.do" style="color: black;" >통계</a></li>
          </ul>
          </div>

        