<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료안내-진료과</title>
<link rel="stylesheet"  href="/resources/notice/notice-style1.css">
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
	margin-top: 30px;
	height: 500px;
	
}
	.section1, .section2 {
		float: left;
	}
	.section1 {
		border-right: 1px solid #ccc;
		padding-right: 25px;
		padding-left: 5px;
	}
	 .section2 {
		padding-left: 25px;
	} 

img {
	height: 300px;
	width: 550px;
	object-fit: cover;
}
.rhk{
	margin-bottom: 15px;
	font-size: 30px;
	color:  rgb(14, 74, 129);
}
.img_text {
	padding-top: 10px;
	font-size: 14px;
	line-height: 1.6;
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
                    <li><a href="/res.kh" class="btn_lnb_dep1">진료예약</a></li>
                    <li><a href="/medical.kh" class="btn_lnb_dep1" id="point">진료안내</a></li>
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
        				<div class="cate_name">진료안내</div>
    				</div>	
    				<ul class="snb_nav">
    					<li><a href="/type.kh" class="link_sb1" id="point">진료과</a></li>
    					<li><a href="/doctor.kh" class="link_sb1">의료진</a></li>
   					</ul>
			  </div>
				<div id="content_box">
					<div class="notice_page_title">
						<h2 class="tit_page">진료과</h2>		
					</div>
					<div class="section">
						<div class="section1">
							<div class="rhk">내과</div>
								<img class="main_img" src="/resources/img/내과12.png" alt="내과12">
								<div class="img_text">
									소화기 내과에서는 내과 질환중 가장 많은 빈도를 차지하는 식도, 위, 십이지장,<br>
									대장, 간 등의 장기에 발생하는 각종 질환에 대한 진단과 치료를 시행하고 있습니다.<br>
									위장관, 간장, 췌장, 담도질환의 진단과 치료를 위해 내시경실, 소화관 운동검사실,<br>
									초음파실 등 소화기검사센터를 운영하고 있으며, 특히 내시경실에서는 위암의<br>
									조기진단과 치료는 물론 각종 치료술을 시행하고 있습니다.
							</div>
						</div>
						<div class="section2">
							<div class="rhk">소아과</div>
								<img class="main_img" src="/resources/img/소아과2.PNG" alt="소아과2">
								<div class="img_text">
								15세 이하의 소아청소년에서 발생하는 질환을 대상으로 하는 분야입니다.<br>
								신생아에서부터 청소년에 이르기까지 성장과 발달에 대한 상담뿐만아니라<br>
								이 시기에 발생하는 모든 질병에 대하여 정확한 진단과 최선의 치료를 진행합니다.<br>
								소아 호흡기 알레르기 질환, 설사, 구토 및 소화기 질환, 두통,<br>
								내분비 질환, 소아 피부질환 및 신생아 질환 등에 대해 전문적인 자료를 제공합니다.
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