<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OneDayClass</title>
<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- w3schools css 라이브러리 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style type="text/css">

#menudiv{
 	align-content: center; 
	background: thistle;
	padding-left: 7%;
}
#minilist{

list-style: none;
 font-weight: bold;
 white-space:nowrap;
 width:300px;
}
#minilist > li{
	float:left;
	
}


.navst{
	list-style-type: none;
	/* 기본여백 제거하기*/
	padding:0;
	margin:0 auto;
	width: 900px;
	white-space: nowrap;
}
/* 메뉴 항목 영역 */
.navst > li{
	/* 수평으로 일렬로 배치하기 */
	float:left;
	padding:20px 0;
	line-height: 5px;
	
	border-right: 1px solid white;
	/*내용물이 <li>항목보다 크면 보이지 않도록 잘라내기  */
/* 	overflow:hidden; */
	/* 외부여백 링크클릭 안되는 영역, 다른 a와 구분되도록 만든다 */
	margin:0 1px;
	/* 자식요소의 기준위치로 설정하기 */
	position:relative;
	padding:10px 15px;
	z-index: 999;
}
.navst>li>a{
	color:white;
	text-decoration: none;
	font-family: "돋움",dotum,sans-serif;
	font-weight:bold;
}
.navst>li>a:hover{
	color:gray;
	background:thistle;
}
.navst > li> ul{
	/*Html 계층구조에서 빼는 설정  */
	/* 부모요소인 li태그의 컨텐츠영역을 차지하지 않도록 만들기 */
	position:absolute;
	/* 서브메뉴의 위치 조절 */
	left:0;
	list-style-type: none;
	padding:0;
	margin-top:10px;
	width:200px;
}
.navst > li >ul >li{
	background: white;
	/* 서브메뉴는 평소에 안보이도록 설정하기 */
	/* 방법1.display하지 않는다 */
/* 	display: none; */
	/* 방법2.내용물의 글자크기 높이를 모두0 으로 한다 */
 	line-height:0;
	height:0;
	font-size:0; 
	padding-left:10px;
}
.navst>li:hover>ul>li{
	/* 방법1에 대한 처리 */
	/* display:list-item; */
	/*방법 2에대한 처리  */
	line-height:40px;
	height: 40px;
	font-size: 14px;
	transition:height 1s;
}
/* 서브메뉴의 링크 텍스트 */
.navst>li>ul>li>a{
	background: white;
	color:gray;
	text-decoration:none;
	display:block;
/* 	margin:1px; */
}
.navst>li>ul>li>a:hover {
	color:gray;
	font-weight: bolder; 
	transition:color 1s,background-color 1s;
}

.container1 {
    width: 440px;
    float: left; 
    position: absolute;
    top: 39%;
    left: 20%; 
}

#headerlogo{
	overflow: hidden;
/* 	margin-left: 100px; */
	position: absolute;
	bottom: -41px;
/* 	left: 5%; */
	float:left;
}
.logo{
	height:100px;
	overflow: hidden;
	white-space: nowrap;
	position: relative;
	width:1400px;
	
}

.chart{
	float:left;
	position: absolute;
    left: 55%; 
    top: 45%;
}

#sizeup{
	font-size: 25px;
}

#lojinjoin{
	float:left;
	padding:20px 0;
	line-height: 5px;
	position:absolute;
	right: 16%;
	top : 0px;
	width:100px;
	
}

.wish{
	position:absolute;
	right: 26%;
	top : 53px;
	width:100px;
	text-align: center;
}

.cart{
	position:absolute;
	right:21%;
	top : 53px;
	width:100px;
	text-align: center;
}

.aNone {
	text-decoration: none;
	color: black;
}

.aNone:visit{
   text-decoration: none;
   color: black;
}

.aNone:hover{
   text-decoration: none;
   color: black;
}

</style>

<style type="text/css">

</style>

</head>
<body>

<div class="container"> <!-- 가운데 오게 하기  -->
<br>
<div class="logo">
<a href="/main"><img id="headerlogo" src="/resources/img/logo2.png" width="200" height="200"></a>

   <!-- 검색창 -->
   <div class="container1">
      <div class="row">
         <div class="col-md-6 col-md-offset-3"></div>
      </div>
      <div class="row">
         <div width="10px;">
            <form action="${servlet}product&command=searchByKeyword&pageNo=1" method='post'
               class="search-form">
               <div class="has-feedback">
                  <label for="search" class="sr-only">Search</label> <input
                     type="text" class="form-control" name="keyword" id="search"
                     placeholder="상품명 또는 카테고리 입력"> <span
                     class="glyphicon glyphicon-search form-control-feedback"></span>
               </div>
            </form>
         </div>
      </div>
   </div>
   
   <div class="chart"><b>1</b> 인기 클래스 top5</div>
   
   <div style="position: absolute; width: 350px; right: 2%;">
	   <ul id="minilist">
	   		<c:if test="${empty userid }">
			<li><a href="/member/login" class="aNone">&nbsp;로그인&nbsp; |</a></li>
			<li><a href="/user/join" class="aNone" >&nbsp; 회원가입&nbsp; |</a></li>
			<li><a href="/artist/main" class="aNone" >&nbsp; 작가 페이지</a></li>
	   		</c:if>
	   		<c:if test="${!empty userid }">
			<li><a href="/user/logout" class="aNone">&nbsp; 로그아웃</a></li>
			<li><a href="/artist/main" class="aNone" >&nbsp; 작가 페이지</a></li>
	   		</c:if>
	   </ul>
   </div>
   
   <div class="wish" onclick="location.href='/user/mypage';">
   <a href="/user/mypage">
   <div id="sizeup" class="glyphicon glyphicon-user" ></div>
   <br><small>마이페이지</small>
   </a>
   </div>
   
   <a href="/mypage/class/wish">
   <div class="cart" onclick="location.href='#'">
   <div id="sizeup" class="glyphicon glyphicon-shopping-cart" ></div>
   <br><small>장바구니</small>
   </a>
   </div>
   
</div>
</div>
<br>

<div id="menudiv" >
<ul class="nav nav nav-pills navst">
	<li><a href="#"> </a></li>
	<li>
		<a href="/category">카테고리</a>
		<ul>
			<li><a href="/category?category=1">플라워</a></li>
			<li><a href="/category?category=2">음악</a></li>
			<li><a href="/category?category=3">수공예</a></li>
			<li><a href="/category?category=4">요리</a></li>
			<li><a href="/category?category=5">뷰티</a></li>
			<li><a href="/category?category=6">미술</a></li>
			<li><a href="/category?category=7">기타</a></li>
		</ul>
	</li>
	<li><a href="/hotclass">인기클래스</a></li>
	<li><a href="/newclass">신규 클래스</a></li>
	<li>
		<a href="/location">지역별 클래스</a>
		<ul>
			<li><a href="/location?location=1">서울</a></li>
			<li><a href="/location?location=2">경기</a></li>
			<li><a href="/location?location=3">강원</a></li>
			<li><a href="/location?location=4">충청</a></li>
			<li><a href="/location?location=5">경상</a></li>
			<li><a href="/location?location=6">전라</a></li>
			<li><a href="/location?location=7">제주</a></li>
		</ul>
	</li>
	<li>
		<a href="#">게시판</a>
		<ul>
			<li><a href="/review/board">후기게시판</a></li>
			<li><a href="/notice/list">공지사항</a></li>

		</ul>
	</li>
	
</ul>
</div>

