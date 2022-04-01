<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>Insert title here</title>
<style>
#content_box {
	float: left;
	width: 1100px;
}

#content_box .chat_page_title {
	position: relative;
	padding: 10px 0;
	border-bottom: 1px solid #ccc;
}

.section {
	margin-top: 50px;
}

.bbs {
	position: relative;
	margin-bottom: 40px;
}

.main-chat {
	background: skyblue;
	width: 65%;
	min-height: 70vh;
	height: auto;
}

a {
	color: black;
	cursor: pointer;
	text-decoration: none;
}

/* 말풍선 공통 스타일 지정 */
.me-chat-col, .admin-chat-col, .msg-col, .msg-col1 {
	display: flex;
	flex-direction: column;
	position: relative;
}

.msg-chat {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	align-items: stretch;
	margin-bottom: 0.3125rem;
}

.msg-col>.balloon {
	margin-top: 3.3125rem;
	margin-left: 15px;
	padding: 0.4375rem;
	border: 1px solid rgb(228, 233, 230);
	border-radius: 0.1875rem;
	background-color: rgb(228, 233, 230);
	font-size: 0.8125rem;
	color: black;
}

.msg-col>.balloon::before {
	content: "";
	border-bottom: 0.6875rem solid transparent;
	border-right: 0.6875rem solid rgb(228, 233, 230);
	position: absolute;
	top: 1.563rem;
	left: -0.5rem;
	margin-left: 13px;
	margin-top: 2.8125rem;
}

.msg-chat1 {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	align-items: stretch;
	margin-top: 15px;
	margin-bottom: 0.3125rem;
}

.msg-col1>.balloon1 {
	margin-top: 2px;
	margin-left: 15px;
	padding: 0.4375rem;
	border: 1px solid rgb(228, 233, 230);
	border-radius: 0.1875rem;
	background-color: rgb(228, 233, 230);
	font-size: 0.8125rem;
	color: black;
	margin-bottom: 0.31rem;
}

.msg-col1>.balloon1::before {
	content: "";
	border-bottom: 0.6875rem solid transparent;
	border-right: 0.6875rem solid rgb(228, 233, 230);
	position: absolute;
	top: 1.563rem;
	left: -0.5rem;
	margin-left: 13px;
	margin-top: 1.3125rem;
}

/* 친구의 채팅 말풍선들 flex 레이아웃 구성 */
.me-chat {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	align-items: stretch;
	margin-top: 0.3125rem;
}

.me-chat-col {
	margin-bottom: 30px;
}

.me-chat-col>.balloon {
	margin-top: 2.3125rem;
	margin-left: 15px;
	padding: 0.4375rem;
	border: 1px solid #ffd400;
	border-radius: 0.1875rem;
	background-color: #ffd400;
	font-size: 0.8125rem;
	color: black;
	font-weight: bold;
}

.me-chat-col>.balloon::before {
	content: "";
	border-bottom: 0.6875rem solid transparent;
	border-right: 0.6875rem solid #ffd400;
	position: absolute;
	top: 1.563rem;
	left: -0.5rem;
	margin-left: 13px;
	margin-top: 1.3125rem;
}

.admin-chat {
	display: flex;
	flex-direction: row-reverse;
	justify-content: flex-start;
	align-items: flex-start;
	margin-right: 0.625rem;
	margin-top: 0.3125rem;
	margin-bottom: 1.3125rem;
}

.admin-chat-col>.balloon {
	margin-top: 0.3125rem;
	padding: 0.4375rem;
	border: 1px solid rgb(228, 233, 230);
	border-radius: 0.1875rem;
	background-color: rgb(228, 233, 230);
	font-size: 0.8125rem;
	color: black;
}

.admin-chat-col>.balloon::before {
	content: "";
	border-bottom: 0.6875rem solid transparent;
	border-left: 0.6875rem solid rgb(228, 233, 230);
	position: absolute;
	top: 0.625rem;
	right: -0.5rem;
}

/* 채팅 말풍선의 시간(time) 아래로 정렬 (flex item들) */
.main-chat .time {
	/* align-self: flex-end; */
	flex-basis: 4.75rem;
	flex-shrink: 0;
	margin-left: 0.6125rem;
	margin-right: 0.6125rem;
	font-size: 0.75rem;
	color: rgb(88, 88, 88);
	text-align: center;
	margin-top: 45px;
}

.me-chat .time {
	margin-right: 2.5rem;
}

.admin-chat .time {
	margin-top: 15px;
	margin-left: 2.5rem;
}

/* 날짜선(date-line) 스타일 지정 */
.date-line {
	/* flex 사용 */
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgb(88, 88, 88);
	font-size: 0.875rem;
}

.date-line::before, .date-line::after {
	content: "";
	flex-grow: 1;
	height: 1px;
	background-color: rgba(88, 88, 88, 0.3);
	font-size: 0px;
	line-height: 0px;
}

