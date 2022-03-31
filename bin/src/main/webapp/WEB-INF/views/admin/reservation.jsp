<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 예약</title>
<link rel="stylesheet"  href="/resources/Reservation/res-style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
</head>
<style>
.bbs {
	width: 1300px;
}
#resNo {
	width: 90px;
}
#deptDate {
	width: 100px;
}
#deptTime {
	width: 40px;
}
#resName {
	width: 60px;
}
#birth {
	width: 100px;
}
#phone{
	width: 100px;
}
#department{
	width: 60px;
}
#deptStaff{
	width: 60px;
}
</style>
<body>
<div id="header">
        <!-- 로그인, 회원가입 부분 -->
        <!-- gnb = global navigation bar  -->
        <div id="gnb">   
            <div class="inner">
            <c:if test="${empty sessionScope}">
                <a href="/login.kh" class="btn_gnb_login">
                    <span class="material-icons">
                        lock
                    </span>
                    로그인
                </a>
           	</c:if>
            <c:if test="${loginUser ne null}">
                <a href="/logout.kh" class="btn_gnb_logout">
                    <span class="material-icons">
                        lock_open
                    </span>
                    로그아웃
                </a>
           	</c:if>
           	<c:if test="${loginDt ne null }">
                <a href="/logout.kh" class="btn_gnb_logout">
                    <span class="material-icons">
                        lock_open
                    </span>
                    로그아웃
                </a>
               </c:if>
           	<c:if test="${loginAdmin ne null}">
                <a href="/logout.kh" class="btn_gnb_logout">
                    <span class="material-icons">
					admin_panel_settings
					</span>
                   관리자
                </a>
           	</c:if>
                <a href="/join.kh" class="btn_gnb_join">
                    <i class="fas fa-plus"></i>
                    회원가입
                </a>
            </div>
        </div>
        <!-- local navigation bar -->
        <div id="lnb">
            <div class="inner lnb_nav">
                <h1>
                    <a href="../main.kh">HW병원</a>
                </h1>
                <ul class="lnb_nav_dep1">
                    <li><a href="/res.kh" class="btn_lnb_dep1">진료예약</a></li>
                    <li><a href="/medical.kh" class="btn_lnb_dep1">진료안내</a></li>
                    <li><a href="/hospital.kh" class="btn_lnb_dep1">병원안내</a></li>
                    <li><a href="/notice/list.kh" class="btn_lnb_dep1">고객센터</a></li>
                    <c:if test="${not empty sessionScope.loginUser}">
                    	<li><a href="/member/myInfo.kh" class="btn_lnb_dep1">마이페이지</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.loginDt}">
                    	<li><a href="/doctor/myInfo.kh" class="btn_lnb_dep1">마이페이지</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.loginAdmin}">
                    	<li><a href="/admin/resList.kh" class="btn_lnb_dep1" id="point">관리자페이지</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
    <div id="container">
		<div id="content" class="sub">
			<div class="inner2">
				<div id="snb">
					<div class="tit_snb">
        				<div class="cate_name">관리자페이지</div>
    				</div>	
    				<ul class="snb_nav">
    					<li><a href="/admin/resList.kh" class="link_sb1" id="point">일반 예약 관리</a></li>
						<li><a href="/admin/withResList.kh" class="link_sb1">동행서비스 예약 관리</a></li>
						<li><a href="/notice/adlist.kh" class="link_sb1">공지사항 관리</a></li>   
						<li><a href="/qna/adlist.kh" class="link_sb1">문의/건의게시판 관리</a></li>	
    					</ul>
			  </div>
			 <div id="content_box">
				<div class="notice_page_title">
					<h2 class="tit_page">일반 예약 관리</h2>		
				</div>
				<div class="section">
				<div class="bbs">
	<table>
			<thead>
				<tr>
					<th>예약번호</th>
					<th>진료일</th>
					<th>진료시간</th>
					<th>예약자명</th>
					<th>생년월일</th>
					<th>전화번호</th>
					<th>진료과</th>
					<th>의료진</th>
			   </tr>
			</thead>
			<tbody>
			<c:forEach items="${rList}" var="Reservation">
				<tr class="space">
					<td class="ta" id="resNo">${Reservation.resNo }</td>
					<td class="ta" id="deptDate">${Reservation.deptDate }</td>
					<td class="ta" id="deptTime">${Reservation.deptTime }</td>
					<td class="ta" id="resName">${Reservation.resName }</td>
					<td class="ta" id="birth">${Reservation.birth }</td>
					<td class="ta" id="phone">${Reservation.phone }</td>
					<td class="ta" id="department">${Reservation.department }</td>
					<td class="ta" id="deptStaff">${Reservation.deptStaff }</td>
				</tr>
			</c:forEach>
			</tbody>
	</table>
	<div class="paging">
			<c:if test="${pi.startNavi ==1 }">
				<a href="/admin/resList.kh?page=1"> <i
					class="fas fa-angle-left">
						<button class="on">
				</i>
				</button></a>
			</c:if>
			<c:if test="${pi.prev}">

				<a href="/admin/resList.kh?page=${pi.startNavi-1}"> <i
					class="fas fa-angle-left">
						<button class="on">
				</i>
				</button>
				</a>
			</c:if>
			<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
				<c:url var="pagination" value="/admin/resList.kh">
					<c:param name="page" value="${p }"></c:param>
				</c:url>

				<a href="${pagination }"><button class="on1">${p }</button></a>&nbsp;
													
				</c:forEach>


			<c:if test="${pi.next && pi.endNavi > 0}">

				<a href="/admin/resList.kh?page=${pi.endNavi+1}"> <i
					class="fas fa-angle-right">
						<button class="on2">
				</i>
				</button>
				</a>
			</c:if>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
<footer>
	<div class="footer_tit">서울특별시 중구 남대문로 120 대일빌딩 2F, 3F (T: 1544-9970) / F: 02-722-0858)</div>
	<div id="footer_bottom">Copyright ⓒ 1988-2022 HW Hospital All Right Reserved</div>
</footer>
</body>
</html>