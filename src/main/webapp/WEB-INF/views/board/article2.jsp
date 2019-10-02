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

<title>[골라줘]물품 정보 :</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="/resources/css/style.css" rel="stylesheet">
<script src="/resources/js/jquery-3.js"></script>

<script type="text/javascript">

function selectChoice(){
	var i=0;
	var j=0;
	var c1=0;
	var c2=0;
	
	$.ajax({
		url : "selectChoice",
		async : false,
		success: function (choice) {
			c1 = choice.c;
			i = choice.cnt;
		},
		data:{
			productNum:$('#p1num').val()
		}
	}) 
	
	$.ajax({
		url : "selectChoice",
		async : false,
		success: function (choice) {
			c2 = choice.c;
			j = choice.cnt;
		},
		data:{
			productNum:$('#p2num').val()
		}
	})
	
	
	if(c1 == 0 && c2 == 0){//선택X
		if($('#check').val() == 'ok'){//내글
			$('#proChoice').css({ "background-color" : "yellow"  , "border-radius" :"30%", "width": "70px", "text-align":"center"});
			$('#proChoice').html("<h2>"+i+"</h2>");
			$('#conChoice').css({ "background-color" : "yellow"  , "border-radius" :"30%", "width": "70px", "text-align":"center"});
			$('#conChoice').html("<h2>"+j+"</h2>");
			
		}
	}else{//선택X, 내글X
		if(i>j){
			$('#proChoice').css({ "background-color" : "yellow"  , "border-radius" :"30%", "width": "70px", "text-align":"center"});
			$('#proChoice').html("<h2>"+i+"</h2>");
			$('#namep1').css({ "background-color" : "yellow" });
		}else if(i<j){
			$('#conChoice').css({ "background-color" : "yellow"  , "border-radius" :"30%", "width": "70px", "text-align":"center"});
			$('#conChoice').html("<h2>"+j+"</h2>");
			$('#namep2').css({ "background-color" : "yellow" });
		}
		else{
			$('#proChoice').css({ "background-color" : "yellow"  , "border-radius" :"30%", "width": "70px", "text-align":"center"});
			$('#proChoice').html("<h2>"+i+"</h2>");
			$('#conChoice').css({ "background-color" : "yellow"  , "border-radius" :"30%", "width": "70px", "text-align":"center"});
			$('#conChoice').html("<h2>"+j+"</h2>");
		}
	}
	
}





$(function() {
	selectChoice();
	

	$('#imgp1').click(function(){
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
							reCommentList();
						}else{
							alert("이미 선택하셨습니다.");
						}
						selectChoice();
					},
					data:{
					productNum:$('#p1num').val()
					}
				
				})
			}
		}
	});
	
	
	$('#imgp2').click(function(){
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
						}else{
							alert("이미 선택하셨습니다.");
						}
						selectChoice();
					},
					data:{
						productNum:$('#p2num').val()
					}
				})
			}
		}
		
	});
});


</script>


