<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 입력</title>

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
				<form id="inputForm" method="post" enctype="multipart/form-data">
				
				<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label for="title">제목</label> 
						<input type="text" class="form-control" name="articleTitle">
					</div>
					<div class="form-group">
						<select class=”form-control“ name="categoryName">
							<option>카테고리</option>
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
					<div class="form-group">
						<label for="content">내용</label>
						<textarea class="form-control" rows="20" cols="20" name="articleContent" ></textarea>
					</div>
</div>
			</div>
				
				<div class="row">
				
				<div class="col-md-6">
					<div class="form-group">
						<label for="productName1">첫 번째 상품명</label> 
						<input type="text" class="form-control" name="productName1">
					</div>
					<div class="form-group">
						<label for="link1">첫 번째 상품 링크</label> 
						<input type="text" class="form-control" name="productLink1">
					</div>
					<div class="form-group">
						<label for="image1">첫 번째 상품 이미지 첨부</label> 
						<input type="file" class="form-control-file" id="uploadFile1" name="uploadFile1">
						<div class="select_img1"><img src="" /></div>
					</div>
				</div>
					
				<div class="col-md-6">	
					<div class="form-group">
						<label for="productName2">두 번째 상품명</label> 
						<input type="text" class="form-control" name="productName2">
					</div>
					<div class="form-group">
						<label for="link2">두 번째 상품 링크</label> 
						<input type="text" class="form-control" name="productLink2">
					</div>
					<div class="form-group">
						<label for="image2">두 번째 상품 이미지 첨부</label> 
						<input type="file" class="form-control-file" id="uploadFile2" name="uploadFile2">
						<div class="select_img2"><img src="" /></div>
					</div>
				</div>
				
				</div>
				
				<div class="row">
					<div class="col-md-2">
					<button type="button" class="btn btn-primary" id="input" >등록</button>
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
							  $('#uploadFile1').change(function(){
							   if(this.files && this.files[0]) {
								   console.log('첫번째파일');
							    var reader = new FileReader;
							    reader.onload = function(data) {
							     $('.select_img1 img').attr('src', data.target.result);        
							    }
							    reader.readAsDataURL(this.files[0]);
							   }
							  });
							  $('#uploadFile2').change(function(){
								   if(this.files && this.files[0]) {
									   console.log('두번째파일');
								    var reader = new FileReader;
								    reader.onload = function(data) {
								     $('.select_img2 img').attr('src', data.target.result);        
								    }
								    reader.readAsDataURL(this.files[0]);
								   }
								  });
							  
							  $('#input').click(function() {
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
							  	} else if ($('#uploadFile1').val() === '' ) {
								  	alert('첫 번째 상품 이미지를 첨부해주세요');
								  	$('#uploadFile1').focus();
							  	} else if ($('#uploadFile2').val() === '' ) {
								  	alert('두 번째 상품 이미지를 첨부해주세요');
								  	$('#uploadFile2').focus();
							  	} else {
							  		$('#inputForm').submit();
							  	}
							});
							 </script>
</body>
</html>