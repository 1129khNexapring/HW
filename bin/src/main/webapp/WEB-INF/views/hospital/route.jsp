<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원안내-찾아오시는길</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=7fvgxnrd59"></script>
 <style>
	#container {
		margin-bottom: 30px;
	}
	.section {
		padding-top: 30px;
	}
	.img1 {
		margin-bottom: 30px;
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
        				<div class="cate_name">병원안내</div>
    				</div>	
    				<ul class="snb_nav">
    					<li><a href="/director.kh" class="link_sb1">대표원장인사말</a></li>
                        <li><a href="/route.kh" class="link_sb1" id="point">찾아오시는길</a></li>
    				</ul>
			  </div>
				<div id="content_box">
					<div class="notice_page_title">
						<h2 class="tit_page">찾아오시는길</h2>		
					</div>
					<div class="section">
						 <div id="map" style="width:100%;height:35vh;margin:0 auto;"></div>
						<!-- <img src="/resources/img/찾아오시는길1.PNG" alt="찾아오시는길1" class="img1">-->
						<img src="/resources/img/찾아오시는길2.PNG" alt="찾아오시는길2"> 
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div class="footer_tit">서울특별시 중구 남대문로 120 대일빌딩 2F, 3F (T: 1544-9970) / F: 02-722-0858)</div>
		<div id="footer_bottom">Copyright ⓒ 1988-2022 HW Hospital All Right Reserved</div>
	</footer>
	
	
<script>
var HOME_PATH = window.HOME_PATH || '.';


map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.56810, 126.98336),
    zoom: 17
});


var hwhospital = new naver.maps.LatLng(37.56810, 126.98336);



var markers = [];
var infowindows = [];


markers.push(new naver.maps.Marker({
    map: map,
    position: hwhospital
}));

infowindows.push(new naver.maps.InfoWindow({
    content: [
        '<div class="iw_inner">',
        '   <h3>HW병원</h3>',
        '</div>'
    ].join('')
}));

for(let i=0; i<markers.length; i++){
    naver.maps.Event.addListener(markers[i], "click", function(e) {
        if (infowindows[i].getMap()) {
            infowindows[i].close();
        } else {
            infowindows[i].open(map, markers[i]);
        }
    });
}

infowindows[0].open(map, markers[0]);
</script>
	
</body>
</html>