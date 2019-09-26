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
        <script src="/resources/js/jquery-3.js"></script>
        
        
        <!-- <script>
            $(function(){//[비밀번호]입력과[비밀번호 확인]의 문구가 같은지 아닌지를 체크함.
                $("#pwpattern").hide();
                $("#alert-success").hide();
                $("#alert-danger").hide();
                $("#alert-warning").hide();
                
                $("#alert-danger_email").hide();
                $("#alert-danger_nickname").hide();               
            	
                $("input").keyup(function(){
                
                 	$.ajax({
                		url : "checkEmail",
                		success: function (data) {
                			if(data>0){//중복
                				$("#alert-danger_email").show();
                			}
                		},
                		data:{
                			email:$("#email").val()
                		}
                	})
                	
                	$.ajax({
                		url : "checkNickname",
                		success: function (data) {
                			if(data>0){//중복
                				 $("#alert-danger_nickname").show();
                			}
                		},
                		data:{
                			nickname:$("#nickname").val()
                		}
                	})

                    var passRule = /^[A-Za-z0-9]{6,12}$/;//6문자 이상 12문자 이하의 영숫자 혼용만 받겠음.
                    var pass1=$("#password").val();
                    var pass2=$("#password2").val();
                    
             
                    if (pass1 =="" && pass2 == ""){
		                $("#alert-success").hide();
		                $("#alert-danger").hide();
		                $("#alert-warning").hide();
                    } else if (pass1 != "" || pass2 != "") {
                           if(pass1 != pass2){ // 비밀번호와 확인이 일치하지 않으면 경고
                                $("#alert-success").hide();
                                $("#alert-danger").show();
                                $("#submit").attr("disabled","disabled");
                            } else if(pass1 == pass2) { //비밀번호와 확인창이 일치
                                $("#alert-success").show();
                                $("#alert-danger").hide();
                                if (!passRule.test(pass1)) { // 정규식과 비밀번호 패턴이 안 맞으면 경고
                                    $("#submit").attr("disabled","disabled");
                                    $("#alert-warning").show();
                                } else { 
                                	// 모두를 만족하면 회원가입버튼이 활성화됨
                                	$("#submit").removeAttr("disabled");
                                	$("#alert-warning").hide();
                                }
                                
                           } 
                     }
                 });
             });
        
        </script> -->
        
        <script>
            $(function(){//[비밀번호]입력과[비밀번호 확인]의 문구가 같은지 아닌지를 체크함.
                $("#pwpattern").hide();
               $("#alert-success").hide();
               $("#alert-danger").hide();
               $("#alert-warning").hide();
               $("#alert-danger_email").hide();
               $("#alert-danger_nickname").hide();
               
               var passOK="";
               var emailOK="";
               var nicknameOK="";
               
               $(".passck").keyup(function(){
            	   //checkAll();
            	   $("#submit").attr("disabled","disabled");
                   passOK="";
                    var passRule = /^[A-Za-z0-9]{6,12}$/;//6문자 이상 12문자 이하의 영숫자 혼용만 받겠음.
                    var pass1=$("#password").val();
                    var pass2=$("#password2").val();
                        
                    if (pass1 =="" && pass2 == ""){
                        $("#alert-success").hide();
                        $("#alert-danger").hide();
                        $("#alert-warning").hide();
                    } else if (pass1 != "" || pass2 != "") {
                        if(pass1 != pass2){ // 비밀번호와 확인이 일치하지 않으면 경고
                            $("#alert-success").hide();
                            $("#alert-danger").show();
                            $("#submit").attr("disabled","disabled");
                        } else if(pass1 == pass2) { //비밀번호와 확인창이 일치
                            $("#alert-success").show();
                            $("#alert-danger").hide();
                            if (!passRule.test(pass1)) { // 정규식과 비밀번호 패턴이 안 맞으면 경고
                                $("#submit").attr("disabled","disabled");
                                $("#alert-warning").show();
                            } else { // 모두를 만족하면 회원가입버튼이 활성화됨
                                passOK="Ok";
                                $("#alert-warning").hide();
                                checkAll();
                            }
                            
                        }
                    }
              });
              $('#email').keyup(function(){
            	  //checkAll();
            	  $("#submit").attr("disabled","disabled");
                  emailOK="";
                  $.ajax({
                      url:"checkEmail",
                      data:{
                          email:$('#email').val()
                      },
                      success:function(data){
                    	  console.log(data);
                          if(data==0){
                        	  $("#alert-danger_email").hide()
                               emailOK="Ok";
                        	  checkAll();
                          } else {
                        	  $("#alert-danger_email").show()
                          }
                      },
                      async:false
                  });
              });
              
              $('.nicknameCk').keyup(function(){
            	  //checkAll();
            	  $("#submit").attr("disabled","disabled");
                  nicknameOK="";
                  $.ajax({
                      url:"checkNickname",
                      data:{
                          nickname:$('#nickname').val()
                      },
                      success:function(data){
                          if(data==0){
                        	  $("#alert-danger_nickname").hide()
                              nicknameOK="Ok";
                          } else {
                        	  $("#alert-danger_nickname").show()
                          }
                      },
                      async:false
                  });
              });
              
	        function checkAll(){
	        	if((passOK=='Ok'&& emailOK=='Ok') && nicknameOK=='Ok'){
	             $("#submit").removeAttr("disabled");
	         	}else{
                    $("#submit").attr("disabled","disabled");

	         	}
	        }
             
         });
            
                 
            
            
            
       </script>
        
        <title>회원가입</title>
    </head>
    <body>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

        <div class="container">
            <br><br><br>  <p class="text-center">회원가입을 하여 살까말까의 기능을 전부 이용하세요.</p>
            <hr>

            <div class="row row justify-content-center">
                <div class="col-md-8">
                    <form class="form-horizontal" action="signUp" method="POST">
                            <fieldset>
                            
                            <!-- Form Name -->
                            <legend>회원 정보 입력</legend>
                               <!-- 이메일, 닉네임, 비밀번호, 성별, 생년월일-->
                            <!-- Text input-->
                            <div class="form-group">
                              <label class="control-label" for="email">이메일</label>  
                              <input id="email" name="email" type="email" placeholder="salmal@mail.com" class="form-control input-md emailCk" required>
                            </div>
                            <div class="alert alert-danger" id="alert-danger_email">중복된 이메일 입니다.</div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="control-label" for="password">비밀번호</label>  
                                <input id="password" name="password" type="password" placeholder="6~12자의 영문/숫자 조합?" class="form-control input-md passck" required>
                            </div>
                            <div class="alert alert-danger" id="pwpattern">비밀번호 형식이 올바르지않습니다.</div>

                            <!-- Text input-->
                            <div class="form-group">
                              <label class="control-label" for="pass2">비밀번호 확인</label>  
                              
                              <input id="password2" name="password2" type="password" placeholder="" class="form-control input-md passck" required>
                            </div>
                            
                            <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                            <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                            
                            <!-- Text input-->
                            <div class="form-group">
                              <label class="control-label" for="nickname">닉네임</label>  
                              <input id="nickname" name="nickname" type="text" placeholder="닉네임을 입력하세요." class="form-control input-md nicknameCk" required>
                            	 <div class="alert alert-danger" id="alert-danger_nickname">중복된 닉네임 입니다.</div>
                            </div>
                            
                            <!-- Select Basic -->
                            <div class="form-group">
                              <label class="control-label" for="state">성별</label>
                                <select id="gender" name="gender" class="form-control">
                                  <option value="M">남</option>
                                  <option value="F">여</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                              <label class="control-label" for="birth">생년월일</label>  
                              <input id="birth" name="birth" type="date" class="form-control input-md" required>
                              <br>
                            </div>
                            
                            <div class="form-group">
                                <button class="btn btn-primary float-right" id="submit" disabled>
                                    <i class="far fa-paper-plane"> 회원가입</i>
                                </button>

                                <label class="checkbox-inline" for="reset">
                                  <input class="btn btn-danger" type="reset" name="reset" id="reset" value="리셋">
                                </label>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div> 
    </body>
</html>