</head>
<body>
	<!-- <form action="control2" id="frm" method="post"> -->
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
							<div>

								<H3>${articleList.get(0).ARTICLETITLE }</H3>
								<p>${articleList.get(0).CATEGORYNAME }</p>
							</div>
							<div class="row">
								<div class="col-md-4">
								<div align="right">
								<div id="proChoice"></div>
								</div>
									<div class="row">
										<div class="col-md-12" style="width: auto; height: 350px;  text-align: center;">
											<img class="productImg"
												src="${articleList.get(0).PRODUCTIMAGE }" alt="상품1이미지">
										</div>
										<div class="col-md-12">
											<table class="table text-center table-hover" style="table-layout: fixed;width:500px" >
												<tr id="namep1">
													<td>상품명</td>
													<td style="width:300px;word-break:break-all">${articleList.get(0).PRODUCTNAME}</td>
												</tr>
												<tr>
													<td>링크</td>
													<td style="text-overflow:ellipsis; overflow:hidden"><a href="${articleList.get(0).PRODUCTLINK}">${articleList.get(0).PRODUCTLINK}</a></td>
												</tr>
											</table>
										</div>
									</div>
								</div>

								<div class="col-md-4" align="center">
							
									<table class="table text-center table-hover" style="table-layout: fixed; width: 200px">
										<tbody>
											<tr>
												<td>조회수</td>
												<td>${articleList.get(0).ARTICLEHITS}</td>
											</tr>
											<tr>
												<td>닉네임</td>
												<td style="width:100px;word-break:break-all">${articleList.get(0).NICKNAME}</td>
											</tr>
											<tr>
												<td>성별</td>
												<td>${article.nickName }<c:choose>
														<c:when test="${articleList.get(0).GENDER eq 'M' }">
												남
												</c:when>
														<c:otherwise>
												여
												</c:otherwise>
													</c:choose></td>
											</tr>
											<tr>
												<td>나이</td>
												<td><c:set var="thisYear">
														<fmt:formatDate value="${toDay}" pattern="yyyy" />
													</c:set> <c:set var="birthYear">
														<fmt:formatDate value="${articleList.get(0).BIRTH}" pattern="yyyy" />
													</c:set> ${thisYear - birthYear}세</td>
											</tr>
										</tbody>
									</table>
									<div class="row">
										<div class="col-md-4">
									
											<img id="imgp1" class="img-fluid rounded-circle" alt="sad"
												src="/resources/image/left.png">
										</div>
										<div class="col-md-4"></div>
										<div class="col-md-4">
											<img id="imgp2" class="img-fluid rounded-circle" alt="sad"
												src="/resources/image/right.png">
										</div>
									</div>
								</div>

								<div class="col-md-4">
								<div align="right">
										<div id="conChoice"></div>
										</div>
									<div class="row">
										<div class="col-md-12" style="width: auto; height: 350px; text-align: center;">
											<img class="productImg"
												src="${articleList.get(1).PRODUCTIMAGE }" alt="상품1이미지">
										</div>
										<div class="col-md-12">
											<table class="table text-center table-hover" style="table-layout: fixed;width:500px">
												<tr id="namep2">
													<td>상품명</td>
													<td style="width:300px;word-break:break-all">${articleList.get(1).PRODUCTNAME}</td>
												</tr>
												<tr>
													<td>링크</td>
													<td style="text-overflow:ellipsis; overflow:hidden"><a
														href="${articleList.get(1).PRODUCTLINK}">${articleList.get(1).PRODUCTLINK}</a></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="row justify-content-center">
								<div class="col-md-8 bg-light">
									<div class="col-md-12">
										<table class="table text-center table-hover">
											<thead>
												<tr>
													<th class="text-center" style="width:100px">내용</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="text-left" style="width:200px;word-break:break-all">${articleList.get(0).ARTICLECONTENT}</td>
												</tr>
											</tbody>
										</table>
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
										<button type="button" class="btn btn-primary btn-block" onclick="script:location='/Salmal/updateArticle2?articleNum=${param.articleNum}'">글 수정</button>
									</div>
									</c:if>
									<c:if test="${modify eq 'no' && check eq 'ok' }">
									<div class="col-md-4">
										<button type="button" class="btn btn-primary btn-block" onclick="script:location='/Salmal/updateOnlyArticleContent2?articleNum=${param.articleNum}'">글 내용 수정</button>
									</div>
									</c:if>
									<c:if test="${check eq 'ok' }">
									<div class="col-md-4">
										<button type="button" class="btn btn-danger btn-block" data-toggle="modal" data-target="#canCelModal">글 삭제</button>
									</div>
									</c:if>
								</div>
								
									<%@ include file="twoReply.jsp" %>
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
        <button type="button" class="btn btn-danger" 
        onclick="script:location='/Salmal/deleteArticle2?productImage1=${articleList.get(0).PRODUCTIMAGE }&productImage2=${articleList.get(1).PRODUCTIMAGE }&articleNum=${param.articleNum }'">삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>			
		
		<input id="p1num" type="hidden" value="${articleList.get(0).PRODUCTNUM }"/>
		<input id="p2num" type="hidden" value="${articleList.get(1).PRODUCTNUM }"/>
		<input id="check" type="hidden" value="${check }"/>
		<input id="replyType" type="hidden" value="2"/>

		<script src="/resources/js/jquery.min.js"></script>
		<script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<script src="/resources/js/scripts.js"></script>
		<script src="/resources/js/popper.min.js"></script>
	<!-- </form> -->
</body>
</html>