<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">

.review{
width: 700px;
height:600px;
margin:20px auto;
text-align: center;
}
</style>

</head>
<body>
<form action="/detail/write" method="post">
 <div class="form-group review">
    <label for="review">후기</label><br>
    <textarea class="form-control" id="review" placeholder="클래스 후기를 작성해 주세요" rows="10" name="review"></textarea>
    
  <input class="btn btn-default" type="submit" value="확인" style="margin-right:20px;margin-top:20px;">
  <input class="btn btn-default" type="reset" value="지우기" style="margin-right:20px;margin-top:20px;">
  </div>
</form>
</body>
</html>