<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>채팅방</title>
<style>
a {
	text-decoration-line: none;
}

#content_box {
	float: left;
	width: 1100px;
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

.main-chat{
	background: skyblue;
	width: 65%;
	min-height: 70px;
	height: auto;
	
}

a {
	color: black;
	cursor: pointer;
	text-decoration: none;
}

/* 말풍선 공통 스타일 지정 */
.me-chat-col {
	display: flex;
	flex-direction: column;
	position: relative;
}

.me-chat {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	align-items: stretch;
	margin-top: 0.3125rem;
	margin-bottom: 1.3125rem;
}


.me-chat-col>.balloon {
	margin-top: 3.3125rem;
	margin-left: 15px;
	padding: 0.4375rem;
	border: 1px solid #ffd400;
	border-radius: 0.1875rem;
	background-color: #ffd400;
	font-size: 1.3125rem;
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
	margin-top: 2.3125rem;
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

.main-chat .time {
	align-self: flex-end;
	flex-basis: 5.75rem;
	flex-shrink: 0;
	margin-left: 0.3125rem;
	margin-right: 0.3125rem;
	font-size: 0.75rem;
	color: rgb(88, 88, 88);
	text-align: center;
}

.me-chat .time {
	margin-right: 2.5rem;
}

.admin-chat .time {
	margin-top: 15px;
	margin-left: 2.5rem;
}
.insert-adcontent{
    background-color: white;
   /*  padding: 0.4375rem; */
    position: sticky;
    bottom: 0;
}

textarea{
	resize: none;
    border: none;
    height: 6.375rem;
    width: 97.5%;
   	margin-left: 1.6px;
   	padding-top: 9px;
   	padding-left: 15px;
   	font-size: 15px;
   	
}


.textarea:focus{
	outline: 2px solid skyblue;
	
}

textarea::placeholder {
 	padding-top: 30px;
 	text-align: center;
 	font-size: 15px;
 	color:#d3d3d3;
 	font-weight: bold;
}
#per{
	padding-top: 20px;
	margin-left: 25px;
	font-size: 40px;
	
}

.mId{
	margin-top: -40px;
	margin-left: 75px;
	font-size: 28px;
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
                    	<li><a href="/admin/resList.kh" class="btn_lnb_dep1" id="point">관리자페이지</a></li>
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
						<li><a href="/admin/withResList.kh" class="link_sb1">동행서비스 예약 관리</a></li>
						<li><a href="/notice/adlist.kh" class="link_sb1" >공지사항 관리</a></li>
						<li><a href="/qna/adlist.kh" class="link_sb1">문의/건의게시판 관리</a></li>
						<li><a href="/chat/list.kh" class="link_sb1" id="point">실시간 상담 관리</a></li>
					</ul>
				</div>

				<div id="content_box">
					<div class="chat_page_title">
						<h2 class="tit_page">채팅 상담 요청</h2>
					</div>
					<div class="section">
						<div class="bbs">
							

								<div>
									<c:if test="${loginAdmin.memberId == 'admin'}">
									
									
									<form action="/chat/adminWrite.kh" method="post">
										<div class="main-chat">
										<span class="material-icons" id="per">person</span>
											<c:forEach items="${room}" var="chatroom1" begin="0" end="0">
											<input type="hidden" name="recv_mem" value="${chatroom1.memberId}" />	
											<div class="mId">${chatroom1.memberId}</div>
											</c:forEach>
										
											<input type="hidden" name="name" value="${loginAdmin.memberName}" />
											<input type="hidden" name="phone" value="${loginAdmin.memberPhone}" />  
											<input type="hidden" name="memberId" value="${loginAdmin.memberId}" />
											
											<input type="hidden" name="reg_date" value="${chatroom1.reg_date}" />
											
											<c:forEach items="${room}" var="chatroom1">
											
											<div class="chat-content">
												<c:if test="${chatroom1.name ne 'admin' }">
												<div class="me-chat">
													<div class="me-chat-col">

														<span class="balloon">${chatroom1.content}</span>
													</div>
													<span class="time"><fmt:parseDate  var= "daVal3" value="${chatroom1.reg_date}" pattern="yyyy-MM-dd HH:mm:ss" />
															<fmt:formatDate value="${daVal3}" type="time"/></span>

												</div>
												</c:if>
												<c:if test="${chatroom1.memberId=='admin' && param.memberId==chatroom1.recv_mem}">
													
												<div class="admin-chat">

															<div class="admin-chat-col">

																<span class="balloon">${chatroom1.content}</span>
															</div>

															<span class="time"><fmt:parseDate var="daVal"
																	value="${chatroom1.reg_date}"
																	pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
																	value="${daVal}" type="time" /></span>

											 </div>	
											 
											</c:if> 
												
											</div>
										
											</c:forEach>
											<div class="insert-adcontent">
												<textarea id="chat-insert" name="content" class="textarea" placeholder="내용을 입력하세요"></textarea>
											</div>
											
										</div>
									</form>
									</c:if>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	$("#chat-insert").keypress(function (e) {
	    if(e.which === 13 && !e.shiftKey) {
	        e.preventDefault();
	    
	        $(this).closest("form").submit();
	    }
	});
	

	</script>
</body>
</html>