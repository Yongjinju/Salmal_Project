<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"><!-- 반응형 웹을 구현코드-->
        <meta http-equiv="X-UA-Compatible" content="ie=edge"><!-- 마이크로소프트 EDGE-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/2fabbfb053.js"></script>
        <link rel="stylesheet" href="/resources/css/style.css">
        <title>로그인</title>
    </head>
    <body>
        <div class="container">
            <br><br><br>  <p class="text-center">로그인하여 의견을 남기거나 게시물을 작성하세요.</p>
            <hr>
            
            <div class="row row justify-content-center">
                <aside class="col-sm-4">
                    <div class="card">
                        <article class="card-body">
                            <h4 class="card-title mb-4 mt-1">로그인</h4>
                          
                          
                            <form action="/Salmal/loginMember" method="POST">
                                <div class="form-group">
                                    <label>EMAIL</label>
                                    <input name="email" class="form-control" placeholder="email" type="email">
                                </div> <!-- form-group// -->
                                <div class="form-group">
                                    <!-- <a class="float-right" href="#">비밀번호찾기</a> -->
                                    <label>비밀번호</label>
                                    <input name="password" class="form-control" placeholder="********" type="password">
                                </div> <!-- form-group// --> 
                                <div class="form-group"> 
                                    <!-- <div class="checkbox">
                                    <label> <input type="checkbox"> 비밀번호 저장하기 </label> -->
                                    </div> <!-- checkbox .// -->
                                </div> <!-- form-group// -->  
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block"> 로그인  </button>
                                    <button type="button" class="btn btn-outline-primary btn-block" onclick="location.href='signUp'"> 회원가입  </button>
                                </div> <!-- form-group// -->                                                           
                            </form>
                        </article>
                    </div> <!-- card.// -->
                </aside> <!-- col.// -->
            </div> <!-- row.// -->
        </div> 
    </body>
</html>