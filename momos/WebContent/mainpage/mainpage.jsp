<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모스모스 커피</title>	
<link rel="icon" href="/image/logo2.png">
</head>
<body>

<%@ include file ="/include/connection.jsp" %>


<section class="container">


<%@ include file ="/include/header.jsp" %>

<%@ include file ="/include/aside.jsp" %>


<main class="main1">

		<div class="mainimage">
			<div id="slide">
				<div><img id="img1" src="/image/momos_main1.jpeg" alt=""></div>
				<div><img id="img2" src="/image/momos_main2.jpeg" alt=""></div>
				<div><img id="img3" src="/image/momos_main3.jpeg" alt=""></div>
				<div><a href="https://worldcoffeeevents.org/congratulations-to-world-barista-champion-jooyeon-jeon-representing-south-korea/"><img id="img4" src="/image/momos_main4.jpeg" alt=""></a></div>
				<div><img id="img5" src="/image/momos_main5.jpeg" alt=""></div>
			</div>
		</div>

		<div class="main_arrivals">
			NEW ARRIVALS
		</div>
		<br>
		<section class="awards">
    
      <div class="swiper">
        <div class="swiper-wrapper">
	        <c:forEach var="list" items="${list}">
	          <div class="swiper-slide">
	            <a href="/product/${list.category1}?no=${list.uid}"><img class="mainpage_new" src="/upload/${list.file1}" alt="" /></a>
	          </div>
	        </c:forEach>
        </div>
      </div>
      <div class="swiper-prev">
        <img src="/image/slide_btn_next.gif">
      </div>
      <div class="swiper-next">
        <img src="/image/slide_btn_prev.gif"></div>
      </div>
  </section>
	
		
</main>
<main class="main2">
		<div class="about_opa">
			<img src="/image/main_about.png">
		</div>
		<div>
			<a class="readmore" href="/momos">READ MORE</a>
		</div>
</main>
<main class="main3">
		<div class="main_arrivals">
			&nbsp;&nbsp;BEST SELLER
		</div>
		<div>
			<img  src="/image/story1.jpg">
			<img  src="/image/story2.jpg">
			<img  src="/image/story3.jpg">		
		</div>
		<div>
			<img src="/image/main_banner04.jpg" class="main_banner04">
		</div>
	 	

</main>

<%@ include file = "/include/footer.jsp" %>

</section>



<script>
$('#slide > div:gt(0)').hide();

setInterval(function(){
    $('#slide > div:first')
        .fadeOut(1000)
        .next()
        .fadeIn(1000)
        .end()
        .appendTo('#slide');
},2500);

</script>

<script>
new Swiper('.awards .swiper', {
	  // direction: 'horizontal',
	  autoplay: {
			delay:2200,// 하나의 슬라이드에서 다음 슬라이드 또는 이전 슬라이드 이동 시 소요 시간
			disableOnInteraction: false
	  },
	  loop: true,
	  spaceBetween: 15,
	  slidesPerView: 5,
	  navigation: {
	    prevEl: '.awards .swiper-next',
	    nextEl: '.awards .swiper-prev'
	  }
	});
</script>


</body>
</html>



