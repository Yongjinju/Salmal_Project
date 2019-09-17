<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>

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
				<form id="updateForm" role="form" method="post" enctype="multipart/form-data">
					
					<div class="row">
					<div class="col-md-12">
					<div class="form-group">
						<label for="title">제목</label> 
						<input type="text" class="form-control" name="articleTitle" value="${article.get(0).articleTitle}">
					</div>
					
					<div class="form-group">
						<select class=”form-control“ name="categoryName">
							<c:forEach items="${category }" var="c">
							 <c:if test="${article.get(0).categoryName eq c}">
							 	<option selected="selected">${c }</option>
							 </c:if>
							 <c:if test="${article.get(0).categoryName ne c}">
							 	<option>${c }</option>
							 </c:if>
						 	</c:forEach>
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
						<input type="hidden" name="oldProductNum1" value="${article.get(0).productNum }">
						<input type="text" class="form-control" name="productName1" value="${article.get(0).productName}">
					</div>
					<div class="form-group">
						<label for="link1">첫 번째 상품 링크</label> 
						<input type="text" class="form-control" name="productLink1" value="${article.get(0).productLink}">
					</div>
					<div class="form-group">
						<label for="image1">첫 번째 상품 이미지 첨부</label> 
						<a href="#this" name="uploadFile1">${article.get(0).productImage.substring(article.get(0).productImage.lastIndexOf("/")+1)}</a>
						<input type="file" class="form-control-file" id="uploadFile1" name="uploadFile1">
						<div class="select_img1"><img src="${pageContext.request.contextPath }${article.get(0).productImage }" width="500" /></div>
					</div>
				</div>	
					
				<div class="col-md-6">	
					<div class="form-group">
						<label for="productName2">두 번째 상품명</label> 
						<input type="hidden" name="oldProductNum2" value="${article.get(1).productNum }">
						<input type="text" class="form-control" name="productName2"  value="${article.get(1).productName}">
					</div>
					<div class="form-group">
						<label for="link">두 번째 상품의 링크</label> 
						<input type="text" class="form-control" name="productLink2" value="${article.get(1).productLink}">
					</div>
					<div class="form-group">
						<label for="image2">두 번째 상품 이미지 첨부</label>
						<a href="#this" name="uploadFile2">${article.get(1).productImage.substring(article.get(1).productImage.lastIndexOf("/")+1)}</a>
						<input type="file" class="form-control-file" id="uploadFile2" name="uploadFile2">
						<div class="select_img2"><img src="${article.get(1).productImage }" width="500" /></div>
					</div>

				</div>
				</div>
				
				<div class="row">
					<div class="col-md-2">
					<button type="button" class="btn btn-primary" id="update" >수정</button>
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
							<script>
							  $("#uploadFile1").change(function(){
							   if(this.files && this.files[0]) {
								   console.log('첫번째파일');
							    var reader = new FileReader;
							    reader.onload = function(data) {
							     $(".select_img1 img").attr("src", data.target.result);        
							    }
							    reader.readAsDataURL(this.files[0]);
							   }
							  });
							  $("#uploadFile2").change(function(){
								   if(this.files && this.files[0]) {
									   console.log('두번째파일');
								    var reader = new FileReader;
								    reader.onload = function(data) {
								     $(".select_img2 img").attr("src", data.target.result);        
								    }
								    reader.readAsDataURL(this.files[0]);
								   }
								  });
							  
							  $('#update').click(function() {
								  if($('[name=articleTitle]').val().replace(/ /g, '') === '' ){
										alert('제목을 입력해주세요');
										$('[name=articleTitle]').focus();
									} else if ($('[name=categoryName]').val() === '카테고리' ) {
									  	alert('카테고리를 선택해주세요');
									  	$('[name=categoryName]').focus();
								  	} else if ($('[name=productName1]').val().replace(/ /g, '') === '' ) {
									  	alert('첫 번째 상품명을 입력해주세요');
									  	$('[name=productName1]').focus();
								  	} else if ($('[name=productName2]').val().replace(/ /g, '') === '' ) {
									  	alert('두 번째 상품명을 입력해주세요');
									  	$('[name=productName2]').focus();
								  	} else if ($('[name=productLink1]').val().replace(/ /g, '') === '' ) {
									  	alert('첫 번째 상품 링크를 입력해주세요');
									  	$('[name=productLink1]').focus();
								  	} else if ($('[name=productLink2]').val().replace(/ /g, '') === '' ) {
									  	alert('두 번째 상품 링크를 입력해주세요');
									  	$('[name=productLink2]').focus();
								  	} else {
							  		$('#updateForm').submit();
							  	}
							});
							 </script>
</body>
</html>