<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
<title>회원 탈퇴</title>
<style>
	.all {
		padding-left: 300px;
		padding-top: 60px;
	}
	p {
        	margin-top: 30px;
            width: 700px;
            font-size: 25px;
            padding-left: 40px;
        }
    .section {
    	padding: 0 30px;
    	width: 600px;
    	height: 150px;
    	board-bottom: 1px solid #b2bfca;
    }
    	.section-img{
    		width: 30%;
    		height: 10px;
    		float: left;
    	}
    	img {
    		width: 150px;
    		height: 150px;
    	}
    	.section-text{
    		padding-top: 12px;
    		width: 70%;
    		font-size: 30px;
    		float: left;
    	}
        .form_table {
        	margin-left: 20px;
            position: relative;
            width: 500px;
            height: 200px;
            padding: 20px;
        }
            .form_table tr {
                height: 50px;
            }
            .td_left {
                width: 200px;
            }
            .form_table .input {
                height: 40px;
                width: 300px;
                border: 1px solid #b2bfca;
                border-radius: 5px;
                padding-left: 10px;
            }
            .btn {
                margin-top: 20px;
                width: 120px;
                height: 42px;
                color: #fff;
                background-color: rgb(14, 74, 129);
                border: 1px;
                border-radius: 5px;
                font-size: 15px;
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
            <c:if test="${loginUser ne null }">
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
        				<div class="cate_name">마이페이지</div>
    				</div>	
    				<ul class="snb_nav">
    					<li><a href="/doctor/history.kh" class="link_sb1">진료 이력</a></li>
    					<li><a href="/doctor/myInfo.kh" class="link_sb1">회원정보수정</a></li>
    					<li><a href="/doctor/delete.kh" class="link_sb1" id="point">회원 탈퇴</a></li>
    				</ul>
			  </div>
			 <div id="content_box">
				<div class="notice_page_title">
					<h2 class="tit_page">회원 탈퇴</h2>		
				</div>
	<p>회원탈퇴</p>
	<div class=all>
		<div class="section">
			<div class="section-img">
				<img src="/resources/img/warning.png" alt="주의">
			</div>
			<div class="section-text">
				회원 탈퇴 시 HW병원<br>
				서비스 내 모든 개인정보<br>
				복구가 불가능합니다.
			</div>
		</div>
		<div class="form_table">
			<form action="/doctor/remove.kh" method="post">
				<table>
					<tr>
						<td class="td_left">아이디</td>
						<td class="td_right">
							<input type="text" name="doctorId" value="${loginDt.doctorId }" class="input">
						</td>
					</tr>
					<tr>
						<td class="td_left">비밀번호</td>
						<td class="td_right">
							<input type="password" name="doctorPw" placeholder="비밀번호를 입력해주세요" value="" class="input">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" class="btn" value="회원탈퇴">
						</td>
					</tr>
				</table>
			</form>
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