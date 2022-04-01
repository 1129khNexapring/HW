<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료안내-의료진</title>
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
	margin-bottom: 30px;
	height: 660px;
}
.section1 {
	border-right: 1px solid #ccc;
	float: left;
	padding-left: 50px;
	padding-right: 50px;
}
.section2 {
	padding-left: 50px;
	float: left;
}
img {
	object-fit: cover;
	width: 200px;
	height: 250px;
}
		#top-left{
			float: left;
		}
		#top-right{
			float: left;
		}
		#bottom-left{
			float: left;
		}
		#bottom-right{
			float: left;
		}
.rhk{
	font-size: 30px;
	color:  rgb(14, 74, 129);
}
#top-left, #top-right {
	margin-top: 15px;
	margin-bottom: 50px;
}
#top-left, #bottom-left {
	padding-right: 100px;
}
.img_text {
	text-align: center;
}
</style>
</head>
<body>
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
    					<li><a href="/type.kh" class="link_sb1">진료과</a></li>
    					<li><a href="/doctor.kh" class="link_sb1" id="point">의료진</a></li>
   					</ul>
			  	</div>
				<div id="content_box">
					<div class="notice_page_title">
						<h2 class="tit_page">의료진</h2>		
					</div>
					<div class="section">
					<div class="section1"><span class="rhk">내과</span>
						<div id="top-img">
							<div id="top-left"><img class="main_img1" src="/resources/img/3. 의료진/2. 의료진/조정석.jpg" alt="조정석">
							<div class="img_text">조정석 내과원장</div>
							</div>
							<div id="top-right"><img class="main_img1" src="/resources/img/3. 의료진/2. 의료진/유연석4.PNG" alt="유연석">
								<div class="img_text">유연석 진료부장</div>
							</div>
						</div>
						<div id="bottom-img">
							<div id="bottom-left"><img class="main_img1" src="/resources/img/3. 의료진/2. 의료진/전미도.png" alt="전미도">
								<div class="img_text">전미도 과장</div>
							</div>
							<div id="bottom-right"><img class="main_img1" src="/resources/img/3. 의료진/2. 의료진/신현빈1.PNG" alt="신현빈">
								<div class="img_text">신현빈 과장</div>
							</div>
						</div>
					</div>
					<div class="section2"><span class="rhk">소아과</span>
						<div id="top-img">
							<div id="top-left"><img class="main_img" src="/resources/img/3. 의료진/2. 의료진/한석규2.PNG" alt="한석규">
							<div class="img_text">한석규 소아과원장</div>
							</div>
							<div id="top-right"><img class="main_img" src="/resources/img/3. 의료진/2. 의료진/안효섭1.PNG" alt="안효섭">
								<div class="img_text">안효섭 과장</div>
							</div>
						</div>
						<div id="bottom-img">
							<div id="bottom-left"><img class="main_img" src="/resources/img/3. 의료진/2. 의료진/이성경1.PNG" alt="이성경">
								<div class="img_text">이성경 과장</div>
							</div>
							<div id="bottom-right"><img class="main_img" src="/resources/img/3. 의료진/2. 의료진/소주연1.PNG" alt="소주연">
								<div class="img_text">소주연 과장</div>
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