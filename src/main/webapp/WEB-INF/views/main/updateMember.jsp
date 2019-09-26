<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <link rel="stylesheet" href="./css/main.css">
        <title>내정보 수정</title>
    </head>
    <body>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

        <div class="container">
            <br>
            <h2 class="text-center">회원 정보 수정</h2>
            <p class="text-center">비밀번호 혹은 다른사람에게 보여지는 닉네임을 수정할 수 있습니다.</p>
            <p class="text-center">입력하지 않은 항목은 반영되지 않습니다. 정보수정이 완료되었으면 다시 로그인해 주십시오.</p>
            <hr>

            <div class="row row justify-content-center">
                <div class="col-md-8">
                    <form class="form-horizontal" method="POST" action="/Salmal/update">
					<input type="hidden" name="memberNum" value="${member.memberNum }">
					<fieldset>
                            
                            <!-- Form Name -->
                            <legend>회원 정보 입력</legend>
                               <!-- 이메일, 닉네임, 비밀번호, 성별, 생년월일-->
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="control-label" for="pass1">새로운 비밀번호</label>  
                                <input id="pass1" name="password" type="password" placeholder="8~16자의 영문/숫자 조합?" class="form-control input-md">
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                              <label class="control-label" for="pass2">비밀번호 확인</label>  
                              
                              <input id="pass2" name="pass2" type="password" placeholder="" class="form-control input-md">
                            </div>
                            
                            <!-- Text input-->
                            <div clas="form-group">
                              <label class="control-label" for="nick">새 닉네임</label>  
                              <input id="nick" name="nickname" type="text" placeholder="닉네임을 입력하세요." class="form-control input-md">
                              <br>
                            </div>
                            
                            
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary float-right">
                                    <i class="far fa-paper-plane"> 정보수정</i>
                                </button>

                                <label class="checkbox-inline" for="submit">
                                  <input class="btn btn-success" type="reset" name="submit" id="submit" onclick="history.back()" value="뒤로">
                                </label>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div> 
    </body>
</html>