<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>상담 채팅리스트(관리자)</title>
<style>
a {
	text-decoration-line: none;
}

#content_box {
	float: left;
	width: 1100px;
	border: 1px solid gray;
}

#content_box .chat_page_title {
	position: relative;
	padding: 10px 0;
	border-bottom: 1px solid #ccc;
}

.tit_page {
	width: 70%;
	line-height: 1;
	font-size: 35px;
	color: #000;
	font-weight: 400;
}

.btn_wr {
	width: 15%;
	float: right;
	font-size: 25px;
	border: none;
	cursor: pointer;
	background: white;
}

.btn_wr #write {
	padding-right: 10px;
	float: right;
}

.section {
	margin-top: 50px;
}

.bbs {
	position: relative;
	margin-bottom: 40px;
}

#ul {
	/* flex box 생성 */
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	/* unordered list 기본 스타일 제거(점, 들여쓰기) */
	list-style: none;
	padding-left: 0;
}

.li {
	/* 안에 또 다른 flex box 생성 */
	display: flex;
	flex-shrink: 0;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: flex-start;
	align-items: center;
	/* margin: 20px; */
	min-height: 30px;
	height: auto;
}

.li>img {
	width: 5.425rem;
	height: 100px;
	margin-left: 8px;
	margin-top: -10px;
}

.li>.talk {
	/* 프로필 사진과 메시지(채팅) 내용 사이 간격 조절 */
	margin-left: 0.9375rem; /* 16 브라우저 기준 15px */
	flex-grow: 1; /* 메시지 내용과 시간 사이에 빈 공간 채우기 위한 flex-grow 설정 */
	margin-top: -30px;
}

.talk>* {
	width: 65%;
	margin-top: 0.3125rem; /* 16 브라우저 기준 5px */
	margin-bottom: 0.3125rem;
}

.friend-name {
	/* 프로필명(이름) 스타일 조정 */
	font-weight: bold;
	font-size: 2.275rem;
}

.chat-content {
	/* 메시지(채팅) 내용 스타일 조정 */
	color: gray;
	font-size: 2.15rem; /* 16 브라우저 기준 12px */
	cursor: pointer;
}

.chat-status {
	flex-basis: 7.5rem;
	flex-shrink: 0;
	text-align: right;
	font-size: 18px;
	margin-right: 15px;
}

.chat-balloon {
	display: inline-block;
	border: 1px solid tomato;
	background-color: tomato;
	border-radius: 0.625rem;
	font-size: 1.2125rem;
	color: white;
	font-weight: bold;
	padding-top: 0.0625rem;
	padding-bottom: 0.0625rem;
	padding-left: 0.25rem;
	padding-right: 0.25rem;
}

.chat-menu {
	background: rgb(208, 218, 224);
	float: left;
	width: 120px;
	height: 600px;
}

#bubble {
	display: block;
	width: 100px;
	height: 100px;
	margin-top: 50px;
	margin-left: 10px;
}

