<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>[살말]물품 정보 :</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="/resources/css/style.css" rel="stylesheet">
<script src="/resources/js/jquery-3.js"></script>

<script type="text/javascript">

function selectChoice(){
	$.ajax({
		url : "selectChoice",
		success: function (choice) {
			
			if($('#check').val() == 'ok'){//내글
				$('#proChoice').css({ "background-color" : "yellow", "border-radius" : "20%", "width": "70px", "text-align":"center" });
				$('#proChoice').html("<h3>"+choice.cnt+"</h3>");
			}
			
			else{//내글아님
				
				if(choice.c == 1){//선택함
					$('#proChoice').css({ "background-color" : "yellow", "border-radius" : "20%", "width": "70px", "text-align":"center" });
					$('#proChoice').html("<h3>"+choice.cnt+"</h3>");
					
				}else{ //선택안함
					$('#proChoice').html();
				}
			}
			
		},
		data:{
			productNum:$('#pnum').val()
		}
	})

	$.ajax({
		url : "selectNChoice",
		success: function (nchoice) {
		
			if($('#check').val() == 'ok'){//내글
				$('#conChoice').css({ "background-color" : "yellow", "border-radius" : "20%", "width": "70px", "text-align":"center" });
				$('#conChoice').html("<h3>"+nchoice.cnt+"</h3>");
			}else{//내글아님
			
				if(nchoice.c == 1){
					$('#conChoice').css({ "background-color" : "yellow", "border-radius" : "20%", "width": "70px", "text-align":"center" });
					$('#conChoice').html("<h3>"+nchoice.cnt+"</h3>");
					
				}
				else{
					$('#conChoice').html();
				}
			}
			
			
		},
		data:{
			productNum:$('#pnum').val()
		}
	}) 
}
	$(function() {
		selectChoice();

		$('.proChoice').click(function() {
			var con = confirm("추천하시겠습니까?");
			if (con) {
				if(	$('#check').val() == 'ok'){
					alert("자신의 글은 추천할 수 없습니다. ");
				}else{
				
					$.ajax({
						url : "proInsert",
						success: function (data) {
							if(data=="success"){
								alert("추천 완료");
								replyList();
								replyList2();
							}else{
								alert("이미 선택하셨습니다.");
							}
							selectChoice();
						},
						data:{
							productNum:$('#productNum').val()
						}
					})
				}
			}
		});
		
		
		$('.conChoice').click(function() {
			var con = confirm("비추천하시겠습니까?");
			if (con) {
				if(	$('#check').val() == 'ok'){
					alert("자신의 글은 추천할 수 없습니다. ");
				}else{
					$.ajax({
						url : "conInsert",
						success: function (data) {
							if(data=="success"){
								alert("비추천 완료");
								replyList();
								replyList2();
							}else{
								alert("이미 선택하셨습니다.");
							}
							selectChoice();
						},
						data:{
							productNum:$('#productNum').val()
						}
						
					})
				}
			}
			
		});
		
	});
