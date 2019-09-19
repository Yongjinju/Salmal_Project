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
		$('#button1').click(function(){ //댓글 추가
			if($('#inputProReply').val()==""){
				alert('댓글을 입력하세요!');
			} else {
				$.ajax({
					url:"addReply",
					data:{
						choice:1,
						replyContent : $('#inputProReply').val(),
						productNum:$('#productNum').val()
					},
					success:function(data){
						replyList();
						$('#reCommentTable').append($('#reComment')); //대댓글입력창 원래 자리로
						$('#inputProReply').val("");				  //댓글입력창 초기화
					}
				});
				/*$.ajax({
					url:"addReply2",
					data:{
						choice:1,
						replyContent : $('#inputProReply').val(),
						productNum:$('#productNum').val()
					},
					success:function(data){
						replyList();
						$('#reCommentTable').append($('#reComment')); //대댓글입력창 원래 자리로
						$('#inputProReply').val("");				  //댓글입력창 초기화
					}
					
				});*/
			}
		});
		
		$('#div1').on('click','.updReply',function(){ //댓글 수정
			var id = $(this).val();
			if(($('#'+id).find('input').val())==""){
				alert('댓글을 입력하세요!');
			} else {
				if($(this).html()=='수정'){
					$(this).html('변경');
					$('#'+id).find(':nth-child(2):eq(0)').html('<input size=30 type=text value="' + $('#' + id).find(':nth-child(2)').html()+ '">')
				} else {
					$.ajax({
						url:"updReply",
						data:{
							replyNum : $(this).val(),
							replyContent : $('#'+id).find('input').val()
						},
						success:function(){
							replyList()
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
						alert('삭제완료');
					}
				})
			}
		});
		
		//대댓글 달기 클릭
		$('#div1').on('click', '.reCommentAdd', function(){
			var trId=$(this).attr('value');//부모댓글id
			console.log(trId);
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
					},
					success:function(data){
						replyList();
						$('.reComment').val("");
						$('#reCommentTable').append($('#reComment'));
						console.log(data)
					}
				});
				/* $.ajax({
					url:"addReply2",
					data:{
						choice:1,
						replyContent : $('.reComment').val(),
						productNum:$('#productNum').val(),
						parentNum:$('.parentNum').val(),
					},
					success:function(data){
						replyList();
						$('.reComment').val("");
						$('#reCommentTable').append($('#reComment'));
						console.log(data)
					}
				}); */
			}
		});
		
		//대댓글 취소
		$('#div1').on('click', '.reCommentCancle', function(){
			console.log('대댓취소');
		});
		
	});
	
	function replyList(){//댓글 전체 조회
		$.ajax({
			url : "replyList",
			success: function (data) {
				var html = "<table class='table text-center table-hover'>";
				html += "<thead><tr><th>번호</th><th>내용</th><th>글쓴이</th></tr></thead><tbody>";
				for(var i=0; i<data.length; i++){
					html+='<tr id="'+data[i].replyNum+'" style="border-top:1px solid;">'
					html+='<td style="width:90px;">'+(i+1)+'</td>';
					html+='<td style="width:250px;word-break:break-all">'+data[i].replyContent+'</td>';
					html+='<td>'+data[i].nickname+'</td>';
					html+='</tr>';
					html+='<tr style="border-top:hidden;">';
					html+='<td><a class="reCommentAdd" href="javascript:;" value="'+data[i].replyNum+'">답글달기</a></td>'
					html+='<td>'+data[i].replyDate+'</td>';
					if($('#logNum').val()==data[i].memberNum){
						html+='<td colspan="2"><button type="button" class="btn btn-success btn-sm updReply" value="'+data[i].replyNum+'" >수정</button>';
						html+='<button type="button" class="btn btn-danger btn-sm delReply" value="'+data[i].replyNum+'">삭제</button> </td>';
					}
					
					html+='</tr>';
					
				}
				html+='</tbody></table>';
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
			<table id="reCommentTable" style="display: none">
				<tr id="reComment">
					<td colspan="3"><textarea class="reComment"
							placeholder="댓글 달기" cols="20"></textarea> <a href="javascript:;"
						class="reCommentCommit" value="1">등록</a> <a href="javascript:;"
						class="reCommentCancle">취소</a> <input type="hidden" value=""
						class="parentNum">
					<td>
				</tr>
			</table>
		</div>
	</div>
	<div id="div1"></div>
</body>
</html>