.insert-content {
	background-color: white;
	/*  padding: 0.4375rem; */
	position: sticky;
	bottom: 0;
}

textarea {
	resize: none;
	border: none;
	min-height: 6.375rem;
	height: auto;
	width: 63.5%;
	margin-left: 1.6px;
	padding-top: 9px;
	padding-left: 15px;
	font-size: 15px;
}

#chat-insert:focus {
	outline: 2px solid skyblue;
}

textarea::placeholder {
	padding-top: 30px;
	text-align: center;
	font-size: 15px;
	color: #d3d3d3;
	font-weight: bold;
}

.cht_dt {
	border: 1px solid #6fadcf;
	border-radius: 8px;
	display: block;
	width: 200px;
	margin-top: 20px; auto;
	background: #6fadcf;
	margin-left: 280px;
	text-align: center;
	font-weight: bold;
	color: white;
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
						<div class="cate_name">실시간 상담</div>
					</div>
					<ul class="snb_nav">
						<li><a href="/chat/req.kh" class="link_sb1" id="point">채팅
								상담 요청</a></li>

					</ul>
				</div>

				<div id="content_box">
					<div class="chat_page_title">
						<h2 class="tit_page">채팅 상담 요청</h2>
					</div>
					<div class="section">
						<div class="bbs">
							<c:if test="${empty sessionScope}">
								<div>

									<form action="/chat/doAdd.kh" method="post">
										<div>
											<div>
												<input autocomplete="off" type="text" name="name"
													required="required" autofocus="autofocus" maxlength="30"
													placeholder="이름을 입력해주세요">
											</div>

										</div>

										<div>
											<div>
												<input autocomplete="off" type="text" name="phone"
													required="required" autofocus="autofocus" maxlength="11"
													placeholder="전화번호를 입력해주세요" />
											</div>

										</div>
										<!-- <div><input type="submit" value="확인" name="chatadd"  onclick="location.href="http://127.0.0.1:8888/chat/add.kh";/></div> -->

										<div>
											<input type="text" name="content" placeholder="내용을 입력해주세요" />
										</div>
										<div>
											<input type="submit" value="전송" name="chatadd">
										</div>

									</form>
								</div>
							</c:if>

							<c:if test="${not empty sessionScope}">
								<div>

									<form action="/chat/doMemAdd.kh" method="post">

										<input type="hidden" name="name"
											value="${loginUser.memberName}" /> <input type="hidden"
											name="phone" value="${loginUser.memberPhone}" /> <input
											type="hidden" name="memberId" value="${loginUser.memberId}" />
										<input type="hidden" name="reg_date"
											value="${chatroom.reg_date}" /> <input type="hidden"
											name="send_mem" value="${loginUser.memberId}" />

										<!-- 채팅 내용 -->
										<div class="main-chat">

											<div class="msg-chat">
												<div class="msg-col">
													<span class="balloon">안녕하세요.HW병원입니다. 채팅 내용은 상담 품질
														관리를 위해<br> 일정 기간 저장됨을 알려드립니다.
													</span>

												</div>

											</div>
											<div class="msg-chat1">
												<div class="msg-col1">
													<span class="balloon1">예약부터 간단하게 상담까지 빠르고 편리하게 실시간으로
														1:1채팅<br> 상담을 받아보세요. 채팅 상담 이용 가능 시간은<br> 08시 30분
														~ 17시 30분까지 입니다.<br> 점심시간은 13시 ~ 14시이며 대기 시간은 20분
														내외입니다.<br> 이용가능 시간 외 문의는 순차적으로 답변 드립니다. 감사합니다.
													</span>
												</div>
											</div>


											<c:forEach items="${croom}" var="chatroom">


												<div class="chat-content">
													<c:if test="${chatroom.memberId eq loginUser.memberId }">

														<div class="me-chat">

															<div class="me-chat-col">

																<span class="balloon">${chatroom.content}</span>
															</div>

															<span class="time"><fmt:parseDate var="daVal"
																	value="${chatroom.reg_date}"
																	pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
																	value="${daVal}" type="time" /></span>

														</div>
													</c:if>

													<c:if
														test="${chatroom.memberId == 'admin' && loginUser.memberId == chatroom.recv_mem}">
														<div class="admin-chat">
															<div class="admin-chat-col">
																<span class="balloon">${chatroom.content}</span>
															</div>
															<span class="time"><fmt:parseDate var="daVal1"
																	value="${chatroom.reg_date}"
																	pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
																	value="${daVal1}" type="time" /></span>
														</div>

													</c:if>

												</div>


											</c:forEach>


										</div>
										<div class="insert-content">
											<textarea id="chat-insert" name="content"
												placeholder="내용을 입력해주세요"></textarea>
										</div>
									</form>
								</div>
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
		$("#chat-insert").keypress(function(e) {
			if (e.which === 13 && !e.shiftKey) {
				e.preventDefault();

				$(this).closest("form").submit();
			}
		});
	</script>
</body>
</html>