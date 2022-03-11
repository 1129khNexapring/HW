# HW
##### 팀원 : 권지혜(팀장), 김대광, 안준영, 오혜성, 이융경, 정은진


## Contents
### [1. 개요](#개요)
### [2. 설계의 주안점](#설계의-주안점)
### [3. 사용기술 및 개발환경](#사용기술-및-개발환경)
### [4. 프로젝트 기능 구현](#프로젝트-기능-구현)
### [5. 주요 기능](#주요-기능)
### [6. Document](#Document)


## 개요
* 병원 홈페이지를 통해 온라인 예약뿐만 아니라 다양한 정보를 확인하고 특별한 서비스 이용
* 코로나19로 인해 병원 방문객이 많고 거리두기가 필수인 상황에서 병원 홈페이지를 통해 편리함을 제공

## 설계의 주안점
* 일반회원 비회원 진료(동행서비스) 예약
* 동행서비스로 차별화
* 간단한 예약절차(비회원도 예약 가능)
* 일반회원과 의사회원으로 회원가입
* 의사는 일반회원 정보를 받아 환자 진료 이력 확인 및 작성
* 로그인 후 진료 이력 확인 가능
* 회원 문의/건의 게시판 작성 및 관리자 답변 작성
* 문의/건의 타임라인을 통해 답변유무 확인 가능

## 사용기술 및 개발환경
|Category | Detail |
| ------- | ------ |
| FrontEnd | HTML5, JS, CSS3, JQuery |
| BackEnd  | Java(JDK 1.8), Spring/JSP |
| OS       | Windows 10, 11 |
| IDE      | Eclipse, Visual Studio Code |
| Server   | Apatch Tomcat(v8.5) |
| DataBase | Oracle(11g) - SQL Developer |

