# On/Off :: KakaoMap API를 활용한 Open-Close 시스템
> 주변의 열려있는 가게를 한눈에 볼 수 있는 프로그램


<div>
<img src="https://user-images.githubusercontent.com/53467948/74467119-d49bb500-4edb-11ea-9575-360625fc4fe0.jpg" width="600">
</div>

> ### Link : [PPT(구글 스프레드시트) 링크](https://docs.google.com/presentation/d/1ua3yVV3cQ4R6jJ8eg1PUO_HUmLhm5Kxz4lcy16sBayM/edit?usp=sharing)

--------
## 📖 Introduction
> - "친구들이랑 모여 점심을 먹을까 하는데, 지금 위치에서 가장 가까운 오픈 상점은 어디일까?"      
> - "이 가게 평가가 어떨까? 나도 간단한 리뷰를 쓰고 싶은데..."      
> - "개업했는데 규모가 작고 홍보 수단도 없어서 손님이 적어..많이 방문할 수 있도록 홍보하고 싶어!"   


**영세한 상점**은 대형 포털 등에 정보를 올리기 쉽지 않아 생존할 다른 방법이 필요하고,  
동네 주민들은 **지금 당장 방문 가능한 가게**를 편하게 찾을 수단이 필요한 시점!


이런 욕구를 해소하기 위해 **Open-Close 프로젝트**를 시작했습니다.


* 손쉽게 주변의 **열린 가게**를 검색할 수 있습니다.  
* 가게 **평점**과 **리뷰**를 작성할 수 있습니다.  
* 마음에 드는 가게는 **'좋아요'나 '즐겨찾기'를 통해 북마크**할 수 있습니다.
* 이동식 가게(푸드트럭 등)를 고려하여 **손쉽게 주소를 변경**할 수 있게 개발했습니다.

------------

## :electric_plug: Tech used
> Site Mesh 및 부트스트랩를 이용하여 반응형 웹으로 설계  
> MVC 모델을 적용하여 Model-View-Controller를 분리  
> 여러 라이브러리를 적용하여 개발시간을 단축하고 표준화하여 유지 보수성을 높임


**개발 환경**
|분류|내용|
|---|-------------|
|개발 언어|BootStrap4, HTML5, Java, JavaScript, jQuery, Ajax, CSS|
|데이터베이스|Oracle Database Express Edition 11g Release 2|
|서버|TOMCAT 8.5|
|IDE|Eclipse, SQL Developer|
|형상관리|GitHub|

**사용 API**  
- Kakao MAP API (https://developers.kakao.com/SE/apidocs/)  
- Daum 우편번호 API (http://postcode.map.daum.net/guide)  
- JavaX.mail 인증

---------

## :camera: Screen Shot

#### 1. 메인 화면/가게 검색
<div>
<img src="https://user-images.githubusercontent.com/53467948/74476247-5267bc80-4eec-11ea-8bad-18bc1bdf5bff.jpg" width="600">
</div>
<div>
<img src="https://user-images.githubusercontent.com/53467948/74476254-5562ad00-4eec-11ea-9d08-666c916f1279.jpg" height="200">
<img src="https://user-images.githubusercontent.com/53467948/74476258-572c7080-4eec-11ea-9fbb-f359d7bc547d.jpg" height="200">
</div>

#### 2. 가게 상세 정보 및 리뷰
<div>
<img src="https://user-images.githubusercontent.com/53467948/74476966-c48cd100-4eed-11ea-806d-77591e8713f7.jpg" width="500">
</div>

#### 3. My 메뉴
<div>
<img src="https://user-images.githubusercontent.com/53467948/74476278-614e6f00-4eec-11ea-92ba-119e12872824.jpg" height="300">
<img src="https://user-images.githubusercontent.com/53467948/74476288-66abb980-4eec-11ea-9e7c-ac3744e2f4d1.jpg" height="300">
</div>

#### 4. 관리자 메뉴
<div>
<img src="https://user-images.githubusercontent.com/53467948/74477677-11bd7280-4eef-11ea-988c-b146a356765f.png" width="280">
<img src="https://user-images.githubusercontent.com/53467948/74477686-141fcc80-4eef-11ea-8d52-455fb7fa205a.png" width="280">
<img src="https://user-images.githubusercontent.com/53467948/74477684-13873600-4eef-11ea-8ad1-75265bd231ba.png" width="280">
</div>

-----------

