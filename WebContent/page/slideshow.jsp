<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#rotate90 {
   tranform: rotate(-90deg);
   -webkit-transform: rotate(-90deg); /* Chrome, Safari, Opera */
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
   var img = $('.item.active').attr('src');
   $(document).ready(function() {
      $('.wrap').css("background", "url('" + img + "') round");
   });
</script>
</head>
<body
   style="width: 100%; height: 100%; vertical-align: middle; align: center">
   <center>
      <div class="wrap" style="position: relative; filter: blur(5px);"></div>
      <div class="container"
         style="position: absolute; top:5%; left: 5%; align: center;">
         <div id="myCarousel" class="carousel slide" data-ride="carousel"
            style="width: 100%; height: 70%; vertical-align: middle">
            <ol class="carousel-indicators">
               <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
               <li data-target="#myCarousel" data-slide-to="1"></li>
               <li data-target="#myCarousel" data-slide-to="2"></li>
               <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner" role="listbox"
               style="height: 70%; vertical-align: middle">
               <div class="item active">
                  <a href="http://www.lillehaven.co.kr" "target=_blank"><img src="../img/banner1.jpg" width="80%" height="60%"></a>
                  <a href="http://www.erbababy.co.kr" "target=_blank"><img src="../img/banner3.jpg" width="80%" height="60%"></a>
               </div>
               <div class="item">
                   <a href="http://www.lillehaven.co.kr" "target=_blank"><img src="../img/banner2.jpg" width="80%" height="60%"></a>
                  <a href="http://www.erbababy.co.kr" "target=_blank"><img src="../img/banner5.jpg" width="80%" height="60%"></a>
               </div>
               <div class="item">
                  <a href="http://www.lillehaven.co.kr" "target=_blank"><img src="../img/banner6.jpg" width="80%" height="60%"></a>
                  <a href="http://www.erbababy.co.kr" "target=_blank"><img src="../img/banner8.jpg" width="80%" height="60%"></a>
               </div>
               <div class="item">
                  <a href="http://www.lillehaven.co.kr" "target=_blank"><img src="../img/banner4.jpg" width="80%" height="60%"></a>
                  <a href="http://www.erbababy.co.kr" "target=_blank"><img src="../img/banner7.jpg" width="80%" height="60%"></a>
               </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" role="button"
               data-slide="prev" style="background-image: none;"> <span
               class="glyphicon glyphicon-chevron-left"></span> <span
               class="sr-only">Previous</span>
            </a> <a class="right carousel-control" href="#myCarousel" role="button"
               data-slide="next" style="background-image: none;"> <span
               class="glyphicon glyphicon-chevron-right"></span> <span
               class="sr-only">Next</span>
            </a>
         </div>
      </div>
   </center>
</body>
</html>


<!-- <div>
         <br><br><br><br>
         <a href="http://www.lillehaven.co.kr" "target=_blank"><img src="../img/banner1.jpg"></a>
         <a href="http://www.erbababy.co.kr" "target=_blank"><img src="../img/banner4.jpg"></a>
         <a href="http://www.naturalattitude.co.kr" "target=_blank"><img src="../img/banner7.jpg"></a>
      </div> -->