.chat {
	margin-left: 20px;
	font-size: 40px;
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
				<c:if test="${loginDt ne null }">
					<a href="/logout.kh" class="btn_gnb_logout"> <span
						class="material-icons"> lock_open </span> 로그아웃
					</a>
				</c:if>
				<c:if test="${loginAdmin ne null}">
					<a href="/logout.kh" class="btn_gnb_logout"> <span
						class="material-icons"> admin_panel_settings </span> 관리자
					</a>
				</c:if>
				<a href="/join.kh" class="btn_gnb_join"> <i class="fas fa-plus"></i>
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
					<li><a href="/notice/list.kh" class="btn_lnb_dep1">고객센터</a></li>
					<c:if test="${not empty sessionScope.loginUser}">
						<li><a href="/member/myInfo.kh" class="btn_lnb_dep1">마이페이지</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.loginDt}">
						<li><a href="/doctor/myInfo.kh" class="btn_lnb_dep1">마이페이지</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.loginAdmin}">
						<li><a href="/notice/adList.kh" class="btn_lnb_dep1"
							id="point">관리자페이지</a></li>
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
						<div class="cate_name">관리자페이지</div>
					</div>
					<ul class="snb_nav">
						<li><a href="/admin/resList.kh" class="link_sb1">일반 예약 관리</a></li>
						<li><a href="/admin/withResList.kh" class="link_sb1">동행서비스
								예약 관리</a></li>
						<li><a href="/notice/adlist.kh" class="link_sb1">공지사항 관리</a></li>
						<li><a href="/qna/adlist.kh" class="link_sb1">문의/건의게시판 관리</a></li>
						<li><a href="/chat/list.kh" class="link_sb1" id="point">실시간
								상담 관리</a></li>
					</ul>
				</div>
				<div id="content_box">
					<div class="chat_page_title">
						<h2 class="tit_page">실시간 상담 관리</h2>
						<!-- <button class="btn_wr"
							onclick="location.href='/notice/writeView.kh'">
							<i class="far fa-plus-square" fa-3x></i> <span id="write">글쓰기</span>
						</button> -->
					</div>
					<div class="section">
						<div class="bbs">
							<div class="chat-menu">
								<img src="/resources/img/thought bubble.PNG" alt="말풍선"
									id="bubble">
							</div>
							<span class="chat">채팅</span>
							<c:if test="${not empty sessionScope.loginAdmin }">
								<c:forEach items="${cList}" var="chatroom">
									<c:if test="${chatroom.name ne 'admin'}">

										<c:url var="chroom" value="/chat/update.kh">
											<c:param name="name" value="${chatroom.name}"></c:param>

										</c:url>

										<c:url var="croom" value="/chat/detail.kh">
											<c:param name="name" value="${chatroom.name}"></c:param>
											<c:param name="memberId" value="${chatroom.memberId}"></c:param>
										</c:url>

										<ul id="ul">
											<li class="li"><img src="/resources/img/profile.PNG"
												alt="프로필사진">
												<div class="talk">
													<a href="${croom}"><p class="friend-name">${chatroom.memberId}</p></a>
													<a href="${chroom}"><p class="chat-content">${chatroom.content}</p></a>

												</div>
												<div class="chat-status">
													<span class="time"><fmt:parseDate var="daVal"
															value="${chatroom.reg_date}"
															pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
															value="${daVal}" type="time" /></span>



													<sql:setDataSource
														url="jdbc:oracle:thin:@sonof.iptime.org:8521:XE"
														driver="oracle.jdbc.driver.OracleDriver" user="HW"
														password="HW" var="dataSource" />


													<sql:query var="result" dataSource="${dataSource}">

												
														SELECT  MEMBER_ID,
														      COUNT(isReading) AS co
														FROM CHAT
														WHERE MEMBER_ID !='admin' AND MEMBER_ID = ? AND ISREADING !='Y'
														GROUP BY MEMBER_ID 
													<sql:param value="${chatroom.memberId}" />

													</sql:query>

													<c:forEach var="row" items="${result.rows}">
														<span class="chat-balloon" id="chat-ballon"> <c:out
																value="${row.co}" />
														</span>

													</c:forEach>

												</div></li>
										</ul>
									</c:if>
								</c:forEach>
							</c:if>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="footer_tit">서울특별시 중구 남대문로 120 대일빌딩 2F, 3F (T:
			1544-9970) / F: 02-722-0858)</div>
		<div id="footer_bottom">Copyright ⓒ 1988-2022 HW Hospital All
			Right Reserved</div>
	</footer>
	<script>
		$(".chat-content").on("click", function() {

			$.ajax({
				url : "/chat/update.kh",
				type : "put",
				data : {
					"name" : name

				},
				success : function(data) {
					$('#chat-ballon').html(data);
				},
				error : function() {

				}
			});

		});
	</script>

</body>
</html>