</script>
</head>
<body>
	<form action="control" id="frm" method="post">
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
				<br>
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-4"><!-- 수정 -->
								<div class="row">
									<div class="col-md-6">
										<img class="img-fluid rounded-circle" alt="happy"
											src="/resources/image/happy.png">
									</div>
									<div class="col-md-6" align="right">
										<div id="proChoice"></div>
									</div>
								</div>
								<button type="button" class="btn btn-info proChoice" value="${article.productNum }">살까</button>
								<div id="proReplys">
								<%@ include file="proReply.jsp" %>
								</div>
							</div>

							<div class="col-md-4"><!-- 수정 -->
								<h2>${article.articleTitle }</h2>
								<div class="col-md-12">
									<div class="col-md-12" style="text-align: center">
										<h3>${article.categoryName }</h3>
										<img class="productImg" src="${article.productImage }">
									</div>
									<div class="col-md-12">
										<table class="table text-center table-hover" width="10" style="table-layout: fixed">
											<tr>
												<td>조회수</td>
												<td>${article.articleHits }</td>
											</tr>
											<tr>
												<td>제품명</td>
												<td style="width:10px;word-break:break-all">${article.productName }</td>
											</tr>
											<tr>
												<td>링크</td>
												<td style="text-overflow:ellipsis; overflow:hidden; width: 10px;"><a href="${article.productLink}"
													target="_blank">${article.productLink }</a></td>
											</tr>
											<tr>
												<td>작성자 정보</td>
												<td style="width:10px;word-break:break-all">${article.nickName } /  
												<c:choose>
												<c:when test="${article.gender eq 'M' }">
												남 / 
												</c:when>
												<c:otherwise>
												여 / 
												</c:otherwise>		
												</c:choose>
												
												<c:set var="thisYear"><fmt:formatDate value="${toDay}" pattern="yyyy" /></c:set>
												<c:set var="birthYear" ><fmt:formatDate value="${article.birth}" pattern="yyyy" /></c:set>
												${thisYear - birthYear}세</td>
											</tr>
											<tr>
												<td>작성일</td>
												<td><fmt:formatDate value="${article.articleDate }"
														pattern="yyyy-MM-dd HH:mm" /></td>
											</tr>
										</table>
									</div>
									<p style="width=400">${article.articleContent }</p>
								</div>
								<div class="row">
<!-- 									<div class="col-md-4"> -->
<!-- 										<button type="button" class="btn btn-dark  btn-block" onclick="script:location='/Salmal/mainArticle'">목록으로</button> -->
<!-- 									</div> -->
             				  <div class="col-md-4">
                              <button type="button" class="btn btn-dark  btn-block" onclick="script:location='/Salmal/mainArticle?pageNum=${cri.pageNum}'
                                                                                                               +'&categoryName=${cri.categoryName}'
                                                                                                               +'&articleHeader='+ encodeURIComponent('${cri.articleHeader}')
                                                                                                               +'&articleTitle=${cri.articleTitle}'">목록으로</button>
							</div>
									<c:if test="${modify eq 'ok' && check eq 'ok'}">
									<div class="col-md-4">
										<button type="button" class="btn btn-primary btn-block" name="update" onclick="script:location='/Salmal/updateArticle?articleNum=${article.articleNum}'">글 수정</button>
									</div>
									</c:if>
									<c:if test="${modify eq 'no' && check eq 'ok' }">
									<div class="col-md-4">
										<button type="button" class="btn btn-primary btn-block" name="update" onclick="script:location='/Salmal/updateOnlyArticleContent?articleNum=${article.articleNum}'">글 내용 수정</button>
									</div>
									</c:if>
									<c:if test="${check eq 'ok' }">
									<div class="col-md-4">
										<button type="button" class="btn btn-danger btn-block" data-toggle="modal" data-target="#canCelModal">글 삭제</button>
									</div>
									</c:if>
								</div>
							</div>

							<div class="col-md-4" ><!-- 수정 -->
								<div class="row">
									<div class="col-md-6">
										<img class="img-fluid rounded-circle" alt="sad"
											src="/resources/image/sad.png">
									</div>
									<div class="col-md-6" align="right">
										<div id = conChoice></div>
									</div>
								</div>
								<button type="button" class="btn btn-warning conChoice"  value="${article.productNum }">말까</button>
								<div id="conReplys">
								<%@ include file="conReply.jsp" %>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<div class="modal fade" id="canCelModal" tabindex="-1" role="dialog" aria-labelledby="canCelModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="canCelModalLabel">글 삭제</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
      <div class="modal-body">
        정말 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick="script:location='/Salmal/deleteArticle?articleNum=${article.articleNum}&productImage=${article.productImage }'">삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>	
	
<input id="check" type="hidden" value="${check}"/>
<input id="pnum" type="hidden" value="${article.productNum}"/>
<input id="replyType" type="hidden" value="1"/>

	<script src="/resources/js/jquery.min.js"></script>
	<script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/scripts.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	</form>
</body>
</html>