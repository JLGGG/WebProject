<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">아이디 찾기</h1>
		</div>
	</div>
	<div class="container">
		<form name="searchId" action="./searchId.jsp" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">Address</label>
				<div class="col-sm-3">
					<input type="text" name="userAddress" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">Email</label>
				<div class="col-sm-5">
					<input type="text" name="userEmail" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">Phone Number</label>
				<div class="col-sm-3">
					<input type="text" name="userMobile" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="아이디 찾기">
				</div>
			</div>
		</form>
	</div>
</body>
</html>