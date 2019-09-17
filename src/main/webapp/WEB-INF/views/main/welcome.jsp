<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <title>회원가입 완료</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <!-- 구글 폰트 -->

  <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/css/style.css" rel="stylesheet">

</head>
<body>
  <section>
      <div class="container">
        <div class="row centered">
          <div class="col-md-12">
          <br>	
          <hr>
            <h3><b>살까말까</b> 가입을 축하합니다.</h3>
            <h3>로그인하여 살까말까의 기능을 모두 이용하세요.</h3>
            <br>
          </div>

          <div class="col-md-8">
            <p>글쓰기 버튼을 클릭하여 사진과 링크를 등록하세요.</p>
            <p>댓글을 작성하여 다른 사람들의 고민을 해결해 줄수 있습니다.</p>
          </div>
          <div class="col-md-8">
            <br>
            <input class="btn btn-primary" type="button" value="메인화면" onclick="location.href='main'">
            <input class="btn btn-primary" type="button" value="로그인" onclick="location.href='login'">
          </div>
        </div>
      </div>
      <!--/ .container -->
  </section>

  <!-- JavaScript Libraries -->
  <script src="/resources/js/jquery.min.js"></script>
  <script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/popper.min.js"></script>


</body>
</html>