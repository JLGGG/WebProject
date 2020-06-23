<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 화면</title>
<style>
.imgSrc {
	border: 1px solid dimgray;
	border-radius: 1px;
	opacity: 0.7;
}

.imgUpload {
	border-radius: 10px;
	border: 1px solid dimgray;
	padding-bottom: 2px;
	color: black;
	margin-top: 5px;
	height: 20px;
	font-size: 12px;
	fontfamily: 맑은고딕;
	vertical-align: middle;
	width: 80px;
}

.fileUploading {
	display: inline;
	border-bottom: 1px solid gray;
}

.imgPreview {
	position: relative;
	float: left;
	padding-top: 30px;
	valign: middle;
	text-align: center;
	border: 1px solid darkgray;
	background-color: gray;
	opacity: 0.7;
	width: 80px;
	height: 60px;
	font-size: 12px;
	fontfamily: 맑은고딕;
}

.imgSetsrc {
	position: relative;
	float: left;
	width: auto;
	height: 60px;
	valign: middle;
	padding: 10px;
}
</style>
</head>
<!--
        파일업로드를 위해선 반드시 method="post" enctype="Multipart/form-data"여야함!
     -->
<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
%>
<div class="fileUploading">
	<table class="item" style="border-bottom: 1px solid gray;">
		<tr style="margin-bottom: 5px;">
			<td>&nbsp;</td>
			<td width="90%" style="display:inline">
				<div class="imgPreview">
					No<br>image
				</div>
				<div class="imgSetsrc">
					<form action="fileUpload.jsp" method="post"	enctype="Multipart/form-data">
						<input type="file" name="fileName1" size="40" class="imgSrc" /><br/>
						<input type="hidden" name="title" value="<%=title %>">
						<input type="hidden" name="content" value="<%=content %>">
						<input type="submit" value="이미지첨부" class="imgUpload" /> <input
							type="reset" value="취소" class="imgUpload" />
					</form>
				</div>
			</td>
		</tr>
	</table>
</div>