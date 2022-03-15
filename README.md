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
* 문의/건의 타임라인을 통해 답변 유무 확인 가능

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
    + 일반 예약
    + 동행서비스 예약
    + 일반/동행서비스 예약 확인
  + 진료이력
    + 마이페이지
      + 과거 진료받은 이력 조회
      + 의사는 환자의 진료 이력 입력, 삭제 가능

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
      + 일반 예약
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
        + 의사는 환자의 진료 이력 입력, 삭제 가능


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
![마이페이지 진료이력](https://user-images.githubusercontent.com/56354642/158286326-f7240ad0-9020-4f8e-aa8c-e2d12d891bf8.PNG)

![마이페이지 문의건의 타임라인](https://user-images.githubusercontent.com/56354642/157789676-ca2b79cc-f0b7-4331-ac64-3860eb2f176a.PNG)

![마이페이지 회원정보수정](https://user-images.githubusercontent.com/56354642/157789678-914eb9a5-8393-4218-b7ad-48b664c862ef.PNG)

![마이페이지 회원탈퇴](https://user-images.githubusercontent.com/56354642/157789679-0d5e3d65-7e25-4327-a617-1c1d8d195f18.PNG)

### 8. 관리자페이지
![관리자 공지사항 관리](https://user-images.githubusercontent.com/56354642/157787704-5cc0e7b5-b515-40ec-9695-1bdcb6163056.PNG)

![관리자 공지사항관리2](https://user-images.githubusercontent.com/56354642/157789033-70c07c8a-960a-40a6-9065-11419c727d6b.PNG)

![관리자 일반예약 관리](https://user-images.githubusercontent.com/56354642/157787675-3bdfa4c8-5cb8-4554-bac5-6127a8cc1127.PNG)

![관리자 동행서비스 예약관리](https://user-images.githubusercontent.com/56354642/157787683-649c58e3-3eef-4091-a51f-d10f50040206.PNG)

![관리자 문의건의 관리](https://user-images.githubusercontent.com/56354642/157788405-20221c5f-0793-4777-bb82-956742f6df06.PNG)

### 9. 진료이력
![진료이력 화면](https://user-images.githubusercontent.com/56354642/158286319-c3fda44a-8f1d-4cba-8771-0a3da3bcee86.PNG)

![진료이력 상세](https://user-images.githubusercontent.com/56354642/158286322-7606484b-8d9c-41a1-a225-cdbcf93f5e3b.PNG)

![진료이력 등록](https://user-images.githubusercontent.com/56354642/158286324-debc7039-544f-4a86-a0d7-b6fdc34d0b91.PNG)

## Document

### 1. 유스케이스

![UML](https://user-images.githubusercontent.com/56354642/157690257-56a9372b-7405-4c17-b734-712b13e12e91.PNG)


### 2. ERD

![ERD](https://user-images.githubusercontent.com/56354642/158345127-806e3af8-1179-45ac-896f-e8da06a6af6a.PNG)


### 3. Class Diagram

#### 일반 회원
![일반 회원](https://user-images.githubusercontent.com/88810856/158339457-a025c9ec-cea8-48f7-b6b5-56ca89324ed6.jpg)

#### 의사
![의사](https://user-images.githubusercontent.com/88810856/158339567-994b9ac6-5b28-4d66-8162-f77b18e62e0f.jpg)

#### 일반 예약
![일반 예약](https://user-images.githubusercontent.com/88810856/158339606-8b1c7731-134a-489d-a049-e120cf875163.jpg)

#### 동행서비스 예약
![동행서비스 예약](https://user-images.githubusercontent.com/88810856/158339645-5ecc6a5d-f493-420d-b5cc-b015a241f970.jpg)

#### 진료 이력
![진료 이력](https://user-images.githubusercontent.com/88810856/158339685-ca68f606-c8ee-451b-a1df-7ec7a605f319.jpg)

#### 공지사항
![공지사항](https://user-images.githubusercontent.com/88810856/158339712-dd28a427-e55d-4053-acc1-71d53552ac3a.jpg)

#### 문의/건의
![문의/건의](https://user-images.githubusercontent.com/88810856/158339740-e17763d0-b8a7-448d-a971-e4ef68c881d2.jpg)


### 4. Sequence Diagram

#### 4-1. 일반 회원

##### 회원가입
![1  일반회원가입](https://user-images.githubusercontent.com/88810856/158345444-3126632f-5283-42e4-9405-4911cbe0dc0c.jpg)

##### 아이디 중복 체크
![2  아이디 중복 체크](https://user-images.githubusercontent.com/88810856/158345498-6656ffbb-87de-44cf-9e85-15908730a7f9.jpg)

##### 로그인
![3  일반회원로그인](https://user-images.githubusercontent.com/88810856/158345515-94f5b6b2-4918-4c13-ace8-86539835c7f4.jpg)

##### 아이디 찾기
![4  아이디찾기](https://user-images.githubusercontent.com/88810856/158345516-e45459c5-3266-43bd-93f8-22e64b735713.jpg)

##### 비밀번호 찾기
![5  비밀번호 찾기](https://user-images.githubusercontent.com/88810856/158345519-c4222543-8ba7-4adf-98ff-4fcc1cc221eb.jpg)

##### 회원정보수정
![6  회원정보수정](https://user-images.githubusercontent.com/88810856/158345523-eb31b244-d2b6-46c8-911f-aa3f75db7011.jpg)

##### 회원탈퇴
![7  회원탈퇴](https://user-images.githubusercontent.com/88810856/158345524-65399ee6-0528-4514-bc84-6e099b3935d2.jpg)

#### 4-2. 의사

##### 회원가입
![8  의사회원가입](https://user-images.githubusercontent.com/88810856/158345527-34d9f478-2861-4a97-a8b0-44c002844d38.jpg)

##### 아이디 중복 체크
![9  의사아이디중복체크](https://user-images.githubusercontent.com/88810856/158345531-e321307b-46d4-478a-8daf-f62a10228c42.jpg)

##### 로그인
![10  의사로그인](https://user-images.githubusercontent.com/88810856/158345532-dde1fef9-a93e-4b7c-aec3-cf990d35cf40.jpg)

##### 아이디 찾기
![11  의사아이디찾기](https://user-images.githubusercontent.com/88810856/158345534-061b7163-1147-479a-9241-5361cc0d5a78.jpg)

##### 비밀번호 찾기
![12  의사비밀번호찾기](https://user-images.githubusercontent.com/88810856/158345535-1206f5ff-36ee-4f0f-a95f-a9dca1bc4b61.jpg)

##### 회원정보수정
![13  의사회원정보수정](https://user-images.githubusercontent.com/88810856/158345538-e68cdcce-a90a-48d7-85ba-04763773fa69.jpg)

##### 회원탈퇴
![14  의사회원탈퇴](https://user-images.githubusercontent.com/88810856/158345540-2cb36762-2762-453f-9df1-dffadcea2018.jpg)

#### 4-3. 일반 예약

##### 일반 예약 등록(회원)
![1  일반 예약 등록(회원)](https://user-images.githubusercontent.com/88810856/158346003-563a0117-926c-4c6f-8434-6cd78bf03671.jpg)

##### 일반 예약 등록(비회원)
![2  일반 예약 등록(비회원)](https://user-images.githubusercontent.com/88810856/158346007-a6bd59cc-0a19-462d-a03b-e78479821eac.jpg)

##### 일반 예약 조회(로그인 안 한 회원)
![3  일반 예약 조회(회원-로그인X)](https://user-images.githubusercontent.com/88810856/158346010-8b7efaaf-cd51-438a-a8c0-a8e94987ea45.jpg)

##### 일반 예약 조회(비회원)
![4  일반 예약 조회(비회원)](https://user-images.githubusercontent.com/88810856/158346012-4177dd89-5975-42ae-a851-e9a999561387.jpg)

##### 일반 예약 조회(로그인 한 회원)
![5  일반 예약 조회(회원)](https://user-images.githubusercontent.com/88810856/158346014-6508624c-16f1-4662-89fa-fd50f2692e12.jpg)

##### 일반 예약 취소
![6  일반 예약 취소](https://user-images.githubusercontent.com/88810856/158346018-c8478594-8a85-471d-9aab-0cd491d85661.jpg)

##### 일반 예약 조회(관리자)
![7  일반 예약 조회(관리자)](https://user-images.githubusercontent.com/88810856/158346019-4492d007-079e-4b01-b395-8177d7028aa9.jpg)

#### 4-4. 동행서비스 예약

##### 동행서비스 예약 등록(회원)
![8  동행 예약 등록(회원)](https://user-images.githubusercontent.com/88810856/158346022-485c9586-d71a-4408-bccf-6a032258c5b4.jpg)

##### 동행서비스 예약 등록(비회원)
![9  동행 예약 등록(비회원)](https://user-images.githubusercontent.com/88810856/158346025-19382974-f964-447f-84dc-78382c5f74f8.jpg)

##### 동행서비스 예약 조회(로그인 안 한 회원)
![10  동행 예약 조회(회원-로그인X)](https://user-images.githubusercontent.com/88810856/158346031-a8697898-9ba3-414c-b72b-8becf0dc91b9.jpg)

##### 동행서비스 예약 조회(비회원)
![11  동행 예약 조회(비회원)](https://user-images.githubusercontent.com/88810856/158346034-5a56f1a7-f5a2-4a6e-bb56-2a6017d4a14c.jpg)

##### 동행서비스 예약 조회(로그인 한 회원)
![12  동행 예약 조회(회원)](https://user-images.githubusercontent.com/88810856/158346037-a4d312a8-3c09-4608-b5f2-412d2b223945.jpg)

##### 동행서비스 예약 취소
![13  동행 예약 취소](https://user-images.githubusercontent.com/88810856/158346038-c45ba4b5-bb38-41d5-9f2c-6f826db76470.jpg)

##### 동행서비스 예약 조회(관리자)
![14  동행 예약 조회(관리자)](https://user-images.githubusercontent.com/88810856/158346041-f6391a8e-e69b-4e96-b428-027c380db71e.jpg)

#### 4-5. 진료 이력

##### 진료 이력 등록(일반 예약)
![1  일반진료이력 등록](https://user-images.githubusercontent.com/88810856/158346478-ec120f65-7cc9-4a07-9ea9-29d44becfccd.jpg)

##### 진료 이력 등록(동행서비스 예약)
![2  동행서비스 진료이력 등록](https://user-images.githubusercontent.com/88810856/158346480-5f85e501-f9ed-478a-a2e6-b74a3d579f8b.jpg)

##### 진료 이력 조회(의사)

![3  의사 진료이력 조회](https://user-images.githubusercontent.com/56354642/158356313-421bb1cb-4c53-49bc-9214-8cca68fd9001.jpg)

##### 진료 이력 삭제
![4  진료이력 삭제](https://user-images.githubusercontent.com/88810856/158346484-c2105c11-dec8-4a8d-ac5b-9875629276a5.jpg)

##### 진료 이력 조회(회원)
![5  회원 진료이력 조회](https://user-images.githubusercontent.com/88810856/158346485-bdc8ec5e-ef0e-4bc4-a543-0bc32348fef7.jpg)

#### 4-6. 공지사항

##### 공지사항 등록
![1  공지사항 등록](https://user-images.githubusercontent.com/88810856/158346686-a99624d5-a169-4b6f-b9cd-3679786d4e59.jpg)

##### 공지사항 수정
![2  공지사항 수정](https://user-images.githubusercontent.com/88810856/158346688-284c271d-6a12-4487-a22c-2fa1c028bbfb.jpg)

##### 공지사항 삭제
![3  공지사항 삭제](https://user-images.githubusercontent.com/88810856/158346690-1d63b0a0-7e80-4634-b2fd-a5340fff3d1e.jpg)

##### 공지사항 조회
![4  공지사항 조회](https://user-images.githubusercontent.com/88810856/158346695-b212e354-e13f-48fe-8320-52eefc0124ed.jpg)

#### 4-7. 문의/건의

##### 문의/건의 등록
![1  문의건의등록](https://user-images.githubusercontent.com/88810856/158346792-02b04240-9f91-490e-a8e8-1d48bb7a743a.jpg)

##### 문의/건의 수정
![2  문의건의수정](https://user-images.githubusercontent.com/88810856/158346795-369441e9-697b-4541-948c-e589fcddf9bb.jpg)

##### 문의/건의 삭제
![3  문의건의삭제](https://user-images.githubusercontent.com/88810856/158346797-35ad47bf-309b-4a9d-8912-a04977c404e5.jpg)

##### 문의/건의 조회
![4  문의건의조회](https://user-images.githubusercontent.com/88810856/158346802-f6b126a7-b36f-4c0a-8f85-6ae91bc82c3b.jpg)

##### 문의/건의 타임라인
![5  문의건의타임라인](https://user-images.githubusercontent.com/88810856/158346803-8466499b-672c-4ee6-bbf4-6abe7079738a.jpg)

##### 문의/건의 답변 등록
![6  문의건의답변등록](https://user-images.githubusercontent.com/88810856/158346805-716fbca1-e476-4d18-86d0-71da92dec117.jpg)

##### 문의/ 건의 답변 수정
![7  문의건의답변수정](https://user-images.githubusercontent.com/88810856/158346808-b7411a4a-9495-4b92-a74e-667246d18027.jpg)
