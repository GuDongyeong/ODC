<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<c:import url="/WEB-INF/layout/common/main/header.jsp"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	
	var location = '<c:out value="${message }"/>'
	
	if( location == '전체'){
		$("#navi li:nth-child(1)").css("border-bottom","2px solid thistle").children("a").css("color","thistle");
	}else if( location == '플라워'){
		$("#navi li:nth-child(2)").css("border-bottom","2px solid thistle").children("a").css("color","thistle");
	}else if( location == '음악'){
		$("#navi li:nth-child(3)").css("border-bottom","2px solid thistle").children("a").css("color","thistle");
	}else if( location == '수공예'){
		$("#navi li:nth-child(4)").css("border-bottom","2px solid thistle").children("a").css("color","thistle");
	}else if( location == '요리'){
		$("#navi li:nth-child(5)").css("border-bottom","2px solid thistle").children("a").css("color","thistle");
	}else if( location == '뷰티'){
		$("#navi li:nth-child(6)").css("border-bottom","2px solid thistle").children("a").css("color","thistle");
	}else if( location == '미술'){
		$("#navi li:nth-child(7)").css("border-bottom","2px solid thistle").children("a").css("color","thistle");
	}else if( location == '기타'){
		$("#navi li:nth-child(8)").css("border-bottom","2px solid thistle").children("a").css("color","thistle");
	}
	
	
});
</script>
<!-- 사이드 메뉴바 -->
<style type="text/css">
ul#navi {
    width: 100%;
    list-style:none;
    margin:0;
    padding:0;
}

ul#navi li {
    margin: 0;
    line-height:40px;
    cursor:pointer;
	border-bottom: 2px solid white;
}
ul#navi li a {
    display: block;
    width: 100%;
    height:100%;
    text-decoration:none;
    text-align: center;
    padding: 0;
}

/* 마우스 올리면 밑에 밑줄 */
ul#navi li:hover {
	border-bottom: 2px solid thistle;
}
#navi li a:hover {
	color: thistle;
}

ul#classIntro {
    list-style:none;
    margin:0;
    padding:0;
}

</style>

<style type="text/css">
#uptitle{
	text-align: center;
	margin-top: 100px;
}

#title {

	color: #845f84;
	font-size: 35px;
	font-weight: bold;
	margin: 10px;
}

#wrapper{
	width: 1200px;
	margin: 20px auto;
	font-family:sans-serif;
}

#wrapper > #content{
	width: 1100px;
	margin: 0 auto;
}

#sidenav {
	float: left;
	width: 120px;
	margin-top: 48px;
}

#main{
	float: right;
	width: 970px;
}

#categoryList{
	list-style: none;
	padding: 0;
	margin: 0;
}

#categoryList li{
	float: left;
	margin: 25px;
}

.bannerborder{
	border-radius: 10px;
	width:249px;
	border:1px solid #ccc;
	overflow: hidden;
}

.imgBox{
	width: 250px;
	height: 250px;
	overflow: hidden;
}

.imgsize{
	width:250px;
	height:250px;
	
}

.imgsize:hover{
	width: 253px;
	height: 253px;
}

#section{
	margin: 0 auto;
	width: 900px;
}
#totop {

	width: 50px;
	height: 50px;
	padding: 4px 0;
	
	position: fixed;
	bottom: 30px;
	right: 30px;
}

.aTagStyleNone {
    text-decoration : none;
    color : black;
}

a:link { color: none; text-decoration: none;}
a:visited { color: none; text-decoration: none;}
a:hover { color: none; text-decoration: none;}

.className{
	font-size: 17px;
	overflow: hidden;
 	white-space: nowrap; 
    text-overflow: ellipsis; 
    padding: 3px 7px;
    margin-bottom: 5px;
    color: black;
} 

.CateLoc{
	font-size: small;
	font-weight: bold;
	margin: 5px;
 	color: #666;
}


.price{
	padding: 0 14px;
}

.aNone:link{
	text-decoration: none;
	color: black;
}
.aNone:visited{
	text-decoration: none;
	color: black;
}
.aNone:hover{
	text-decoration: none;
	color: black;
}

</style>

<div id="wrapper">

<div id="uptitle">
	<div id="title">카테고리별 클래스</div>
	<div style="color: #666;">내 취향의 클래스를 찾아보세요</div>
</div>

<div id="content">	
<div id="sidenav">
	<ul id="navi">
       <li><a href="/category"><strong>전체</strong></a></li>
       <li><a href="/category?category=1"><strong>플라워</strong></a></li>
       <li><a href="/category?category=2"><strong>음악</strong></a></li>
       <li><a href="/category?category=3"><strong>수공예</strong></a></li>
       <li><a href="/category?category=4"><strong>요리</strong></a></li>
       <li><a href="/category?category=5"><strong>뷰티</strong></a></li>
       <li><a href="/category?category=6"><strong>미술</strong></a></li>
       <li><a href="/category?category=7"><strong>기타</strong></a></li>
    </ul>
</div>


<div id="main">

	<!-- 서브 네비게이션바에서 선택할 때마다 바뀜 -->
	<h4>${message }</h4>
	<hr>
	<c:if test="${empty list }">
        <div style="font-size: 20px; color: #999;  text-align: center;">개설된 클래스가 없습니다...</div>
    </c:if>

	<c:if test="${not empty list }">
	<div id="section">
	
	<ul id="categoryList">
	<!-- 서버에서 데이터 가져와서 for 문으로 있는 만큼 출력하기.. -->
	
	<c:forEach var="info" items="${list }" >
	
	 <li>
	 <a href="/userclass/detail?classno=${info.classNo }">
	 <div class="bannerborder">
	 <div class="imgBox">
      <img class="imgsize" src="/upload/${info.filename }" alt="...">
     </div>
      <div class="caption">
        <div align="center" class="CateLoc">${info.category }/${info.location }</div>
        <div class="className" align="center">${info.className }</div>
      </div>
     </div>
     </a>
	 </li>
	 
	 </c:forEach>
	
	</ul>
	 
	 <div class="clearfix"></div>
	 </div>
	 </c:if>
</div>

</div>

<div class="clearfix"></div>

</div>

<c:if test="${not empty list }">
<c:import url="/WEB-INF/paging/pagingCategory.jsp" />
 </c:if>
 
 <div id="totop">
   <a href="#"><img alt="up" src="/resources/img/totop.png" width="40px" height="35px"/></a>
</div>
 

<br>
<c:import url="/WEB-INF/layout/common/main/footer.jsp"></c:import>