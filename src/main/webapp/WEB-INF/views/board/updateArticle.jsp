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
					<div class="form-group">
						<label for="title">제목</label> 
						<input type="text" class="form-control" name="articleTitle" value="${article.get(0).articleTitle}">
					</div>
					<div class="form-group">
						<label for="link">상품명</label> 
						<input type="hidden" name="oldProductNum" value="${article.get(0).productNum }">
						<input type="text" class="form-control" name="productName" value="${article.get(0).productName}">
					</div>
					<div class="form-group">
						<label for="link">링크</label> 
						<input type="text" class="form-control" name="productLink" value="${article.get(0).productLink}" >
						
					</div>

					<div class="form-group">
						<select class=”form-control“ name="categoryName" >
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

					<div class="form-group">
						<a href="#this" name="uploadFile">${article.get(0).productImage.substring(article.get(0).productImage.lastIndexOf("/")+1)}</a>
						<input type="file" class="form-control-file" id="uploadFile"  name="uploadFile" >
						<div class="select_img"><img src="${article.get(0).productImage }"/></div>
					</div>

					<button type="button" class="btn btn-primary" id="update">수정</button>
					<button type="button" class="btn btn-danger" onclick="script:history.back()">취소</button>
				</form>
			</div>
		</div>
	</div>

	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/scripts.js"></script>
	
							<script>
							  $("#uploadFile").change(function(){
							   if(this.files && this.files[0]) {
							    var reader = new FileReader;
							    reader.onload = function(data) {
							     $(".select_img img").attr("src", data.target.result);        
							    }
							    reader.readAsDataURL(this.files[0]);
							   }
							  });
							  
							  
							  $('#update').click(function() {
								  if($('[name=articleTitle]').val().replace(/ /g, '') === '' ){
									alert('제목을 입력해주세요');
									$('[name=articleTitle]').focus();
								} else if ($('[name=productName]').val().replace(/ /g, '') === '' ) {
								  	alert('상품명을 입력해주세요');
								  	$('[name=productName]').focus();
							  	} else if ($('[name=productLink]').val().replace(/ /g, '') === '' ) {
								  	alert('링크를 입력해주세요');
								  	$('[name=productLink]').focus();
							  	} else if ($('[name=categoryName]').val() === '카테고리' ) {
								  	alert('카테고리를 선택해주세요');
								  	$('[name=categoryName]').focus();
							  	} else {
							  		$('#updateForm').submit();
							  	}
							});
							 </script>

</body>
</html>