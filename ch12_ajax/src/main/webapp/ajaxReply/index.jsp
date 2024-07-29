<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>댓글 보기</title>
<style>
	body {text-align:center;}
	img { width: 600px;}
	table {width: 600px; border: 1px solid; border-collapse:collapse;}
	tr, th, td {border: 1px solid;}
</style>
</head>
<body>
	<img src="../resources/img1.JPG"><br>
	<table align="center">
		<thead>
			<tr>
				<th>댓글작성</th>
				<td>
					<textarea rows="3" cols="50" id="replyContent"></textarea>
				</td>
				<td><button id="btn1">댓글등록</button></td>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	<script type="text/javascript">
		$(() => {
			selectReplyList();
			
			//setInterval(selectReplyList, 1000);
		})
		
		function selectReplyList() {
			$.ajax({
				url: "rlist.bo",
				data: {bnum: 1},  //원글의 num값을 넘겨준다
				success:function(result){
					let value = "";
					for(let i=0; i<result.length; i++) {
						value += "<tr>"
							  + "	<td>" + result[i].name + "</td>"
							  + "	<td>" + result[i].content + "</td>"
							  + "	<td>" + result[i].redate.substring(0,10) + "</td>"
							  + "</tr>";
					}
					$("table tbody").html(value);
				},
				error:function() {
					console.log("ajax 통신 실패");
				}
			})
		}
		
		$(() => {
			$("#btn1").click(function() {			
				$.ajax({
					url : "rinsert.bo",
					data : {
						bnum : 1,
						content : $("#replyContent").val(),
						name : "채규태"
					},
					type : "post",
					success : function(result) {
						console.log(result);
					},
					error : function() {
						console.log("ajax 통신 실패");
					}
				})
				selectReplyList();
			})
		})
	</script>
</body>
</html>