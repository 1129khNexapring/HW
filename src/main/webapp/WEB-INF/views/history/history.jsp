<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>진료이력1</title>
	<style>
		
	</style>
</head>
<body>
    
    <div id="header">
		<!-- 로그인, 회원가입 부분 -->
		<!-- gnb = global navigation bar  -->
		<div id="gnb">
			<div class="inner">
				<c:if test="${empty sessionScope.loginUser}">
					<a href="/login.kh" class="btn_gnb_login"> <span
						class="material-icons"> lock </span> 로그인
					</a>
				</c:if>
				<c:if test="${not empty sessionScope.loginUser}">
					<a href="/logout.kh" class="btn_gnb_logout"> <span
						class="material-icons"> lock_open </span> 로그아웃
					</a>
				</c:if>
				<a href="/member/JoinView.kh" class="btn_gnb_join"> <i
					class="fas fa-plus"></i> 회원가입
				</a>
			</div>
		</div>
		<!-- local navigation bar -->
		<div id="lnb">
			<div class="inner lnb_nav">
				<h1>
					<a href="">HW병원</a>
				</h1>
				<ul class="lnb_nav_dep1">
					<li><a href="/reservation" class="btn_lnb_dep1">진료예약</a></li>
					<li><a href="/medicalInfo" class="btn_lnb_dep1">진료안내</a></li>
					<li><a href="/intro" class="btn_lnb_dep1">병원안내</a></li>
					<li><a href="/customCenter" class="btn_lnb_dep1">고객센터</a></li>
					<c:if test="${not empty sessionScope.loginUser}">
						<li><a href="/myPage" class="btn_lnb_dep1">마이페이지</a></li>
					</c:if>
					<!-- <li><a href="/member/myPage" class="btn_lnb_dep1">마이페이지</a></li> -->
				</ul>
			</div>
		</div>
	</div>

    <div id="container">
		<div id="content" class="sub">
			<div class="">
				<div id="">
					<div class="">
        				<div class="">마이페이지</div>
    				</div>	
    				<ul class="">
    					<li><a href="" class="">진료 이력</a></li>     					
    				</ul>
                    <ul class="">
    					<li><a href="" class="">회원정보수정</a></li>     					
    				</ul>
                    <ul class="">
    					<li><a href="" class="">회원 탈퇴</a></li>     					
    				</ul>
			    </div>
            </div>
        </div>
    </div>

    <h1>진료 이력</h1>
    <hr class="one">
	<form action="/history.kh" method="post">
		<table>
			<h4>진료 이력 입력</h4>
			<hr class="two">
			<tr>
				<td>예약번호
					<select name="num" >${hList.resNo }
						<option value=""></option>
					</select>
				</td>
				<td>진료일<input type="text" name="deptDate"></td>
			</tr>
			<tr>
				<td>의료진<input type="text" name="doctorId" ></td>
				<td>진료과<input type="text" name="department" ></td>
			</tr>
			<tr>
				<td>환자명<input type="text" name="resName" ></td>
				<td>청구 금액(원)<input type="text" name="charge" ></td>
			</tr>
			<tr>
				<td>
					진료 내용<textarea rows ="" cols="" name="deptContents"></textarea>
				</td>
				<td>
					약 처방 내용<textarea rows ="" cols="" name="prescription"></textarea>
				</td>
			</tr>
		</table>
    	<tr>
    		<input type="submit" value="등록">
    	</tr>
    	
    	
    	
	</form>
</body>
</html>