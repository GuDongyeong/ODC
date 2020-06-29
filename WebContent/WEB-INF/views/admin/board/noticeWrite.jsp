<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<c:import url="/WEB-INF/layout/admin/header.jsp" />

<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

	try {
	    elClickedObj.form.submit();
	} catch(e) {}
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	
	//글쓰기 버튼 누르면 전송
	$("#btnWrite").click(function() {
		
		submitContents($("#btnWrite"));
		$("#noticeForm").submit();
	});
});
</script>

<style type="text/css">
#noticeTable th {
	text-align: center;
	background: #ecdfec;
}
</style>
<div>
<h4>게시판 관리</h4>
<hr>
<h5>공지사항 관리</h5><br>

<form action="/notice/write" method="post" id="noticeForm">
<table id="noticeTable" class="table table-condensed text-center table-hover">
	<tr>
		<th>글제목</th>
		<td><input style="width: 100%;" type="text" name="noticeTitle" required="required"/></td>
	</tr>
	<tr>
		<th style="vertical-align: middle;">본문</th>
		<td>
		<textarea rows="10" id="content" name="content" style="width: 100%;" placeholder="내용을 입력하세요" required="required"></textarea>
		</td>
	</tr>
</table>
</form>
<div id="btnBox" style="text-align: center;">
<button id="btnWrite" class="btn btn-primary">등록</button>
<button id="btnDelete" class="btn btn-warning" onclick="history.go(-1);">취소</button>
</div>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "content",
 sSkinURI: "/resources/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
})
</script> 

</div>
<c:import url="/WEB-INF/layout/admin/footer.jsp" />