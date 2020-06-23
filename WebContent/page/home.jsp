<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>home</title>
<script src="http://code.jquery.com/jquery-latest.min.js"  type="text/javascript"></script>
<script>
   $(document).ready(function() {
      $("#menu_bar").load("menu_bar.html");
   });
</script>
<style type="text/css">
#header {
   margin-top: 0px;
   margin-bottom: 20px;
}

#menu_bar {
  	width: 100%;
	position: absolute;
	z-index: 5;
}

.container {
  	margin-top: 50px;
	overflow: hidden;
	height: auto;
	position:center;
}

#slideshow {
	padding-right: 4%;
	width: 80%;
	margin-top: 20px;
	margin-bottom: 20px;
}

iframe {
	border:0px;
	align:middle;
}
</style>
</head>
<body style="overflow-x: hidden;">

   <%
      String userId = null;

      if (session.getAttribute("userId") != null) {
         userId = (String) session.getAttribute("userId");
      }
   %>

   <div style="position: center">
      <center>
         <div id="header">
            <%
               if (userId == null) { //로그인이 안되어있을때,
            %>
            <iframe src="header.html?ver2.01" width="100%" height="auto" scrolling="no"
               style="z-index: 20"></iframe>
            <%
               } else { //로그인이 되어있을때,
            %>
            <iframe src="header2.jsp?ver2.01" width="100%" height="auto" scrolling="no"
               style="z-index: 20"></iframe>
            <%
               }
            %>
         </div>
         <div id="menu_bar"></div>
      
      <div class="container">
			<!-- main -->
				<div id="slideshow">
					<iframe src="slideshow.jsp" width="100%" height="630px"
						scrolling="no"></iframe>
				</div>
		</div>
       </center>
   </div>
</body>
</html>