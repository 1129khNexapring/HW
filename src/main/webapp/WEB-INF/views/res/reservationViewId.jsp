<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 예약 조회 정보(회원)</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
<style>
.section1 {
    margin-top: 20px;
    margin-left: 40px;
    width: 900px;
    height: 50px;
    border-bottom: 1px solid #ccc;
    color: rgb(14, 74, 129);
    font-size: 25px;
}
.section2{
    margin-left: 40px;
}
.form_table {
    margin-left: 20px;
    position: relative;
    width: 700px;
    height: 400px;
    padding: 20px;
}
table {
    border-collapse: collapse;
    width: 900px;
    }
    #tr1 {
        border-bottom: 1px solid #ccc;
      }
.form_table .input {
    height: 40px;
    width: 400px;
    border: 1.2px solid #b2bfca;
    border-radius: 5px;
    padding-left: 10px;
}
.submit { 
    margin-top: 25px;
    margin-bottom: 10px;
    width: 110px;
    height: 40px;
    color: #fff;
    background-color: rgb(14, 74, 129);
    border: 1px;
    border-radius: 5px;
    font-size: 15px;
    cursor: pointer;
}
.select{
    width: 150px;
    height: 30px;
}
#text_title{
    font-size: 16px;
    font-weight: 500;
    color: #5c5c5c;
}
.td_left {
	padding-left: 30px;
    width: 250px;
    height: 50px;
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
                    <a href="../main.kh">HW병원</a>
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
        				<div class="cate_name">진료예약</div>
    				</div>
    				<ul class="snb_nav">
    					<li><a href="/res/JoinView.kh" class="link_sb1">일반 예약</a></li>
    					<li><a href="/reservation/JoinView.kh" class="link_sb1">동행서비스 예약</a></li>
                        <c:if test="${empty sessionScope }">
                        	<li><a href="/res/type.kh" class="link_sb1" id="point">일반 예약 확인</a></li>
                        </c:if>
                        <c:if test="${not empty sessionScope }">
                        	<li><a href="/reservationView.kh" class="link_sb1" id="point">일반 예약 확인</a></li>
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
						<h2 class="tit_page">일반 예약 정보</h2>		
		</div>
	<div class="section1"><p id="link_sb1_1">예약결과가 조회되었습니다.</p></div>
   <div class="section2">
      <form>
         <table>
            <tr id="tr1">
               <td class="td_left">예약 유형</td>
               <td class="td_right">
                  <span>일반 예약</span>
               </td>
            </tr>
            <tr id="tr1">
               <td class="td_left">예약자 이름</td>
               <td>
                  <span id="resName">${reservation.resName }</span>
               </td>
            </tr>
            <tr id="tr1">
               <td class="td_left">예약자 생년월일</td>
               <td>
                  <span id="birth">${reservation.birth }</span>
               </td>
            </tr>
            <tr id="tr1">
               <td class="td_left">예약자 전화번호</td>
               <td>
                  <span id="phone">${reservation.phone }</span>
               </td>
            </tr>
            <tr id="tr1">
               <td class="td_left">진료과</td>
               <td>
                  <span id="department">${reservation.department }</span>
               </td>
            </tr>
            <tr id="tr1">
               <td class="td_left">희망의료진</td>
               <td>
                  <span id="deptStaff">${reservation.deptStaff }</span>
               </td>
            </tr>
            <tr id="tr1">
               <td class="td_left">진료날짜</td>
               <td>
                  <span id="deptDate">${reservation.deptDate }</span>
               </td>
            </tr>
            <tr id="tr1">
               <td class="td_left" >진료시간</td>
               <td>
                  <span id="deptTime">${reservation.deptTime }</span>
               </td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <button  class="submit" type="button" onclick="location.href='/res/remove.kh?resName=${reservation.resName }&phone=${reservation.phone }&birth=${reservation.birth }'">예약 취소</button>
               </td>
            </tr>
         </table>
      </form>
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
