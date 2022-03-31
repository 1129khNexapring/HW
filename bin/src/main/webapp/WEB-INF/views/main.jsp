<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/mediaquery.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/256809dc75.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/resources/main.css">
    <link rel="stylesheet" href="/resources/head.css">
    <link rel="stylesheet" href="/resources/footer.css">
    <title>HW병원</title>
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
                    	<li><a href="/admin/resList.kh" class="btn_lnb_dep1">관리자페이지</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>

    <div id="container">
        <div id="content">
            <!-- 메인 이미지 -->
            <div id="main_visual">
                <div class="inner">
                </div>
                <!-- 메인 이미지1 -->
                <div class="visual_bg visual_bg1 active" style="display: block;">
                    <div class="block_visual">
                       
                    </div>
                </div>
            </div>
            <!-- 메인 이미지 끝 -->
            <div class="main_top inner fl_c">
                 <!-- 예약하기 -->
                <div class="main_reservation m_hide col">
					<div class="tit_main">예약하기</div>
					
					<div class="ico_wrap">
                        <!-- 일반예약 -->
                        <div>
                            <div class="margin">
                                <a href="/res/JoinView.kh">
                                <p>일반예약
                                </a>
                            </div>
                        </div>
                        <!-- 동행서비스 예약 -->
						<div>
							<div>
                                <a href="/reservation/JoinView.kh">
                                <p>동행서비스 예약
                                </a>
                            </div>
						</div>
					</div>
					
				</div>
				<!-- 병원안내 -->
                 <div class="main_real_cons col">
                    <div class="tit_main">진료안내</div><br>
                    <div class="txt_main">
                        <span>
                        	진료 전, HW병원 <br>
                       		전문 의료진을 확인하세요.<br>
                        </span>
                    </div>
                    <br>
                    <!-- 의료진 버튼 -->
                    <div class="form_quick_con" style="text-align:center;">
                        <button class="btn1 btn_blue1 mg5" style="width:100%;" onclick="location.href='/doctor.kh'">의료진</button>
                    </div>
                </div>
            <!-- 고객센터 -->
            <div class="main_real_cons2 col">
				<div class="tit_main">병원안내</div><br>
				<div class="txt_main">
					<span>
						방문 전, HW병원<br>
						찾아오시는길을 확인하세요.<br>
					</span> 
				</div>
				<br>
				<!-- 찾아오시는길 버튼 -->
				 <div class="form_quick_con" style="text-align:center;">
					 <button class="btn1 btn_blue2 mg5" style="width:100%;" onclick="location.href='/route.kh'">찾아오시는길</button>
				</div>
					
			</div>
        </div>


            <!-- 게시판(진료시간 안내, 공지사항)-->
            <div class="main_board">
                <div class="tit_main"></div>
                <div class="txt_main m_hide"></div>
                <div class="inner">
                    <ul class="main_bottom">
                        <!-- 진료시간 안내 -->
                        <li class="main_bottom_item col2">
                            <div class="main_treatInfo"style="min-height:300px; box-sizing:border-box;">
                                <div class="tit_treatInfo">
                                    진료시간
                                    <div class="treat_top"><br>
                                        <div class="top_left">
                                            <i class="far fa-clock fa-4x">
                                            </i>
                                        </div>
                                        <div class="top_right">
                                            <div>평&nbsp;&nbsp;&nbsp;일 : 08:30 ~ 17:30 </div>
                                            <div>토요일 : 08:30 ~ 12:30</div>
                                            <div id="t1">일요일/공휴일 휴진</div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="treat_bottom">
                                        <div class="bottom_left">
                                            <i class="fas fa-phone-alt fa-4x"></i>
                                        </div>
                                        <div class="bottom_right">
                                            <div>1544-9970</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <!-- 공지사항 게시판 -->
                        <li class="main_bottom_item col2">
                            <div class="main_notice" style="min-height:300px; box-sizing:border-box;">
                                <div class="tit_notice">
                                    공지사항
                                    <div class="tab_notice">
                                      
                                    </div>
                                </div>
                                <a href="/notice/list.kh" class="btn_goto_board"></a>
                                   
                               
                                <!-- HW공지사항 -->
                                <div class="cont_bbs active"><br>
    
                                    <c:forEach items="${nmList}" var = "list">
									
    								<a href="/notice/detail.kh?noticeNo=${list.noticeNo }">
    									<span class="bbs_subject"><c:out value="${list.noticeTitle}" /></span>
    									<span class="bbs_date"><c:out value="${list.noticeDate}"/></span>
    								</a>
    								<br>
									</c:forEach>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- // content -->	
    </div>
<footer>
	<div class="footer_tit">서울특별시 중구 남대문로 120 대일빌딩 2F, 3F (T: 1544-9970) / F: 02-722-0858)</div>
	<div id="footer_bottom">Copyright ⓒ 1988-2022 HW Hospital All Right Reserved</div>
</footer>
</body>
</html>