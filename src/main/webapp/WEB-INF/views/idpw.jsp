<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/resources/head.css">
    <link rel="stylesheet" href="/resources/footer.css">
    <title>아이디/비밀번호 찾기 선택</title>
    <style>
        #content{
            height: 350px;
        }
            #content1{
                overflow: auto;
                height: inherit;
                width: 350px;   
                float: left;
                border: solid 3px;
                border-top-left-radius:2em;
                border-top-right-radius:2em;
                border-bottom-right-radius:2em;
                border-bottom-left-radius:2em;
                border-color:  rgb(14, 74, 129);
                margin-left: 500px;
                margin-top: 80px;
                position: absolute;
            }
            #content1 div {
                margin-top: 25px;
            }
            .type{
                font-size: 25px;
                color: rgb(14, 74, 129);
                font-weight: bold;
                margin-left: 30px;
            }
                #content1-layer1{
                    height: 200px;
                    width: 50%;

                    float: left;
                }
                
                    #addperson{
                        margin-top: 50px;
                        margin-left: 50px;
                        font-size: 80px;
                    }
                #content1-layer2{
                    height: 200px;
                    width: 50%;
            
                    float: left;
                }
                    #icon{
                        margin-right: 25px;
                        font-size: 150px;
                        margin-top: 10px
                		
                    }
            
            #content2{
                overflow: auto;
                height: inherit;
                width: 350px;
                float: left;
                border: solid 3px;
                border-top-left-radius:2em;
                border-top-right-radius:2em;
                border-bottom-right-radius:2em;
                border-bottom-left-radius:2em;
                border-color:  rgb(14, 74, 129);
                margin-left: 1000px;
                margin-top: 80px;
                position: absolute;
            }
            #content2 div {
                margin-top: 25px;
            }
            #content2-layer1{
                    height: 200px;
                    width: 50%;
         
                    float: left;
                }
                    #addperson2{
                        margin-top: 50px;
                        margin-left: 50px;
                        font-size: 80px;
                    }
                #content2-layer2{
                    height: 200px;
                    width: 50%;
            
                    float: left;
                }
                    #icon2{
                        margin-right: 25px;
                        font-size: 150px;
                        margin-top: 10px
                
                    }
        .member{
				width: 1100px;
				font-size: 40px;
				margin-top: 50px;
				margin-right: 300px;
				margin-left: 400px;
				border-bottom: 1px solid #b2bfca;
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
                        <a href="main.kh">HW병원</a>
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
        <div id="container">
	        <div class="member">아이디/비밀번호 찾기</div>
	        <div id="content">
	            <div id="content1">
	                <div class="type">
	                    <p>일반 회원</p>
	                </div>
	                <div id="content1-layer1">
	                    <span class="material-icons" id="addperson">
	                        person_add
	                    </span>
	                </div>
	                <div id="content1-layer2">
	                    <span class="material-icons" id="icon">
	                        wysiwyg
	                    </span>
	                </div>
	                <div id="btn">
	                    <button class="btn" onclick="location.href='/find_mem_form.kh'">선택</button>
	                </div>
	            </div>    
	            <div id="content2">
	                <div class="type">
	                    <p>의사</p>
	                </div>
	                <div id="content2-layer1">
	                    <span class="material-icons" id="addperson2">
	                        contacts
	                    </span>
	                </div>
	                <div id="content2-layer2">
	                    <span class="material-icons" id="icon2">
	                        wysiwyg
	                    </span>
	                </div>
	                <div id="btn">
	                    <button class="btn" onclick="location.href='/find_doc_form.kh'">선택</button>
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