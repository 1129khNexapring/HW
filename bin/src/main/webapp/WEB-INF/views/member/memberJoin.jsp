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
	<title>회원가입</title>
	<style>
			.member{
				width: 1100px;
				font-size: 40px;
				margin-top: 50px;
				margin-right: 300px;
				margin-left: 400px;
				border-bottom: 1px solid #b2bfca;
			}
			p {
				width: 700px;
				margin-top: 50px;
				margin-right: 300px;
				margin-left: 600px;
				font-size: 25px;
			}
			.form_table {
				margin-left: 600px;
				position: relative;
				width: 700px;
				height: 500px;
				padding: 20px;
			}
				.form_table tr {
					height: 50px;
				}
				.td_left {
					width: 200px;
				}
				.td_right {
					width: 500px;
				}
				.form_table .input {
					height: 40px;
					width: 300px;
					border: 1px solid #b2bfca;
					border-radius: 5px;
					padding-left: 10px;
				}
				.box-birth {
					height: 40px;
					border: 1px solid #b2bfca;
					border-radius: 5px;
					padding-left: 10px;
					color: #707070
				}
				.box-gender {
					height: 40px;
					border: 1px solid #b2bfca;
					border-radius: 5px;
					padding-left: 5px;
					padding-right: 5px;
					color: #707070
				}
				.checkbtn {
					margin-left: 15px;
					width: 85px;
					height: 40px;
					color: #fff;
					background-color: #505050;
					border: 1px;
					border-radius: 5px;
				}
				.submit {
					margin-top: 20px;
					width: 120px;
					height: 42px;
					color: #fff;
					background-color: rgb(14, 74, 129);
					border: 1px;
					border-radius: 5px;
					font-size: 15px;
				}
			#btn{
				height: 20px;
				text-align: center;
				
			}
			.btn{
				height: 40px;
				width: 100px;
				border-radius: 3px;
				padding: 5px;
				border: 0px;
				font-size: 15px;
				color: #fff;
				cursor: pointer;
				background-color: rgb(14, 74, 129);
			}
			span.guide {
				display : none;
				font-size : 12px;
				top : 12px;
				right : 10px;
			}
			span.ok { color : green }
			span.error { color : red }
			#check {
				font-size : 12px;
				top : 12px;
				right : 10px;
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
	                        <li><a href="/admin/resList.kh" class="btn_lnb_dep1">관리자페이지</a></li>
	                    </c:if>
					</ul>
				</div>
			</div>
		</div>
		<div class="member">일반 회원가입</div>
		<p>회원정보 입력</p>
		<div class="form_table">
			<form action="/member/register.kh" method="post">
				<table>
					<tr>
						<td class="td_left"><font color="#f00"> * </font>이름</td>
						<td class="td_right"><input type="text" name="memberName" placeholder="이름을 입력하세요." class="input"></td>
					</tr>
					<tr>
						<td class="td_left"><font color="#f00"> * </font>아이디</td>
						<td class="td_right">
							<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력하세요." class="input">
							<span class="guide ok">이 아이디는 사용 가능합니다.</span>
							<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
						</td>
						
					</tr>
					<tr>
						<td class="td_left"><font color="#f00"> * </font>비밀번호</td>
						<td class="td_right">
							<input type="password" name="memberPw" placeholder="비밀번호를 입력하세요." class="input" id="pw">
						</td>
					</tr>
					<tr>
						<td class="td_left"><font color="#f00"> * </font>비밀번호 확인</td>
						<td class="td_right">
							<input type="password" name="memberPw2" placeholder="비밀번호를 한 번 더 입력하세요." class="input" onchange="check_pw()" id="pw2">
							<span id="check"></span>
						</td>
					</tr>
					<tr>
						<td class="td_left"><font color="#f00"> * </font>생년월일</td>
						<td class="td_right"><input type="date" name="memberBirth" class="box-birth"></td>
					</tr>
					<tr>
						<td class="td_left"><font color="#f00"> * </font>성별</td>
						<td class="td_right">
							<select name="memberGender" class="box-gender">
								<option selected="selected">성별</option>
								<option value="M">남</option>
								<option value="F">여</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="td_left"><font color="#f00"> * </font>전화번호</td>
						<td class="td_right"><input type="text" name="memberPhone" placeholder="'-'구분 없이 전화번호를 입력하세요." class="input"></td>
					</tr>
					<tr>
						<td class="td_left"><font color="#f00"> * </font>이메일</td>
						<td class="td_right"><input type="text" name="memberEmail" placeholder="이메일을 입력하세요." class="input"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="회원가입" class="submit">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<footer>
			<div class="footer_tit">서울특별시 중구 남대문로 120 대일빌딩 2F, 3F (T: 1544-9970) / F: 02-722-0858)</div>
			<div id="footer_bottom">Copyright ⓒ 1988-2022 HW Hospital All Right Reserved</div>
		</footer>
	</body>
	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
	<script>
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
		$("#memberId").on("blur", function() {
			var memberId = $("#memberId").val();
			$.ajax({
				url : "/member/checkDupId.kh",
				type : "get",
				data : { "memberId" : memberId }, // JSON
				success : function(data) {
					if(data != 0) {
						$(".guide.ok").hide();
						$(".guide.error").show();
					}else {
						$(".guide.ok").show();
						$(".guide.error").hide();
					}
				},
				error : function() {
					alert("ajax 전송 실패! 관리자에게 문의해주세요.")
				}
			});
		});
		function check_pw(){
            var pw = document.getElementById('pw').value;
            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
                if(document.getElementById('pw').value==document.getElementById('pw2').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
                }
            }
		}
	</script>
	</html>