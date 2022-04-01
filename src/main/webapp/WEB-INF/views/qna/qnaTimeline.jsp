<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의/건의 타임라인</title>
<link rel="stylesheet" href="/resources/qna/qnaTimeline.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
<style>
	#date {
		width: 200px;
	}
	#type {
		width: 200px;
	}
	#title {
		width: 700px;
	}
	#status {
		width: 200px;
	}
	.title {
		color: black;
		font-weight: bold;
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
				<a href="/join.kh" class="btn_gnb_join"> <i class="fas fa-plus"></i>
					회원가입
				</a>
			</div>
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
					<li><a href="/member/myInfo.kh" class="btn_lnb_dep1" id="point">마이페이지</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.loginDt}">
					<li><a href="/doctor/myInfo.kh" class="btn_lnb_dep1" id="point">마이페이지</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.loginAdmin}">
					<li><a href="/ad/noticeList.kh" class="btn_lnb_dep1">관리자페이지</a></li>
				</c:if>
			</ul>
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
						<li><a href="/member/history.kh" class="link_sb1">진료이력</a></li>
    					<li><a href="/qna/Timeline.kh?qnaWriter=${loginUser.memberId }" class="link_sb1" id="point">문의/건의 타임라인</a></li>
						<li><a href="/member/myInfo.kh" class="link_sb1">회원정보수정</a></li>
						<li><a href="/member/delete.kh" class="link_sb1">회원 탈퇴 </a></li>
					</ul>
				</div>
				<div id="content_box">
					<div class="notice_page_title">
						<h2 class="tit_page">문의/건의 타임라인</h2>
					</div>
						<div class="section">
							<div class="bbs">
								<table>
									<thead>
										<tr>
											<th>날짜</th>
											<th>유형</th>
											<th>제목</th>
											<th>답변유무</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${qList }" var="qna">
											<c:url var="qDetail" value="/qna/detail.kh">
												<c:param name="qnaNo" value="${qna.qnaNo }"></c:param>
											</c:url>
											<tr class="space">
												<td class="ta" id="date">${qna.qnaDate }</td>
												<td class="ta" id="type">${qna.qnaType }</td>
												<td style="text-align: center;" id="title"><a href="${qDetail }" class="title">${qna.qnaTitle }</a></td>
												<td class="ta" id="status"><c:if test="${qna.qnaStatus eq 'Y' }">
                     답변완료 
                     </c:if> <c:if test="${qna.qnaStatus eq 'N' }">
                     답변대기 
                     </c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
									
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
</html>