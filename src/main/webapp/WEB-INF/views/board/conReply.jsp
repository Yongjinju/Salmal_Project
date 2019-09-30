<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cons Reply</title>
<script src="/resources/js/jquery-3.js"></script>
<script>
	$(function(){
		replyList2();
		reCommentList2();
		$('#button2').click(function(){//댓글 추가
			if($('#inputConReply').val()==""){
				alert('댓글을 입력하세요!');
			} else {
				$.ajax({
					url:"addReply",
					data:{
						choice:0,
						replyContent : $('#inputConReply').val(),
						productNum:$('#productNum').val()
					},
					success:function(data){
						replyList2();
						reCommentList2();
						$('#reCommentTable').append($('#reComment'));
						$('#inputConReply').val("");
					}
				});
			}
		});
		
		$('#div2').on('click','.updReply',function(){ //댓글 수정
			var id = $(this).val();
			if($('#'+id).find('input').val()==""){
				alert('댓글을 입력하세요!');
			} else {
				if($(this).html()=='수정'){
					$(this).html('변경');
					$('#content'+id).html('<input size=30 type=text value="' + $('#content' + id).html()+ '">')
				} else {
					$.ajax({
						url:"updReply",
						data:{
							replyNum : $(this).val(),
							replyContent : $('#'+id).find('input').val()
						},
						success:function(){
							replyList2();
							reCommentList2();
						}
					});
				}
			}
		});
		
		$('#div2').on('click','.delReply',function(){ //댓글 삭제
			var i = confirm('정말 삭제하시겠습니까?');
			if(i){
				$('.reComment').val("");
				$('#reCommentTable').append($('#reComment'));
				$.ajax({
					url:"delReply",
					data:{
						replyNum:$(this).val()
					},
					success:function(){
						replyList2();
						reCommentList2();
						alert('삭제완료');
					}
				})
			}
		});
		
		//대댓글 달기 클릭
		$('#div2').on('click', '.reCommentAdd', function(){
			var trId=$(this).attr('value');//부모댓글id
			var parentDepth=$(this).attr('depth');//부모댓글깊이
			console.log(trId);
			console.log(parentDepth);
			$('#depth2').val(parentDepth);//hidden에 부모댓글 깊이 저장
			$('.parentNum').val(trId);//hidden에 부모댓글id저장
			$('.reComment').val(""); //textarea초기화
			$('#'+trId).next().after($('#reComment'));//textarea위치수정
			$('#reComment').css('display',''); //댓글창디스플레이on
		});
		
		//대댓글 등록
		$('#div2').on('click', '.reCommentCommit', function(){
			console.log('대댓등록');
			if($('.reComment').val()==""){ //대댓글 추가창이 비어있다면
				alert('댓글을 입력하세요!');
			} else { 
				$.ajax({
					url:"addReply",
					data:{
						choice:0,
						replyContent : $('.reComment').val(),
						productNum:$('#productNum').val(),
						parentNum:$('.parentNum').val(),
						depth:$('#depth2').val()
					},
					success:function(data){
						replyList2();
						reCommentList2();
						$('.reComment').val("");
						$('#reCommentTable').append($('#reComment'));
					}
				});
			}
		});
		
		//대댓글 취소
		$('#div2').on('click', '.reCommentCancle', function(){
			console.log('대댓취소');
			$('.reComment').val("");
			$('#reCommentTable').append($('#reComment'));
		});
		
	});
	
	function replyList2(){
		$.ajax({
			url : "replyList",
			success: function (data) {
				var html = "<table class='table text-center table-hover'>";
				html += "<thead><tr><th>번호</th><th>내용</th><th>글쓴이</th></tr></thead><tbody>";
				var cnt=0;
				for(var i=0; i<data.length; i++){
					if(data[i].depth==0 && data[i].parentNum==0){
						html+='<tbody id="td'+data[i].replyNum+'"><tr id="'+data[i].replyNum+'" style="border-top:1px solid; background-color: #ffffd3;">'
						html+='<td style="width:90px;">'+(cnt+1)+'</td>';
						html+='<td style="width:250px;word-break:break-all">'+data[i].replyContent+'</td>';
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
				$('#div2').html(html);
				$('#button1').attr('disabled', false);
				$('#button2').attr('disabled', false);
			},
			dataType:'json',
			data:{
				productNum:$('#productNum').val(),
				choice:0,
				articleNum:$('#articleNum').val(),
				replyType:$('#replyType').val()
			}
		})
	}
	
	function reCommentList2(){// 대댓글 전체 조회
		$.ajax({
			url : "replyList",
			success: function (data) {
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
						$('#'+data[i].parentNum).closest('tbody').append($('#rediv tr'));
					}
				}
			},
			dataType:'json',
			data:{
				productNum : $('#productNum').val(),
				choice:0
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
		<div  class="form-group">
			<input type="text" placeholder="비추천 댓글 달기" id="inputConReply"  class="form-control">
		</div>
	</div>
		<div class="col-md-2">
			<button id="button2" type="button" class="btn btn-primary" disabled="disabled">등록</button>
			<input id="productNum" type="hidden" value="${article.productNum }">
			<input id="logNum" type="hidden" value="${logNum}">
			<input id="depth2" type="hidden" value="">
		</div>
	</div>
	<div id="div2">
	</div>
</body>
</html>