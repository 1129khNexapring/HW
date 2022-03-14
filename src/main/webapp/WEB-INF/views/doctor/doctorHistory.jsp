<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
<link rel="stylesheet" href="/resources/notice/notice-admin-list.css">
<title>진료 이력</title>
<style>
        a {
		    color: black;
		    cursor: pointer;
		    text-decoration: none;
		}
		#c1 {
			width: 50px;
		}
		#c2 {
			width: 100px;
		}
		#c3 {
			width: 100px;
		}
		#c4 {
			width: 250px;
		}
		#c5 {
			width: 250px;
		}
		#c6 {
			width: 100px;
		}
</style>
</head>
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
                    <a href="../main.kh">HW병원</a></h1>
                <ul class="lnb_nav_dep1">
                    <li><a href="/res.kh" class="btn_lnb_dep1">진료예약</a></li>
                   	<li><a href="/medical.kh" class="btn_lnb_dep1">진료안내</a></li>
                   	<li><a href="/hospital.kh" class="btn_lnb_dep1">병원안내</a></li>
                    <li><a href="/notice/list.kh" class="btn_lnb_dep1">고객센터</a></li>
                    <c:if test="${not empty sessionScope.loginUser}">
                        <li><a href="/member/myInfo.kh" class="btn_lnb_dep1">마이페이지</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.loginDt}">
                        <li><a href="/doctor/myInfo.kh" class="btn_lnb_dep1" id="point">마이페이지</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.loginAdmin}">
                        <li><a href="/admin/resList.kh" class="btn_lnb_dep1">관리자페이지</a></li>
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
        				<div class="cate_name">진료 이력</div>
    				</div>	
    				<ul class="snb_nav">
    					<li><a href="/doctor/history.kh" class="link_sb1" id="point">진료 이력</a></li>
    					<li><a href="/doctor/myInfo.kh" class="link_sb1">회원정보수정</a></li>
    					<li><a href="/doctor/delete.kh" class="link_sb1">회원 탈퇴</a></li>
    				</ul>
			  </div>
			 <div id="content_box">
				<div class="notice_page_title">
					<h2 class="tit_page">진료 이력</h2>		
				</div>
				<div class="section">
				<div class="bbs">	
					<table>
						<thead>
							<tr>
								<th>예약번호</th>
								<th>진료일</th>
								<th>환자명</th>
								<th>진료 내용</th>
								<th>약 처방 내용</th>
								<th>청구 금액(원)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${hList}" var="history">
								<tr class="space">
									<c:url var="hDetail" value="/history/oneView.kh">
										<c:param name="resNo" value="${history.resNo}"></c:param>
									</c:url>
									<td class="ta" id="c1"><a href="${hDetail}">${history.resNo}</a></td>
									<td class="ta" id="c2">${history.deptDate}</td>
									<td class="ta" id="c3">${history.resName}</td>
									<td class="ta" id="c4" style="white-space:pre;">${history.deptContents}</td>
									<td class="ta" id="c5" style="white-space:pre;">${history.prescription}</td>
									<td class="ta" id="c6">${history.charge}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="register_btn">
						<a href="/doctor/historyWriteView.kh" id="register_l">이력 등록</a>
					</div>
					<div class="paging">

								<c:if test="${pi.startNavi ==1 }">

									<a href="/doctor/history.kh?page=1"> <i
										class="fas fa-angle-left">
											<button class="on">
									</i>
									</button></a>

								</c:if>
								<c:if test="${pi.prev}">

									<a href="/doctor/history.kh?page=${pi.startNavi-1}"> <i
										class="fas fa-angle-left">
											<button class="on">
									</i>
									</button>
									</a>
								</c:if>

								<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
									<c:url var="pagination" value="/doctor/history.kh">
										<c:param name="page" value="${p }"></c:param>
									</c:url>

									<a href="${pagination }"><button class="on1">${p }</button></a>&nbsp;
																		
									</c:forEach>


								<c:if test="${pi.next && pi.endNavi > 0}">

									<a href=/doctor/history.kh?page=${pi.endNavi+1}"> <i
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