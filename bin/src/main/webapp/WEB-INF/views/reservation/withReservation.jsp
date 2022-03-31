<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행서비스 예약</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/head.css">
<link rel="stylesheet" href="/resources/footer.css">
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
        height: 540px;
        padding: 20px;
    }
    .form_table tr {
        height: 45px;
    }
    .td_left {
        width: 200px;
        font-size: 16px;
        font-weight: 500;
        color: #5c5c5c;
    }
    .td_right {
    	width: 600px;
    }
    .input1{
    	width: 30px;
	}
    .form_table .input {
        height: 40px;
        width: 400px;
        border: 1.2px solid #b2bfca;
        border-radius: 5px;
        padding-left: 10px;
    }
    .input2{
    	display: inline-block;
    	padding: 10px 0.75em;
    	border: 1.2px solid #b2bfca;
        border-radius: 5px;
    }
    .input3{
    	display: inline-block;
    	border: 1.2px solid #b2bfca;
        border-radius: 5px;
      	padding : 10px 0.75em;
      	width: 250px;
        margin-left: -400px;
    }
    .input4{
    	display: inline-block;
    	padding: 10px 0.75em;
    	border: 1.2px solid #b2bfca;
        border-radius: 5px;
        margin-left : -110px;
        width: 300px;
    }
    
    .submit { 
        margin-top: 15px;
        margin-bottom: 10px;
        width: 170px;
        height: 40px;
        color: #fff;
        background-color: rgb(14, 74, 129);
        border: 0px;
        border-radius: 5px;
        font-size: 15px;
        cursor: pointer;
    }
    .select{
        border: 1.2px solid #b2bfca;
		border-radius: 5px;
	    width: 200px;
	    height: 45px;
    }
    label {
    	font-size: 15px;
        display: inline-block;
        padding: 10px .75em;
        color: #fff;
        line-height: normal;
        vertical-align: middle;
        background-color: rgb(50, 50, 50);
        cursor: pointer;
        border-radius: .25em;
    }
    input[type="file"] { /* 파일 필드 숨기기 */
        position: absolute;
        width: 1px; height: 1px;
        padding: 0; margin: -1px; 
        overflow: hidden;
        clip:rect(0,0,0,0); 
        border: 0;
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
                    <li><a href="/res.kh" class="btn_lnb_dep1" id="point">진료예약</a></li>
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
		<div id="content" class="sub">
			<div class="inner2">
				<div id="snb">
					<div class="tit_snb">
        				<div class="cate_name">진료예약</div>
    				</div>
    				<ul class="snb_nav">
    					<li><a href="/res/JoinView.kh" class="link_sb1">일반 예약</a></li>
    					<li><a href="/reservation/JoinView.kh" class="link_sb1" id="point">동행서비스 예약</a></li>
                        <c:if test="${empty sessionScope }">
                        	<li><a href="/res/type.kh" class="link_sb1">일반 예약 확인</a></li>
                        </c:if>
                        <c:if test="${not empty sessionScope }">
                        	<li><a href="/reservationView.kh" class="link_sb1">일반 예약 확인</a></li>
                        </c:if>
                        <c:if test="${empty sessionScope }">
                        	<li><a href="/reservation/type.kh" class="link_sb1">동행서비스 예약 확인</a></li>
    					</c:if>
    					<c:if test="${not empty sessionScope }">
    						<li><a href="/withReservationView.kh" class="link_sb1">동행서비스 예약 확인</a></li>
    					</c:if>
    					</ul>
			  </div>
				<div id="content_box">
					<div class="notice_page_title">
						<h2 class="tit_page">동행서비스 예약</h2>		
					</div>
					<p>환자정보 입력</p>
                    <div class="form_table">
                        <!-- 회원 -->
                        <c:if test="${not empty sessionScope}">
                            <form action="/reservationId/register.kh" method="post" enctype="multipart/form-data">
                                <table>
                                    <tr>
                                        <td class="td_left">진료과</td>
                                          <td>
	                                          <select title="진료과" onchange="depChange()" class="select" id="doctorDpt" name="department">
                                                  	<option value="" >선택</option>
	                                              <c:forEach items="${sList }" var="dpt">
	                                                <option value="${dpt }">${dpt }</option>
	                                              </c:forEach>
                                          	  </select>
                                          </td>
                                      </tr>
                                          <tr>
                                              <td class="td_left">희망 의료진</td>
                                              <td>
	                                              <select id="de" class="select" onchange="staffChange()">
	                                              <option value="">선택</option>
	                                              </select>
                                          </td>
                                      </tr>
                                        <input type="hidden" name="memberId" class="input" value="${loginUser.memberId }" readonly>
                                    	<input type="hidden" name="doctorId" id="doctorId" readonly>
                                        <input type="hidden" name="deptStaff" id="deptStaff" readonly>
                                    <tr>
                                        <td class="td_left"> 예약자명</td>
                                        <td><input type="text" name="resName" class="input" value="${loginUser.memberName }"></td>
                                    </tr>
                                    <tr>
                                        <td class="td_left"> 진료희망일자</td>
                                        <td><input type="date" name="deptDate" class="input"></td>
                                    </tr>
                                    <tr>
                                        <td class="td_left"> 진료희망시간</td>
                                        <td><input type="time" name="deptTime" class="input"></td>
                                    </tr>
                                    <tr>
                                        <td class="td_left"> 생년월일</td>
                                        <td><input type="date" name="birth" class="input" value="${loginUser.memberBirth }"></td>
                                    </tr>
                                    <tr>
                                        <td class="td_left"> 전화번호</td>
                                        <td><input type="text" name="phone" class="input" value="${loginUser.memberPhone }"></td>
                                    </tr>
                                    <tr>
                                        <td class="td_left"> 원하시는 위치 주소</td>
                                        <td> <input id="member_post"  type="text" placeholder="우편번호"  readonly  class="input2"></td>
                                        <td><input type="text" name="address" class="input3" id="member_addr" onclick="findAddr()" readonly></td>
  										&nbsp;<td><input type="text" placeholder="상세주소"  class="input4" name="address" ></td>
                                    </tr>
                                    <tr>
                                        <td class="td_left"> 별도인증 첨부</td>
                                        <td class="td_right">
                                        	<input type="text" id="fileName" class="input" readonly="readonly" placeholder="증빙자료(주민등록증, 수술진단서, 복지카드 등)를 첨부해주세요." readonly="readonly">
                                            <label for="ex_file">첨부 파일</label>
                                            <input id="ex_file" type="file" name="uploadFile" onchange="javascript: document.getElementById('fileName').value = this.value">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_left"> 보장구</td>
                                        <td>
                                            <input class="input1" type="checkbox" name="acc" value="휠체어">휠체어
                                            <input class="input1" type="checkbox" name="acc" value="목발">목발
                                            <input class="input1" type="checkbox" name="acc" value="지팡이">지팡이
                                            <input class="input1" type="checkbox" name="acc" value="보행보조기">보행보조기
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="submit" value="동행서비스 예약 신청"class="submit">
                                        </td>
                                    </tr>
                                </table>
                                </form>
                                </c:if>
                               <!-- 비회원 -->
                               <c:if test="${empty sessionScope}">	
                                    <form action="/reservation/register.kh" method="post"  enctype="multipart/form-data">
                                    <table>		
                                        <tr>
                                          <td class="td_left">진료과</td>
                                          <td>
	                                          <select title="진료과" onchange="depChange()" class="select" id="doctorDpt" name="department">
                                                  	<option value="" >선택</option>
	                                              <c:forEach items="${sList }" var="dpt">
	                                                <option value="${dpt }">${dpt }</option>
	                                              </c:forEach>
                                          	  </select>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="td_left">희망 의료진</td>
                                          <td>
                                           <select id="de" class="select" onchange="staffChange()">
                                           	<option value="">선택</option>
                                           </select>
                                          </td>
                                      </tr>
                                          <input type="hidden" name="doctorId" id="doctorId" readonly>
                                          <input type="hidden" name="deptStaff" id="deptStaff" readonly>
                                        <tr>
                                            <td class="td_left"> 예약자명</td>
                                            <td class="td_right"><input class="input" type="text" name="resName" placeholder="이름을 입력하세요."></td>
                                        </tr>
                                        <tr>
                                            <td class="td_left"> 진료희망일자</td>
                                            <td class="td_right"><input class="input" type="date" name="deptDate"></td>
                                        </tr>
                                        <tr>
                                            <td class="td_left"> 진료희망시간</td>
                                            <td class="td_right"><input class="input" type="time" name="deptTime"></td>
                                        </tr>
                                        <tr>
                                            <td class="td_left"> 생년월일</td>
                                            <td class="td_right"><input class="input" type="date" name="birth"></td>
                                        </tr>
                                        <tr>
                                            <td class="td_left">전화번호</td>
                                            <td class="td_right"><input class="input" type="text" name="phone"></td>
                                        </tr>
                                        <tr>
                                            <td class="td_left">원하시는 위치 주소</td>
                                              <td> <input id="member_post"  type="text" placeholder="우편번호"  readonly  class="input2"></td>
                                       		  <td><input type="text" name="address" class="input3" id="member_addr" onclick="findAddr()" readonly></td>
  											  &nbsp;<td><input type="text" placeholder="상세주소"  class="input4" name="address" ></td>
<!--                                             <td class="td_right"><input class="input" type="text" name="address"></td> -->
                                        </tr>
                                        <tr>
                                            <td class="td_left">별도인증 첨부</td>
                                            <td class="td_right">
                                                <input type="text" id="fileName" class="input" placeholder="증빙자료(주민등록증, 수술진단서, 복지카드 등)를 첨부해주세요." readonly="readonly">
	                                            <label for="ex_file">첨부 파일</label>
	                                            <input id="ex_file" type="file" name="uploadFile" onchange="javascript: document.getElementById('fileName').value = this.value">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_left">보장구</td>
                                            <td class="td_right">
                                                <input class="input1" type="checkbox" name="acc" value="휠체어">휠체어
                                                <input class="input1" type="checkbox" name="acc" value="목발">목발
                                                <input class="input1" type="checkbox" name="acc" value="지팡이">지팡이
                                                <input class="input1" type="checkbox" name="acc" value="보행보조기">보행보조기
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">
                                                <input type="submit" value="동행서비스 예약 신청"class="submit">
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                           	</c:if>
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
		function depChange(){
			var doctorDpt = $("#doctorDpt").val();
			var target = document.getElementById("de");
			$.ajax({
				url:'/reservation/JoinViewDoctor.kh',
				type : "get",
				data: { "doctorDpt" : doctorDpt },
				success : function(dList) {
					target.options.length=1;
					$.each(dList, function(index, item) {
		    			var opt= document.createElement("option");
		                opt.value= item.doctorId;
		                opt.innerHTML= item.doctorName;
		                target.appendChild(opt);
					})
				},
				error : function() {
					alter("ajax 실패");
				}
			})
		}
		function staffChange(){
			var doctorId = $("#de option:checked").val();
			var deptStaff = $("#de option:checked").text();
			$("#doctorId").val(doctorId);
			$("#deptStaff").val(deptStaff);
		}
		
		function findAddr(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        	
		        	console.log(data);
		        	
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var roadAddr = data.roadAddress; // 도로명 주소 변수
		            var jibunAddr = data.jibunAddress; // 지번 주소 변수
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('member_post').value = data.zonecode;
		            if(roadAddr !== ''){
		                document.getElementById("member_addr").value = roadAddr;
		            } 
		            else if(jibunAddr !== ''){
		                document.getElementById("member_addr").value = jibunAddr;
		            }
		        }
		    }).open();
		}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>
