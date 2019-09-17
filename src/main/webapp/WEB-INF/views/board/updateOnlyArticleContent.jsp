<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용 수정</title>

<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
<style>
img {
	width: auto;
	height: auto;
	max-width: 300px;
	max-height: 300px;
}
</style>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8">
				<form role="form" method="post" enctype="multipart/form-data">
<%-- 						<input type="hidden" name="articleNum" value="${article.articleNum}"> --%>
					<div class="form-group">
						<label for="title">제목</label> 
						<input type="text" class="form-control" name="articleTitle" value="${article.get(0).articleTitle}" disabled="disabled">
					</div>
					<div class="form-group">
						<label for="link">상품명</label> 
						<input type="text" class="form-control" name="productName" value="${article.get(0).productName}" disabled="disabled">
					</div>
					<div class="form-group">
						<label for="link">링크</label> 
						<input type="text" class="form-control" name="productLink" value="${article.get(0).productLink}" disabled="disabled">
						
					</div>

					<div class="form-group">
						<select class=”form-control“ name="categoryName" disabled="disabled">
							<option>${article.get(0).categoryName }</option>
						</select>
					</div>

					<div class="form-group">
						<label for="content">내용</label>
						<textarea class="form-control" rows="20" cols="20" name="articleContent" >${article.get(0).articleContent }</textarea>
					</div>

					<div class="form-group">
						<a href="#this" name="uploadFile">${article.get(0).productImage.substring(article.get(0).productImage.lastIndexOf("/")+1)}</a>
						<input type="file" class="form-control-file" id="uploadFile"  name="uploadFile" disabled="disabled" >
					</div>
						<div class="select_img"><img src="${article.get(0).productImage }"/></div>

					<button type="submit" class="btn btn-primary" >수정</button>
					<button type="button" class="btn btn-danger" onclick="script:history.back()">취소</button>
				</form>
			</div>
		</div>
	</div>

	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/scripts.js"></script>
	
</body>
</html>