![개발환경](https://user-images.githubusercontent.com/56354642/157645005-18e1c0ee-df0c-44ca-9d7d-4907eb3c25c1.PNG)


## 프로젝트 기능 구현
* 권지혜
  + 회원가입 페이지
  + 마이페이지
    + 회원정보 수정
    + 회원 탈퇴
  + 진료 예약
    + 일반예약
    + 동행서비스 예약
    + 일반/동행서비스 예약 확인

* 김대광
  + 문의/건의게시판
    + 게시판 글 작성
      + 회원만 글 작성 가능
    + 답글 작성
      + 관리자만 답글 작성 가능
  + 문의/건의 타임라인
    +  답변유무 조회
 
* 안준영
  + 메인 페이지
  + 공지사항 게시판
    + 최신순 정렬 페이징
    + 관리자 권한만 공지사항 게시글 작성 가능
    + 마이페이지
       + 관리자만 게시글 수정, 삭제 가능
  + 아이디/비밀번호 찾기

* 오혜성
   + 의사 회원가입 페이지
   + 마이페이지
      + 회원정보 수정
      + 회원 탈퇴
   + 진료 예약
      + 일반예약
      + 동행서비스 예약
      + 일반/동행서비스 예약 확인


* 이융경
   + 진료안내
      + 진료과
      + 의료진 소개
   + 병원안내
      + 찾아오시는 길
   + 진료이력
      + 마이페이지
        + 과거 진료받은 이력 조회
        + 의사는 환자의 진료 이력 입력 가능


 * 정은진
    + 문의/건의게시판
      + 게시판 글 작성
        + 회원만 글 작성 가능
      + 답글 작성
        + 관리자만 답글 작성 가능
    + 문의/건의 타임라인
      +  답변유무 조회       


## 주요 기능

### 1. 메인화면
![메인화면](https://user-images.githubusercontent.com/56354642/157616972-3f0724b1-9d69-4d78-802a-0093c924cc84.PNG)

### 2. 로그인 화면
![로그인 화면](https://user-images.githubusercontent.com/56354642/157618338-d696f48c-0929-4095-8f23-e7f16fc7da00.PNG)

### 3. 회원가입
![회원가입 화면](https://user-images.githubusercontent.com/56354642/157618636-e7ccb7e0-c365-4042-a9ab-acf3ae91cf85.PNG)

![일반회원가입2](https://user-images.githubusercontent.com/56354642/157619204-a195cfcb-f29c-4559-a5f3-6e211a24b80c.PNG)

![일반회원가입](https://user-images.githubusercontent.com/56354642/157618847-9904bd1b-ae28-4927-b147-bf628ec680b4.PNG)

![의사 회원가입 화면](https://user-images.githubusercontent.com/56354642/157620565-1db17790-2b34-4ae7-a8ce-c40541208683.PNG)

### 4. 아이디/비밀번호 찾기
![아이디 비밀번호 찾기 화면](https://user-images.githubusercontent.com/56354642/157621045-9c404c30-083d-4085-83f2-5572b7dec6de.PNG)

![아이디 비밀번호 찾기2](https://user-images.githubusercontent.com/56354642/157621733-32de9487-838a-4a8f-ae2b-6c2b289de4a5.PNG)

![아이디 비밀번호 찾기3](https://user-images.githubusercontent.com/56354642/157621781-386ead6f-4db9-4ec8-90d2-381f8c7bb283.PNG)

### 5. 진료예약

#### 5-1. 일반예약
![진료예약 화면](https://user-images.githubusercontent.com/56354642/157622687-2572bd44-ccdd-4ebe-ac4b-58d6ae8362de.PNG)

![회원일반예약](https://user-images.githubusercontent.com/56354642/157630197-c11f08ef-59d9-48e9-8fe2-cb0f3e9f43be.PNG)

![비회원일반예약 ](https://user-images.githubusercontent.com/56354642/157622734-9bfa2fe9-b580-4477-a7db-83eb83e2ecc6.PNG)

![비회원일반예약조회](https://user-images.githubusercontent.com/56354642/157630755-c6bd99ba-2aa4-43f5-b493-66d6bfa0b719.PNG)

![일반예약 확인](https://user-images.githubusercontent.com/56354642/157625190-247c23e4-7b38-4a93-83f2-c11dc266faaf.PNG)

#### 5-2. 동행서비스 예약


![비회원 동행서비스 예약](https://user-images.githubusercontent.com/56354642/157630876-5d21d947-8229-4876-a892-a030581bf88a.PNG)

![회원 동행서비스예약](https://user-images.githubusercontent.com/56354642/157632172-f3df26a6-3583-44ff-a248-b0daf6415bb5.PNG)

![동행서비스 예약조회 선택](https://user-images.githubusercontent.com/56354642/157634539-b2b92158-b05d-4756-82aa-36bd17c51d92.PNG)


![비회원 동행서비스 예약조회](https://user-images.githubusercontent.com/56354642/157633816-96ef25ab-85a1-4427-8d5a-3dd877452d7a.PNG)


![동행서비스 예약확인](https://user-images.githubusercontent.com/56354642/157632922-4edadf2d-89f9-4fca-b6fe-a6bc47125f1b.PNG)


### 6. 고객센터

![고객센터 공지사항](https://user-images.githubusercontent.com/56354642/157787667-73b90c74-6e5f-4beb-9c3e-704c1d330972.PNG)

![고객센터 문의건의 게시판](https://user-images.githubusercontent.com/56354642/157788392-5b68740f-80ca-4690-8832-ebd2c3421477.PNG)


### 7. 마이페이지
진료이력 이미지 추가

![마이페이지 문의건의 타임라인](https://user-images.githubusercontent.com/56354642/157789676-ca2b79cc-f0b7-4331-ac64-3860eb2f176a.PNG)

![마이페이지 회원정보수정](https://user-images.githubusercontent.com/56354642/157789678-914eb9a5-8393-4218-b7ad-48b664c862ef.PNG)

![마이페이지 회원탈퇴](https://user-images.githubusercontent.com/56354642/157789679-0d5e3d65-7e25-4327-a617-1c1d8d195f18.PNG)




### 8. 관리자페이지

![관리자 공지사항 관리](https://user-images.githubusercontent.com/56354642/157787704-5cc0e7b5-b515-40ec-9695-1bdcb6163056.PNG)

![관리자 공지사항관리2](https://user-images.githubusercontent.com/56354642/157789033-70c07c8a-960a-40a6-9065-11419c727d6b.PNG)

![관리자 일반예약 관리](https://user-images.githubusercontent.com/56354642/157787675-3bdfa4c8-5cb8-4554-bac5-6127a8cc1127.PNG)

![관리자 동행서비스 예약관리](https://user-images.githubusercontent.com/56354642/157787683-649c58e3-3eef-4091-a51f-d10f50040206.PNG)

![관리자 문의건의 관리](https://user-images.githubusercontent.com/56354642/157788405-20221c5f-0793-4777-bb82-956742f6df06.PNG)



## Document

1. 유스케이스

![UML](https://user-images.githubusercontent.com/56354642/157690257-56a9372b-7405-4c17-b734-712b13e12e91.PNG)


2. ERD

![ERD](https://user-images.githubusercontent.com/56354642/157687792-e3119771-d33c-45c5-bc64-86c413a2198d.PNG)
