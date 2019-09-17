<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>살까말까</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="/resources/css/style.css" rel="stylesheet">

</head>
<body>
	<script src="/resources/js/jquery.min.js"></script>
	<script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/scripts.js"></script>
	<script src="/resources/js/popper.min.js"></script>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="page-header" style="background-color: #FFDF3F">
					<h1>
						<img alt="Logo" src="/resources/productImage/Logo.jpg"
							class="rounded" width="100" height="100"> 살까? 말까? <small>
							구매 결정 도우미 </small>
					</h1>
				</div>
				<div class="tabbable" id="tabs-129651"
					style="background-color: #ffae00">
					<nav class="navbar navbar-expand-sm navbar-dark">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item">
								<button type="button" class="btn btn btn-light"
									onclick="location.href='main'">
									<b>홈으로</b>
								</button>
							</li>
							<li>　</li>
							<li class="nav-item active">
								<button type="button" class="btn btn-outline-light"
									onclick="location.href='mainArticle'">
									<b>살까말까</b>
								</button>
							</li>
						</ul>
						<c:choose>
							<c:when test="${login eq 'success'}">
								<button type="button" class="btn btn-outline-light" onclick="location.href='myPage'">
									<b>마이페이지</b>
								</button>
								<a>　</a>
								<button type="button" class="btn btn-outline-light"
									onclick="location.href='logout'">
									<b>로그아웃</b>
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-outline-light"
									onclick="location.href='login'">
									<b>로그인</b>
								</button>
							</c:otherwise>
						</c:choose>
					</nav>
				</div>
				<br>
				<div class="row">
					<div class="col-md-6">
						<div class="jumbotron" style="background-color: #FFDF3F">
							<h2 class="text-center">살까 말까</h2>
							<p class="text-center">
								살까 말까는<br> 당신의 구매 결정을 <br> 다양한 사람들과 공유하고 결정하는 <br>
								커뮤니티 사이트입니다.
							</p>
							<p class="text-center">
								<a class="btn btn-primary btn-large btn-warning" href="mainArticle">살까말까
									게시판</a>
							</p>
						</div>
					</div>
					<div class="col-md-6">
						<p>날짜순</p>
						<table class="table">
							<thead>
								<tr>
									<th class="text-center">글번호</th>
									<th class="text-center">말머리</th>
									<th class="text-center">글제목</th>
									<th class="text-center">글쓴이</th>
									<th class="text-center">날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listDate }" var="articleNew">
									<tr>
										<td class="text-center"><c:out
												value="${articleNew.ARTICLENUM}"></c:out></td>
												
										<td class="text-center"><c:out
												value="${articleNew.PRODUCTCNT}"></c:out></td>
										<c:if test="${articleNew.PRODUCTCNT eq '#이거어때?' }">
											<td class="text-center "><a
												href="article?articleNum=<c:out value="${articleNew.ARTICLENUM}"></c:out>">
													<c:out value="${articleNew.ARTICLETITLE }..."></c:out>
											</a></td>
										</c:if>
										<c:if test="${articleNew.PRODUCTCNT eq '#골라줘' }">
											<td class="text-center "><a
												href="article2?articleNum=<c:out value="${articleNew.ARTICLENUM}"></c:out>">
													<c:out value="${articleNew.ARTICLETITLE }..."></c:out>
											</a></td>
										</c:if>
										
										<td class="text-center"><c:out
												value="${articleNew.NICKNAME }"></c:out></td>
										<td class="text-center"><fmt:formatDate value="${articleNew.ARTICLEDATE }" pattern="yyyy-MM-dd HH:mm"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<p>조회순</p>
						<table class="table">
							<thead>
								<tr>
									<th class="text-center">글번호</th>
									<th class="text-center">말머리</th>
									<th class="text-center">글제목</th>
									<th class="text-center">글쓴이</th>
									<th class="text-center">조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<c:forEach items="${listHits }" var="articleHit">
										<tr>
											<td class="text-center"><c:out
													value="${articleHit.ARTICLENUM}"></c:out></td>
													
										<td class="text-center"><c:out
												value="${articleHit.PRODUCTCNT}"></c:out></td>
										<c:if test="${articleHit.PRODUCTCNT eq '#이거어때?' }">
											<td class="text-center "><a
												href="article?articleNum=<c:out value="${articleHit.ARTICLENUM}"></c:out>">
													<c:out value="${articleHit.ARTICLETITLE }..."></c:out>
											</a></td>
										</c:if>
										<c:if test="${articleHit.PRODUCTCNT eq '#골라줘' }">
											<td class="text-center "><a
												href="article2?articleNum=<c:out value="${articleHit.ARTICLENUM}"></c:out>">
													<c:out value="${articleHit.ARTICLETITLE }..."></c:out>
											</a></td>
										</c:if>
											
											<td class="text-center"><c:out
													value="${articleHit.NICKNAME }"></c:out></td>
											<td class="text-center"><c:out
													value="${articleHit.ARTICLEHITS }"></c:out></td>
										</tr>
									</c:forEach>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>


</body>
</html>