<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원안내-대표원장인사말</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
<style>
#content_box {
	float: left;
	width: 1250px;
}
.section {
	padding-top: 30px;
}
.section1 {
	height: 480px;
    margin-left: 5px;
    border-right:  2px solid #ccc;
	padding-right: 30px;
    float: left;
    
}
    .main_img{
        margin-top: 15px;
        width:550px;
        height: 450px;
        object-fit: cover;
    }
.section2{
    margin-top: 30px;
   margin-left: 25px;
    width: 45%;
    float: left;
    font-size: 15px;
    color: #1d1d1d;
    text-align: left;
    font-family: 'Nanum Gothic','Malgun Gothic','맑은 고딕',sans-serif;
    line-height: 1.9;
    letter-spacing: -0.05em;
    
}
.strong_1{
	margin-top: 10px;
	text-align: right;
    font-size: 17px;
}
@font-face {
    font-family: 'KCC-Jeongbeom';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202@1.0/KCC-Jeongbeom.woff') format('woff');
    font-weight: bold;
    font-style: normal;
}
.strong_2 {
	font-size: 30px;
	font-family: 'KCC-Jeongbeom';
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
                    <li><a href="/hospital.kh" class="btn_lnb_dep1" id="point">병원안내</a></li>
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
        				<div class="cate_name">병원안내</div>
    				</div>	
    				<ul class="snb_nav">
                        <li><a href="/director.kh" class="link_sb1" id="point">대표원장인사말</a></li>
                        <li><a href="/route.kh" class="link_sb1">찾아오시는길</a></li>
   					</ul>
			  </div>
				<div id="content_box">
					<div class="notice_page_title">
						<h2 class="tit_page">대표원장인사말</h2>		
					</div>
			<div class="section">
					<div class="section1"><img class="main_img" src="/resources/img/3. 의료진/1. 대표원장/대표원장33.jpg" alt="대표원장"></div>
					<div class="section2">홈페이지를 찾아주신 여러분 안녕하십니까!<br>
			           	HW병원을 믿고 찾아주시는 여러분께 전 직원을 대표하여 감사의 말씀을 올립니다.<br>
			           	HW병원은 1993년 개원이래 의사들의 노력으로 꾸준한 성장을 거듭해왔습니다.<br>
			           	좀 더 세분화되고 개개인에 맞춘 특화된 진료를 시행하여 그 효과를 입증하고 있습니다.<br>
			           	우수하고 경험 많은 의료진들의 신속하고 정확한 진료를 약속합니다.<br>
						명실공히 의료기관 명문의 자리를 굳혀 가고 있는 HW병원은 적극적 선진 의료 도입으로<br>
						의료의 질을 더욱 높이고 세계적인 의료기관으로 거듭남을 위해 힘껏 노력할 것입니다.<br>
						일회적인 치료의 개념보다도 철저한 고객 관리 시스템으로<br>
						모든 환자분들의 건강과 행복을 위해 더욱 정진할 것을 약속드립니다.<br>
						HW병원의 오늘이 직원 여러분과 저희 병원을 신뢰하고 아껴주시는 고객 여러분의 사랑과 관심으로 이루어졌음을 믿사오며,
						앞으로도 고객 한 분 한 분께 질 높은 의료 서비스를 제공하고자 최선을 다할 것을 약속드립니다.<br>
						홈페이지를 방문하시는 모든 분들의 가정에 행복과 기쁨이 충만하시기를 기원합니다.<br>
						<p class="strong_1">HW병원 대표원장&nbsp&nbsp<strong class="strong_2">박 원 장</strong></p>
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