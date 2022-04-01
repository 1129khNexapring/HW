<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일반 예약 비회원 정보 입력</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/resources/head.css">
    <link rel="stylesheet" href="/resources/footer.css">
    <style>
        .section1{
            height: 500px;
            width: 100%;
        }
        .section2{
            overflow: auto;
            height: 300px;
            width: 700px;   
            float: left;
            border: solid 2px;
            border-top-left-radius:0.5em;
            border-top-right-radius:0.5em;
            border-bottom-right-radius:0.5em;
            border-bottom-left-radius:0.5em;
            border-color: #ccc;
            margin-left: 600px;
            margin-top: 150px;
            position: absolute;
        }
        form {
        	margin-top: 20px;
        }
        #tr1{
            height: 60px;
        }
        .td_left{
            margin-left: 50px;
            width: 120px;
            height: 50px;
        }
        #input{
        	width: 300px;
            height: 40px;
            border: 1px solid #b2bfca;
            border-radius: 5px;
            padding-left: 10px;
            color: #707070
        }
        .submit {
        	margin-top: 20px;
            width: 110px;
            height: 35px;
            color: #fff;
            background-color: rgb(14, 74, 129);
            border: 1px;
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
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
						<h2 class="tit_page">일반 예약 정보 조회</h2>		
					</div>
		      </div>
              <div class="section1">
                  <div class="section2">
                  <form action="res/view.kh" method="post">
                    <table align="center">        
                        <tr id="tr1">
                           <td class="td_left">이름</td>
                           <td class="td_right">
                              <input type="text" name="resName" value="${resName }" id="input" placeholder="이름을 입력해주세요.">
                           </td>
                        </tr>
                        <tr id="tr1">
                            <td class="td_left">생년월일</td>
                            <td class="td_right">
                               <input type="date" name="birth" value="${birth }" id="input" placeholder="생년월일을 입력해주세요.">
                            </td>
                         </tr>
                        <tr id="tr1">
                            <td class="td_left">전화번호</td>
                            <td class="td_right">
                               <input type="text" name="phone" value="${phone }" id="input" placeholder="전화번호를 입력해주세요.">
                            </td>
                         </tr>
                         <tr>
                            <td colspan="2" align="center">
                            	<input type="submit" value="조회" class="submit">
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