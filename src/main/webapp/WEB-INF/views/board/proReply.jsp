<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pros Reply</title>
<script src="/resources/js/jquery-3.js"></script>
<script>
	$(function(){
		replyList();
		reCommentList();
		$('#button1').click(function(){ //댓글 추가
			if($('#inputProReply').val()==""){
				alert('댓글을 입력하세요!');
			} else {
				$.ajax({
					url:"addReply",
					data:{
						choice:1,
						replyContent : $('#inputProReply').val(),
						productNum:$('#productNum').val(),
					},
					success:function(data){
						replyList();
						reCommentList();
						$('#reCommentTable').append($('#reComment')); //대댓글입력창 원래 자리로
						$('#inputProReply').val("");				  //댓글입력창 초기화
					}
				});
			}
		});
		
		$('#div1').on('click','.updReply',function(){ //댓글 수정
			var id = $(this).val();
			if(($('#'+id).find('input').val())==""){
				alert('댓글을 입력하세요!');
			} else {
				if($(this).html()=='수정'){
					$(this).html('변경');
					//$('#'+id).find(':nth-child(2):eq(0)').html('<input size=30 type=text value="' + $('#' + id).find(':nth-child(2)').html()+ '">')
					console.log($('#content'+id).attr('id'));
					$('#content'+id).html('<input size=30 type=text value="' + $('#content' + id).html()+ '">')
				} else {
					$.ajax({
						url:"updReply",
						data:{
							replyNum : $(this).val(),
							replyContent : $('#'+id).find('input').val()
						},
						success:function(){
							replyList();
							reCommentList();
						}
					});
				}
			}
		});
		
		
		$('#div1').on('click','.delReply',function(){ //댓글 삭제
			var i = confirm('정말 삭제하시겠습니까?');
			if(i){
				$.ajax({
					url:"delReply",
					data:{
						replyNum:$(this).val()
					},
					success:function(){
						replyList();
						reCommentList();
						alert('삭제완료');
					}
				})
			}
		});
		
		//대댓글 달기 클릭
		$('#div1').on('click', '.reCommentAdd', function(){
			var trId=$(this).attr('value');//부모댓글id
			var parentDepth=$(this).attr('depth');//부모댓글깊이
			console.log(trId);
			console.log(parentDepth);
			$('#depth').val(parentDepth);//hidden에 부모댓글 깊이 저장
			$('.parentNum').val(trId);//hidden에 부모댓글id저장
			$('.reComment').val(""); //textarea초기화
			$('#'+trId).next().after($('#reComment'));//textarea위치수정
			$('#reComment').css('display',''); //댓글창디스플레이on
		});
		
		//대댓글 등록
		$('#div1').on('click', '.reCommentCommit', function(){
			console.log('대댓등록');
			if($('.reComment').val()==""){ //대댓글 추가창이 비어있다면
				alert('댓글을 입력하세요!');
			} else { 
				$.ajax({
					url:"addReply",
					data:{
						choice:1,
						replyContent : $('.reComment').val(),
						productNum:$('#productNum').val(),
						parentNum:$('.parentNum').val(),
						depth:$('#depth').val()
					},
					success:function(data){
						replyList();
						reCommentList();
						$('.reComment').val("");
						$('#reCommentTable').append($('#reComment'));
						console.log(data)
					}
				});
			}
		});
		
		//대댓글 취소
		$('#div1').on('click', '.reCommentCancle', function(){
			console.log('대댓취소');
			$('.reComment').val("");
			$('#reCommentTable').append($('#reComment'));
		});
		
	});
	
	function replyList(){//댓글 전체 조회
		$.ajax({
			url : "replyList",
			success: function (data) {
				var html = "<table class='table text-center table-hover'>";
				html += "<thead><tr><th>번호</th><th>내용</th><th>글쓴이</th></tr></thead>";
				var cnt=0;
				for(var i=0; i<data.length; i++){
					if(data[i].depth==0 && data[i].parentNum==0){
						html+='<tbody id="td'+data[i].replyNum+'"><tr id="'+data[i].replyNum+'" style="border-top:1px solid; background-color: #ffffd3;">'
						html+='<td style="width:90px;">'+(cnt+1)+'</td>';
						html+='<td style="width:250px;word-break:break-all"><span id="content'+data[i].replyNum+'">'+data[i].replyContent+'</span></td>';
						html+='<td>'+data[i].nickname+'</td>';
						html+='</tr>';
						html+='<tr style="border-top:hidden; background-color: #ffffd3;">';
						html+='<td><a class="reCommentAdd" href="javascript:;" value="'+data[i].replyNum+'" depth="'+data[i].depth+'">답글달기</a></td>';
						html+='<td>'+data[i].replyDate+'</td>';
						if($('#logNum').val()==data[i].memberNum){
							html+='<td colspan="2"><button type="button" class="btn btn-success btn-sm updReply" value="'+data[i].replyNum+'" >수정</button>';
							html+='<button type="button" class="btn btn-danger btn-sm delReply" value="'+data[i].replyNum+'">삭제</button> </td>';
						} else {
							html += '<td></td>'
						}
						html+='</tr></tbody>';
						cnt=cnt+1;
					}
				}
				html+='</table>';
				$('#div1').html(html);
				$('#button1').attr('disabled', false);
				$('#button2').attr('disabled', false);
			},
			  
			 
			dataType:'json',
			data:{
				productNum : $('#productNum').val(),
				choice:1
				,articleNum:$('#articleNum').val()
				,replyType:$('#replyType').val()
			}
		});
	}
	
	function reCommentList(){// 대댓글 전체 조회
		$.ajax({
			url : "replyList",
			success: function (data) {
				console.log('▶'+ JSON.stringify(data));
				for(var i=0; i<data.length; i++){
				var html = "";
					if(data[i].depth!=0 || data[i].parentNum!=0){
						html+='<tr id="'+data[i].replyNum+'" parentNum="'+data[i].parentNum+'" depth="'+data[i].depth+'"style="border-top:1px solid; background-color:#fff1b4;">';
						html+='<td style="width:90px;"><img src="/resources/image/turn-right.png" width="15px" height="auto"></td>';
						if(data[i].depth==1){
							html+='<td style="width:250px;word-break:break-all;"><span id="content'+data[i].replyNum+'">'+data[i].replyContent+'</span></td>';
						} else if(data[i].depth==2){
							html+='<td style="width:250px;word-break:break-all;"><font color="#a2a2a2" size="2">@'+$('#'+data[i].parentNum).find('td').last().html()+'</font><span id="content'+data[i].replyNum+'">'+data[i].replyContent+'</span></td>';
						}
						html+='<td>'+data[i].nickname+'</td>';
						html+='</tr>';
						html+='<tr style="border-top:hidden; background-color:#fff1b4;">';
						html+='<td><a class="reCommentAdd" href="javascript:;" value="'+data[i].replyNum+'" depth="'+data[i].depth+'">답글달기</a></td>'
						html+='<td>'+data[i].replyDate+'</td>';
						if($('#logNum').val()==data[i].memberNum){
							html+='<td colspan="2"><button type="button" class="btn btn-success btn-sm updReply" value="'+data[i].replyNum+'" >수정</button>';
							html+='<button type="button" class="btn btn-danger btn-sm delReply" value="'+data[i].replyNum+'">삭제</button> </td>';
						} else {
							html += '<td></td>';
						}
						html+='</tr>';
						$('#rediv').html(html);
						
						if(data[i].depth==1){
							$('#td'+data[i].parentNum+':last').append($('#'+data[i].replyNum)).append($('#rediv tr'));
						    //$('#td'+data[i].parentNum+':last').append($('#rediv tr'));
						} else if(data[i].depth==2){
							var grandNum="";
							if($('#'+data[i].parentNum).attr('depth')==2){
								//grendNum=$('#'+$('#'+data[i].parentNum).attr('parentNum')).attr('id');
								grandNum=$('#'+($('#'+$('#'+data[i].parentNum).attr('parentNum'))).attr('parentNum')).attr('id');
								console.log(data[i].replyNum+':부모댓이 깊이: 2 , 조상: '+grandNum);
								$('#td'+grandNum+':last').append($('#'+data[i].replyNum)).append($('#rediv tr'));
							} else if ($('#'+data[i].parentNum).attr('depth')==1){
								grandNum=$('#'+$('#'+data[i].parentNum).attr('parentNum')).attr('id');
								console.log(data[i].replyNum+':부모댓이 깊이: 1 , 조상: '+grandNum);
								$('#td'+grandNum+':last').append($('#'+data[i].replyNum)).append($('#rediv tr'));
							}
						    //$('#td'+grandNum+':last').append($('#rediv tr'));
						}
						//alert(">>>"+$('#rediv tr').html())
					}
				}
			},
			dataType:'json',
			data:{
				productNum : $('#productNum').val(),
				choice:1
				,articleNum:$('#articleNum').val()
				,replyType:$('#replyType').val()
			}
		});
	}
</script>
</head>
<body>
	<br>
	<div class="row">
		<div class="col-md-10">
			<div class="form-group">
				<input type="text" placeholder="추천 댓글 달기" id="inputProReply"
					class="form-control">
			</div>
		</div>
		<div class="col-md-2">
			<button id="button1" type="button" class="btn btn-primary"
				disabled="disabled">등록</button>
			<input id="productNum" type="hidden" value="${article.productNum }">
			<input id="logNum" type="hidden" value="${logNum}"> <input
				id="articleNum" type="hidden" value="${article.articleNum }" />
			<input id="parentNick" type="hidden" value=""/>
			<input id="depth" type="hidden" value="">
			<table id="reCommentTable" style="display: none">
				<tr id="reComment" style="background-color: ">
					<td colspan="3">
						<textarea class="reComment" placeholder="댓글 달기" cols="20"></textarea>
						<a href="javascript:;" class="reCommentCommit" value="1">등록</a> 
						<a href="javascript:;" class="reCommentCancle">취소</a> 
					 	<input type="hidden" value="" class="parentNum">
					<td>
				</tr>
			</table>
		</div>
	</div>
	<div id="div1"></div>
	<div id="rediv" style="display: none"></div>
</body>
</html>