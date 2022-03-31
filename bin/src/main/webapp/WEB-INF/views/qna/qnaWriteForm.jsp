<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의/건의 작성페이지</title>
<link rel="stylesheet"  href="/resources/notice/notice-admin-write.css">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <link rel="stylesheet" href="/resources/head.css">
 <link rel="stylesheet" href="/resources/footer.css">
<style>
.input_pw {
	display: inline-block;
	padding: 10px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	vertical-align: middle;
}
.input_type {
	display: inline-block;
	padding: 10px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	vertical-align: middle;
}
.td-left {
	width: 100px;
}
.enr_btn {
	padding-bottom: 25px;
}
.submit_btn {
	text-align: center;
	margin-left: 600px;
	float: left;
}
.list_btn {
	float: right;
}
#list_l {
	height: 40px;
	display: inline-block;
	border-radius: 2px;
	padding: 10px 25px;
	box-sizing: border-box;
	cursor: pointer;
	background: rgb(60, 60, 60);
	text-decoration: none;
	color: #fff;
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
						<li><a href="/admin/resList.kh" class="btn_lnb_dep1"
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
							<form action="/qna/register.kh" method="post">
								<table>
									<tr>
										<td class="td-left">작성자</td>
										<td><input type="hidden" name="qnaWriter"
											value="${loginUser.memberId }">${loginUser.memberId }</td>
									</tr>
									<tr>
										<td class="td-left">비밀번호</td>
										<td><input type="password" name="qnaPw" class="input_pw"></td>
									</tr>
									<tr>
										<td class="td-left">제목</td>
										<td><input type="text" class="input_text" name="qnaTitle"
											placeholder="내용을 입력해주세요"></td>
									</tr>
									<tr>
										<td class="td-left">유형</td>
										<td><select name="qnaType" class="input_type">
												<option value="">유형선택</option>
												<option value="문의">문의</option>
												<option value="건의">건의</option>
										</select>
										</td>
									</tr>
									<tr>
										<td class="td-left">내용</td>
										<td><textarea name="qnaContent" class="textarea" style="white-space:pre;"></textarea></td>
									</tr>
								</table>
								<div class="enr_btn">
									<div class="submit_btn">
										<input type="submit" class="btn_blue" value="완료">
									</div>
									<div class="list_btn">
										<a href="/qna/list.kh" id="list_l">목록</a>
									</div>
								</div>
							</form>
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
</body>
</html>