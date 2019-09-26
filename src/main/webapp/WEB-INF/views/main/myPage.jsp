<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <script>
        
        var actionForm = $("#actionForm");
        
        $(function(){
            $("#withdraw").click(function(){
                alert('이용해 주셔서 감사합니다.');
            });
            
            $(".move").on("click",function(e){
            	e.preventDefault();
            	actionForm.append("<input type='hidden' name='articleNum' value'"
            						+ $(this).attr("href") + "'>");
            	actionForm.attr("action","article");
            	actionForm.submit();
            });
            
        });
        
        

        </script>
        <link rel="stylesheet" href="./css/main.css">
        <title>[살까말까]${member.nickname }님의 마이페이지</title>
    </head>
    <body>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

        <div class="container">
            <br><br><br>
         <h2>
           <c:if test="${myPoint le 10}">
  				<img src="/resources/image/level1.png" height="50" width="50" align="top">
  			</c:if>
		   <c:if test="${myPoint gt 10 && myPoint le 30}">
  				<img src="/resources/image/level2.png" height="50" width="50" align="top">
           </c:if>
           <c:if test="${myPoint gt 30 }">
  				<img src="/resources/image/level3.png" height="50" width="50" align="top">
           </c:if>
             ${member.nickname }님의 마이페이지</h2>
             <p>&nbsp level</p>
             
            <%-- <br><p class="text-center">자신의 정보를 수정하고 자신이 평가한 게시물과 댓글을 입력한 게시물을 확인할 수 있습니다.</p>  --%>
            <br><p class="text-center">자신의 정보를 확인할 수 있습니다.</p>
            <hr>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <h5 class="card-header">
                            내 정보 보기
                        </h5>
                        <div class="card-body">
                            <table class="table text-center table-hover">
                                <thead>
                                    <tr>
                                        <th>이메일</th>
                                        <th>닉네임</th>
                                        <th>성별</th>
                                        <th>생년월일</th>
                                        <th>가입일자</th>
                                        <th>활동점수</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>${member.email} </td>
                                        <td>${member.nickname }</td>
                                        <c:choose>
                                        	<c:when test="${member.gender eq 'F'||'f'}">
                                        		<td>여</td>
                                        	</c:when>
                                        	<c:when test="${member.gender eq 'M'||'m'}">
                                        		<td>남</td>
                                        	</c:when>
                                        </c:choose>
                                        <td>
                                        	<fmt:formatDate value="${member.birth }" pattern="yyyy년 MM월 dd일"/>
                                        </td>
                                        <td><fmt:formatDate value="${member.joinDate }" pattern="yyyy년 MM월 dd일"/></td>
                                        <td>${myPoint}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer">
                        	<button class="btn btn-success" type="button" onclick="location.href='updateForm'">내 정보 수정</button>
                        </div>
                    </div>
                    <div id="card-990375">
                        <div class="card">
                            <div class="card-header">
                                <a class="card-link collapsed" data-toggle="collapse" data-parent="#card-990375" href="#card-element-791163">내가 쓴 게시물 조회</a>
                            </div>
                            <div id="card-element-791163" class="collapse">
                                <div class="card-body">
                                    <table class="table text-center table-hover">
                                        <thead>
                                            <tr>
                                                <th>글번호</th>
                                                <th>말머리</th>
                                                <th>닉네임</th>
                                                <th>글제목</th>
                                                <th>작성시간</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${myArticleList }" var="myArticle">
	                                            <tr>
	                                                <td>${myArticle.ARTICLENUM }</td>
	                                                <td>${myArticle.PRODUCTCNT}</td>
	                                                <c:if test="${myArticle.PRODUCTCNT eq '#이거어때?' }">
														<td class="text-center ">
															<a href="article?articleNum=<c:out value="${myArticle.ARTICLENUM}"></c:out>">
																<c:out value="${myArticle.ARTICLETITLE }..."></c:out>
															</a>
 														</td>
													</c:if>
													<c:if test="${myArticle.PRODUCTCNT eq '#골라줘' }">
														<td class="text-center "><a href="article2?articleNum=<c:out value="${myArticle.ARTICLENUM}"></c:out>">
															<c:out value="${myArticle.ARTICLETITLE }..."></c:out></a>
														</td>
													</c:if>
	                                                <td>${myArticle.NICKNAME }</td>
	                                                <td><fmt:formatDate value="${myArticle.ARTICLEDATE }" pattern="yyyy-MM-dd HH:mm"/></td>
	                                             </tr>
                                        	</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                    <a class="card-link collapsed" data-toggle="collapse" data-parent="#card-990375" href="#card-element-946878">내가 댓글을 입력한 게시물 조회</a>
                            </div>
                            <div id="card-element-946878" class="collapse">
                                <div class="card-body">
                                    <table class="table text-center table-hover">
                                        <thead>
                                            <tr>
                                                <th>글번호</th>
                                                <th>말머리</th>
                                                <th>작성자</th>
                                                <th>글제목</th>
                                                <th>작성시간</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${articleWithMyReplyList }" var="myReplyList">
	                                            <tr>
	                                                <td>${myReplyList.ARTICLENUM }</td>
	                                                <td>${myReplyList.PRODUCTCNT}</td>
	                                                <c:if test="${myReplyList.PRODUCTCNT eq '#이거어때?' }">
														<td class="text-center ">
															<a href="article?articleNum=<c:out value="${myReplyList.ARTICLENUM}"></c:out>">
																<c:out value="${myReplyList.ARTICLETITLE }..."></c:out>
															</a>
 														</td>
													</c:if>
													<c:if test="${myReplyList.PRODUCTCNT eq '#골라줘' }">
														<td class="text-center "><a href="article2?articleNum=<c:out value="${myReplyList.ARTICLENUM}"></c:out>">
															<c:out value="${myReplyList.ARTICLETITLE }..."></c:out></a>
														</td>
													</c:if>
	                                                <td>${myReplyList.NICKNAME }</td>
	                                                <td><fmt:formatDate value="${myReplyList.ARTICLEDATE }" pattern="yyyy-MM-dd HH:mm"/></td>
	                                             </tr>
                                        	</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
 			            <br><a id="modal-679956" href="#modal-container-679956" role="button" class="btn btn-danger" data-toggle="modal">회원 탈퇴하기</a>
			            <button class="btn btn-primary float-right" onclick="history.back()">뒤로가기</button>
			
			            <div class="modal fade" id="modal-container-679956" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="myModalLabel">
                                            ※ 주의!!!
                                        </h5> 
                                        <button type="button" class="close" data-dismiss="modal">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </div>
						            <div class="modal-body">
                                        작성한 게시물이 모두 삭제되며, 탈퇴처리된 회원은 어떠한 일이 있어도 복구할 수 없습니다. <br>탈퇴하시겠습니까?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" id="withdraw" onclick="location.href='/Salmal/withdraw?email=${member.email}'">
                                            회원 탈퇴하기
                                        </button> 
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                            닫기
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form id="actionForm" action="/board/list" method="get">
                    
                    </form>
                </div>
            </div>
        </div> 
    </body>
</html>