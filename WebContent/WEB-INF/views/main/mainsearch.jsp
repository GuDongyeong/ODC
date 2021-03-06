<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<c:import url="/WEB-INF/layout/common/main/header.jsp" />


<!-- 레이아웃 -->
<style type="text/css">

#main {

	width: 1200px;
 	height: 100%;
  	margin: 100px auto; 
 	text-align: center;
}

#title {

	color: #845f84;
	font-size: 35px;
	font-weight: bold;
	margin: 10px;
}

#main > select { 

	float: left;
	margin: 0 40px; 
}

#section {

	width: 1100px;
	height: 100%;
	margin: 0 auto;
}

#totop {

	width: 50px;
	height: 50px;
	padding: 4px 0;
	
	position: fixed;
	bottom: 30px;
	right: 30px;
}

</style>



<!-- 클래스들 -->
<style type="text/css">

#searchClass {

	margin: 100px 0;
}

#li { 

	list-style: none; 
	width: 200px;
 	height: 320px;
	margin: 0 30px 50px;
	float: left;
	display: inline-block;

}

#eachClass {

	color: black;
	border: 1px solid #eee;
}

#eachClass #img {
	
	width: 100%;
	height: 200px;
	overflow: hidden;
}

#eachClass #img:hover img {

	/* 커서 올렸을때 살짝 확대되게 하기 */
	width: 205px;
	height: 205px;
}

#eachClass a:hover { 

	text-decoration: none; 
	color: black;
} 

#sort { 
	
	width: 200px;
	margin: 5px;
	
 	font-size: 15px; 
 	font-weight: bold;
 	color: #666;
} 

#classname { 
	
	width: 200px;
	height: 40px;
 	
 	font-size: 17px; 
 	color: black; 
 	
 	/* 제목 길때 ...으로 생략하기 */
	overflow: hidden;
 	white-space: nowrap; 
    text-overflow: ellipsis; 
} 

#btns { margin: 0 0 5px; }

</style>




<div id="main">

	
	<div id="title">검색 결과</div>
	<hr>
	
	<section id="section">
	
		<ul id="searchClass"><!-- 클래스 목록 한줄 -->
	
		<c:if test="${empty list }">
         <div style="font-size: 20px; color: #999;">개설된 클래스가 없습니다...</div>
      </c:if>
      
		<c:forEach items="${list }" var="info" >
			<li id="li">
			<div id="eachClass">
				<div id="img"><!-- 링크 누르면 클래스 상세 페이지로 이동 -->
					<a href="/userclass/detail?classno=${info.classNo }"><img src="/upload/${info.filename }" alt="썸네일" width="200px;" height="200px;"></a>
				</div>
				<div id="sort">
					<c:if test="${info.location eq 1 }">
						<span>서울</span>
					</c:if>
					<c:if test="${info.location eq 2 }">
						<span>경기</span>
					</c:if>
					<c:if test="${info.location eq 3 }">
						<span>강원</span>
					</c:if>
					<c:if test="${info.location eq 4 }">
						<span>충청</span>
					</c:if>
					<c:if test="${info.location eq 5 }">
						<span>경상</span>
					</c:if>
					<c:if test="${info.location eq 6 }">
						<span>전라</span>
					</c:if>
					<c:if test="${info.location eq 7 }">
						<span>제주</span>
					</c:if>
					|
					<c:if test="${info.category eq 1 }">
						<span>플라워</span>
					</c:if>
					<c:if test="${info.category eq 2 }">
						<span>음악</span>
					</c:if>
					<c:if test="${info.category eq 3 }">
						<span>수공예</span>
					</c:if>
					<c:if test="${info.category eq 4 }">
						<span>요리</span>
					</c:if>
					<c:if test="${info.category eq 5 }">
						<span>뷰티</span>
					</c:if>
					<c:if test="${info.category eq 6 }">
						<span>미술</span>
					</c:if>
					<c:if test="${info.category eq 7 }">
						<span>기타</span>
					</c:if>
				</div>
				<div id="classname"><!-- 링크 누르면 클래스 상세 페이지로 이동 -->
					<a href="/userclass/detail?classno=${info.classNo }"><span>${info.className }</span></a>
				</div>
			</div>
			</li>
		</c:forEach>
		
		</ul>
	
	</section>


</div><!-- end main -->

</body><!-- end body (header에서 옴) -->

<div class="clearfix"></div>

<c:if test="${not empty list }">
	<c:import url="/WEB-INF/paging/mainsearchpaging.jsp" />
</c:if>

<div id="totop">
	<a href="/main/search"><img alt="up" src="/resources/img/totop.png" width="40px" height="35px"/></a>
</div>

<br>
<c:import url="/WEB-INF/layout/common/main/footer.jsp" />