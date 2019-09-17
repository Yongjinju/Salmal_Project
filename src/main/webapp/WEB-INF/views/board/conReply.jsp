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
		$('#button2').click(function(){
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
					$('#'+id).find(':nth-child(2):eq(0)').html('<input size=4 type=text value="' + $('#' + id).find(':nth-child(2)').html()+ '">')
				} else {
					$.ajax({
						url:"updReply",
						data:{
							replyNum : $(this).val(),
							replyContent : $('#'+id).find('input').val()
						},
						success:function(){
							replyList2()
						}
					});
				}
			}
		});
		
		$('#div2').on('click','.delReply',function(){ //댓글 삭제
			var i = confirm('정말 삭제하시겠습니까?');
			if(i){
				$.ajax({
					url:"delReply",
					data:{
						replyNum:$(this).val()
					},
					success:function(){
						replyList2();
						alert('삭제완료');
					}
				})
			}
		});
	});
	
	function replyList2(){
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
					html+='<td colspan="3" style="text-align:right;">'+data[i].replyDate+'</td>';
					if($('#logNum').val()==data[i].memberNum){
						html+='<td colspan="2"><button type="button" class="btn btn-success btn-sm updReply" value="'+data[i].replyNum+'" >수정</button>';
						html+='<button type="button" class="btn btn-danger btn-sm delReply" value="'+data[i].replyNum+'">삭제</button> </td>';
					}
					
					html+='</tr>';
					
				}
				html+='</tbody></table>';
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
		</div>
	</div>
	<div id="div2">
	</div>
</body>
</html>