<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 등록</title>

<style type="text/css">
@import url('../../Css/writebutton.css');
@import url('../../Css/list_title.css');
@import url('../../Css/text.css');
@import url('../../Css/table2_css.css');

@import	url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import	url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');
</style>
</head>

<body>
	<%
		String userId = null;
		String userGender = null;
		User user = new User();
		UserDAO ud = new UserDAO();
		//로그인 여부 확인
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
			user = ud.getUser(userId);
			
			if (user.getLevel().equals("불량")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('등급이 낮아서 상품을 등록할 수 없습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요!')");
			script.println("history.back()");
			script.println("</script>");
		}
		%>
	<div class="GG">상품 등록</div>
	<hr color="gray" size="2"><br>

	<div class="container">
		<form name="addProduct" action="./serverAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
					<label class="col-sm-2">상품번호</label>
					<div class="col-sm-3">
						<input type="text" name="productId" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" name="price" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-5">
					<textarea name="description" cols="30" rows="3" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-3">
					<input type="text" name="condition" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="상품등록">
				</div>
			</div>
			<div align="right">
			<input type="button" class="btn btn-secondary" onclick="history.back()" value="뒤로 가기">
	
			</div>
		</form>
	</div>
</body>
</html>