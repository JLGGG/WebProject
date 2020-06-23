<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원가입</title>
<style type="text/css">
#Icon {
   width: 18%;
   padding: 10px;
   border-radius: 5px;
   border: 2px solid #FFD966;
   background-color: #FFD966;
   color: white;
   font-size: 20px;
   font-weight:bold;
}
#check {
	width: 60px;
	height: 30px;
	border: none;
}
select {
	border-color: #E6E6E6;
}
iframe {
	border: none;
}
p{
	text-align: left;
	margin-left:41%;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function check() {
		id = document.getElementById("id");
		
		window.open("input_checkID.jsp?userID=" + id.value + "", "a",
				"width=600,height=200,left=300,top=50");
	}
	
</script>
</head>
<body>
	<div style="position: relative">
		<center>
			<div id="header">
				<iframe src="../page/header_noIcon.jsp" width="100%" scrolling="no"></iframe>
			</div>
			<br>
			<div>
					<b style="color: dimgrey; text-align: justify; font-size: 30px">회원가입</b>
				<hr size="5" color="#FFD966" width="70%">

				<!-- ID,PW -->
				<form action="output_signup.jsp" method="POST">
				<p>
					<br> 아이디<br> <input type="text" id="id" name="id"
						placeholder="아이디를 입력해주세요"
						style="border: 0.5px solid grey; border-radius: 5px; width: 20%; height: 30px;">
					<input type="button" value="아이디 중복확인" onclick="check()"
						style="background: darkgray; border-radius: 5px; width: 100px; height: 30px; font-size: 10px"><br>
					<br> 비밀번호<br> <input type="password" name="pw"
						placeholder="비밀번호를 입력해주세요"
						style="border: 0.5px solid grey; border-radius: 5px; width: 30%; height: 30px"><br>
					<br> 비밀번호 재확인<br> <input type="password" name="pw_check"
						placeholder="비밀번호를 한 번 더 입력해주세요"
						style="border: 0.5px solid grey; border-radius: 5px; width: 30%; height: 30px"><br>
					<br>

					<!-- 개인정보 -->
					<br> 이름<br> <input type="text" name="name"
						placeholder="이름을 입력해주세요"
						style="border: 0.5px solid grey; border-radius: 5px; width: 30%; height: 30px"><br>
					<br>성별: 남자 <input type="radio" name="gender"
						id="male" value="male"> 여자 <input type="radio"
						name="gender" id="female" value="female"><br> <br>
					생년월일<br> <select name="year" id="year">
						<option value=""></option>
						<%
										for (int i = 1980; i <= 2010; i++) {
									%>
						<option value="<%=i%>"><%=i%></option>
						<%
										}
									%>
					</select>년 <select name="month" id="month">
						<option value=""></option>
						<%
										for (int i = 1; i <= 12; i++) {
									%>
						<option value="<%=i%>"><%=i%></option>
						<%
										}
									%>
					</select>월 <select name="date" id="date">
						<option value=""></option>
						<%
										for (int i = 1; i <= 31; i++) {
									%>
						<option value="<%=i%>"><%=i%></option>
						<%
										}
									%>
					</select>일<br> <br>가입경로 <select name="joinPath"
						style="width: 100px; height: auto;" id="joinPath">
						<option value="">가입경로</option>
						<option value="recommend">추천</option>
						<option value="search">검색</option>
						<option value="self">자진</option>
						<option value="etc">기타</option>
					</select><br> <br>추천인 아이디 <input type="text" name="recomID"
						id="recomID" placeholder="추천인 아이디"
						style="border: 0.5px solid grey; border-radius: 5px; width: 15%; height: 30px"><br>

					<!-- 가입하기 버튼 -->
					<hr size="2" color="#FFD966" width="20%"><br>
					<input type="submit" value="회원가입"
						style="background: darkgray; border-radius: 5px; width: 19%; height: 50px; font-size: 15px">
						</p>
				</form>
				<br>
			</div>
			<br>
		</center>
		<br> <br>
		</center>
	</div>
</body>
</html>