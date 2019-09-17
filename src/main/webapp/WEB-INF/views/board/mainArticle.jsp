<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>mainArticle</title>

<meta name="description"
   content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">

<script src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/scripts.js"></script>
<script src="/resources/js/popper.min.js"></script>


<script type="text/javascript">
   

   $(document)
         .ready(
               function() {
                  
                  $(".paginate_button a").on("click",
                        function(e) {
   
                           e.preventDefault();
   
                           console.log('click');
   
                           actionForm.find("input[name='pageNum']")
                                 .val($(this).attr("href"));
                           actionForm.submit();
                        });
                   
                  var actionForm = $("#actionForm");
   
                  $(".move").on("click",
                        function(e) {

                           e.preventDefault();
                           actionForm
                                  .append("<input type='hidden' name='articleNum' value='"
                                        + $(this).attr(
                                             "href")
                                       + "'>"); 
                           actionForm.attr("action",
                                 "article");
                           actionForm.submit();

                        });            
   
                  $(".move2").on("click",
                        function(e) {

                           e.preventDefault();
                           actionForm
                                  .append("<input type='hidden' name='articleNum' value='"
                                        + $(this).attr(
                                             "href")
                                       + "'>"); 
                           actionForm.attr("action",
                                 "article2");
                           actionForm.submit();

                        });
                  
                  var searchForm = $("#searchForm");
                  
                  $("#searchForm button").on("click",
                        function(e) {

                            searchForm.find("input[name='pageNum']").val("1");
                           e.preventDefault();
                           
                           searchForm.submit();  
                  });
   });
</script>
               
</head>
<body>

   <div class="container-fluid">
   
      <div class="row">
      
         <div class="col-md-12">
            <div class="page-header" style="background-color: #FFDF3F">
               <h1>
                  <img alt="Logo" src="/resources/productImage/Logo.jpg"
                     class="rounded" width="100" height="100"> 살까? 말까?
               </h1>
            </div>
            <div class="tabbable" id="tabs-129651" style="background-color: #ffae00">
            <nav class="navbar navbar-expand-sm navbar-dark">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                     <button type="button" class="btn btn-outline-light" onclick="location.href='main'"><b>홈으로</b></button>
                </li>
                <li>　</li>
                <li class="nav-item active">
                  <button type="button" class="btn btn-light" onclick="location.href='mainArticle'"><b>살까말까</b></button>
                </li>
              </ul>
                 <c:choose>
                 <c:when test="${login eq 'success'}">
                  <button type="button" class="btn btn-outline-light" onclick="location.href='myPage'"><b>마이페이지</b></button>
                  <a>　</a>
                  <button type="button" class="btn btn-outline-light" onclick="location.href='logout'"><b>로그아웃</b></button>
                 </c:when>
                 <c:otherwise>
                    <button type="button" class="btn btn-outline-light" onclick="location.href='login'"><b>로그인</b></button>
                 </c:otherwise>
               </c:choose>
            </nav>
            </div>

            <br> <br>

         <form id='searchForm' action="mainArticle" method='get'>
         
            <div class="row">
               <div class="col-md-1"></div>
               <div class="col-md-1"></div>
               <div class="col-md-1"></div>
               <div class="col-md-1"></div>
               <div class="col-md-1">
               
                  <select class="form-control" name="categoryName">
                     <option>전체</option>
                     <option>기타</option>
                     <option>컴퓨터</option>
                     <option>디지털</option>
                     <option>식품/건강</option>
                     <option>서적</option>
                     <option>육아</option>
                     <option>카메라</option>
                     <option>의류잡화</option>
                     <option>화장품</option>
                     <option>가전</option>
                  </select>
               </div>

               <div class="col-md-1">

                  <select class="form-control" name="articleHeader">
                    <option>말머리</option>
                    <option>#골라줘</option>
                    <option>#이거어때?</option>
                  </select>
               </div>

                  <div class="form-inline form-group">
                  
                     <input type='text' class="form-control" placeholder="검색어를 입력해주세요" name='articleTitle' value='<c:out value="${pageMaker.cri.articleTitle}"/>' /> 
                     <input type='hidden' name='pageNum'value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
                     <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
                  <div class="col-md-1">
                     <button class='btn btn-default btn-success'>Search</button>
                  </div>
                  </div>
            </div>
         </form>

            <br>

            <div class="row ">
               <div class="col-md-8">
                  <table class="table table-sm table-hover">
                     <thead>
                        <tr>
                           <th class="text-center">글번호</th>
                           <th class="text-center">분류</th>
                           <th class="text-center">말머리</th>
                           <th class="text-center">제목</th>
                           <th class="text-center">글쓴이</th>
                           <th class="text-center">날짜</th>
                           <th class="text-center">조회수</th>
                           <th class="text-center">댓글수</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${list }" var="article">
                           <tr>
                              <td class="text-center"><c:out
                                    value="${article.ARTICLENUM}"></c:out></td>
                              <td class="text-center"><c:out
                                    value="${article.CATEGORYNAME}"></c:out></td>
                              <td class="text-center"><c:out
                                    value="${article.PRODUCTCNT}"></c:out></td>
                              <c:if test="${article.PRODUCTCNT eq '#이거어때?' }">
                                 <td class="text-center ">
                                    <a class='move' href='<c:out value="${article.ARTICLENUM}"/>'> 
                                       <c:out value="${article.ARTICLETITLE}" />
                                    </a>
                                 </td>
                              </c:if>

                              <c:if test="${article.PRODUCTCNT eq '#골라줘' }">
                                 <td class="text-center ">
                                    <a class='move2' href='<c:out value="${article.ARTICLENUM}"/>'> 
                                       <c:out value="${article.ARTICLETITLE}" />
                                    </a>
                                 </td>
                              </c:if>


                              <td class="text-center"><c:out
                                    value="${article.NICKNAME}"></c:out></td>
                              <td class="text-center">
                              	<fmt:formatDate value="${article.ARTICLEDATE}" pattern="yyyy-MM-dd   HH:mm"/>
                              <%-- <c:out
                                    value="${article.ARTICLEDATE}"></c:out> --%></td>
                              <td class="text-center"><c:out
                                    value="${article.ARTICLEHITS}"></c:out></td>
                              <td class="text-center"><c:out
                                    value="${article.REPLYCNT}"></c:out></td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>

               </div>

               <div class="col-md-4">
                  <iframe width="458" height="257" src="https://www.youtube.com/embed/JknUOHDwSbI?autoplay=1&mute=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
               </div>

		</div>
	
		<div class="row">
               <div class="col-md-7 form-inline form-group"
                  style="float: none; margin: 0 auto;">

               <ul class="pagination">
                  
                     <c:if test="${pageMaker.prev}">
                         <li class="paginate_button previous">
                         <a class="page-link" href="${pageMaker.startPage -1}">&lt;</a>
                        </li>
                     </c:if>
                     
                     <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        <li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":""} '>
                           <a class="page-link" href="${num}">${num}</a>
                        </li>
                     </c:forEach>
                     
                     <c:if test="${pageMaker.next}">
                        <li class="paginate_button next">
                        <a class="page-link" href="${pageMaker.endPage +1 }">&gt;</a>
                        </li>
                     </c:if>
                     
                  </ul>

                  <form id='actionForm' action="mainArticle" method='get'>
                     <input type='hidden' name='pageNum'value='${pageMaker.cri.pageNum}'> 
                     <input type='hidden'name='amount' value='${pageMaker.cri.amount}'>
                     <input type='hidden' name='categoryName'value='${pageMaker.cri.categoryName}'> 
                     <input type='hidden'name='articleHeader' value='${pageMaker.cri.articleHeader}'>
                     <input type='hidden' name='articleTitle'value='${pageMaker.cri.articleTitle}'> 
                  </form>
				</div>

                  <c:if test="${login eq 'success' }">
                  <div class="col-md-3 "> 
                     <button type="button" class="btn" style="background-color: #ff99cc"
                        data-toggle="modal" data-target="#myModal">글쓰기</button>
                  </div>
                  </c:if>

				<div class="col-md-2"></div>
				
         </div>
       </div>
               
     </div>
