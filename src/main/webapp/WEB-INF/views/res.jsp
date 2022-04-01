<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료예약_선택페이지</title>
<link rel="stylesheet"  href="/resources/notice/notice-style1.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
 <style>
.section1 {
    margin-left: 50px;
    width: 100%;
    height: 140px;
}
.section2 {
    margin-left: 50px;
    width: 100%;
    height: 60px;
}
.section3{
    margin-left: 50px;
    width: 100%;
    height: 190px;
}
.text_title{
	margin-top: 30px;
    margin-bottom: 15px;
	font-size: 30px;
	color:  rgb(14, 74, 129);
}
.text_title2{
    margin-top: 20px;
}
.text_1{
    margin-top: 10px;
}
.dPdir{
    width: 100%;
    height: 160px;
}
.area {
	text-align: center;
	padding-right: 50px;
	float: left;
}
.icon-area, .btn-area {
}

#icon{
    font-size: 130px;
    color: rgb(40, 40, 40);
}
.btn{
    height: 40px;
    width: 170px;
    border-radius: 3px;
    padding: 5px;
    border: 0px;
    font-size: 15px;
    color: #fff;
    cursor: pointer;
    background-color: rgb(14, 74, 129);
    margin-bottom: 50px;
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
                    <a href="main.kh">HW병원</a>
                </h1>
                <ul class="lnb_nav_dep1">
                    <li><a href="/res.kh" class="btn_lnb_dep1" id="point">진료예약</a></li>
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
                    	<li><a href="/notice/adList.kh" class="btn_lnb_dep1">관리자페이지</a></li>
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
        				<div class="cate_name">진료예약</div>
    				</div>
    				<ul class="snb_nav">
    					<li><a href="/res/JoinView.kh" class="link_sb1">일반 예약</a></li>
    					<li><a href="/reservation/JoinView.kh" class="link_sb1">동행서비스 예약</a></li>
    					<c:if test="${empty sessionScope }">
                        	<li><a href="/res/type.kh" class="link_sb1">일반 예약 확인</a></li>
                        </c:if>
                        <c:if test="${not empty sessionScope }">
                        	<li><a href="/reservationView.kh" class="link_sb1">일반 예약 확인</a></li>
                        </c:if>
                        <c:if test="${empty sessionScope }">
                        	<li><a href="/reservation/type.kh" class="link_sb1">동행서비스 예약 확인</a></li>
    					</c:if>
    					<c:if test="${not empty sessionScope }">
    						<li><a href="/withReservationView.kh" class="link_sb1">동행서비스 예약 확인</a></li>
    					</c:if>
    					</ul>
			  </div>
				<div id="content_box">
					<div class="notice_page_title">
						<h2 class="tit_page">진료예약</h2>		
					</div>
					<div class="section1">
                        <div class="text_title">외래접수/ 수납 및 진료시간</div>
                        <div class="text_title2"><strong>(1)평일</strong></div>
                        <div class="text_1">접수 : 08시 30분 ~ 17시 30분</div>
                        <div class="text_1">진료 : 08시 30분 ~ 17시 30분(점심시간:13시 ~ 14시)</div>
                    </div>
					<div class="section2">
                        <div class="text_title2"><strong>(2)토요일</strong></div>
                        <div class="text_1">진료 : 08시 30분 ~ 12시 30분</div>
                    </div>
                    <div class="section3">
                        <div class="text_title">간편예약</div>
                        <div class="dPdir">
	                        <div class="area">
		                        <div class="icon-area"> 
		                            <span class="material-icons" id="icon">
		                             wysiwyg
		                             </span></div>
		                        <div class="btn-area"><button class="btn" onclick="location.href='/res/JoinView.kh'">일반예약</button></div>
	                        </div>
	                        <div class="area">
		                        <div class="icon-area">
		                           <span class="material-icons" id="icon">
		                                directions_car
		                            </span></div> 
		                        <div class="btn-area"><button class="btn" onclick="location.href='/reservation/JoinView.kh'">동행서비스 예약</button></div>
		                        </div>
	                        <div class="area">
		                        <div class="icon-area">    
		                            <span class="material-icons" id="icon">
		                                find_in_page
		                            </span></div>
		                        <div class="btn-area">
		                        	<c:if test="${empty sessionScope }">
		                        		<button class="btn" onclick="location.href='/res/type.kh'">일반 예약 확인</button>
		                        	</c:if>
		                        	<c:if test="${not empty sessionScope }">
		                        		<button class="btn" onclick="location.href='/reservationView.kh'">일반 예약 확인</button>
		                        	</c:if>
	                        	</div> 
	                        </div>
	                        <div class="area">
		                        <div class="icon-area">
		                        	<span class="material-icons" id="icon">
		                                content_paste_search
		                                </span></div>
		                        <div class="btn-area">
		                       		<c:if test="${empty sessionScope }">
		                        		<button class="btn" onclick="location.href='/reservation/type.kh'">동행서비스 예약 확인</button>
	                        		</c:if>
	                        		<c:if test="${not empty sessionScope }">
	                        			<button class="btn" onclick="location.href='/withReservationView.kh'">동행서비스 예약 확인</button>
	                        		</c:if>
	                        	</div>
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