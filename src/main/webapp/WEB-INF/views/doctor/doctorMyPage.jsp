<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
<title>마이페이지</title>
<style>
        p {
        	margin-top: 30px;
            width: 700px;
            font-size: 25px;
            padding-left: 40px;
        }
        .form_table {
        	margin-left: 20px;
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
            .box-dpt {
					height: 40px;
					border: 1px solid #b2bfca;
					border-radius: 5px;
					padding-left: 5px;
					padding-right: 5px;
					color: #707070
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
    					<li><a href="/doctor/myInfo.kh" class="link_sb1" id="point">회원정보수정</a></li>
    					<li><a href="/doctor/delete.kh" class="link_sb1">회원 탈퇴</a></li>
    				</ul>
			  </div>
			 <div id="content_box">
				<div class="notice_page_title">
					<h2 class="tit_page">회원정보수정</h2>		
				</div>
	<p>회원정보 입력</p>			
	<div class="form_table">
		<form action="/doctor/modify.kh" method="post">
			<table>
				<tr>
					<td class="td_left">사원번호</td>
					<td class="td_right">
						<input type="text" name="doctorNo" readonly value="${loginDt.doctorNo }" class="input">
					</td>
				</tr>
				<tr>
					<td class="td_left">이름</td>
					<td class="td_right">
						<input type="text" name="doctorName" readonly value="${loginDt.doctorName }" class="input">
					</td>
				</tr>
				<tr>
					<td class="td_left">아이디</td>
					<td class="td_right">
						<input type="text" name="doctorId" readonly value="${loginDt.doctorId }" class="input">
					</td>
				</tr>
				<tr>
					<td class="td_left">비밀번호</td>
					<td class="td_right">
						<input type="password" name="doctorPw" placeholder="비밀번호를 입력해주세요" class="input" id="pw">
					</td>
				</tr>
					<tr>
					<td class="td_left">비밀번호 확인</td>
					<td class="td_right">
						<input type="password" name="doctorPw2" placeholder="비밀번호를 한 번 더 입력해주세요" class="input" onchange="check_pw()" id="pw2">
						<span id="check"></span>
					</td>
				</tr>
				<tr>
					<td class="td_left">진료과</td>
					<td class="td_right">
						<select name="doctorDpt" class="box-dpt">
							<c:if test="${loginDt.doctorDpt eq '내과'}">
								<option>진료과</option>
								<option value="내과" selected="selected">내과</option>
								<option value="소아과">소아과</option>
							</c:if>
							<c:if test="${loginDt.doctorDpt eq '소아과'}">
								<option>진료과</option>
								<option value="내과">내과</option>
								<option value="소아과" selected="selected">소아과</option>
							</c:if>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_left">전화번호</td>
					<td class="td_right">
						<input type="text" name="doctorPhone"  placeholder="'-'구분 없이 전화번호를 입력하세요." value="${loginDt.doctorPhone }" class="input">
					</td>
				</tr>
				<tr>
					<td class="td_left">이메일</td>
					<td class="td_right">
						<input type="text" name="doctorEmail" placeholder="이메일을 입력하세요." value="${loginDt.doctorEmail }" class="input">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit"  value="정보수정" class="submit">
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
	<script>
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
</body>
</html>