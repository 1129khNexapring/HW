<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료 이력 등록</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"  href="/resources/notice/notice-admin-write.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
</head>
<style>
	p {
        	margin-top: 30px;
            width: 700px;
            font-size: 25px;
            padding-left: 40px;
        }
    .form_table {
        	margin-left: 50px;
            position: relative;
            padding: 20px;
        }
        .form_table tr {
                height: 50px;
            }
		.td_left {
		    	width: 170px;
		 	}
		.td_right {
		    	width: 350px;
		 	}
		.select {
			height: 40px;
            width: 200px;
            border: 1px solid #b2bfca;
            border-radius: 5px;
            padding-left: 10px;
		}
	    .form_table .input {
	    		height: 40px;
                width: 300px;
                border: 1px solid #b2bfca;
                border-radius: 5px;
                padding-left: 10px;
	    	}
	    textarea {
	    	height: 150px;
            width: 470px;
            border: 1px solid #b2bfca;
            border-radius: 5px;
            padding-left: 10px;
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
        				<div class="cate_name">진료 이력</div>
    				</div>	
    				<ul class="snb_nav">
    					<li><a href="/doctor/history.kh" class="link_sb1" id="point">진료 이력</a></li>
    					<li><a href="/doctor/myInfo.kh" class="link_sb1">회원정보수정</a></li>
    					<li><a href="/doctor/delete.kh" class="link_sb1">회원 탈퇴</a></li>					
   					</ul>
			  </div>
			 <div id="content_box">
				<div class="notice_page_title">
					<h2 class="tit_page">진료 이력</h2>	
				</div>
			<p>진료 이력 입력</p>
			<div class="form_table">
					<form action="/history/register.kh" method="post">
						<input type="hidden" name="doctorId" id="doctorId" readonly>
						<input type="hidden" name="memberId" id="memberId" readonly>
						<table>
							<tr class="top">
								<td class="td_left">예약번호</td>
								<td class="td_right">
								<select title="예약번호" id="resNo" name="resNo" class="select" onchange="resNoChange()">
									<option value="">선택</option>
								<c:forEach items="${rList }" var="rList">
									<option value="${rList }">${rList }</option>
								</c:forEach>
								</select></td>
								<td class="td_left">진료일</td>
								<td class="td_right"><input type="text" name="strDate" id="deptDate" class="input" readonly></td>
							</tr>
							<tr>
								<td class="td_left">의료진</td>
								<td class="td_right"><input type="text" name="deptStaff" id="deptStaff" class="input" readonly></td>
								<td class="td_left">진료과</td>
								<td class="td_right"><input type="text" name="department" id="department" class="input" readonly></td>
							</tr>
							<tr>
								<td class="td_left">환자명</td>
								<td class="td_right"><input type="text" name="resName" id="resName" class="input" readonly></td>
								<td class="td_left">청구 금액(원)</td>
								<td class="td_right"><input type="text" name="charge" class="input"></td>
							</tr>
							<tr>
								<td class="td_left" colspan="2">진료 내용</td>
								<td class="td_left" colspan="2">약 처방 내용</td>
							</tr>
							<tr class="bottom">
								<td colspan="2"><textarea name="deptContents" style="white-space:pre;"></textarea></td>
								<td colspan="2"><textarea name="prescription" style="white-space:pre;"></textarea></td>
							</tr>
							<tr>
								<td colspan="4" align="center">
									<input type="submit" value="저장" class="submit">
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
<script type="text/javascript">
    function resNoChange(){
    	var resNo = $("#resNo").val();
    	$.ajax({
    		url:'/doctor/historyRes.kh',
    		type : "get",
    		data: { "resNo" : resNo },
    		success : function(resOne) {		
 				$("#deptDate").val(resOne.deptDate);
				$("#deptStaff").val(resOne.deptStaff);
				$("#department").val(resOne.department);
				$("#resName").val(resOne.resName);
				$("#memberId").val(resOne.memberId);
				$("#doctorId").val(resOne.doctorId);
    		},
    		error : function() {
    			alter("ajax 실패");
    		}
    	})
    }
</script>	
</body>
</html>