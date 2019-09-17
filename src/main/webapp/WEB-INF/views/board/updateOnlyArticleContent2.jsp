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
					
					<div class="row">
					<div class="col-md-12">
					
					<div class="form-group">
						<label for="title">제목</label> 
						<input type="text" class="form-control" name="articleTitle" value="${article.get(0).articleTitle}" disabled="disabled">
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
					
			</div>
			</div>					

				<div class="row">
				
				<div class="col-md-6">
										
					<div class="form-group">
						<label for="productName1">첫 번째 상품명</label>
						<input type="text" class="form-control" name="productName1"  value="${article.get(0).productName}" disabled="disabled">
					</div>
					
					<div class="form-group">
						<label for="link1">첫 번째 상품 링크</label>  
						<input type="text" class="form-control" name="productLink1" value="${article.get(0).productLink}" disabled="disabled">
					</div>
					
					<div class="form-group">
						<label for="image1">첫 번째 상품 이미지 첨부</label> 
						<a href="#this" name="uploadFile1">${article.get(0).productImage.substring(article.get(0).productImage.lastIndexOf("/")+1)}</a>
						<input type="file" class="form-control-file" id="uploadFile1" name="uploadFile1" disabled="disabled">
						<div class="select_img1"><img src="${article.get(0).productImage }"/></div>
					</div>
				</div>	
				
				<div class="col-md-6">	
					<div class="form-group">
						<label for="productName2">두 번째 상품명</label> 
						<input type="text" class="form-control" name="productName2"  value="${article.get(1).productName}" disabled="disabled">
					</div>
					
					
					<div class="form-group">
						<label for="link">두 번째 상품의 링크</label>
						<input type="text" class="form-control" name="productLink2" value="${article.get(1).productLink}" disabled="disabled">
					</div>

					<div class="form-group">
						<label for="image2">두 번째 상품 이미지 첨부</label>
						<a href="#this" name="uploadFile2">${article.get(1).productImage.substring(article.get(1).productImage.lastIndexOf("/")+1)}</a>
						<input type="file" class="form-control-file" id="uploadFile2" name="uploadFile2" disabled="disabled">
						<div class="select_img2"><img src="${article.get(1).productImage }"/></div>
					</div>

				</div>
				</div>

				<div class="row">
					<div class="col-md-2">
					<button type="submit" class="btn btn-primary" >수정</button>
					</div>
					<div class="col-md-2">
					<button type="button" class="btn btn-danger" onclick="script:location='/Salmal/mainArticle'">취소</button>
					</div>
				</div>				
				</form>
			</div>
		</div>
	</div>
							
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/scripts.js"></script>
	
</body>
</html>