</div>

                  <div id="myModal" class="modal fade">
                     <div class="modal-dialog">
                        <div class="modal-content">
                           <div class="modal-header">
                              <h4 class="modal-title">메뉴를 골라주세요</h4>
                              <button type="button" class="close" data-dismiss="modal">
                                 <i class="fas fa-times"></i>
                              </button>
                           </div>
                           <div class="row">
                              
                              <div class="modal-body col-md-6 form-inline form-group">
                                 <img src="/resources/image/select1.jpg" class="img-fluid" alt="dog">

                              <div class="modal-footer col-md-12">
                                    <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#inputModal1">선택</button>
                              </div>
                              </div>
                              
                              <div class="modal-body col-md-6 form-inline form-group">
                                 <img src="/resources/image/select2.jpg" class="img-fluid" alt="dog">

                              <div class="modal-footer col-md-12">
                                    <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#inputModal2">선택</button>
                              </div>
                              </div>
                              
                              </div>

                           </div>
                        </div>
                     </div>



<div class="modal fade" id="inputModal1" tabindex="-1" role="dialog" aria-labelledby="inputModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="inputModalLabel">주의</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
      <div class="modal-body">
        글 작성 후 댓글 또는 추천/비추천이 등록될 경우 글 내용 이외에는 수정이 불가능하오니 글 작성시 신중히 작성 해주시기 바랍니다. 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick="script:location.href='/Salmal/inputArticle1'">등록</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="inputModal2" tabindex="-1" role="dialog" aria-labelledby="inputModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="inputModalLabel">주의</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
      <div class="modal-body">
        글 작성 후 댓글 또는 추천/비추천이 등록될 경우 글 내용 이외에는 수정이 불가능하오니 글 작성시 신중히 작성 해주시기 바랍니다. 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick="script:location.href='/Salmal/inputArticle2'">등록</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>