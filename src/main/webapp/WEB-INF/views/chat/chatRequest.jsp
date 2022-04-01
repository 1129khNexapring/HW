<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
<title>Insert title here</title>
<style>
#content_box {
	float: left;
	width: 1100px;
}

#content_box .chat_page_title {
	position: relative;
	padding: 10px 0;
	border-bottom: 1px solid #ccc;
}

.section {
	margin-top: 50px;
}

.bbs {
	position: relative;
	margin-bottom: 40px;
}

a {
	color: black;
	cursor: pointer;
	text-decoration: none;
}

.info_msg1 {
	padding-top: 5px;
	width: 400px;
	border: 3px solid rgb(14, 74, 129);
	text-align: center;
}

.info_msg2 {
	margin-top: 15px;
	padding-top: 5px;
	width: 400px;
	border: 3px solid rgb(14, 74, 129);
	text-align: center;
}

.material-icons {
	margin-top: 5px;
	font-size: 30px;
}

.m2 {
	
}

.pro {
	margin-top: 30px;
}

#phone {
	font-size: 45px;
	margin-top: 40px;
	margin-bottom: 80px;
}

.bottom1 {
	width: 5%;
	float: left;
}

.bottom2 {
	margin-top: 45px;
	width: 10%;
	float: left;
}

.bottom3 {
	width: 5%;
	float: left;
}

.bottom4 {
	margin-top: 45px;
	width: 15%;
	float: left;
}

.bottom5 {
	margin-top: 40px;
	width: 60%;
	float: left;
}

.bottom5 .chatBtn {
	width: 100px;
	height: 50px;
	background: rgb(14, 74, 129);
	color: white;
	cursor: pointer;
	border: none;
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
					<a href="/login.kh" class="btn_gnb_login"> <span
						class="material-icons"> lock </span> 로그인
					</a>
				</c:if>
				<c:if test="${loginUser ne null}">
					<a href="/logout.kh" class="btn_gnb_logout"> <span
						class="material-icons"> lock_open </span> 로그아웃
					</a>
				</c:if>
				<c:if test="${loginDt ne null }">
					<a href="/logout.kh" class="btn_gnb_logout"> <span
						class="material-icons"> lock_open </span> 로그아웃
					</a>
				</c:if>
				<c:if test="${loginAdmin ne null}">
					<a href="/logout.kh" class="btn_gnb_logout"> <span
						class="material-icons"> admin_panel_settings </span> 관리자
					</a>
				</c:if>
				<a href="/join.kh" class="btn_gnb_join"> <i class="fas fa-plus"></i>
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
						<div class="cate_name">실시간 상담</div>
					</div>
					<ul class="snb_nav">
						<li><a href="/chat/req.kh" class="link_sb1" id="point">채팅
								상담 요청</a></li>

					</ul>
				</div>

				<div id="content_box">
					<div class="chat_page_title">
						<h2 class="tit_page">채팅 상담 요청</h2>

					</div>
					<div class="section">
						<div class="bbs">
							<span class="material-icons">list_alt <span class="m1">채팅
									상담 요청</span></span> <br>
							<br> <span class="m2">회원/비회원 관계 없이 실시간으로 문의사항을 해결할 수
								있습니다.<br> 궁금한 내용이 있으시면 채팅을 남겨주세요.
							</span>


							<div>
								<img src="/resources/img/profile2.PNG" alt="프로필 이미지" class="pro"><br>
								<br>
								<div class="info_msg1">
									안녕하세요.HW병원입니다.<br> 채팅 내용은 상당 품질 관리를 위해 일정 기간<br> 저장됨을
									알려드립니다.<br> 상담을 시작하려면 우측 하단에 상담요청 <br> 버튼을 눌러주세요. <br>
									채팅을 원치 않으시면 "종료"를 입력해 주세요.<br>
								</div>
								<div class="info_msg2">
									예약부터 간단한 상담까지 빠르고 편리하게 <br> 실시간으로 1:1 채팅 상담을 받아보세요.<br>
									채팅 상담 이용 가능 시간<br> 08시 30분 ~ 17시 30분(점심시간 13시 ~ 14시)<br>
									상담 대기 시간은 20분 내외이며, <br> 이용 가능 시간 외 시간의 문의는 상담 시간<br>
									내 순차적으로 답변 드립니다. 감사합니다.
								</div>
							</div>
							<div class="bottom1">
								<i class="fas fa-phone-alt fa-4x" id="phone"></i>

							</div>
							<div class="bottom2">
								<div>
									문의전화<br>1588-1588
								</div>
							</div>
							<div class="bottom3">
								<i class="fas fa-phone-alt fa-4x" id="phone"></i>
							</div>
							<div class="bottom4">
								<div>
									질병관리청<br>1588-1588
								</div>
							</div>
							<div class="bottom5">
								<button type="button" class="chatBtn"
									onClick="location.href='/chat/write.kh'">상담요청</button>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<footer>
		<div class="footer_tit">서울특별시 중구 남대문로 120 대일빌딩 2F, 3F (T:
			1544-9970) / F: 02-722-0858)</div>
		<div id="footer_bottom">Copyright ⓒ 1988-2022 HW Hospital All
			Right Reserved</div>
	</footer>
</body>
</html>