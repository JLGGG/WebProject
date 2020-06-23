<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ID 중복확인</title>
<style>
#find {
	border-radius: 10px;
	border: 2px solid #FFD966;
	background-color: #FFFFFF;
	color: dimgray;
	width: 20%;
	height: 10%;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<center>
	<br><br>
			<fieldset
				style="border: 1px solid darkgray; width: 40%; height: 40%;">
				<legend>
					<b>아이디 중복확인</b>
				</legend>
					아이디를 확인해주세요!
				<input type="text" id="newid" name="newid">
				<input type="button" id="find" value="찾기">
			</fieldset>
	</center>
	<script>
	var getParams = function (url) {
		var params = {};
		var parser = document.createElement('a');
		parser.href = url;
		var query = parser.search.substring(1);
		var vars = query.split('&');
		for (var i = 0; i < vars.length; i++) {
			var pair = vars[i].split('=');
			params[pair[0]] = decodeURIComponent(pair[1]);
		}
		return params;
	};

	$(document).ready(function() {
		var params = getParams(location.href);
		
		var $newIdInput = $("#newid");
		$newIdInput.val(params.userID);
		
		$("#find").click(function() {
			$.ajax({
				type: "post",
				data: {
					newid: $newIdInput.val()
				},
				url: "output_checkID.jsp",
				success: function(result) {
					var rs = parseInt(result.trim());
					if(rs == 1) {
						alert('중복된 ID가 없습니다. 사용해도 좋아요 :)');
					    window.opener.document.getElementById("id").value = $newIdInput.val();
					    window.close();
					} else if (rs == 0) {
						alert('중복되는 ID가 이미 있습니다. 새로운 ID를 입력해주세요');
						$("#newid").val("");
					} else if (rs == -1) {
						alert('오류가 발생했습니다.');
					}
				}
			});
		});
	});
	</script>
</body>
</html>