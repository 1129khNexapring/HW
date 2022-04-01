<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의/건의 상세히 보기 페이지(일반유저)</title>
<link rel="stylesheet" href="/resources/notice/notice-style2.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
	<link rel="stylesheet" href="/resources/head.css">
	<link rel="stylesheet" href="/resources/footer.css">
</head>
<style>
.bbs_content{
	height: 280px;
}
.enr_btn {
	width: 1300px;
	margin-top: 30px;
	padding-bottom: 30px;
}
.input-btn {
	padding-left: 500px;
	width: 700px;
	float: left;
	text-align: center;
}
.a-btn {
	width: 100px;
	float: left;
}
#btn1 {
	float: left;
	height: 40px;
	width: 100px;
	border-radius: 3px;
	padding: 5px;
	border: 0px;
	font-size: 15px;
	color: #fff;
	cursor: pointer;
	background-color: rgb(14, 74, 129);
	margin-right: 30px;
}

#btn2 {
	float: left;
	height: 40px;
	width: 100px;
	border-radius: 3px;
	padding: 5px;
	border: 0px;
	font-size: 15px;
	color: #000;
	cursor: pointer;
	background-color: rgb(200, 200, 200);
}
</style>
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
                    <li><a href="/res.kh" class="btn_lnb_dep1">진료예약</a></li>
                    <li><a href="/medical.kh" class="btn_lnb_dep1">진료안내</a></li>
                    <li><a href="/hospital.kh" class="btn_lnb_dep1">병원안내</a></li>
                    <li><a href="/notice/list.kh" class="btn_lnb_dep1" id="point">고객센터</a></li>
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
        				<div class="cate_name">고객센터</div>
    				</div>	
    				<ul class="snb_nav">
    					<li><a href="/notice/list.kh" class="link_sb1">공지사항</a></li>
    					<li><a href="/qna/list.kh" class="link_sb1" id="point">문의/건의게시판</a></li>
    					</ul>
			  </div>
				<div id="content_box">
					<div class="notice_page_title">
						<h2 class="tit_page">문의/건의게시판</h2>
					</div>
					<div class="section">
						<div class="bbs">
							<table>
								<thead>
									<tr>
										<input type="hidden" id="qnaNo" name="qnaNo"
											value="${qna.qnaNo }">
										<th colspan="2" class="ta_t">
										
										${qna.qnaTitle }</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="t1"><span class="t_da"> <strong>작성일</strong>
												${qna.qnaDate }
										</span> <span class="t_da"> <strong>작성자</strong>
												${qna.qnaWriter }	</span>
										
												</td>
										<td class="t2"><span class="t_da"> <strong>조회수</strong>
												${qna.qnaCount }
										</span></td>
									</tr>
									<tr class="t3">
										<td class="bbs_content" colspan="2" style="white-space:pre;">
											<p>${qna.qnaContent}</p>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="enr_btn">
									<div class="input-btn">
										<c:if test="${loginUser.memberId  eq qna.qnaWriter  }">
											<input type="button" id="btn1" onclick="location.href='/qna/update.kh?qnaNo=${qna.qnaNo }'"value="수정">
											<input type="button" id="btn2" onclick="location.href='/qna/remove.kh?qnaNo=${qna.qnaNo }'"value="삭제">
										</c:if>
										<c:if test="${not empty sessionScope.loginAdmin && qna.depthNo > 0 }">
											<input type="button" id="btn1" onclick="location.href='/qna/update.kh?qnaNo=${qna.qnaNo }'"value="수정">
											<input type="button" id="btn2" onclick="location.href='/qna/remove.kh?qnaNo=${qna.qnaNo }'"value="삭제">
										</c:if>
									</div>
									<div class="a-btn">
										<a href="/qna/list.kh" id="list_l">목록</a>		
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