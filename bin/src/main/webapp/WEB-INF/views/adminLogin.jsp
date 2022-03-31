<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>로그인</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/footer.css">
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
        }
        header {
            padding-top: 120px;
            font-size: 25px;
            color: rgb(14, 74, 129);
            text-align: center;
        }
        main {
            display: flex;
            justify-content: center;
            height: 64%;
        }
            .tr-div {
                position: relative;
                border-radius: 5px;
                border: 1px solid rgb(150, 150, 150);
            }
                .type {
                    text-align: center;
                }
                main i {
                    position: absolute;
                    font-size: 30px;
                    top: 11px;
                    left: 19px;
                    color: rgb(80, 80, 80);
                }
                .input {
                    border: 0;
                    margin-left: 60px;
                    width: 440px;
                    height: 50px;
                    font-size: 17px;
                }
            .tr-btn {
                height: 100px;
            }
                .btn {
                    width: 500px;
                    height: 50px;
                    font-size: 20px;
                    background-color: rgb(14, 74, 129);
                    color: #fff;
                    border: 0;
                    border-radius: 5px;
                }
    </style>
</head>
<body>
    <header>
	    <h1>HW병원</h1>
    </header>
    <main>
		<form action="/adminLogin.kh" method="post">
			<table>
				<tr>
					<td class="tr-div">
                        <i class="fas fa-user"></i>
                        <input type="text" name="id" placeholder="아이디" class="input">
                    </td>
				</tr>
				<tr>
					<td class="tr-div">
                        <i class="fas fa-key"></i>
                        <input type="password" name="pw" placeholder="비밀번호" class="input">
                    </td>
				</tr>
				<tr class="tr-btn">
					<td colspan="2"><input type=submit value="로그인" class="btn"></td>
				</tr>
			</table>
		</form>
    </main>
    <footer>
		<div class="footer_tit">서울특별시 중구 남대문로 120 대일빌딩 2F, 3F (T: 1544-9970) / F: 02-722-0858)</div>
		<div id="footer_bottom">Copyright ⓒ 1988-2022 HW Hospital All Right Reserved</div>
	</footer>
</body>
</html>