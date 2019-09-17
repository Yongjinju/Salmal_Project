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
        <title>관리자페이지</title>
    </head>
    <body>

        <div class="container">
            <br><br>
            <h2>관리자 페이지</h2>
            <br><p class="text-center">회원정보 조회, 회원관리, 카테고리 관리, 통계 등.....</p>
            <hr>
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <div class="card">
                        <h5 class="card-header">
                            회원 관리 (회원 클릭시 회원 정보 수정 페이지로 이동)
                        </h5>
                        <div class="card-body">
                            <table class="table text-center table-hover table-sm">
                                <thead>
                                    <tr>
                                        <th>이메일</th>
                                        <th>닉네임</th>
                                        <th>성별</th>
                                        <th>가입일자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a href="">gildong@email.com</a></td>
                                        <td>홍길동</td>
                                        <td>남자</td>
                                        <td>2019년 09월 02일 00시 00분</td>
                                    </tr>
                                    <tr>
                                        <td><a href="">lime@email.com</a></td>
                                        <td>길라임</td>
                                        <td>여자</td>
                                        <td>2019년 09월 02일 00시 00분</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="row justify-content-center">

                                <div class="col-md-8">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="accordion" id="accordionExample">
                            <div class="card">
                              <div class="card-header" id="headingTwo">
                                <h2 class="mb-0">
                                  <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <h5>카테고리 관리</h5>
                                  </button>
                                </h2>
                              </div>
                              <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                <div class="card-body">
                                        <!-- Button trigger modal -->
                                        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#exampleModal">여기</button>
                                        를 클릭하여 카테고리를 추가, 카테고리번호를 클릭하여 수정 페이지로 이동
                                        
                                            
                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">카테고리 추가</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">

                                                            <div class="input-group mb-3">
                                                                <input type="text" class="form-control" placeholder="카테고리 이름" aria-label="categoryName" aria-describedby="button-addon2">
                                                            </div>

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                                            <button type="button" class="btn btn-primary">추가</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                    <table class="table text-center table-hover table-sm">
                                        <!-- 카테고리 목록을 표시하는 다른 더 좋은 방법이 있으면 그 방법으로 표시해도 될것같습니다.-->
                                        <thead>
                                            <tr>
                                                <th>카테고리 번호</th>
                                                <th>카테고리 이름</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><a href="">1</a></td>
                                                <td>기타</td>
                                            </tr>
                                            <tr>
                                                <td><a href="">2</a></td>
                                                <td>컴퓨터</td>
                                            </tr>
                                            <tr>
                                                <td><a href="">3</a></td>
                                                <td>디지털</td>
                                            </tr>
                                            <tr>
                                                <td><a href="">4</a></td>
                                                <td>식품/건강</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                              </div>
                            </div>
                            <div class="card">
                              <div class="card-header" id="headingThree">
                                <h2 class="mb-0">
                                  <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <h5>그외 정보</h5>
                                  </button>
                                </h2>
                              </div>
                              <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                <div class="card-body">
                                    각종 정보들이 들어갈 곳
                                </div>
                              </div>
                            </div>
                          </div>
                </div>
            </div>
        </div> 
    </body>
</html>